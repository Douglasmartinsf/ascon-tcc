`timescale 1ns / 1ps

module ascon_tb;

  `include "test_vectors.sv"

  localparam time CLK_HALF_PERIOD = 50ns;
  localparam int VECTOR_COUNT = 800;

  typedef struct {
    int           count;
    bit [7:0]     size;
    bit [127:0]   key;
    bit [127:0]   nonce;
    bit [7:0]     pt[];
    bit [7:0]     ad[];
    bit [447:0]   expected_ct;
  } test_vector_t;

  test_vector_t test_vectors[VECTOR_COUNT];

  logic         clock_i;
  logic         resetb_i;
  logic         init_i;
  logic         associate_data_i;
  logic         finalisation_i;
  logic         en_reg_ascon_i;
  logic [63:0]  data_i;
  logic         data_valid_i;
  logic [127:0] key_i;
  logic [127:0] nonce_i;

  logic         end_associate_o;
  logic [63:0]  cipher_o;
  logic         cipher_valid_o;
  logic [127:0] tag_o;
  logic         end_tag_o;
  logic         end_initialisation_o;
  logic         end_cipher_o;

  int tests_passed;
  int tests_failed;

  ascon dut (
      .clock_i,
      .resetb_i,
      .init_i,
      .associate_data_i,
      .finalisation_i,
      .en_reg_ascon_i,
      .data_i,
      .data_valid_i,
      .key_i,
      .nonce_i,
      .end_associate_o,
      .cipher_o,
      .cipher_valid_o,
      .tag_o,
      .end_tag_o,
      .end_initialisation_o,
      .end_cipher_o
  );

  always #CLK_HALF_PERIOD clock_i = ~clock_i;

  function automatic logic [63:0] pack_block(
      input bit [7:0] bytes[],
      input int       first_byte
  );
    logic [63:0] block;
    block = '0;
    for (int byte_index = 0; byte_index < 8; byte_index++) begin
      block[63-(byte_index*8) -: 8] = bytes[first_byte+byte_index];
    end
    return block;
  endfunction

  function automatic int padding_bits(input bit [7:0] bytes[]);
    for (int byte_index = 0; byte_index < bytes.size(); byte_index++) begin
      if (bytes[byte_index] == 8'h80) begin
        bit valid_padding;
        valid_padding = 1'b1;
        for (int following = byte_index + 1; following < bytes.size(); following++) begin
          if (bytes[following] != 8'h00) valid_padding = 1'b0;
        end
        if (valid_padding) return (bytes.size() - byte_index) * 8;
      end
    end
    return 0;
  endfunction

  task automatic clear_controls();
    init_i           = 1'b0;
    associate_data_i = 1'b0;
    finalisation_i   = 1'b0;
    en_reg_ascon_i   = 1'b0;
    data_i            = '0;
    data_valid_i      = 1'b0;
  endtask

  task automatic reset_dut();
    clear_controls();
    resetb_i = 1'b1;
    repeat (3) @(posedge clock_i);
    @(negedge clock_i);
    resetb_i = 1'b0;
    repeat (2) @(posedge clock_i);
  endtask

  task automatic pulse_initialization();
    @(negedge clock_i);
    init_i = 1'b1;
    @(negedge clock_i);
    init_i = 1'b0;
    wait (end_initialisation_o === 1'b1);
  endtask

  task automatic process_associated_block(input logic [63:0] block);
    @(negedge clock_i);
    data_i            = block;
    associate_data_i = 1'b1;
    data_valid_i      = 1'b1;
    @(negedge clock_i);
    associate_data_i = 1'b0;
    data_valid_i      = 1'b0;
    wait (end_associate_o === 1'b1);
  endtask

  task automatic process_plaintext_block(
      input  logic [63:0] plaintext,
      output logic [63:0] ciphertext
  );
    @(negedge clock_i);
    data_i          = plaintext;
    en_reg_ascon_i = 1'b1;
    data_valid_i    = 1'b1;
    @(negedge clock_i);
    en_reg_ascon_i = 1'b0;
    data_valid_i    = 1'b0;
    wait (end_cipher_o === 1'b1);
    ciphertext = cipher_o;
  endtask

  task automatic finalize_and_read_outputs(
      input  logic [63:0]  final_plaintext,
      output logic [63:0]  final_ciphertext,
      output logic [127:0] tag
  );
    @(negedge clock_i);
    data_i          = final_plaintext;
    finalisation_i = 1'b1;
    en_reg_ascon_i = 1'b1;
    data_valid_i    = 1'b1;
    @(negedge clock_i);
    finalisation_i = 1'b0;
    en_reg_ascon_i = 1'b0;
    data_valid_i    = 1'b0;
    wait (end_tag_o === 1'b1);
    final_ciphertext = cipher_o;
    tag              = tag_o;
  endtask

  task automatic run_vector(input int vector_index);
    logic [319:0] received_cipher;
    logic [447:0] received_ct;
    logic [127:0] received_tag;
    logic [63:0]  cipher_block;
    int padding_size;

    received_cipher = '0;
    received_ct     = '0;
    received_tag    = '0;

    reset_dut();
    key_i   = test_vectors[vector_index].key;
    nonce_i = test_vectors[vector_index].nonce;

    pulse_initialization();

    for (int byte_index = 0;
         byte_index < test_vectors[vector_index].ad.size();
         byte_index += 8) begin
      process_associated_block(pack_block(test_vectors[vector_index].ad, byte_index));
    end

    // O último bloco contém o padding ASCON. Neste core ele é absorvido na
    // transição de finalização, que também disponibiliza seu ciphertext.
    for (int byte_index = 0;
         byte_index < test_vectors[vector_index].pt.size() - 8;
         byte_index += 8) begin
      process_plaintext_block(
          pack_block(test_vectors[vector_index].pt, byte_index),
          cipher_block
      );
      received_cipher = {received_cipher[255:0], cipher_block};
    end

    finalize_and_read_outputs(
        pack_block(
            test_vectors[vector_index].pt,
            test_vectors[vector_index].pt.size() - 8
        ),
        cipher_block,
        received_tag
    );
    received_cipher = {received_cipher[255:0], cipher_block};

    padding_size = padding_bits(test_vectors[vector_index].pt);
    received_cipher = received_cipher >> padding_size;
    received_ct = {received_cipher, received_tag};

    if (received_ct === test_vectors[vector_index].expected_ct) begin
      tests_passed++;
    end else begin
      tests_failed++;
      if (tests_failed <= 10) begin
        $display("[TB] FAIL vector %0d", test_vectors[vector_index].count);
        $display("[TB] expected: %h", test_vectors[vector_index].expected_ct);
        $display("[TB] received: %h", received_ct);
      end
    end
  endtask

  initial begin
    clock_i     = 1'b0;
    resetb_i    = 1'b1;
    key_i       = '0;
    nonce_i     = '0;
    tests_passed = 0;
    tests_failed = 0;
    clear_controls();

    init_test_vectors();

    for (int vector_index = 0; vector_index < VECTOR_COUNT; vector_index++) begin
      run_vector(vector_index);
    end

    $display("\n===========================================");
    $display("[TB] ASCON CORE COMPLETED");
    $display("[TB] TESTS EXECUTED: %0d", VECTOR_COUNT);
    $display("[TB] TESTS PASSED:   %0d", tests_passed);
    $display("[TB] TESTS FAILED:   %0d", tests_failed);
    $display("===========================================\n");

    if (tests_failed != 0) $fatal(1, "ASCON core validation failed");
    $finish;
  end

  initial begin
    #1s;
    $fatal(1, "Timeout while validating ASCON core");
  end

endmodule
