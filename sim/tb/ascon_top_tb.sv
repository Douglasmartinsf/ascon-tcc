`timescale 1ns/1ps
// Black-box verification: only public ports of ascon_aead128 are observed.
module ascon_top_tb #(parameter bit TEST_TRUNCATION = 1'b0);
  logic clock_s = 0, reset_s = 1, enable_s = 1, init_s = 0, associate_s = 1;
  logic valid_s = 0, last_s = 0, final_s = 0;
  logic [127:0] key_s = 0, nonce_s = 0, data_s = 0, cipher_s, tag_s;
  logic [4:0] bytes_s = 16, cipher_bytes_s;
  logic truncate_s = 0;
  logic [4:0] tag_bytes_request_s = 16, tag_bytes_s;
  bit selected_truncate_s = 0, config_captured_s = 0;
  int selected_tag_bytes_s = 16, captured_tag_bytes_s = 16;
  int invalid_requests_s = 0, disabled_inits_s = 0;
  logic init_ready_s, ready_s, final_ready_s, busy_s;
  logic init_done_s, block_done_s, ad_done_s, pt_done_s, tag_done_s, cipher_valid_s;
  bit expect_init_s = 0, expect_block_s = 0, expect_ad_s = 0, expect_pt_s = 0;
  bit expect_cipher_s = 0, expect_tag_s = 0, seen_init_s, seen_block_s, seen_ad_s, seen_pt_s, seen_tag_s;
  logic [127:0] expected_cipher_s, expected_tag_s;
  int expected_bytes_s, actual_fd_s;
  bit recording_s = 0;
  int cases_s = 0, tags_s = 0, cipher_blocks_s = 0, aborts_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128 dut (
    .clock_i(clock_s), .resetb_i(reset_s), .init_i(init_s), .en_reg_ascon_i(enable_s),
    .associate_data_i(associate_s), .finalisation_i(final_s), .key_i(key_s), .nonce_i(nonce_s),
    .data_i(data_s), .data_valid_i(valid_s), .data_bytes_i(bytes_s), .data_last_i(last_s),
    .tag_truncate_i(truncate_s), .tag_bytes_i(tag_bytes_request_s), .tag_bytes_o(tag_bytes_s),
    .init_ready_o(init_ready_s), .data_ready_o(ready_s), .finalisation_ready_o(final_ready_s),
    .busy_o(busy_s), .end_initialisation_o(init_done_s), .block_done_o(block_done_s),
    .end_associate_o(ad_done_s), .end_cipher_o(pt_done_s), .cipher_o(cipher_s),
    .cipher_bytes_o(cipher_bytes_s), .cipher_valid_o(cipher_valid_s), .tag_o(tag_s), .end_tag_o(tag_done_s)
  );

  always @(posedge clock_s) begin
    #1;
    if (config_captured_s && tag_bytes_s !== 5'(captured_tag_bytes_s))
      $fatal(1, "Tag length changed without an accepted init");
    if (init_done_s) begin
      if (!expect_init_s) $fatal(1, "Unexpected/repeated public init completion");
      expect_init_s = 0; seen_init_s = 1;
    end
    if (block_done_s) begin
      if (!expect_block_s) $fatal(1, "Unexpected/repeated public transfer completion");
      expect_block_s = 0; seen_block_s = 1;
    end
    if (ad_done_s) begin
      if (!expect_ad_s) $fatal(1, "Unexpected/repeated public AD completion");
      expect_ad_s = 0; seen_ad_s = 1;
    end
    if (pt_done_s) begin
      if (!expect_pt_s) $fatal(1, "Unexpected/repeated public PT completion");
      expect_pt_s = 0; seen_pt_s = 1;
    end
    if (cipher_valid_s) begin
      if (!expect_cipher_s || cipher_s !== expected_cipher_s || cipher_bytes_s !== 5'(expected_bytes_s))
        $fatal(1, "Public ciphertext mismatch case=%0d received=%032h expected=%032h", cases_s, cipher_s, expected_cipher_s);
      expect_cipher_s = 0;
      if (recording_s) begin
        for (int b = 0; b < expected_bytes_s; b++) $fwrite(actual_fd_s, "%02h", cipher_s[8*b +: 8]);
        cipher_blocks_s++;
      end
    end
    if (tag_done_s) begin
      if (!expect_tag_s || tag_s !== expected_tag_s) $fatal(1, "Public tag mismatch case=%0d", cases_s);
      expect_tag_s = 0; seen_tag_s = 1;
      if (recording_s) begin
        for (int b = 0; b < captured_tag_bytes_s; b++) $fwrite(actual_fd_s, "%02h", tag_s[8*b +: 8]);
        tags_s++;
      end
    end
  end

  task automatic tick;
    @(posedge clock_s); #2;
  endtask

  task automatic check_busy;
    if (busy_s !== 1 || init_ready_s !== 0 || ready_s !== 0 || final_ready_s !== 0)
      $fatal(1, "Public busy/ready mismatch");
  endtask

  task automatic reset_and_check;
    @(negedge clock_s); #2;
    reset_s = 1;
    config_captured_s = 0;
    expect_init_s = 0; expect_block_s = 0; expect_ad_s = 0; expect_pt_s = 0;
    expect_cipher_s = 0; expect_tag_s = 0;
    #1;
    if (init_ready_s !== 0 || ready_s !== 0 || final_ready_s !== 0 || busy_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0 || ad_done_s !== 0 || pt_done_s !== 0 ||
        cipher_valid_s !== 0 || tag_done_s !== 0 || tag_s !== 0 || cipher_s !== 0 || cipher_bytes_s !== 0 || tag_bytes_s !== 0)
      $fatal(1, "Public active-high asynchronous reset failed");
    @(negedge clock_s);
    reset_s = 0; enable_s = 1; init_s = 0; valid_s = 1; associate_s = 0; final_s = 1;
    bytes_s = 16; last_s = 0;
    truncate_s = 0; tag_bytes_request_s = 16;
    repeat (20) begin
      tick();
      if (init_ready_s !== 1 || ready_s !== 0 || final_ready_s !== 0 || busy_s !== 0 ||
          cipher_s !== 0 || tag_s !== 0 || init_done_s !== 0 || block_done_s !== 0 ||
          ad_done_s !== 0 || pt_done_s !== 0 || tag_done_s !== 0 || cipher_valid_s !== 0 || tag_bytes_s !== 0)
        $fatal(1, "Stale result or acceptance before public init");
    end
    @(negedge clock_s); valid_s = 0; final_s = 0;
  endtask

  task automatic start_init(input logic [127:0] key_value, nonce_value);
    @(negedge clock_s);
    enable_s = 1; init_s = 1; valid_s = 1; final_s = 1;
    key_s = key_value; nonce_s = nonce_value; associate_s = 1; bytes_s = 16; last_s = 0;
    truncate_s = selected_truncate_s; tag_bytes_request_s = 5'(selected_tag_bytes_s);
    #1;
    if (init_ready_s !== 1 || ready_s !== 0 || final_ready_s !== 0) $fatal(1, "Public init priority");
    expect_init_s = 1; seen_init_s = 0;
    captured_tag_bytes_s = selected_truncate_s ? selected_tag_bytes_s : 16;
    config_captured_s = 1;
    tick(); check_busy();
    if (seen_init_s || tag_s !== 0) $fatal(1, "Early init completion or uncleared old tag");
  endtask

  task automatic initialize(input logic [127:0] key_value, nonce_value, input bit paused);
    bit complete;
    start_init(key_value, nonce_value);
    complete = 0;
    for (int cycle = 1; cycle <= 50; cycle++) begin
      @(negedge clock_s);
      enable_s = !(paused && cycle <= 18); init_s = 0; valid_s = 1; final_s = 1;
      key_s = ~key_value; nonce_s = ~nonce_value; data_s = '1; bytes_s = 31; associate_s = 0;
      if (TEST_TRUNCATION) begin
        truncate_s = !selected_truncate_s; tag_bytes_request_s = 31;
      end
      tick();
      if (seen_init_s) begin
        if ((!paused && cycle != 15) || busy_s !== 0) $fatal(1, "Public init latency");
        complete = 1; break;
      end
      check_busy();
    end
    if (!complete) $fatal(1, "Public init timeout");
  endtask

  task automatic start_transfer(input logic [127:0] value, input int bytes_value,
                                input bit last_value, ad_value);
    @(negedge clock_s);
    enable_s = 1; init_s = 0; valid_s = 1; final_s = 0;
    data_s = value; bytes_s = 5'(bytes_value); last_s = last_value; associate_s = ad_value;
    #1;
    if (ready_s !== 1) $fatal(1, "Legal public transfer blocked");
    expect_block_s = 1; expect_ad_s = ad_value && last_value; expect_pt_s = !ad_value && last_value;
    seen_block_s = 0; seen_ad_s = 0; seen_pt_s = 0;
    tick(); check_busy();
    if (seen_block_s || cipher_valid_s !== 0) $fatal(1, "Public transfer completed on acceptance");
  endtask

  task automatic transfer(input logic [127:0] value, expected_cipher,
                          input int bytes_value, input bit last_value, ad_value, paused);
    bit complete;
    int latency;
    if (paused) begin
      @(negedge clock_s);
      enable_s = 0; init_s = 0; final_s = 0; valid_s = 1;
      data_s = value; bytes_s = 5'(bytes_value); last_s = last_value; associate_s = ad_value;
      repeat (2) begin
        tick();
        if (ready_s !== 0 || busy_s !== 0 || cipher_valid_s !== 0) $fatal(1, "Disabled public transfer");
      end
    end
    expected_cipher_s = expected_cipher; expected_bytes_s = bytes_value;
    expect_cipher_s = !ad_value && bytes_value != 0;
    start_transfer(value, bytes_value, last_value, ad_value);
    complete = 0;
    latency = ad_value ? (bytes_value == 0 ? 1 : !last_value ? 12 : bytes_value == 16 ? 25 : 13) :
                         (bytes_value < 16 ? 1 : last_value ? 13 : 12);
    for (int cycle = 1; cycle <= 100; cycle++) begin
      @(negedge clock_s);
      enable_s = !(paused && (cycle % 5 == 1 || cycle % 5 == 2));
      init_s = 1; final_s = 1; valid_s = 1; associate_s = !ad_value;
      bytes_s = 31; last_s = !last_value; data_s = ~value; key_s = '1; nonce_s = '1;
      if (TEST_TRUNCATION) begin
        truncate_s = 1; tag_bytes_request_s = 31;
      end
      tick();
      if (seen_block_s) begin
        if ((!paused && cycle != latency) || busy_s !== 0 || expect_cipher_s ||
            seen_ad_s != (ad_value && last_value) || seen_pt_s != (!ad_value && last_value))
          $fatal(1, "Public transfer latency/conclusion");
        complete = 1; break;
      end
      check_busy();
    end
    if (!complete) $fatal(1, "Public transfer timeout");
  endtask

  task automatic start_final(input logic [127:0] expected_tag);
    @(negedge clock_s);
    enable_s = 1; init_s = 0; valid_s = 0; final_s = 1;
    #1;
    if (final_ready_s !== 1) $fatal(1, "Public finalization not ready");
    expected_tag_s = '0;
    for (int b = 0; b < captured_tag_bytes_s; b++) expected_tag_s[8*b +: 8] = expected_tag[8*b +: 8];
    expect_tag_s = 1; seen_tag_s = 0;
    tick(); check_busy();
    if (seen_tag_s) $fatal(1, "Tag published on acceptance");
  endtask

  task automatic finalize(input logic [127:0] expected_tag, input bit paused, immediate);
    bit complete;
    if (!immediate) begin
      @(negedge clock_s); enable_s = 1; init_s = 0; valid_s = 1; final_s = 1;
      repeat (2) begin
        tick();
        if (final_ready_s !== 0 || busy_s !== 0 || tag_done_s !== 0)
          $fatal(1, "Public finalization accepted simultaneous data");
      end
      @(negedge clock_s); enable_s = 0; valid_s = 0;
      repeat (2) begin
        tick();
        if (final_ready_s !== 0 || busy_s !== 0) $fatal(1, "Disabled public finalization accepted");
      end
    end
    start_final(expected_tag);
    complete = 0;
    for (int cycle = 1; cycle <= 100; cycle++) begin
      @(negedge clock_s);
      enable_s = !(paused && (cycle % 5 == 1 || cycle % 5 == 2));
      init_s = 0; valid_s = 1; final_s = 1; key_s = '1; nonce_s = '1;
      if (TEST_TRUNCATION) begin
        truncate_s = 1; tag_bytes_request_s = 0;
      end
      tick();
      if (seen_tag_s) begin
        if ((!paused && cycle != 17) || busy_s !== 0 || ready_s !== 0 || final_ready_s !== 0)
          $fatal(1, "Public finalization latency/conclusion");
        complete = 1; break;
      end
      check_busy();
    end
    if (!complete) $fatal(1, "Public finalization timeout");
    for (int cycle = 0; cycle < 5; cycle++) begin
      @(negedge clock_s); enable_s = cycle >= 2;
      tick();
      if (tag_s !== expected_tag_s || tag_done_s !== 0 || ready_s !== 0 || final_ready_s !== 0 || busy_s !== 0)
        $fatal(1, "Public tag retention/repeated finalization");
    end
  endtask

  task automatic check_initial_ad_final_aborts(input logic [127:0] key_value, nonce_value, expected_tag);
    for (int phase = 0; phase < 2; phase++) begin
      start_init(key_value, nonce_value);
      if (phase == 1) begin
        @(negedge clock_s); init_s = 0; valid_s = 0; final_s = 0;
        repeat (6) tick();
      end
      reset_and_check(); aborts_s++;
    end
    for (int phase = 0; phase < 3; phase++) begin
      initialize(key_value, nonce_value, 0);
      start_transfer('1, 16, 1, 1);
      if (phase != 0) begin
        @(negedge clock_s); init_s = 0; valid_s = 0; final_s = 0;
        repeat (phase == 1 ? 8 : 24) tick();
      end
      reset_and_check(); aborts_s++;
    end
    for (int phase = 0; phase < 5; phase++) begin
      initialize(key_value, nonce_value, 0);
      transfer('1, '0, 0, 1, 1, 0); transfer('1, '0, 0, 1, 0, 0);
      start_final(expected_tag);
      if (phase != 0) begin
        @(negedge clock_s); final_s = 0; valid_s = 0;
        repeat (phase == 1 ? 8 : phase == 2 ? 14 : phase == 3 ? 16 : 17) tick();
      end
      if (phase == 2 || phase == 3) begin
        @(negedge clock_s); enable_s = 0;
        repeat (3) tick();
      end
      reset_and_check(); aborts_s++;
    end
  endtask

  task automatic check_pt_aborts(input logic [127:0] key_value, nonce_value, value, expected_cipher,
                                input int bytes_value);
    for (int phase = 0; phase < (bytes_value == 1 ? 2 : 4); phase++) begin
      initialize(key_value, nonce_value, 0); transfer('1, '0, 0, 1, 1, 0);
      expected_cipher_s = expected_cipher; expected_bytes_s = bytes_value; expect_cipher_s = 1;
      start_transfer(value, bytes_value, 1, 0);
      if (bytes_value == 16 || phase == 1) begin
        @(negedge clock_s); init_s = 0; valid_s = 0; final_s = 0;
        repeat (bytes_value == 1 ? 1 : phase == 0 ? 1 : phase == 1 ? 6 : phase == 2 ? 10 : 12) tick();
      end
      if (bytes_value == 16 && phase == 2) begin
        @(negedge clock_s); enable_s = 0;
        repeat (3) tick();
      end
      reset_and_check(); aborts_s++;
    end
  endtask

  task automatic check_invalid_config(input bit ad_value, data_present);
    logic [127:0] held_tag, held_cipher;
    logic [4:0] held_bytes;
    held_tag = tag_s; held_cipher = cipher_s; held_bytes = tag_bytes_s;
    for (int count = 0; count < 32; count++) begin
      if (count >= 4 && count <= 16) continue;
      @(negedge clock_s);
      enable_s = 1; init_s = 1; valid_s = data_present; associate_s = ad_value; final_s = 1;
      data_s = '1; bytes_s = 16; last_s = 1; truncate_s = 1; tag_bytes_request_s = 5'(count);
      #1;
      if (init_ready_s !== 0 || ready_s !== 0 || final_ready_s !== 0)
        $fatal(1, "Invalid tag configuration acknowledged");
      repeat (2) begin
        tick();
        if (busy_s !== 0 || init_done_s !== 0 || block_done_s !== 0 || ad_done_s !== 0 ||
            pt_done_s !== 0 || tag_done_s !== 0 || cipher_valid_s !== 0 ||
            tag_s !== held_tag || cipher_s !== held_cipher || tag_bytes_s !== held_bytes)
          $fatal(1, "Invalid init changed state/configuration or consumed simultaneous input");
      end
      invalid_requests_s++;
    end
    // A valid, different configuration is also ignored if init is disabled.
    @(negedge clock_s);
    enable_s = 0; init_s = 1; valid_s = 1; final_s = 1;
    truncate_s = 1; tag_bytes_request_s = captured_tag_bytes_s == 16 ? 4 : 16;
    repeat (2) begin
      tick();
      if (init_ready_s !== 0 || busy_s !== 0 || tag_bytes_s !== held_bytes || tag_s !== held_tag)
        $fatal(1, "Disabled init captured a tag configuration");
    end
    disabled_inits_s++;
  endtask

  task automatic check_default_mode(input logic [127:0] key_value, nonce_value, expected_tag);
    int saved_bytes;
    saved_bytes = selected_tag_bytes_s;
    for (int option_id = 0; option_id < 2; option_id++) begin
      selected_truncate_s = 0; selected_tag_bytes_s = option_id == 0 ? 0 : 31;
      initialize(key_value, nonce_value, 0);
      transfer('1, '0, 0, 1, 1, 0); transfer('1, '0, 0, 1, 0, 0);
      finalize(expected_tag, 0, 0);
      if (tag_bytes_s !== 16 || tag_s !== expected_tag) $fatal(1, "Default tag must remain 128 bits");
    end
    selected_truncate_s = 1; selected_tag_bytes_s = saved_bytes;
    reset_and_check();
  endtask

  task automatic check_vectors;
    int fd, total, id, alen, plen, ad_count, pt_count, count, last;
    logic [127:0] key_value, nonce_value, value, expected_cipher, expected_tag;
    string trailing;
    bit paused;
    fd = $fopen("top.txt", "r");
    if (!fd || $fscanf(fd, "%d\n", total) != 1 || total != 1558) $fatal(1, "Public corpus header");
    for (int sample = 0; sample < total; sample++) begin
      if ($fscanf(fd, "%d %d %d %d %d\n", id, alen, plen, ad_count, pt_count) != 5 || id != sample ||
          alen < 0 || alen > 256 || plen < 0 || plen > 256 ||
          ad_count != (alen == 0 ? 1 : (alen+15)/16) || pt_count != (plen == 0 ? 1 : (plen+15)/16))
        $fatal(1, "Malformed public vector");
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Public key/nonce missing");
      initialize(key_value, nonce_value, sample % 23 == 0);
      if (TEST_TRUNCATION && sample == 0) check_invalid_config(1, 1);
      paused = sample % 17 == 0;
      for (int index = 0; index < ad_count; index++) begin
        if ($fscanf(fd, "%d %d %h\n", count, last, value) != 3 ||
            count != (alen == 0 ? 0 : alen-16*index >= 16 ? 16 : alen-16*index) || last != (index == ad_count-1))
          $fatal(1, "Malformed public AD transfer");
        transfer(value, '0, count, last != 0, 1, paused);
      end
      if (TEST_TRUNCATION && sample == 0) check_invalid_config(0, 1);
      if (TEST_TRUNCATION) $fwrite(actual_fd_s, "%0d %0d %0d ", cases_s, tag_bytes_s, plen+captured_tag_bytes_s);
      else $fwrite(actual_fd_s, "%0d %0d ", sample, plen+16);
      recording_s = 1;
      for (int index = 0; index < pt_count; index++) begin
        if ($fscanf(fd, "%d %d %h\n", count, last, value) != 3 || $fscanf(fd, "%h\n", expected_cipher) != 1 ||
            count != (plen == 0 ? 0 : plen-16*index >= 16 ? 16 : plen-16*index) || last != (index == pt_count-1))
          $fatal(1, "Malformed public PT transfer");
        if (sample == 33 || sample == 528) begin
          recording_s = 0;
          check_pt_aborts(key_value, nonce_value, value, expected_cipher, count);
          initialize(key_value, nonce_value, 0); transfer('1, '0, 0, 1, 1, 0);
          recording_s = 1;
        end
        transfer(value, expected_cipher, count, last != 0, 0, paused);
      end
      if ($fscanf(fd, "%h\n", expected_tag) != 1) $fatal(1, "Public tag missing");
      if (TEST_TRUNCATION && sample == 0) check_invalid_config(0, 0);
      finalize(expected_tag, paused, sample % 5 == 0);
      recording_s = 0; $fwrite(actual_fd_s, "\n");
      if (TEST_TRUNCATION && sample == 0) check_invalid_config(0, 1);
      if (sample == 0) check_initial_ad_final_aborts(key_value, nonce_value, expected_tag);
      if (TEST_TRUNCATION && cases_s == 0) check_default_mode(key_value, nonce_value, expected_tag);
      cases_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Extra public vectors");
    $fclose(fd);
  endtask

  initial begin
    repeat (2) @(negedge clock_s);
    reset_and_check();
    actual_fd_s = $fopen(TEST_TRUNCATION ? "truncated_actual.txt" : "aead_actual.txt", "w");
    if (!actual_fd_s) $fatal(1, "Cannot open public output records");
    for (int profile = 0; profile < (TEST_TRUNCATION ? 13 : 1); profile++) begin
      if (profile != 0) reset_and_check();
      selected_truncate_s = TEST_TRUNCATION;
      selected_tag_bytes_s = TEST_TRUNCATION ? 4 + profile : 16;
      check_vectors();
    end
    $fclose(actual_fd_s);
    reset_and_check();
    if (TEST_TRUNCATION) begin
      $display("[TRUNCATION] CASES: %0d", cases_s);
      $display("[TRUNCATION] TAGS: %0d", tags_s);
      $display("[TRUNCATION] CIPHER_BLOCKS: %0d", cipher_blocks_s);
      $display("[TRUNCATION] INVALID_REQUESTS: %0d", invalid_requests_s);
      $display("[TRUNCATION] DISABLED_INITS: %0d", disabled_inits_s);
      $display("[TRUNCATION] ABORTS: %0d", aborts_s);
      $display("[TRUNCATION] PASS");
    end else begin
      $display("[TOP] CASES: %0d", cases_s);
      $display("[TOP] TAGS: %0d", tags_s);
      $display("[TOP] CIPHER_BLOCKS: %0d", cipher_blocks_s);
      $display("[TOP] ABORTS: %0d", aborts_s);
      $display("[TOP] PASS");
    end
    $finish;
  end

  initial begin
    #100000000;
    $fatal(1, "Public interface watchdog timeout");
  end
endmodule : ascon_top_tb
