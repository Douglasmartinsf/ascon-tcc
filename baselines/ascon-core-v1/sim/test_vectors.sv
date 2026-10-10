function void init_test_vectors();
    // Test vector 0
    test_vectors[0].count = 1;  
    test_vectors[0].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[0].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[0].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[0].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[0].size = 8'h10;
    test_vectors[0].expected_ct = 448'h5EFAB113B0EA40474617F0FD7B077F10973B43203A514ED8;

    // Test vector 1
    test_vectors[1].count = 2;
    test_vectors[1].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[1].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[1].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[1].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[1].size = 8'h10;
    test_vectors[1].expected_ct = 448'hBF72723D152FD9E33644DE9BD37A6C7BAFE6590D01403F73;

    // Test vector 2
    test_vectors[2].count = 3;
    test_vectors[2].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[2].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[2].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[2].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[2].size = 8'h10;
    test_vectors[2].expected_ct = 448'h08AEF97669321B6F476AD7E7962B04107D0A4467990167CE;

    // Test vector 3
    test_vectors[3].count = 4;
    test_vectors[3].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[3].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[3].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[3].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[3].size = 8'h10;
    test_vectors[3].expected_ct = 448'h900740A4EA051B0C16F6C91A431D8CD69C770E5D7736AB98;

    // Test vector 4
    test_vectors[4].count = 5;
    test_vectors[4].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[4].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[4].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[4].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[4].size = 8'h10;
    test_vectors[4].expected_ct = 448'h9F9D9AA1EF72D88ED319A34F6594326A8B39DF271CC2512E;

    // Test vector 5
    test_vectors[5].count = 6;
    test_vectors[5].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[5].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[5].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[5].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[5].size = 8'h10;
    test_vectors[5].expected_ct = 448'h0C6C19B0FF039E9FD6EFB0AB46A530D028CB11657CEC6867;

    // Test vector 6
    test_vectors[6].count = 7;
    test_vectors[6].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[6].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[6].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[6].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[6].size = 8'h10;
    test_vectors[6].expected_ct = 448'h46F20A6BB802E57111238852BF4942FA1F075A167F937BCE;

    // Test vector 7
    test_vectors[7].count = 8;
    test_vectors[7].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[7].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[7].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[7].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[7].size = 8'h11;
    test_vectors[7].expected_ct = 448'hF338928A2BB8DA34421188BF9E966DEFA6D9BA3A86D21669;

    // Test vector 8
    test_vectors[8].count = 9;
    test_vectors[8].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[8].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[8].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[8].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[8].size = 8'h12;
    test_vectors[8].expected_ct = 448'hB38613AA4F88677DE1CC4685AAE238E35D2032359D4012D3;

    // Test vector 9
    test_vectors[9].count = 10;
    test_vectors[9].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[9].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[9].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[9].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[9].size = 8'h12;
    test_vectors[9].expected_ct = 448'h41686728116E749BFDC5702FEC216314D7D9A306BC84DCF2;

    // Test vector 10
    test_vectors[10].count = 11;
    test_vectors[10].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[10].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[10].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[10].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[10].size = 8'h12;
    test_vectors[10].expected_ct = 448'h9A3CE30D7741D4463135B9C1AC1C4629EE7A4E63925E493A;

    // Test vector 11
    test_vectors[11].count = 12;
    test_vectors[11].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[11].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[11].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[11].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[11].size = 8'h12;
    test_vectors[11].expected_ct = 448'h8E1B97083F4293640704C1BBA7F65DBB99F881E0DA290282;

    // Test vector 12
    test_vectors[12].count = 13;
    test_vectors[12].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[12].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[12].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[12].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[12].size = 8'h12;
    test_vectors[12].expected_ct = 448'h2635F718A34B62D8BA7E0A0D48CE982DC5F46D18FA0AA829;

    // Test vector 13
    test_vectors[13].count = 14;
    test_vectors[13].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[13].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[13].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[13].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[13].size = 8'h12;
    test_vectors[13].expected_ct = 448'hAAE06C75966BB0295D16EB442E05E5333AEA875621DDBF27;

    // Test vector 14
    test_vectors[14].count = 15;
    test_vectors[14].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[14].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[14].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[14].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[14].size = 8'h12;
    test_vectors[14].expected_ct = 448'hA8D3C39D34CF5EE7A8CFD0ADC20465E37A716556CCB27123;

    // Test vector 15
    test_vectors[15].count = 16;
    test_vectors[15].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[15].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[15].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[15].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[15].size = 8'h13;
    test_vectors[15].expected_ct = 448'h42CD8C3F62DECC6BBBDCE06638AAF57D7C17C4438C6251EF;

    // Test vector 16
    test_vectors[16].count = 17;
    test_vectors[16].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[16].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[16].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[16].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[16].size = 8'h16;
    test_vectors[16].expected_ct = 448'hE7E5C7F71D251D49CE779FDCEDAC6E32B9B02C9B5B848191;

    // Test vector 17
    test_vectors[17].count = 18;
    test_vectors[17].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[17].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[17].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[17].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[17].size = 8'h16;
    test_vectors[17].expected_ct = 448'h8EA432E4B0273969BBF4115D6104959923D077B6CA0BE8C8;

    // Test vector 18
    test_vectors[18].count = 19;
    test_vectors[18].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[18].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[18].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[18].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[18].size = 8'h16;
    test_vectors[18].expected_ct = 448'h732AAF0D04E6361035F126C704FA90F895ADBE72C772680F;

    // Test vector 19
    test_vectors[19].count = 20;
    test_vectors[19].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[19].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[19].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[19].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[19].size = 8'h16;
    test_vectors[19].expected_ct = 448'hF0A4B91928FFF75844E0FE9A261AA7DC51B9B86FCF3EF50D;

    // Test vector 20
    test_vectors[20].count = 21;
    test_vectors[20].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[20].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[20].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[20].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[20].size = 8'h16;
    test_vectors[20].expected_ct = 448'h652289701299914E8746AD851BD15C774385188CB0A1B383;

    // Test vector 21
    test_vectors[21].count = 22;
    test_vectors[21].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[21].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[21].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[21].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[21].size = 8'h16;
    test_vectors[21].expected_ct = 448'hB77ECCCA41E9076D17BD3DF822E68083DFD522250E8DB302;

    // Test vector 22
    test_vectors[22].count = 23;
    test_vectors[22].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[22].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[22].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[22].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[22].size = 8'h16;
    test_vectors[22].expected_ct = 448'hEB2FD4A53E8D44DB349A0B7F91F2A15072F36F15A6531742;

    // Test vector 23
    test_vectors[23].count = 24;
    test_vectors[23].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[23].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[23].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[23].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[23].size = 8'h17;
    test_vectors[23].expected_ct = 448'h73D4CD3CF96F0875881A96D6D4CDBCFC97696F05DC9F16A9;

    // Test vector 24
    test_vectors[24].count = 25;
    test_vectors[24].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[24].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[24].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[24].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[24].size = 8'h1E;
    test_vectors[24].expected_ct = 448'h758522EE8F9B166D662C2FFCAC529AB41A4B5F2FB221C4F4;

    // Test vector 25
    test_vectors[25].count = 26;
    test_vectors[25].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[25].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[25].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[25].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[25].size = 8'h1E;
    test_vectors[25].expected_ct = 448'h161AC3E4ADE7B8CF574ADB2212DD3304D064088719BEE837;

    // Test vector 26
    test_vectors[26].count = 27;
    test_vectors[26].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[26].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[26].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[26].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[26].size = 8'h1E;
    test_vectors[26].expected_ct = 448'h09A8849000D11794551EB18660D7AA130EB5044C5B5175F6;

    // Test vector 27
    test_vectors[27].count = 28;
    test_vectors[27].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[27].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[27].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[27].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[27].size = 8'h1E;
    test_vectors[27].expected_ct = 448'h01CD32715DFD630BB9E40DDEB508DC1683E6493BB2FBC3E8;

    // Test vector 28
    test_vectors[28].count = 29;
    test_vectors[28].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[28].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[28].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[28].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[28].size = 8'h1E;
    test_vectors[28].expected_ct = 448'h18AFB984F1C3BEDCCC3E6FE2F6648EBE3A218E2FC420ECFB;

    // Test vector 29
    test_vectors[29].count = 30;
    test_vectors[29].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[29].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[29].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[29].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[29].size = 8'h1E;
    test_vectors[29].expected_ct = 448'hB2CB543086A1E9F2FCF514EFEEB7557AAA4CD5576A9B6D06;

    // Test vector 30
    test_vectors[30].count = 31;
    test_vectors[30].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[30].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[30].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[30].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[30].size = 8'h1E;
    test_vectors[30].expected_ct = 448'hF328DF5AA680D8D516691ADFB926008CB33A667994E6562D;

    // Test vector 31
    test_vectors[31].count = 32;
    test_vectors[31].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[31].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[31].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[31].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[31].size = 8'h1F;
    test_vectors[31].expected_ct = 448'hE1B2C05F6F1FC804AC65F9545ABFEF03890B44EFB8F6216C;

    // Test vector 32
    test_vectors[32].count = 33;
    test_vectors[32].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[32].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[32].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[32].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[32].size = 8'h20;
    test_vectors[32].expected_ct = 448'h5EFAB113B0EA4047759B886218A6EAAD74361A4E7F64DFCB15;

    // Test vector 33
    test_vectors[33].count = 34;
    test_vectors[33].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[33].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[33].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[33].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[33].size = 8'h20;
    test_vectors[33].expected_ct = 448'hBF72723D152FD9E32048AF4E4D51DF8F813FD526DF69CF022D;

    // Test vector 34
    test_vectors[34].count = 35;
    test_vectors[34].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[34].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[34].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[34].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[34].size = 8'h20;
    test_vectors[34].expected_ct = 448'h08AEF97669321B6F58991B126C9D913D416A6A536F8E855438;

    // Test vector 35
    test_vectors[35].count = 36;
    test_vectors[35].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[35].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[35].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[35].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[35].size = 8'h20;
    test_vectors[35].expected_ct = 448'h900740A4EA051B0C003B2332323804BF14CA0DCE62AA7C8B43;

    // Test vector 36
    test_vectors[36].count = 37;
    test_vectors[36].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[36].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[36].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[36].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[36].size = 8'h20;
    test_vectors[36].expected_ct = 448'h9F9D9AA1EF72D88E77CD178C470143E7A2D67437E11475DA5E;

    // Test vector 37
    test_vectors[37].count = 38;
    test_vectors[37].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[37].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[37].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[37].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[37].size = 8'h20;
    test_vectors[37].expected_ct = 448'h0C6C19B0FF039E9FD108B7494E5DBE9B876534A99DD2CC2264;

    // Test vector 38
    test_vectors[38].count = 39;
    test_vectors[38].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[38].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[38].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[38].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[38].size = 8'h20;
    test_vectors[38].expected_ct = 448'h46F20A6BB802E571BFDCFE7CFC9B41453B8C7AD70277280688;

    // Test vector 39
    test_vectors[39].count = 40;
    test_vectors[39].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[39].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[39].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[39].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[39].size = 8'h21;
    test_vectors[39].expected_ct = 448'hF338928A2BB8DA348EE14A63A95091B4E4ABDE1103FE129EF5;

    // Test vector 40
    test_vectors[40].count = 41;
    test_vectors[40].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[40].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[40].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[40].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[40].size = 8'h22;
    test_vectors[40].expected_ct = 448'hB38613AA4F88677DD53CA87194DD9D986D907C3F5B290A6CCE;

    // Test vector 41
    test_vectors[41].count = 42;
    test_vectors[41].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[41].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[41].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[41].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[41].size = 8'h22;
    test_vectors[41].expected_ct = 448'h41686728116E749BFE645746694D80569AF08ABE1CB60EA233;

    // Test vector 42
    test_vectors[42].count = 43;
    test_vectors[42].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[42].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[42].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[42].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[42].size = 8'h22;
    test_vectors[42].expected_ct = 448'h9A3CE30D7741D446555022948E5D81B10A503A5F88A2E6F5C0;

    // Test vector 43
    test_vectors[43].count = 44;
    test_vectors[43].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[43].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[43].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[43].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[43].size = 8'h22;
    test_vectors[43].expected_ct = 448'h8E1B97083F429364FB0E25DC818E806A40FA3D185C9BFB7E21;

    // Test vector 44
    test_vectors[44].count = 45;
    test_vectors[44].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[44].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[44].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[44].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[44].size = 8'h22;
    test_vectors[44].expected_ct = 448'h2635F718A34B62D83F20C445E8EA282AD92E40C2A8EBFAF553;

    // Test vector 45
    test_vectors[45].count = 46;
    test_vectors[45].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[45].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[45].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[45].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[45].size = 8'h22;
    test_vectors[45].expected_ct = 448'hAAE06C75966BB029C725F1A34A3F06CB7BB169AF29E3C696FA;

    // Test vector 46
    test_vectors[46].count = 47;
    test_vectors[46].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[46].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[46].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[46].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[46].size = 8'h22;
    test_vectors[46].expected_ct = 448'hA8D3C39D34CF5EE7A9E88519971D5B85C4F4102415B28AA968;

    // Test vector 47
    test_vectors[47].count = 48;
    test_vectors[47].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[47].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[47].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[47].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[47].size = 8'h23;
    test_vectors[47].expected_ct = 448'h42CD8C3F62DECC6B0327CE9E8DC2E98A8408158527F8BAEBB0;

    // Test vector 48
    test_vectors[48].count = 49;
    test_vectors[48].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[48].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[48].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[48].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[48].size = 8'h26;
    test_vectors[48].expected_ct = 448'hE7E5C7F71D251D49C202C2BAF25DF0DC97A3F81AE9AA968BDD;

    // Test vector 49
    test_vectors[49].count = 50;
    test_vectors[49].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[49].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[49].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[49].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[49].size = 8'h26;
    test_vectors[49].expected_ct = 448'h8EA432E4B02739697DA247BCF60080A7C507778458C8E0570C;

    // Test vector 50
    test_vectors[50].count = 51;
    test_vectors[50].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[50].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[50].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[50].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[50].size = 8'h26;
    test_vectors[50].expected_ct = 448'h732AAF0D04E63610713A79705A0F448CEEA7BAD6F861EC84A5;

    // Test vector 51
    test_vectors[51].count = 52;
    test_vectors[51].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[51].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[51].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[51].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[51].size = 8'h26;
    test_vectors[51].expected_ct = 448'hF0A4B91928FFF758A3597F5874B4C54F868AD5583963C2F4B9;

    // Test vector 52
    test_vectors[52].count = 53;
    test_vectors[52].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[52].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[52].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[52].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[52].size = 8'h26;
    test_vectors[52].expected_ct = 448'h652289701299914EF7DF7F1EA9B5C8D2F1818575F9F3B84971;

    // Test vector 53
    test_vectors[53].count = 54;
    test_vectors[53].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[53].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[53].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[53].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[53].size = 8'h26;
    test_vectors[53].expected_ct = 448'hB77ECCCA41E9076DF408438DFBED640F6A9A139841AD176D58;

    // Test vector 54
    test_vectors[54].count = 55;
    test_vectors[54].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[54].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[54].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[54].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[54].size = 8'h26;
    test_vectors[54].expected_ct = 448'hEB2FD4A53E8D44DBBF4D9B09D7947B899A65745BE1DBBC60F6;

    // Test vector 55
    test_vectors[55].count = 56;
    test_vectors[55].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[55].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[55].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[55].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[55].size = 8'h27;
    test_vectors[55].expected_ct = 448'h73D4CD3CF96F0875CC66F196F9848DB6828A37DB6720CB46FA;

    // Test vector 56
    test_vectors[56].count = 57;
    test_vectors[56].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[56].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[56].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[56].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[56].size = 8'h2E;
    test_vectors[56].expected_ct = 448'h758522EE8F9B166DB3496C18D9548EE598AA8C249308AED088;

    // Test vector 57
    test_vectors[57].count = 58;
    test_vectors[57].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[57].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[57].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[57].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[57].size = 8'h2E;
    test_vectors[57].expected_ct = 448'h161AC3E4ADE7B8CF284E965F275FA579A370D82ED99AD57C0A;

    // Test vector 58
    test_vectors[58].count = 59;
    test_vectors[58].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[58].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[58].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[58].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[58].size = 8'h2E;
    test_vectors[58].expected_ct = 448'h09A8849000D117940B1B6287E377E6B8B025D09F6567A3A5D3;

    // Test vector 59
    test_vectors[59].count = 60;
    test_vectors[59].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[59].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[59].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[59].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[59].size = 8'h2E;
    test_vectors[59].expected_ct = 448'h01CD32715DFD630B2350A7ECF83DC6D3CCBD775FE598F56649;

    // Test vector 60
    test_vectors[60].count = 61;
    test_vectors[60].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[60].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[60].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[60].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[60].size = 8'h2E;
    test_vectors[60].expected_ct = 448'h18AFB984F1C3BEDCE591FA209D5EE155FF442B29AFC31D4B25;

    // Test vector 61
    test_vectors[61].count = 62;
    test_vectors[61].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[61].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[61].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[61].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[61].size = 8'h2E;
    test_vectors[61].expected_ct = 448'hB2CB543086A1E9F26209D000A1C6C7A7337EC392036A06D5EA;

    // Test vector 62
    test_vectors[62].count = 63;
    test_vectors[62].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[62].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[62].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[62].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[62].size = 8'h2E;
    test_vectors[62].expected_ct = 448'hF328DF5AA680D8D527B7DEBFCDABC9894FA576281D83CB1319;

    // Test vector 63
    test_vectors[63].count = 64;
    test_vectors[63].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[63].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[63].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[63].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[63].size = 8'h2F;
    test_vectors[63].expected_ct = 448'hE1B2C05F6F1FC804AFB9352B88EEAD3C4963315DA59187F61C;

    // Test vector 64
    test_vectors[64].count = 65;
    test_vectors[64].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[64].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[64].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[64].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[64].size = 8'h20;
    test_vectors[64].expected_ct = 448'h5EFAB113B0EA404775AD64DFDF632F90907307C760B0BD4A20CC;

    // Test vector 65
    test_vectors[65].count = 66;
    test_vectors[65].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[65].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[65].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[65].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[65].size = 8'h20;
    test_vectors[65].expected_ct = 448'hBF72723D152FD9E320DB2CDE006BDC90919C1241C41343B35706;

    // Test vector 66
    test_vectors[66].count = 67;
    test_vectors[66].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[66].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[66].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[66].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[66].size = 8'h20;
    test_vectors[66].expected_ct = 448'h08AEF97669321B6F58AC8BEA67E658A47D1D0AFF3E3103D0D729;

    // Test vector 67
    test_vectors[67].count = 68;
    test_vectors[67].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[67].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[67].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[67].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[67].size = 8'h20;
    test_vectors[67].expected_ct = 448'h900740A4EA051B0C002CEA39E1C79D6C8ECE7DD7769332D02006;

    // Test vector 68
    test_vectors[68].count = 69;
    test_vectors[68].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[68].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[68].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[68].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[68].size = 8'h20;
    test_vectors[68].expected_ct = 448'h9F9D9AA1EF72D88E771E1C8E39C654A40531F410718D2C5068FA;

    // Test vector 69
    test_vectors[69].count = 70;
    test_vectors[69].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[69].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[69].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[69].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[69].size = 8'h20;
    test_vectors[69].expected_ct = 448'h0C6C19B0FF039E9FD153373EE638D6B0FCBEC70E78A677B799C3;

    // Test vector 70
    test_vectors[70].count = 71;
    test_vectors[70].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[70].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[70].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[70].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[70].size = 8'h20;
    test_vectors[70].expected_ct = 448'h46F20A6BB802E571BF2A55B43226F6FFE2C9C43E85439C26FFB3;

    // Test vector 71
    test_vectors[71].count = 72;
    test_vectors[71].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[71].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[71].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[71].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[71].size = 8'h21;
    test_vectors[71].expected_ct = 448'hF338928A2BB8DA348E39542FEA86D7206FF59A0CF70B21FEA095;

    // Test vector 72
    test_vectors[72].count = 73;
    test_vectors[72].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[72].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[72].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[72].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[72].size = 8'h22;
    test_vectors[72].expected_ct = 448'hB38613AA4F88677DD583F9F307567772F887DE50729E216A4609;

    // Test vector 73
    test_vectors[73].count = 74;
    test_vectors[73].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[73].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[73].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[73].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[73].size = 8'h22;
    test_vectors[73].expected_ct = 448'h41686728116E749BFEE5F0E9DAE88C8883666379CE33FE229D1F;

    // Test vector 74
    test_vectors[74].count = 75;
    test_vectors[74].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[74].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[74].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[74].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[74].size = 8'h22;
    test_vectors[74].expected_ct = 448'h9A3CE30D7741D446557CEDAF417B91FE4F124F8CF3BFDFC8EC58;

    // Test vector 75
    test_vectors[75].count = 76;
    test_vectors[75].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[75].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[75].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[75].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[75].size = 8'h22;
    test_vectors[75].expected_ct = 448'h8E1B97083F429364FB7A53396AA8FF14779AC689300D44F5BC00;

    // Test vector 76
    test_vectors[76].count = 77;
    test_vectors[76].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[76].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[76].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[76].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[76].size = 8'h22;
    test_vectors[76].expected_ct = 448'h2635F718A34B62D83FAB7771BD1B9EEF177315014A068AEDE85A;

    // Test vector 77
    test_vectors[77].count = 78;
    test_vectors[77].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[77].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[77].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[77].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[77].size = 8'h22;
    test_vectors[77].expected_ct = 448'hAAE06C75966BB029C70F10E3A1F2CFE20B91B5830BD9FC061322;

    // Test vector 78
    test_vectors[78].count = 79;
    test_vectors[78].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[78].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[78].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[78].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[78].size = 8'h22;
    test_vectors[78].expected_ct = 448'hA8D3C39D34CF5EE7A935DB2AD3BFBD9835E92A582DCBA0FB69D0;

    // Test vector 79
    test_vectors[79].count = 80;
    test_vectors[79].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[79].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[79].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[79].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[79].size = 8'h23;
    test_vectors[79].expected_ct = 448'h42CD8C3F62DECC6B03BD5DF3C1D319FA0D85D0F7AC3C3C58E3A3;

    // Test vector 80
    test_vectors[80].count = 81;
    test_vectors[80].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[80].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[80].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[80].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[80].size = 8'h26;
    test_vectors[80].expected_ct = 448'hE7E5C7F71D251D49C2E0DA493E9594A5C964350E0119357EB143;

    // Test vector 81
    test_vectors[81].count = 82;
    test_vectors[81].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[81].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[81].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[81].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[81].size = 8'h26;
    test_vectors[81].expected_ct = 448'h8EA432E4B02739697DFEF978B69A258303E6E00667B7A4A9C551;

    // Test vector 82
    test_vectors[82].count = 83;
    test_vectors[82].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[82].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[82].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[82].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[82].size = 8'h26;
    test_vectors[82].expected_ct = 448'h732AAF0D04E6361071638DD9F5E7BCD074E039CD2C5BF7266A82;

    // Test vector 83
    test_vectors[83].count = 84;
    test_vectors[83].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[83].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[83].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[83].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[83].size = 8'h26;
    test_vectors[83].expected_ct = 448'hF0A4B91928FFF758A31A763962BEC8980C141508E59CDAA0B316;

    // Test vector 84
    test_vectors[84].count = 85;
    test_vectors[84].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[84].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[84].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[84].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[84].size = 8'h26;
    test_vectors[84].expected_ct = 448'h652289701299914EF7AA233EA35A15633E102C7F17CF60E67534;

    // Test vector 85
    test_vectors[85].count = 86;
    test_vectors[85].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[85].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[85].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[85].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[85].size = 8'h26;
    test_vectors[85].expected_ct = 448'hB77ECCCA41E9076DF4C6E2EEE53512440E8DC99F95D38CEF9582;

    // Test vector 86
    test_vectors[86].count = 87;
    test_vectors[86].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[86].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[86].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[86].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[86].size = 8'h26;
    test_vectors[86].expected_ct = 448'hEB2FD4A53E8D44DBBF5D3BD41B177C2E59415929F6061901AA35;

    // Test vector 87
    test_vectors[87].count = 88;
    test_vectors[87].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[87].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[87].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[87].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[87].size = 8'h27;
    test_vectors[87].expected_ct = 448'h73D4CD3CF96F0875CC330204F883C0AFB840EC9A9DBDE86709CF;

    // Test vector 88
    test_vectors[88].count = 89;
    test_vectors[88].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[88].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[88].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[88].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[88].size = 8'h2E;
    test_vectors[88].expected_ct = 448'h758522EE8F9B166DB3E2ED7127810689118B2CCB4D7AEA0C85B8;

    // Test vector 89
    test_vectors[89].count = 90;
    test_vectors[89].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[89].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[89].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[89].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[89].size = 8'h2E;
    test_vectors[89].expected_ct = 448'h161AC3E4ADE7B8CF28888AC70B015618345CD5CB79D1BBE28474;

    // Test vector 90
    test_vectors[90].count = 91;
    test_vectors[90].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[90].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[90].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[90].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[90].size = 8'h2E;
    test_vectors[90].expected_ct = 448'h09A8849000D117940BBA7BC7C20F304CB88F67E4E5C42D922453;

    // Test vector 91
    test_vectors[91].count = 92;
    test_vectors[91].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[91].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[91].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[91].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[91].size = 8'h2E;
    test_vectors[91].expected_ct = 448'h01CD32715DFD630B23476DADEEE65E8B7178C7A0D9D9492CBDBD;

    // Test vector 92
    test_vectors[92].count = 93;
    test_vectors[92].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[92].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[92].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[92].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[92].size = 8'h2E;
    test_vectors[92].expected_ct = 448'h18AFB984F1C3BEDCE5EC6927E7EA5C6A9A3010B2A99E77D2626C;

    // Test vector 93
    test_vectors[93].count = 94;
    test_vectors[93].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[93].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[93].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[93].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[93].size = 8'h2E;
    test_vectors[93].expected_ct = 448'hB2CB543086A1E9F262276E28BC5017C5959826BD5A97CB0DF1EF;

    // Test vector 94
    test_vectors[94].count = 95;
    test_vectors[94].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[94].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[94].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[94].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[94].size = 8'h2E;
    test_vectors[94].expected_ct = 448'hF328DF5AA680D8D527EA7609027C5E996F4735A4A7ADCAE15297;

    // Test vector 95
    test_vectors[95].count = 96;
    test_vectors[95].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[95].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[95].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[95].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[95].size = 8'h2F;
    test_vectors[95].expected_ct = 448'hE1B2C05F6F1FC804AF8AEA15AA62B9F0331F6926B85710D93E1D;

    // Test vector 96
    test_vectors[96].count = 97;
    test_vectors[96].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[96].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[96].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[96].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[96].size = 8'h20;
    test_vectors[96].expected_ct = 448'h5EFAB113B0EA404775ADE7A9F85927DB14566D6E3BD8CBD1A440F2;

    // Test vector 97
    test_vectors[97].count = 98;
    test_vectors[97].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[97].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[97].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[97].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[97].size = 8'h20;
    test_vectors[97].expected_ct = 448'hBF72723D152FD9E320DBAF8C3A80912B8AD582F9892CD64662D6F4;

    // Test vector 98
    test_vectors[98].count = 99;
    test_vectors[98].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[98].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[98].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[98].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[98].size = 8'h20;
    test_vectors[98].expected_ct = 448'h08AEF97669321B6F58AC266055EE0A644A7F6711ADE03FFED2AF6A;

    // Test vector 99
    test_vectors[99].count = 100;
    test_vectors[99].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[99].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[99].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[99].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[99].size = 8'h20;
    test_vectors[99].expected_ct = 448'h900740A4EA051B0C002C55F4C9F9F71DA4C1BDA8DB69144DBD1098;

    // Test vector 100
    test_vectors[100].count = 101;
    test_vectors[100].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[100].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[100].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[100].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[100].size = 8'h20;
    test_vectors[100].expected_ct = 448'h9F9D9AA1EF72D88E771E18E2CF3FBDE6137EAB83763ADFBF9D9134;

    // Test vector 101
    test_vectors[101].count = 102;
    test_vectors[101].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[101].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[101].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[101].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[101].size = 8'h20;
    test_vectors[101].expected_ct = 448'h0C6C19B0FF039E9FD1534F7484ED1C9DDC10F72427C2AD653C4AD0;

    // Test vector 102
    test_vectors[102].count = 103;
    test_vectors[102].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[102].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[102].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[102].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[102].size = 8'h20;
    test_vectors[102].expected_ct = 448'h46F20A6BB802E571BF2A65CFE6A291AB1A89888E2B78330B82B824;

    // Test vector 103
    test_vectors[103].count = 104;
    test_vectors[103].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[103].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[103].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[103].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[103].size = 8'h21;
    test_vectors[103].expected_ct = 448'hF338928A2BB8DA348E39F2B643927B3F5F4162DB98387621B6E51A;

    // Test vector 104
    test_vectors[104].count = 105;
    test_vectors[104].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[104].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[104].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[104].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[104].size = 8'h22;
    test_vectors[104].expected_ct = 448'hB38613AA4F88677DD583CE0AACD43C40A7C7CD0D650AE299088005;

    // Test vector 105
    test_vectors[105].count = 106;
    test_vectors[105].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[105].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[105].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[105].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[105].size = 8'h22;
    test_vectors[105].expected_ct = 448'h41686728116E749BFEE5AC7D0BE35B04EA44BB68D8A59BA6DE2745;

    // Test vector 106
    test_vectors[106].count = 107;
    test_vectors[106].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[106].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[106].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[106].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[106].size = 8'h22;
    test_vectors[106].expected_ct = 448'h9A3CE30D7741D446557C2EBD5A42280EB82E64781BD9DC5B63AD4A;

    // Test vector 107
    test_vectors[107].count = 108;
    test_vectors[107].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[107].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[107].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[107].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[107].size = 8'h22;
    test_vectors[107].expected_ct = 448'h8E1B97083F429364FB7AE58DCBAC101F16465DF103875E6473649D;

    // Test vector 108
    test_vectors[108].count = 109;
    test_vectors[108].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[108].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[108].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[108].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[108].size = 8'h22;
    test_vectors[108].expected_ct = 448'h2635F718A34B62D83FAB15CD05E623AC007A15786592DCFEE02B9C;

    // Test vector 109
    test_vectors[109].count = 110;
    test_vectors[109].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[109].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[109].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[109].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[109].size = 8'h22;
    test_vectors[109].expected_ct = 448'hAAE06C75966BB029C70F8044D611E847CD4DE9EA4D5FDE3354DAAC;

    // Test vector 110
    test_vectors[110].count = 111;
    test_vectors[110].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[110].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[110].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[110].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[110].size = 8'h22;
    test_vectors[110].expected_ct = 448'hA8D3C39D34CF5EE7A9354072393F37D9B3A50C35BB9D92B1A6DCF4;

    // Test vector 111
    test_vectors[111].count = 112;
    test_vectors[111].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[111].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[111].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[111].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[111].size = 8'h23;
    test_vectors[111].expected_ct = 448'h42CD8C3F62DECC6B03BDEE79177E6E873DD9012894502B697E13E8;

    // Test vector 112
    test_vectors[112].count = 113;
    test_vectors[112].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[112].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[112].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[112].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[112].size = 8'h26;
    test_vectors[112].expected_ct = 448'hE7E5C7F71D251D49C2E0C5AAEE610F33CD6DE393B86BCEC0D794DF;

    // Test vector 113
    test_vectors[113].count = 114;
    test_vectors[113].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[113].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[113].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[113].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[113].size = 8'h26;
    test_vectors[113].expected_ct = 448'h8EA432E4B02739697DFE3ED575F32579A5B94391B9B5267DA991C1;

    // Test vector 114
    test_vectors[114].count = 115;
    test_vectors[114].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[114].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[114].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[114].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[114].size = 8'h26;
    test_vectors[114].expected_ct = 448'h732AAF0D04E63610716363EA90F9604C76FF32C399F55CFD0C98C0;

    // Test vector 115
    test_vectors[115].count = 116;
    test_vectors[115].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[115].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[115].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[115].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[115].size = 8'h26;
    test_vectors[115].expected_ct = 448'hF0A4B91928FFF758A31A4651884F1BAE1910A17AB0426F66257A96;

    // Test vector 116
    test_vectors[116].count = 117;
    test_vectors[116].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[116].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[116].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[116].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[116].size = 8'h26;
    test_vectors[116].expected_ct = 448'h652289701299914EF7AAF739CD711980059C60B2D7B199710ED619;

    // Test vector 117
    test_vectors[117].count = 118;
    test_vectors[117].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[117].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[117].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[117].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[117].size = 8'h26;
    test_vectors[117].expected_ct = 448'hB77ECCCA41E9076DF4C629BFFF51E3CC555408A5C79922B15A9C05;

    // Test vector 118
    test_vectors[118].count = 119;
    test_vectors[118].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[118].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[118].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[118].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[118].size = 8'h26;
    test_vectors[118].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4660E8A86F749312C10C1FF0388C69B87;

    // Test vector 119
    test_vectors[119].count = 120;
    test_vectors[119].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[119].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[119].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[119].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[119].size = 8'h27;
    test_vectors[119].expected_ct = 448'h73D4CD3CF96F0875CC3324C88CDBA8E298D8C478E1DDA679852FEB;

    // Test vector 120
    test_vectors[120].count = 121;
    test_vectors[120].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[120].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[120].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[120].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[120].size = 8'h2E;
    test_vectors[120].expected_ct = 448'h758522EE8F9B166DB3E2A559D499A8DA98520012D6A0D3DD43BE8E;

    // Test vector 121
    test_vectors[121].count = 122;
    test_vectors[121].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[121].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[121].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[121].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[121].size = 8'h2E;
    test_vectors[121].expected_ct = 448'h161AC3E4ADE7B8CF2888DC2D3A8F4FC9106607ED6EE27614F366AD;

    // Test vector 122
    test_vectors[122].count = 123;
    test_vectors[122].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[122].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[122].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[122].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[122].size = 8'h2E;
    test_vectors[122].expected_ct = 448'h09A8849000D117940BBA309E75992426A6E0E3BF6DEB0F2F8D3462;

    // Test vector 123
    test_vectors[123].count = 124;
    test_vectors[123].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[123].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[123].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[123].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[123].size = 8'h2E;
    test_vectors[123].expected_ct = 448'h01CD32715DFD630B2347DFC6E01C2C10D67EBCEBA3B86B77FF4E2E;

    // Test vector 124
    test_vectors[124].count = 125;
    test_vectors[124].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[124].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[124].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[124].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[124].size = 8'h2E;
    test_vectors[124].expected_ct = 448'h18AFB984F1C3BEDCE5ECFDECCED07D1A95B3312CD3932A16FFFAD1;

    // Test vector 125
    test_vectors[125].count = 126;
    test_vectors[125].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[125].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[125].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[125].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[125].size = 8'h2E;
    test_vectors[125].expected_ct = 448'hB2CB543086A1E9F26227AD1690040ED4BF24CFC80F98CC91AB5F92;

    // Test vector 126
    test_vectors[126].count = 127;
    test_vectors[126].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[126].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[126].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[126].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[126].size = 8'h2E;
    test_vectors[126].expected_ct = 448'hF328DF5AA680D8D527EAAC4BBEB48ED183833C08DAED6C3DD042D0;

    // Test vector 127
    test_vectors[127].count = 128;
    test_vectors[127].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[127].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[127].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[127].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[127].size = 8'h2F;
    test_vectors[127].expected_ct = 448'hE1B2C05F6F1FC804AF8A6F57794D153DE81A6EB02F814E26D54E91;

    // Test vector 128
    test_vectors[128].count = 129;
    test_vectors[128].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[128].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[128].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[128].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[128].size = 8'h20;
    test_vectors[128].expected_ct = 448'h5EFAB113B0EA404775ADE744F101E1061D6006FCB4AF398DF2E66659;

    // Test vector 129
    test_vectors[129].count = 130;
    test_vectors[129].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[129].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[129].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[129].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[129].size = 8'h20;
    test_vectors[129].expected_ct = 448'hBF72723D152FD9E320DBAF5714DF90C6BBF0DD89C47E5A70A19F7D5D;

    // Test vector 130
    test_vectors[130].count = 131;
    test_vectors[130].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[130].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[130].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[130].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[130].size = 8'h20;
    test_vectors[130].expected_ct = 448'h08AEF97669321B6F58AC264FB356FC458705D04F10ADDE275171BFFC;

    // Test vector 131
    test_vectors[131].count = 132;
    test_vectors[131].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[131].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[131].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[131].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[131].size = 8'h20;
    test_vectors[131].expected_ct = 448'h900740A4EA051B0C002C55682E56B9F4321FF4B841BBE2D060228DF4;

    // Test vector 132
    test_vectors[132].count = 133;
    test_vectors[132].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[132].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[132].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[132].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[132].size = 8'h20;
    test_vectors[132].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB50B35372070323FA90B68487A575C698;

    // Test vector 133
    test_vectors[133].count = 134;
    test_vectors[133].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[133].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[133].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[133].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[133].size = 8'h20;
    test_vectors[133].expected_ct = 448'h0C6C19B0FF039E9FD1534F9036CB5A7A37657D1A3930981AFADE2918;

    // Test vector 134
    test_vectors[134].count = 135;
    test_vectors[134].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[134].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[134].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[134].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[134].size = 8'h20;
    test_vectors[134].expected_ct = 448'h46F20A6BB802E571BF2A65BE375F94340377E30CC154CE0935158FEB;

    // Test vector 135
    test_vectors[135].count = 136;
    test_vectors[135].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[135].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[135].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[135].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[135].size = 8'h21;
    test_vectors[135].expected_ct = 448'hF338928A2BB8DA348E39F22D63F21F85D28E5E71482C2C40B33C7E6E;

    // Test vector 136
    test_vectors[136].count = 137;
    test_vectors[136].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[136].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[136].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[136].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[136].size = 8'h22;
    test_vectors[136].expected_ct = 448'hB38613AA4F88677DD583CECDEB8CADE91D0287858EF796944AF052F0;

    // Test vector 137
    test_vectors[137].count = 138;
    test_vectors[137].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[137].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[137].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[137].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[137].size = 8'h22;
    test_vectors[137].expected_ct = 448'h41686728116E749BFEE5AC02E73ED9D116A9D2CE60F5D5C22CF285D0;

    // Test vector 138
    test_vectors[138].count = 139;
    test_vectors[138].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[138].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[138].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[138].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[138].size = 8'h22;
    test_vectors[138].expected_ct = 448'h9A3CE30D7741D446557C2E0839347BDF51FE5A11998B4D4E1BE2EFC7;

    // Test vector 139
    test_vectors[139].count = 140;
    test_vectors[139].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[139].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[139].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[139].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[139].size = 8'h22;
    test_vectors[139].expected_ct = 448'h8E1B97083F429364FB7AE5905927DB7F5BF435B349E950239CDD565F;

    // Test vector 140
    test_vectors[140].count = 141;
    test_vectors[140].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[140].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[140].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[140].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[140].size = 8'h22;
    test_vectors[140].expected_ct = 448'h2635F718A34B62D83FAB15B1DFBD6DB539EFD39AEF272A421ABE1AFD;

    // Test vector 141
    test_vectors[141].count = 142;
    test_vectors[141].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[141].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[141].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[141].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[141].size = 8'h22;
    test_vectors[141].expected_ct = 448'hAAE06C75966BB029C70F80DC1644079266BB759B0E0B0DB9B74EE5EF;

    // Test vector 142
    test_vectors[142].count = 143;
    test_vectors[142].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[142].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[142].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[142].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[142].size = 8'h22;
    test_vectors[142].expected_ct = 448'hA8D3C39D34CF5EE7A935405DB097144E687F58E8E0446F305EC6ECC6;

    // Test vector 143
    test_vectors[143].count = 144;
    test_vectors[143].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[143].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[143].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[143].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[143].size = 8'h23;
    test_vectors[143].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED16B834A9C4968D206016C3434582D99A;

    // Test vector 144
    test_vectors[144].count = 145;
    test_vectors[144].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[144].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[144].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[144].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[144].size = 8'h26;
    test_vectors[144].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D9EC5DCD64200C9AD26FF2E27C7EC08C;

    // Test vector 145
    test_vectors[145].count = 146;
    test_vectors[145].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[145].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[145].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[145].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[145].size = 8'h26;
    test_vectors[145].expected_ct = 448'h8EA432E4B02739697DFE3EDF1159ACA658A3BFB6D3264990E40F20E2;

    // Test vector 146
    test_vectors[146].count = 147;
    test_vectors[146].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[146].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[146].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[146].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[146].size = 8'h26;
    test_vectors[146].expected_ct = 448'h732AAF0D04E63610716363967CCA623A7CF796490EF211F00387FC74;

    // Test vector 147
    test_vectors[147].count = 148;
    test_vectors[147].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[147].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[147].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[147].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[147].size = 8'h26;
    test_vectors[147].expected_ct = 448'hF0A4B91928FFF758A31A4659CBACDE9C64FB97B553C9D89FDE7E3A30;

    // Test vector 148
    test_vectors[148].count = 149;
    test_vectors[148].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[148].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[148].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[148].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[148].size = 8'h26;
    test_vectors[148].expected_ct = 448'h652289701299914EF7AAF77F5169D2A44617C0F3BC8FBEA820848A5A;

    // Test vector 149
    test_vectors[149].count = 150;
    test_vectors[149].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[149].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[149].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[149].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[149].size = 8'h26;
    test_vectors[149].expected_ct = 448'hB77ECCCA41E9076DF4C629BFEB815B8E7189DF90B8A12FD8502D6582;

    // Test vector 150
    test_vectors[150].count = 151;
    test_vectors[150].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[150].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[150].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[150].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[150].size = 8'h26;
    test_vectors[150].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4472F6AF8E3DE09AB2E54253A545B9FFC51;

    // Test vector 151
    test_vectors[151].count = 152;
    test_vectors[151].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[151].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[151].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[151].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[151].size = 8'h27;
    test_vectors[151].expected_ct = 448'h73D4CD3CF96F0875CC3324693F655C3FE527B3DC9D557BA9A93C8BF6;

    // Test vector 152
    test_vectors[152].count = 153;
    test_vectors[152].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[152].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[152].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[152].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[152].size = 8'h2E;
    test_vectors[152].expected_ct = 448'h758522EE8F9B166DB3E2A5E66A9644192A3AC1F9397CFB5B40B8723F;

    // Test vector 153
    test_vectors[153].count = 154;
    test_vectors[153].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[153].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[153].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[153].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[153].size = 8'h2E;
    test_vectors[153].expected_ct = 448'h161AC3E4ADE7B8CF2888DC38FFCBE76363D08AC9F27DFF5B11FB31D4;

    // Test vector 154
    test_vectors[154].count = 155;
    test_vectors[154].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[154].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[154].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[154].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[154].size = 8'h2E;
    test_vectors[154].expected_ct = 448'h09A8849000D117940BBA30BD64A29C12AB131AE22ED0174AB02B1F7A;

    // Test vector 155
    test_vectors[155].count = 156;
    test_vectors[155].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[155].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[155].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[155].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[155].size = 8'h2E;
    test_vectors[155].expected_ct = 448'h01CD32715DFD630B2347DFD1F1563702AAF2D89A990473DC98A0FC4B;

    // Test vector 156
    test_vectors[156].count = 157;
    test_vectors[156].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[156].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[156].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[156].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[156].size = 8'h2E;
    test_vectors[156].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD39856226CD31123E08F7331FA18835D189;

    // Test vector 157
    test_vectors[157].count = 158;
    test_vectors[157].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[157].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[157].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[157].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[157].size = 8'h2E;
    test_vectors[157].expected_ct = 448'hB2CB543086A1E9F26227ADB3463D374BB953BFADE4E5EC91106CCD9F;

    // Test vector 158
    test_vectors[158].count = 159;
    test_vectors[158].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[158].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[158].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[158].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[158].size = 8'h2E;
    test_vectors[158].expected_ct = 448'hF328DF5AA680D8D527EAACC5F0E9246F27324421E8E94E05F5B5FFEE;

    // Test vector 159
    test_vectors[159].count = 160;
    test_vectors[159].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[159].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[159].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[159].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[159].size = 8'h2F;
    test_vectors[159].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FAD01022EE2912D71938CFDD83B71AAAD73;

    // Test vector 160
    test_vectors[160].count = 161;
    test_vectors[160].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[160].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[160].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[160].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[160].size = 8'h20;
    test_vectors[160].expected_ct = 448'h5EFAB113B0EA404775ADE74496C4203788DA0228824875E425D8FB8AA3;

    // Test vector 161
    test_vectors[161].count = 162;
    test_vectors[161].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[161].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[161].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[161].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[161].size = 8'h20;
    test_vectors[161].expected_ct = 448'hBF72723D152FD9E320DBAF578FB3CD4DE24E07AFF2D915FD4CF4F6AE35;

    // Test vector 162
    test_vectors[162].count = 163;
    test_vectors[162].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[162].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[162].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[162].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[162].size = 8'h20;
    test_vectors[162].expected_ct = 448'h08AEF97669321B6F58AC264F41F72357E5E5557A60B65CA3606BA80CD7;

    // Test vector 163
    test_vectors[163].count = 164;
    test_vectors[163].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[163].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[163].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[163].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[163].size = 8'h20;
    test_vectors[163].expected_ct = 448'h900740A4EA051B0C002C556864F3E83D643276F40C25A95BC41739ABD8;

    // Test vector 164
    test_vectors[164].count = 165;
    test_vectors[164].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[164].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[164].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[164].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[164].size = 8'h20;
    test_vectors[164].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB9833B255F440A0372693BF4E88E3ADFC9B;

    // Test vector 165
    test_vectors[165].count = 166;
    test_vectors[165].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[165].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[165].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[165].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[165].size = 8'h20;
    test_vectors[165].expected_ct = 448'h0C6C19B0FF039E9FD1534F90271490B2895924B1E4D9EFC98A24F0D566;

    // Test vector 166
    test_vectors[166].count = 167;
    test_vectors[166].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[166].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[166].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[166].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[166].size = 8'h20;
    test_vectors[166].expected_ct = 448'h46F20A6BB802E571BF2A65BE04041C04F7F95DBE4AE57A3BCF3B9CA8CE;

    // Test vector 167
    test_vectors[167].count = 168;
    test_vectors[167].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[167].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[167].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[167].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[167].size = 8'h21;
    test_vectors[167].expected_ct = 448'hF338928A2BB8DA348E39F22DB6EE4F125457F439E92CB03F62677506B3;

    // Test vector 168
    test_vectors[168].count = 169;
    test_vectors[168].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[168].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[168].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[168].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[168].size = 8'h22;
    test_vectors[168].expected_ct = 448'hB38613AA4F88677DD583CECDA341A310C966776604C469CB1413D8B07E;

    // Test vector 169
    test_vectors[169].count = 170;
    test_vectors[169].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[169].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[169].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[169].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[169].size = 8'h22;
    test_vectors[169].expected_ct = 448'h41686728116E749BFEE5AC0218B4C9309FBE1FB0422002321DE9C6E94C;

    // Test vector 170
    test_vectors[170].count = 171;
    test_vectors[170].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[170].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[170].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[170].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[170].size = 8'h22;
    test_vectors[170].expected_ct = 448'h9A3CE30D7741D446557C2E080F68FF148806819F10B9CF2E7D35238042;

    // Test vector 171
    test_vectors[171].count = 172;
    test_vectors[171].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[171].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[171].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[171].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[171].size = 8'h22;
    test_vectors[171].expected_ct = 448'h8E1B97083F429364FB7AE590D2CF6C664F94F10286450EA0E62D3B6830;

    // Test vector 172
    test_vectors[172].count = 173;
    test_vectors[172].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[172].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[172].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[172].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[172].size = 8'h22;
    test_vectors[172].expected_ct = 448'h2635F718A34B62D83FAB15B1A9808C36EDE547169F4883264B02E13F88;

    // Test vector 173
    test_vectors[173].count = 174;
    test_vectors[173].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[173].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[173].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[173].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[173].size = 8'h22;
    test_vectors[173].expected_ct = 448'hAAE06C75966BB029C70F80DC75C605DFE31FE79F0A9E1DD55427E28F90;

    // Test vector 174
    test_vectors[174].count = 175;
    test_vectors[174].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[174].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[174].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[174].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[174].size = 8'h22;
    test_vectors[174].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD2A40971355C25EB93C790F0DB43D6CBAC;

    // Test vector 175
    test_vectors[175].count = 176;
    test_vectors[175].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[175].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[175].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[175].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[175].size = 8'h23;
    test_vectors[175].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED34B659BC031E196F2292040DD060436CCC;

    // Test vector 176
    test_vectors[176].count = 177;
    test_vectors[176].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[176].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[176].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[176].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[176].size = 8'h26;
    test_vectors[176].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D9CAA11535ACD0BC0AF0F1B1676A6A5E21;

    // Test vector 177
    test_vectors[177].count = 178;
    test_vectors[177].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[177].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[177].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[177].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[177].size = 8'h26;
    test_vectors[177].expected_ct = 448'h8EA432E4B02739697DFE3EDF36B9AD6B6F64FB5CA636433B2DB88CBA9F;

    // Test vector 178
    test_vectors[178].count = 179;
    test_vectors[178].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[178].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[178].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[178].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[178].size = 8'h26;
    test_vectors[178].expected_ct = 448'h732AAF0D04E6361071636396AD2A4E0932C359FE3FFC0976A81F77EA50;

    // Test vector 179
    test_vectors[179].count = 180;
    test_vectors[179].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[179].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[179].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[179].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[179].size = 8'h26;
    test_vectors[179].expected_ct = 448'hF0A4B91928FFF758A31A4659C7EE163B087395DD78719A2A8ACD43BAB8;

    // Test vector 180
    test_vectors[180].count = 181;
    test_vectors[180].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[180].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[180].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[180].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[180].size = 8'h26;
    test_vectors[180].expected_ct = 448'h652289701299914EF7AAF77F70CE32D1C362767F5A225E6046AD20B8BE;

    // Test vector 181
    test_vectors[181].count = 182;
    test_vectors[181].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[181].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[181].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[181].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[181].size = 8'h26;
    test_vectors[181].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE90E0BD460771B33E6937ADE2FF4701B2D;

    // Test vector 182
    test_vectors[182].count = 183;
    test_vectors[182].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[182].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[182].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[182].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[182].size = 8'h26;
    test_vectors[182].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B867CF5282840EEAD8FA115FCCFAD233C;

    // Test vector 183
    test_vectors[183].count = 184;
    test_vectors[183].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[183].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[183].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[183].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[183].size = 8'h27;
    test_vectors[183].expected_ct = 448'h73D4CD3CF96F0875CC33246984B66E8AFEFEBA2114926720CF45FD66E4;

    // Test vector 184
    test_vectors[184].count = 185;
    test_vectors[184].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[184].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[184].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[184].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[184].size = 8'h2E;
    test_vectors[184].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A958953572F97D9709E058564651BBEDC;

    // Test vector 185
    test_vectors[185].count = 186;
    test_vectors[185].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[185].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[185].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[185].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[185].size = 8'h2E;
    test_vectors[185].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389D86799864BEDE348D5D50327EA2EF2B1F;

    // Test vector 186
    test_vectors[186].count = 187;
    test_vectors[186].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[186].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[186].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[186].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[186].size = 8'h2E;
    test_vectors[186].expected_ct = 448'h09A8849000D117940BBA30BD0F8B36A5A78E4ADB9758ADE44D3F87222A;

    // Test vector 187
    test_vectors[187].count = 188;
    test_vectors[187].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[187].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[187].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[187].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[187].size = 8'h2E;
    test_vectors[187].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B0D8390CA70DB1696E2019B3F27ECAEB;

    // Test vector 188
    test_vectors[188].count = 189;
    test_vectors[188].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[188].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[188].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[188].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[188].size = 8'h2E;
    test_vectors[188].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD39963593156B73E724488C7B8905E2A5C3BA;

    // Test vector 189
    test_vectors[189].count = 190;
    test_vectors[189].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[189].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[189].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[189].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[189].size = 8'h2E;
    test_vectors[189].expected_ct = 448'hB2CB543086A1E9F26227ADB361B2F38000D663EDAFECAAACD88EFF20DC;

    // Test vector 190
    test_vectors[190].count = 191;
    test_vectors[190].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[190].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[190].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[190].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[190].size = 8'h2E;
    test_vectors[190].expected_ct = 448'hF328DF5AA680D8D527EAACC504E39A2386D178196D95BEA2ADE95F93CE;

    // Test vector 191
    test_vectors[191].count = 192;
    test_vectors[191].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[191].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[191].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h80, 8'h00, 8'h00};
    test_vectors[191].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[191].size = 8'h2F;
    test_vectors[191].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAA7690D82777268B69ADCE4B8691676B8D;

    // Test vector 192
    test_vectors[192].count = 193;
    test_vectors[192].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[192].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[192].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[192].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[192].size = 8'h20;
    test_vectors[192].expected_ct = 448'h5EFAB113B0EA404775ADE744963D0444B1F98DAC51E3D66F2682F9AAF187;

    // Test vector 193
    test_vectors[193].count = 194;
    test_vectors[193].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[193].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[193].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[193].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[193].size = 8'h20;
    test_vectors[193].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EA10B8F021B7C70CCCCBE345DEE570560;

    // Test vector 194
    test_vectors[194].count = 195;
    test_vectors[194].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[194].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[194].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[194].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[194].size = 8'h20;
    test_vectors[194].expected_ct = 448'h08AEF97669321B6F58AC264F41882647D3174EBB788C467D75A12C41C9D8;

    // Test vector 195
    test_vectors[195].count = 196;
    test_vectors[195].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[195].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[195].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[195].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[195].size = 8'h20;
    test_vectors[195].expected_ct = 448'h900740A4EA051B0C002C556864069C3A8F806A87B669D93173C98ED18955;

    // Test vector 196
    test_vectors[196].count = 197;
    test_vectors[196].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[196].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[196].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[196].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[196].size = 8'h20;
    test_vectors[196].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B70C58EE75E3DE998A1AC2F7E6029E5DB8;

    // Test vector 197
    test_vectors[197].count = 198;
    test_vectors[197].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[197].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[197].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[197].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[197].size = 8'h20;
    test_vectors[197].expected_ct = 448'h0C6C19B0FF039E9FD1534F902766599451E4A96FC31185019C45772F8E31;

    // Test vector 198
    test_vectors[198].count = 199;
    test_vectors[198].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[198].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[198].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[198].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[198].size = 8'h20;
    test_vectors[198].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431A80B24D71537C3B7DF52A135450D6981;

    // Test vector 199
    test_vectors[199].count = 200;
    test_vectors[199].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[199].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[199].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[199].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[199].size = 8'h21;
    test_vectors[199].expected_ct = 448'hF338928A2BB8DA348E39F22DB60249E0022EDCF5ED2A5838FF4A4EC2EEEA;

    // Test vector 200
    test_vectors[200].count = 201;
    test_vectors[200].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[200].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[200].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[200].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[200].size = 8'h22;
    test_vectors[200].expected_ct = 448'hB38613AA4F88677DD583CECDA38C71C9E4DC5FA3A5D5CA57A423DC45FD88;

    // Test vector 201
    test_vectors[201].count = 202;
    test_vectors[201].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[201].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[201].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[201].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[201].size = 8'h22;
    test_vectors[201].expected_ct = 448'h41686728116E749BFEE5AC0218748BD11C03B812AB9789D0FA77D0673AAE;

    // Test vector 202
    test_vectors[202].count = 203;
    test_vectors[202].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[202].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[202].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[202].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[202].size = 8'h22;
    test_vectors[202].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2E28198F4F3EB1C3C12E9A7C2192905B1;

    // Test vector 203
    test_vectors[203].count = 204;
    test_vectors[203].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[203].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[203].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[203].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[203].size = 8'h22;
    test_vectors[203].expected_ct = 448'h8E1B97083F429364FB7AE590D2EA86E334330F8BEF04DD227EB6DFA70C15;

    // Test vector 204
    test_vectors[204].count = 205;
    test_vectors[204].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[204].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[204].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[204].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[204].size = 8'h22;
    test_vectors[204].expected_ct = 448'h2635F718A34B62D83FAB15B1A992FCF3EBC64547D56C3948468B043C85CF;

    // Test vector 205
    test_vectors[205].count = 206;
    test_vectors[205].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[205].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[205].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[205].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[205].size = 8'h22;
    test_vectors[205].expected_ct = 448'hAAE06C75966BB029C70F80DC759030EAA76AEABC827B38552BE390AA0DA7;

    // Test vector 206
    test_vectors[206].count = 207;
    test_vectors[206].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[206].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[206].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[206].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[206].size = 8'h22;
    test_vectors[206].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E2D6B4643035D1AA4A5982DFAFEFBF2E8;

    // Test vector 207
    test_vectors[207].count = 208;
    test_vectors[207].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[207].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[207].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[207].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[207].size = 8'h23;
    test_vectors[207].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED3419526B5B45F3490F46B94959BAD43F9006;

    // Test vector 208
    test_vectors[208].count = 209;
    test_vectors[208].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[208].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[208].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[208].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[208].size = 8'h26;
    test_vectors[208].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D957E62EC4AAE2A49206F10661653788ECF5;

    // Test vector 209
    test_vectors[209].count = 210;
    test_vectors[209].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[209].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[209].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[209].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[209].size = 8'h26;
    test_vectors[209].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609072979C7B6FFDCF3FDEA1E1FFFC893DA;

    // Test vector 210
    test_vectors[210].count = 211;
    test_vectors[210].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[210].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[210].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[210].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[210].size = 8'h26;
    test_vectors[210].expected_ct = 448'h732AAF0D04E6361071636396ADAB755AB637807B1B65E135B3FE0EF69933;

    // Test vector 211
    test_vectors[211].count = 212;
    test_vectors[211].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[211].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[211].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[211].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[211].size = 8'h26;
    test_vectors[211].expected_ct = 448'hF0A4B91928FFF758A31A4659C710CD175E43442C9409D5842EF4E25B5994;

    // Test vector 212
    test_vectors[212].count = 213;
    test_vectors[212].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[212].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[212].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[212].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[212].size = 8'h26;
    test_vectors[212].expected_ct = 448'h652289701299914EF7AAF77F7005B744EA16EEAC72959BFE8022414BA831;

    // Test vector 213
    test_vectors[213].count = 214;
    test_vectors[213].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[213].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[213].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[213].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[213].size = 8'h26;
    test_vectors[213].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F0EA9697E8A5F3756FBA880FD7708B0630;

    // Test vector 214
    test_vectors[214].count = 215;
    test_vectors[214].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[214].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[214].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[214].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[214].size = 8'h26;
    test_vectors[214].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2C5DBBFD142AD62A190B7063E752BBAE37;

    // Test vector 215
    test_vectors[215].count = 216;
    test_vectors[215].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[215].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[215].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[215].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[215].size = 8'h27;
    test_vectors[215].expected_ct = 448'h73D4CD3CF96F0875CC33246984443267BD9221BAFD99D4886F5D5C333B36;

    // Test vector 216
    test_vectors[216].count = 217;
    test_vectors[216].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[216].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[216].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[216].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[216].size = 8'h2E;
    test_vectors[216].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3EC16B33A06D5E14475BECD65147A627BB;

    // Test vector 217
    test_vectors[217].count = 218;
    test_vectors[217].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[217].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[217].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[217].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[217].size = 8'h2E;
    test_vectors[217].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4DF6575E5A635C8EB682D08496F3861E0;

    // Test vector 218
    test_vectors[218].count = 219;
    test_vectors[218].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[218].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[218].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[218].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[218].size = 8'h2E;
    test_vectors[218].expected_ct = 448'h09A8849000D117940BBA30BD0FC5431E35D38E9495E3331E58A4C53FC235;

    // Test vector 219
    test_vectors[219].count = 220;
    test_vectors[219].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[219].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[219].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[219].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[219].size = 8'h2E;
    test_vectors[219].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B93CAE96FBFA6027145962C3177B3F39B5;

    // Test vector 220
    test_vectors[220].count = 221;
    test_vectors[220].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[220].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[220].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[220].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[220].size = 8'h2E;
    test_vectors[220].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD399694EE91364DA86794BDDC7409A26E70EFEB;

    // Test vector 221
    test_vectors[221].count = 222;
    test_vectors[221].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[221].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[221].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[221].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[221].size = 8'h2E;
    test_vectors[221].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2F8C1B96A2B15D1CEE558CF5DF8AA613D;

    // Test vector 222
    test_vectors[222].count = 223;
    test_vectors[222].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[222].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[222].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[222].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[222].size = 8'h2E;
    test_vectors[222].expected_ct = 448'hF328DF5AA680D8D527EAACC5047A9C71E768DB0CF8D56C47F00109057686;

    // Test vector 223
    test_vectors[223].count = 224;
    test_vectors[223].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[223].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[223].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h80, 8'h00};
    test_vectors[223].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[223].size = 8'h2F;
    test_vectors[223].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD6CF61ADD6A0C40C197108F33D997A5D04;

    // Test vector 224
    test_vectors[224].count = 225;
    test_vectors[224].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[224].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[224].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[224].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[224].size = 8'h20;
    test_vectors[224].expected_ct = 448'h5EFAB113B0EA404775ADE744963D336E7B122112B8F35C18442CBDE2A40251;

    // Test vector 225
    test_vectors[225].count = 226;
    test_vectors[225].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[225].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[225].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[225].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[225].size = 8'h20;
    test_vectors[225].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB503DDFBA10AC8AFFBFC0312C9362D1D0;

    // Test vector 226
    test_vectors[226].count = 227;
    test_vectors[226].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[226].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[226].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[226].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[226].size = 8'h20;
    test_vectors[226].expected_ct = 448'h08AEF97669321B6F58AC264F41881628C4D33BFF76441C8CA8409E5D9DA46F;

    // Test vector 227
    test_vectors[227].count = 228;
    test_vectors[227].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[227].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[227].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[227].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[227].size = 8'h20;
    test_vectors[227].expected_ct = 448'h900740A4EA051B0C002C55686406EE7D5C7F9C3A6E68ACF45D3FF9C957E141;

    // Test vector 228
    test_vectors[228].count = 229;
    test_vectors[228].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[228].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[228].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[228].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[228].size = 8'h20;
    test_vectors[228].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE362E1612975CB827D6399E082F546D0E;

    // Test vector 229
    test_vectors[229].count = 230;
    test_vectors[229].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[229].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[229].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[229].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[229].size = 8'h20;
    test_vectors[229].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643CA334D4184783C867A97504AB3B9C987;

    // Test vector 230
    test_vectors[230].count = 231;
    test_vectors[230].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[230].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[230].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[230].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[230].size = 8'h20;
    test_vectors[230].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9C740562DF2487CC9892030B87CE13C31;

    // Test vector 231
    test_vectors[231].count = 232;
    test_vectors[231].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[231].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[231].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[231].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[231].size = 8'h21;
    test_vectors[231].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E7A363782DBFBD9BBDE2B88B1FEF7ED2F0;

    // Test vector 232
    test_vectors[232].count = 233;
    test_vectors[232].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[232].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[232].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[232].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[232].size = 8'h22;
    test_vectors[232].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDA815A63426C20F32BBC31E22EA221BB1F;

    // Test vector 233
    test_vectors[233].count = 234;
    test_vectors[233].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[233].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[233].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[233].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[233].size = 8'h22;
    test_vectors[233].expected_ct = 448'h41686728116E749BFEE5AC021874C5A0F584BF1C59EC18DE07F09A2D53FB43;

    // Test vector 234
    test_vectors[234].count = 235;
    test_vectors[234].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[234].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[234].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[234].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[234].size = 8'h22;
    test_vectors[234].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2202577F43F48BC4972640B2FBD1760AAAC;

    // Test vector 235
    test_vectors[235].count = 236;
    test_vectors[235].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[235].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[235].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[235].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[235].size = 8'h22;
    test_vectors[235].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD668D806E32D91CA6DA02CD6291C67311B;

    // Test vector 236
    test_vectors[236].count = 237;
    test_vectors[236].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[236].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[236].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[236].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[236].size = 8'h22;
    test_vectors[236].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928D1F37A75D504CDA573DF331F5373ADECD;

    // Test vector 237
    test_vectors[237].count = 238;
    test_vectors[237].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[237].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[237].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[237].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[237].size = 8'h22;
    test_vectors[237].expected_ct = 448'hAAE06C75966BB029C70F80DC75907472BF140EFE23103636130A9A0A938C58;

    // Test vector 238
    test_vectors[238].count = 239;
    test_vectors[238].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[238].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[238].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[238].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[238].size = 8'h22;
    test_vectors[238].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6AF56263C6EA150E3DE98DB572E2C33291;

    // Test vector 239
    test_vectors[239].count = 240;
    test_vectors[239].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[239].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[239].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[239].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[239].size = 8'h23;
    test_vectors[239].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED34191722AF71AA93ACFBC0FA43C75674A272BD;

    // Test vector 240
    test_vectors[240].count = 241;
    test_vectors[240].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[240].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[240].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[240].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[240].size = 8'h26;
    test_vectors[240].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D957192D119CB6A8959E573FCB570E23575969;

    // Test vector 241
    test_vectors[241].count = 242;
    test_vectors[241].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[241].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[241].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[241].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[241].size = 8'h26;
    test_vectors[241].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8297066B8D5452DDEB4012BD6723F3073;

    // Test vector 242
    test_vectors[242].count = 243;
    test_vectors[242].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[242].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[242].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[242].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[242].size = 8'h26;
    test_vectors[242].expected_ct = 448'h732AAF0D04E6361071636396ADABAFBAAFFF03FAA64FF0BF1FD1DBAC431C6F;

    // Test vector 243
    test_vectors[243].count = 244;
    test_vectors[243].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[243].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[243].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[243].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[243].size = 8'h26;
    test_vectors[243].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D74C3BDB3256B34BAB63A3464559B5CA11;

    // Test vector 244
    test_vectors[244].count = 245;
    test_vectors[244].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[244].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[244].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[244].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[244].size = 8'h26;
    test_vectors[244].expected_ct = 448'h652289701299914EF7AAF77F70050DC45AD9E1FBF6DE5F93DAE8E59EE84481;

    // Test vector 245
    test_vectors[245].count = 246;
    test_vectors[245].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[245].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[245].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[245].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[245].size = 8'h26;
    test_vectors[245].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C8CB819F69E31273B3607AE473EB4FD5A;

    // Test vector 246
    test_vectors[246].count = 247;
    test_vectors[246].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[246].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[246].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[246].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[246].size = 8'h26;
    test_vectors[246].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD7C8551D8A77AE2FBEBD7864ECACADB40;

    // Test vector 247
    test_vectors[247].count = 248;
    test_vectors[247].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[247].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[247].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[247].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[247].size = 8'h27;
    test_vectors[247].expected_ct = 448'h73D4CD3CF96F0875CC3324698444641A3B08D2B7CA7479C3CCD457C1E2865E;

    // Test vector 248
    test_vectors[248].count = 249;
    test_vectors[248].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[248].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[248].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[248].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[248].size = 8'h2E;
    test_vectors[248].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C96549E558B2BD2A70A8CB8964F0F553B;

    // Test vector 249
    test_vectors[249].count = 250;
    test_vectors[249].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[249].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[249].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[249].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[249].size = 8'h2E;
    test_vectors[249].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C933863548CE999223C8F0C1B06B10A456;

    // Test vector 250
    test_vectors[250].count = 251;
    test_vectors[250].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[250].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[250].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[250].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[250].size = 8'h2E;
    test_vectors[250].expected_ct = 448'h09A8849000D117940BBA30BD0FC537401DBE090ABA3BC1B5E51E683C445481;

    // Test vector 251
    test_vectors[251].count = 252;
    test_vectors[251].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[251].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[251].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[251].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[251].size = 8'h2E;
    test_vectors[251].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92D002986E4C7005252DA80A9B94CC2960B;

    // Test vector 252
    test_vectors[252].count = 253;
    test_vectors[252].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[252].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[252].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[252].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[252].size = 8'h2E;
    test_vectors[252].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940B201FCD37AF583F0B99118B46F51FB05F;

    // Test vector 253
    test_vectors[253].count = 254;
    test_vectors[253].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[253].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[253].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[253].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[253].size = 8'h2E;
    test_vectors[253].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D00CE37C428F2436944FB8B67624FE8AB5;

    // Test vector 254
    test_vectors[254].count = 255;
    test_vectors[254].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[254].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[254].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[254].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[254].size = 8'h2E;
    test_vectors[254].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA067219CF78E53081A55B9BD352B1581D4;

    // Test vector 255
    test_vectors[255].count = 256;
    test_vectors[255].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[255].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[255].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h80};
    test_vectors[255].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[255].size = 8'h2F;
    test_vectors[255].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F838AEE99E599F898869090A68EC43400;

    // Test vector 256
    test_vectors[256].count = 257;
    test_vectors[256].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[256].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[256].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[256].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[256].size = 8'h30;
    test_vectors[256].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C2FD52475B60B51D46F3644294F9F42C6;

    // Test vector 257
    test_vectors[257].count = 258;
    test_vectors[257].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[257].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[257].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[257].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[257].size = 8'h30;
    test_vectors[257].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6E4DF2E66318DEB91CB9C9F9C8A6AC0ADA;

    // Test vector 258
    test_vectors[258].count = 259;
    test_vectors[258].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[258].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[258].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[258].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[258].size = 8'h30;
    test_vectors[258].expected_ct = 448'h08AEF97669321B6F58AC264F4188168608BA19BD41056E19637C8DC54393E631;

    // Test vector 259
    test_vectors[259].count = 260;
    test_vectors[259].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[259].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[259].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[259].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[259].size = 8'h30;
    test_vectors[259].expected_ct = 448'h900740A4EA051B0C002C55686406EECBBD4B611C4831005E00DE2B53E4CD7E00;

    // Test vector 260
    test_vectors[260].count = 261;
    test_vectors[260].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[260].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[260].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[260].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[260].size = 8'h30;
    test_vectors[260].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9D9826039F29687A4612BAD1579BB71033;

    // Test vector 261
    test_vectors[261].count = 262;
    test_vectors[261].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[261].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[261].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[261].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[261].size = 8'h30;
    test_vectors[261].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D68041FAB61BEF59C138F1C7F6EF493FA4;

    // Test vector 262
    test_vectors[262].count = 263;
    test_vectors[262].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[262].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[262].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[262].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[262].size = 8'h30;
    test_vectors[262].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF16819E97D396E71EAEDA91F641E4986F;

    // Test vector 263
    test_vectors[263].count = 264;
    test_vectors[263].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[263].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[263].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[263].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[263].size = 8'h31;
    test_vectors[263].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E7975CC4FE0DCB4D997240116DCB699ACCAA;

    // Test vector 264
    test_vectors[264].count = 265;
    test_vectors[264].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[264].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[264].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[264].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[264].size = 8'h32;
    test_vectors[264].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA28978585B4C61CFEB5EDFAE53D7139D8C;

    // Test vector 265
    test_vectors[265].count = 266;
    test_vectors[265].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[265].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[265].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[265].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[265].size = 8'h32;
    test_vectors[265].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF99E7D360E2423A0E57D7486C54E99BA4;

    // Test vector 266
    test_vectors[266].count = 267;
    test_vectors[266].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[266].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[266].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[266].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[266].size = 8'h32;
    test_vectors[266].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200B10796F7CC2EC203F083041C133782128;

    // Test vector 267
    test_vectors[267].count = 268;
    test_vectors[267].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[267].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[267].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[267].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[267].size = 8'h32;
    test_vectors[267].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BFD8817652861B681EE1F12CAC177AE031;

    // Test vector 268
    test_vectors[268].count = 269;
    test_vectors[268].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[268].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[268].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[268].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[268].size = 8'h32;
    test_vectors[268].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7D4AC2E124880F276E9F4824F53C8F49A;

    // Test vector 269
    test_vectors[269].count = 270;
    test_vectors[269].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[269].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[269].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[269].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[269].size = 8'h32;
    test_vectors[269].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C95B437580341C310115D9286F74C1CD;

    // Test vector 270
    test_vectors[270].count = 271;
    test_vectors[270].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[270].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[270].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[270].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[270].size = 8'h32;
    test_vectors[270].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D035D6A4251BD98355B670EB08EB4D693;

    // Test vector 271
    test_vectors[271].count = 272;
    test_vectors[271].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[271].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[271].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[271].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[271].size = 8'h33;
    test_vectors[271].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED34191759F92343794D987BD485E9CA2D59B2DE59;

    // Test vector 272
    test_vectors[272].count = 273;
    test_vectors[272].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[272].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[272].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[272].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[272].size = 8'h36;
    test_vectors[272].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FCF42D05ECBC194CC84F09E9B11BD44174;

    // Test vector 273
    test_vectors[273].count = 274;
    test_vectors[273].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[273].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[273].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[273].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[273].size = 8'h36;
    test_vectors[273].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E5206DEA9219DCE9BE6BEEAF99772C65D4;

    // Test vector 274
    test_vectors[274].count = 275;
    test_vectors[274].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[274].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[274].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[274].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[274].size = 8'h36;
    test_vectors[274].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FAACBF2F414D92CA2626425DEE4FA69D7;

    // Test vector 275
    test_vectors[275].count = 276;
    test_vectors[275].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[275].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[275].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[275].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[275].size = 8'h36;
    test_vectors[275].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B4B8151C547ABC5FAF0BDB758A9A7B13C;

    // Test vector 276
    test_vectors[276].count = 277;
    test_vectors[276].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[276].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[276].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[276].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[276].size = 8'h36;
    test_vectors[276].expected_ct = 448'h652289701299914EF7AAF77F70050DF595A818CBBFDD00EA455B396EFCD62EF3;

    // Test vector 277
    test_vectors[277].count = 278;
    test_vectors[277].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[277].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[277].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[277].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[277].size = 8'h36;
    test_vectors[277].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C4438DAB865A4650782344837C02D797C41;

    // Test vector 278
    test_vectors[278].count = 279;
    test_vectors[278].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[278].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[278].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[278].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[278].size = 8'h36;
    test_vectors[278].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13E2591D1FEC561A9AD70CA714FA74F7A9;

    // Test vector 279
    test_vectors[279].count = 280;
    test_vectors[279].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[279].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[279].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[279].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[279].size = 8'h37;
    test_vectors[279].expected_ct = 448'h73D4CD3CF96F0875CC332469844464790620E74D5F8DF2C28A43357BFC274EEE;

    // Test vector 280
    test_vectors[280].count = 281;
    test_vectors[280].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[280].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[280].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[280].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[280].size = 8'h3E;
    test_vectors[280].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C232D9371D9254F91C4A30FB0C81A3CF7B1;

    // Test vector 281
    test_vectors[281].count = 282;
    test_vectors[281].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[281].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[281].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[281].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[281].size = 8'h3E;
    test_vectors[281].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A4778F67F5D668A21E401907833BF2757F;

    // Test vector 282
    test_vectors[282].count = 283;
    test_vectors[282].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[282].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[282].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[282].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[282].size = 8'h3E;
    test_vectors[282].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5FCB619AEC7950A2CC6C0867EC8C3CDFE;

    // Test vector 283
    test_vectors[283].count = 284;
    test_vectors[283].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[283].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[283].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[283].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[283].size = 8'h3E;
    test_vectors[283].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DAD60C4B0FE42D69B1281AE7DA84DCD7D31;

    // Test vector 284
    test_vectors[284].count = 285;
    test_vectors[284].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[284].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[284].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[284].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[284].size = 8'h3E;
    test_vectors[284].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE261CC3B4C3BE342B204133B68DF81DFF6;

    // Test vector 285
    test_vectors[285].count = 286;
    test_vectors[285].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[285].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[285].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[285].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[285].size = 8'h3E;
    test_vectors[285].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037FC8C6EF6638563FEA6D322DACEAE9396;

    // Test vector 286
    test_vectors[286].count = 287;
    test_vectors[286].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[286].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[286].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[286].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[286].size = 8'h3E;
    test_vectors[286].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05594EC3262817201C3388CED48824ECF8B;

    // Test vector 287
    test_vectors[287].count = 288;
    test_vectors[287].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[287].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[287].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[287].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[287].size = 8'h3F;
    test_vectors[287].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F757171A3323C136228FB50D1864B009620;

    // Test vector 288
    test_vectors[288].count = 289;
    test_vectors[288].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[288].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[288].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[288].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[288].size = 8'h60;
    test_vectors[288].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1C05C073BED619AD557E7DF142D1B34262;

    // Test vector 289
    test_vectors[289].count = 290;
    test_vectors[289].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[289].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[289].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[289].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[289].size = 8'h60;
    test_vectors[289].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2FBD1D0B882AD26CEA2852161356BE2AC;

    // Test vector 290
    test_vectors[290].count = 291;
    test_vectors[290].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[290].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[290].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[290].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[290].size = 8'h60;
    test_vectors[290].expected_ct = 448'h08AEF97669321B6F58AC264F4188168604D3EDCAF49BD67F46B86A129952B5751B;

    // Test vector 291
    test_vectors[291].count = 292;
    test_vectors[291].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[291].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[291].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[291].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[291].size = 8'h60;
    test_vectors[291].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC824C9DBB5E2370BE78FEC1E617E3EB81A;

    // Test vector 292
    test_vectors[292].count = 293;
    test_vectors[292].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[292].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[292].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[292].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[292].size = 8'h60;
    test_vectors[292].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC314EBF09E51A3B16078255AD69FDD18F;

    // Test vector 293
    test_vectors[293].count = 294;
    test_vectors[293].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[293].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[293].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[293].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[293].size = 8'h60;
    test_vectors[293].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6242DB7FD98A375257B1E6416FD4C10E9C0;

    // Test vector 294
    test_vectors[294].count = 295;
    test_vectors[294].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[294].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[294].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[294].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[294].size = 8'h60;
    test_vectors[294].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF7313B2BB99BBB3F6F662B9C68705CE6A43;

    // Test vector 295
    test_vectors[295].count = 296;
    test_vectors[295].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[295].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[295].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[295].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[295].size = 8'h61;
    test_vectors[295].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3983411A1B0158E6FEDBD973FB54B7FF3;

    // Test vector 296
    test_vectors[296].count = 297;
    test_vectors[296].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[296].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[296].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[296].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[296].size = 8'h62;
    test_vectors[296].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D8B6329CDA633461B0113B6161C2E95D49;

    // Test vector 297
    test_vectors[297].count = 298;
    test_vectors[297].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[297].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[297].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[297].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[297].size = 8'h62;
    test_vectors[297].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82147C330D55DDF2546290016C9BD1B749;

    // Test vector 298
    test_vectors[298].count = 299;
    test_vectors[298].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[298].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[298].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[298].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[298].size = 8'h62;
    test_vectors[298].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB0A934BA33E22EA9E26645A0694B47373;

    // Test vector 299
    test_vectors[299].count = 300;
    test_vectors[299].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[299].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[299].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[299].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[299].size = 8'h62;
    test_vectors[299].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FCB54EF3DCAA2CF5358E61891D221B379;

    // Test vector 300
    test_vectors[300].count = 301;
    test_vectors[300].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[300].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[300].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[300].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[300].size = 8'h62;
    test_vectors[300].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF7F38AC560D3DCFFE91D8A019526B8C98;

    // Test vector 301
    test_vectors[301].count = 302;
    test_vectors[301].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[301].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[301].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[301].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[301].size = 8'h62;
    test_vectors[301].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6EF0221086D3460DBB6ED5040E1511FD8;

    // Test vector 302
    test_vectors[302].count = 303;
    test_vectors[302].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[302].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[302].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[302].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[302].size = 8'h62;
    test_vectors[302].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D481BDD7A981662E1B2BCDC8324D4AE0ADD;

    // Test vector 303
    test_vectors[303].count = 304;
    test_vectors[303].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[303].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[303].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[303].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[303].size = 8'h63;
    test_vectors[303].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A4AD9A6E734699AE769EF0252B461A6EE;

    // Test vector 304
    test_vectors[304].count = 305;
    test_vectors[304].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[304].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[304].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[304].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[304].size = 8'h66;
    test_vectors[304].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F50FB9D713E9FED0FBA4D3980D6B4247D;

    // Test vector 305
    test_vectors[305].count = 306;
    test_vectors[305].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[305].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[305].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[305].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[305].size = 8'h66;
    test_vectors[305].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53B34E12C7625802AD3ED5AD8787FF6ED6B;

    // Test vector 306
    test_vectors[306].count = 307;
    test_vectors[306].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[306].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[306].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[306].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[306].size = 8'h66;
    test_vectors[306].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBCEE47A1F6C2FB23C04FD48482C55895B2;

    // Test vector 307
    test_vectors[307].count = 308;
    test_vectors[307].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[307].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[307].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[307].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[307].size = 8'h66;
    test_vectors[307].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B512621928C65DF82188BD8403C25FD03;

    // Test vector 308
    test_vectors[308].count = 309;
    test_vectors[308].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[308].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[308].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[308].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[308].size = 8'h66;
    test_vectors[308].expected_ct = 448'h652289701299914EF7AAF77F70050DF5574D384C3D4952FCEE134A411A6F21450A;

    // Test vector 309
    test_vectors[309].count = 310;
    test_vectors[309].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[309].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[309].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[309].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[309].size = 8'h66;
    test_vectors[309].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C4460385E0F529CB745A4C68C550F09869A7F;

    // Test vector 310
    test_vectors[310].count = 311;
    test_vectors[310].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[310].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[310].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[310].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[310].size = 8'h66;
    test_vectors[310].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD1392EF6F81E8FB1AC6115EEF0EE9522FA99D;

    // Test vector 311
    test_vectors[311].count = 312;
    test_vectors[311].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[311].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[311].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[311].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[311].size = 8'h67;
    test_vectors[311].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F29A86B6E2B851C52C8F9E1DD122BB14A;

    // Test vector 312
    test_vectors[312].count = 313;
    test_vectors[312].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[312].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[312].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[312].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[312].size = 8'h6E;
    test_vectors[312].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D431BA54D948B6A2A8A937E92D4591070;

    // Test vector 313
    test_vectors[313].count = 314;
    test_vectors[313].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[313].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[313].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[313].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[313].size = 8'h6E;
    test_vectors[313].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A4572553CF9BFFF09DA01DFFE1298ACA4DE7;

    // Test vector 314
    test_vectors[314].count = 315;
    test_vectors[314].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[314].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[314].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[314].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[314].size = 8'h6E;
    test_vectors[314].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F95147C608AA5CF87F97C869FA6FE0DBE1;

    // Test vector 315
    test_vectors[315].count = 316;
    test_vectors[315].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[315].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[315].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[315].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[315].size = 8'h6E;
    test_vectors[315].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBD4E1A46CDA03C8A83E22051135457CDEB;

    // Test vector 316
    test_vectors[316].count = 317;
    test_vectors[316].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[316].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[316].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[316].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[316].size = 8'h6E;
    test_vectors[316].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD5149B0636566E41912B0B805F2F40731;

    // Test vector 317
    test_vectors[317].count = 318;
    test_vectors[317].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[317].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[317].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[317].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[317].size = 8'h6E;
    test_vectors[317].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BB01461DCED919BC22C943E9DBCE0CF992;

    // Test vector 318
    test_vectors[318].count = 319;
    test_vectors[318].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[318].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[318].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[318].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[318].size = 8'h6E;
    test_vectors[318].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA055410F64914FF6ED2B831A5DF255FF5D6F28;

    // Test vector 319
    test_vectors[319].count = 320;
    test_vectors[319].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[319].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[319].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[319].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[319].size = 8'h6F;
    test_vectors[319].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD0870E987983C5BA9487F2704CC49F5B7;

    // Test vector 320
    test_vectors[320].count = 321;
    test_vectors[320].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[320].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[320].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[320].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[320].size = 8'h60;
    test_vectors[320].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3E244B4783F7BD51B1C46C8987C932CF7;

    // Test vector 321
    test_vectors[321].count = 322;
    test_vectors[321].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[321].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[321].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[321].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[321].size = 8'h60;
    test_vectors[321].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E89EE85FECF52155F79D4BD44302E7939F;

    // Test vector 322
    test_vectors[322].count = 323;
    test_vectors[322].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[322].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[322].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[322].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[322].size = 8'h60;
    test_vectors[322].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A329329128FC805716B85F7FC1A711258;

    // Test vector 323
    test_vectors[323].count = 324;
    test_vectors[323].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[323].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[323].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[323].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[323].size = 8'h60;
    test_vectors[323].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80C3BAA254BB8DA538EA947CA32D44AB8F9;

    // Test vector 324
    test_vectors[324].count = 325;
    test_vectors[324].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[324].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[324].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[324].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[324].size = 8'h60;
    test_vectors[324].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC92FBA9DEB869FDD9D82E3FAA9058B6D823;

    // Test vector 325
    test_vectors[325].count = 326;
    test_vectors[325].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[325].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[325].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[325].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[325].size = 8'h60;
    test_vectors[325].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241C3BF7413EB9339DEBBFFE0261E10D4C1B;

    // Test vector 326
    test_vectors[326].count = 327;
    test_vectors[326].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[326].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[326].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[326].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[326].size = 8'h60;
    test_vectors[326].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C05D81BED714D91524CDD03B30009ECB05;

    // Test vector 327
    test_vectors[327].count = 328;
    test_vectors[327].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[327].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[327].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[327].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[327].size = 8'h61;
    test_vectors[327].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3EC26D8BA2E3F5E222D25B13AF34BA158FA;

    // Test vector 328
    test_vectors[328].count = 329;
    test_vectors[328].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[328].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[328].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[328].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[328].size = 8'h62;
    test_vectors[328].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D820ABB01A78B24CD2BA71A41679DB48B2CC;

    // Test vector 329
    test_vectors[329].count = 330;
    test_vectors[329].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[329].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[329].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[329].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[329].size = 8'h62;
    test_vectors[329].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A084C2E857F6E11686866480D1CB6C4097;

    // Test vector 330
    test_vectors[330].count = 331;
    test_vectors[330].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[330].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[330].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[330].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[330].size = 8'h62;
    test_vectors[330].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6B623C87A1015609FBDBD977384C3704D5;

    // Test vector 331
    test_vectors[331].count = 332;
    test_vectors[331].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[331].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[331].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[331].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[331].size = 8'h62;
    test_vectors[331].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1E9520378A427F539DE2741296A1811A8;

    // Test vector 332
    test_vectors[332].count = 333;
    test_vectors[332].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[332].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[332].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[332].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[332].size = 8'h62;
    test_vectors[332].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F2BBA50501785163E641A2A786F143627;

    // Test vector 333
    test_vectors[333].count = 334;
    test_vectors[333].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[333].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[333].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[333].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[333].size = 8'h62;
    test_vectors[333].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C689C2EBDB4EA042C34922A76A065DDD1AF1;

    // Test vector 334
    test_vectors[334].count = 335;
    test_vectors[334].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[334].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[334].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[334].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[334].size = 8'h62;
    test_vectors[334].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D484586A137B8BF80F38C5D9DDE650112C47E;

    // Test vector 335
    test_vectors[335].count = 336;
    test_vectors[335].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[335].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[335].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[335].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[335].size = 8'h63;
    test_vectors[335].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EC8AC6FC006BC0317C6618E51F93DC539;

    // Test vector 336
    test_vectors[336].count = 337;
    test_vectors[336].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[336].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[336].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[336].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[336].size = 8'h66;
    test_vectors[336].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F8631050DE37DC94996129EF5F146645240;

    // Test vector 337
    test_vectors[337].count = 338;
    test_vectors[337].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[337].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[337].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[337].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[337].size = 8'h66;
    test_vectors[337].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC1421656205F7449E231A8F648AED437E4;

    // Test vector 338
    test_vectors[338].count = 339;
    test_vectors[338].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[338].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[338].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[338].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[338].size = 8'h66;
    test_vectors[338].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8F1BE55913A73D6DEF37D967F94428E7B4;

    // Test vector 339
    test_vectors[339].count = 340;
    test_vectors[339].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[339].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[339].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[339].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[339].size = 8'h66;
    test_vectors[339].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B19F64B45CB786B123874A5D2B538F80B86;

    // Test vector 340
    test_vectors[340].count = 341;
    test_vectors[340].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[340].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[340].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[340].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[340].size = 8'h66;
    test_vectors[340].expected_ct = 448'h652289701299914EF7AAF77F70050DF557741EE595CE2B418F00E758CC53733C4752;

    // Test vector 341
    test_vectors[341].count = 342;
    test_vectors[341].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[341].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[341].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[341].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[341].size = 8'h66;
    test_vectors[341].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C44600234E07814B7FD0355DA3C9A613D69C93E;

    // Test vector 342
    test_vectors[342].count = 343;
    test_vectors[342].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[342].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[342].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[342].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[342].size = 8'h66;
    test_vectors[342].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8EA80E94128079B5CE83A1394EF78427;

    // Test vector 343
    test_vectors[343].count = 344;
    test_vectors[343].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[343].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[343].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[343].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[343].size = 8'h67;
    test_vectors[343].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F425CB054394545CC84D864585080D73C77;

    // Test vector 344
    test_vectors[344].count = 345;
    test_vectors[344].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[344].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[344].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[344].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[344].size = 8'h6E;
    test_vectors[344].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D28718B21B668FDE2BE8051E1D3DA47C73B;

    // Test vector 345
    test_vectors[345].count = 346;
    test_vectors[345].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[345].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[345].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[345].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[345].size = 8'h6E;
    test_vectors[345].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A4573751C77BE31D7E38F0A03D2FDCD0B78BA2;

    // Test vector 346
    test_vectors[346].count = 347;
    test_vectors[346].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[346].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[346].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[346].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[346].size = 8'h6E;
    test_vectors[346].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F00584AD007B2C8BB583E77AA6D80110DA;

    // Test vector 347
    test_vectors[347].count = 348;
    test_vectors[347].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[347].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[347].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[347].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[347].size = 8'h6E;
    test_vectors[347].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF62DFD57D727AEF2A58BAF756635641497;

    // Test vector 348
    test_vectors[348].count = 349;
    test_vectors[348].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[348].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[348].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[348].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[348].size = 8'h6E;
    test_vectors[348].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD40A18D8D69C67D10AD6F631484291302FB;

    // Test vector 349
    test_vectors[349].count = 350;
    test_vectors[349].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[349].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[349].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[349].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[349].size = 8'h6E;
    test_vectors[349].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7D716F31F84FB1B8B92BFABF632D8D02D;

    // Test vector 350
    test_vectors[350].count = 351;
    test_vectors[350].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[350].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[350].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[350].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[350].size = 8'h6E;
    test_vectors[350].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F92CC23BACEECAE0519ADBD8BBDF8F49C5;

    // Test vector 351
    test_vectors[351].count = 352;
    test_vectors[351].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[351].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[351].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[351].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[351].size = 8'h6F;
    test_vectors[351].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD0032153E69A38360E9EE1AA78904BC4126;

    // Test vector 352
    test_vectors[352].count = 353;
    test_vectors[352].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[352].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[352].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[352].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[352].size = 8'h60;
    test_vectors[352].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7758CE82F4F49A3B3E9FAE8A5386BB209;

    // Test vector 353
    test_vectors[353].count = 354;
    test_vectors[353].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[353].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[353].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[353].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[353].size = 8'h60;
    test_vectors[353].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCA1E6BEF50249BF4C15EBB6CD14390B8;

    // Test vector 354
    test_vectors[354].count = 355;
    test_vectors[354].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[354].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[354].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[354].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[354].size = 8'h60;
    test_vectors[354].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A5489AD44678C253BD39423BF830719030F;

    // Test vector 355
    test_vectors[355].count = 356;
    test_vectors[355].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[355].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[355].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[355].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[355].size = 8'h60;
    test_vectors[355].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE976C48AB376D94DB52EC9074314A12DC;

    // Test vector 356
    test_vectors[356].count = 357;
    test_vectors[356].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[356].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[356].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[356].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[356].size = 8'h60;
    test_vectors[356].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CB529DFF7F159115EF538F9CA0E40FFBE;

    // Test vector 357
    test_vectors[357].count = 358;
    test_vectors[357].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[357].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[357].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[357].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[357].size = 8'h60;
    test_vectors[357].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF01F0E21F867800494F2E6BFA94A235438;

    // Test vector 358
    test_vectors[358].count = 359;
    test_vectors[358].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[358].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[358].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[358].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[358].size = 8'h60;
    test_vectors[358].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082EDAB24B20A43F42C8EB7159C827AE599;

    // Test vector 359
    test_vectors[359].count = 360;
    test_vectors[359].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[359].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[359].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[359].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[359].size = 8'h61;
    test_vectors[359].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF9500A630F851C54D0C7371E47151175D;

    // Test vector 360
    test_vectors[360].count = 361;
    test_vectors[360].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[360].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[360].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[360].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[360].size = 8'h62;
    test_vectors[360].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D820105EDE1E5D1869CBC028D7E2AB892934FE;

    // Test vector 361
    test_vectors[361].count = 362;
    test_vectors[361].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[361].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[361].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[361].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[361].size = 8'h62;
    test_vectors[361].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C597CC4D908EDF4873D6408357876425F;

    // Test vector 362
    test_vectors[362].count = 363;
    test_vectors[362].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[362].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[362].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[362].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[362].size = 8'h62;
    test_vectors[362].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6264A7124F087EEA3108A5EAB386FF31D;

    // Test vector 363
    test_vectors[363].count = 364;
    test_vectors[363].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[363].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[363].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[363].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[363].size = 8'h62;
    test_vectors[363].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FAB77B236DD75C0CD984CCF606510DC2B8;

    // Test vector 364
    test_vectors[364].count = 365;
    test_vectors[364].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[364].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[364].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[364].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[364].size = 8'h62;
    test_vectors[364].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F8058651DBBD71122E8C67E648A3945BDCD;

    // Test vector 365
    test_vectors[365].count = 366;
    test_vectors[365].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[365].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[365].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[365].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[365].size = 8'h62;
    test_vectors[365].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897F2FA0EDE02A9719C0E70B5B5C4DB2794D;

    // Test vector 366
    test_vectors[366].count = 367;
    test_vectors[366].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[366].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[366].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[366].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[366].size = 8'h62;
    test_vectors[366].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D48453821DD1028C23AD03C6A93DB634C7364EB;

    // Test vector 367
    test_vectors[367].count = 368;
    test_vectors[367].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[367].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[367].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[367].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[367].size = 8'h63;
    test_vectors[367].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF76C2EEB82B266F9171524726A5DA672B7;

    // Test vector 368
    test_vectors[368].count = 369;
    test_vectors[368].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[368].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[368].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[368].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[368].size = 8'h66;
    test_vectors[368].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865E3B65EB0628A3E8B6D2F9C53C5AEE3BC4;

    // Test vector 369
    test_vectors[369].count = 370;
    test_vectors[369].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[369].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[369].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[369].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[369].size = 8'h66;
    test_vectors[369].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC1958FDFDE8EA8FA5511A9E592C09138142C;

    // Test vector 370
    test_vectors[370].count = 371;
    test_vectors[370].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[370].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[370].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[370].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[370].size = 8'h66;
    test_vectors[370].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7AD0CF18EF5C9CCEE50BDAE37E0138A46;

    // Test vector 371
    test_vectors[371].count = 372;
    test_vectors[371].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[371].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[371].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[371].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[371].size = 8'h66;
    test_vectors[371].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B19687D18374A284D2C855A532591C66F3154;

    // Test vector 372
    test_vectors[372].count = 373;
    test_vectors[372].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[372].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[372].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[372].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[372].size = 8'h66;
    test_vectors[372].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A5DF5FC787B7B9DAB09B06425F00A07E71;

    // Test vector 373
    test_vectors[373].count = 374;
    test_vectors[373].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[373].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[373].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[373].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[373].size = 8'h66;
    test_vectors[373].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1820B68EF14ACF9BF5EB08979EC9CB2D8;

    // Test vector 374
    test_vectors[374].count = 375;
    test_vectors[374].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[374].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[374].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[374].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[374].size = 8'h66;
    test_vectors[374].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8A3B2D44238640D91C95C7EC3992A4F6C9;

    // Test vector 375
    test_vectors[375].count = 376;
    test_vectors[375].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[375].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[375].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[375].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[375].size = 8'h67;
    test_vectors[375].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E3CC057EC368797A5F2FF37B14A90E810;

    // Test vector 376
    test_vectors[376].count = 377;
    test_vectors[376].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[376].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[376].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[376].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[376].size = 8'h6E;
    test_vectors[376].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282C77A560EB63A19ED3647337C989BB2406;

    // Test vector 377
    test_vectors[377].count = 378;
    test_vectors[377].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[377].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[377].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[377].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[377].size = 8'h6E;
    test_vectors[377].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C2C8ACEC4D15653150DC1D4DAB24C039CA;

    // Test vector 378
    test_vectors[378].count = 379;
    test_vectors[378].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[378].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[378].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[378].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[378].size = 8'h6E;
    test_vectors[378].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B6E292E06548E40807446B7ABA696FEB;

    // Test vector 379
    test_vectors[379].count = 380;
    test_vectors[379].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[379].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[379].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[379].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[379].size = 8'h6E;
    test_vectors[379].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF64723A45A429C1BB6940F2AE53DC30A1A29;

    // Test vector 380
    test_vectors[380].count = 381;
    test_vectors[380].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[380].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[380].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[380].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[380].size = 8'h6E;
    test_vectors[380].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD401884D85EF1952EAEC14EDB38D0E21E22D8;

    // Test vector 381
    test_vectors[381].count = 382;
    test_vectors[381].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[381].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[381].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[381].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[381].size = 8'h6E;
    test_vectors[381].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FD3748FD829A9CD334BBD7114956E2A93F;

    // Test vector 382
    test_vectors[382].count = 383;
    test_vectors[382].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[382].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[382].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[382].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[382].size = 8'h6E;
    test_vectors[382].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9535F1AAED560876DD15976AC49FA4D7E6A;

    // Test vector 383
    test_vectors[383].count = 384;
    test_vectors[383].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[383].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[383].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[383].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[383].size = 8'h6F;
    test_vectors[383].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD0049F6EDD3077293432005BEB6DFADB8AF93;

    // Test vector 384
    test_vectors[384].count = 385;
    test_vectors[384].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[384].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[384].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[384].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[384].size = 8'h60;
    test_vectors[384].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F4D1E2200C59CC153855C1A6195871F52C;

    // Test vector 385
    test_vectors[385].count = 386;
    test_vectors[385].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[385].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[385].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[385].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[385].size = 8'h60;
    test_vectors[385].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCBF5045CC50BD4E652A772B1D4501E9831;

    // Test vector 386
    test_vectors[386].count = 387;
    test_vectors[386].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[386].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[386].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[386].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[386].size = 8'h60;
    test_vectors[386].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1BE3094136A79A0EE3C1803BC1527094E;

    // Test vector 387
    test_vectors[387].count = 388;
    test_vectors[387].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[387].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[387].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[387].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[387].size = 8'h60;
    test_vectors[387].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91D6272FCD90590CE89AAA2ACD358F31FE;

    // Test vector 388
    test_vectors[388].count = 389;
    test_vectors[388].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[388].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[388].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[388].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[388].size = 8'h60;
    test_vectors[388].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA057FF0F06D85BD121ABED476AC6BF2CF2;

    // Test vector 389
    test_vectors[389].count = 390;
    test_vectors[389].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[389].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[389].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[389].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[389].size = 8'h60;
    test_vectors[389].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0666058D03F05208D0A569F7211411C0D7A;

    // Test vector 390
    test_vectors[390].count = 391;
    test_vectors[390].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[390].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[390].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[390].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[390].size = 8'h60;
    test_vectors[390].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082AD1400B50BF8D34A55115D9F1017DE7063;

    // Test vector 391
    test_vectors[391].count = 392;
    test_vectors[391].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[391].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[391].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[391].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[391].size = 8'h61;
    test_vectors[391].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FD5C5E06FABFBDCA70FF2E8BD146E416C;

    // Test vector 392
    test_vectors[392].count = 393;
    test_vectors[392].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[392].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[392].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[392].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[392].size = 8'h62;
    test_vectors[392].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AAC9D26B60B49B84113E27E0157097EDFF;

    // Test vector 393
    test_vectors[393].count = 394;
    test_vectors[393].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[393].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[393].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[393].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[393].size = 8'h62;
    test_vectors[393].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C086AEF10B5AC711E654CA7D27215640045;

    // Test vector 394
    test_vectors[394].count = 395;
    test_vectors[394].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[394].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[394].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[394].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[394].size = 8'h62;
    test_vectors[394].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB652CDB650F1EC2381DB1DFAD2A548327B02;

    // Test vector 395
    test_vectors[395].count = 396;
    test_vectors[395].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[395].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[395].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[395].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[395].size = 8'h62;
    test_vectors[395].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA5994CDCBD9AB27F38CC1993869CCFF3F74;

    // Test vector 396
    test_vectors[396].count = 397;
    test_vectors[396].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[396].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[396].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[396].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[396].size = 8'h62;
    test_vectors[396].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F8069907B0FBDCB7844CBD239BB4442D3BF9C;

    // Test vector 397
    test_vectors[397].count = 398;
    test_vectors[397].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[397].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[397].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[397].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[397].size = 8'h62;
    test_vectors[397].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC243591FABC6B99E52DE7F46C5D340A599;

    // Test vector 398
    test_vectors[398].count = 399;
    test_vectors[398].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[398].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[398].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[398].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[398].size = 8'h62;
    test_vectors[398].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F627460B35984F13F04F8213B2C9D0C85;

    // Test vector 399
    test_vectors[399].count = 400;
    test_vectors[399].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[399].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[399].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[399].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[399].size = 8'h63;
    test_vectors[399].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E64B4A20C9E9C69DD50C0171CE9C78FC2;

    // Test vector 400
    test_vectors[400].count = 401;
    test_vectors[400].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[400].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[400].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[400].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[400].size = 8'h66;
    test_vectors[400].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED20499EA2C922B34DA75B5ADE5663ACD74;

    // Test vector 401
    test_vectors[401].count = 402;
    test_vectors[401].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[401].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[401].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[401].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[401].size = 8'h66;
    test_vectors[401].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555169A94E88853F3639E7B45D8E7CA0AF0;

    // Test vector 402
    test_vectors[402].count = 403;
    test_vectors[402].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[402].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[402].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[402].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[402].size = 8'h66;
    test_vectors[402].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D98E38959CAB6E7AC6BDFF425CAF21F11B;

    // Test vector 403
    test_vectors[403].count = 404;
    test_vectors[403].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[403].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[403].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[403].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[403].size = 8'h66;
    test_vectors[403].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B1968288313134CF5A5BEB17942A253A5E0ABAE;

    // Test vector 404
    test_vectors[404].count = 405;
    test_vectors[404].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[404].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[404].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[404].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[404].size = 8'h66;
    test_vectors[404].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54D1984EBF5A69F745CD77F335C3182D24A;

    // Test vector 405
    test_vectors[405].count = 406;
    test_vectors[405].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[405].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[405].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[405].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[405].size = 8'h66;
    test_vectors[405].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A216448CC1A2F5C36E1448E585B7343C2B;

    // Test vector 406
    test_vectors[406].count = 407;
    test_vectors[406].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[406].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[406].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[406].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[406].size = 8'h66;
    test_vectors[406].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA0E8C52E3EDFD4CB20BC40B5917931BDE;

    // Test vector 407
    test_vectors[407].count = 408;
    test_vectors[407].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[407].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[407].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[407].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[407].size = 8'h67;
    test_vectors[407].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E92D5DE32E94E32E05AFA503C12B7E9AC4A;

    // Test vector 408
    test_vectors[408].count = 409;
    test_vectors[408].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[408].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[408].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[408].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[408].size = 8'h6E;
    test_vectors[408].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA9CBE42BC4914278B4BED12806D168D846;

    // Test vector 409
    test_vectors[409].count = 410;
    test_vectors[409].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[409].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[409].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[409].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[409].size = 8'h6E;
    test_vectors[409].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C254A7066872B541AF0586E86B756E8799FD;

    // Test vector 410
    test_vectors[410].count = 411;
    test_vectors[410].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[410].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[410].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[410].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[410].size = 8'h6E;
    test_vectors[410].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B77C83EFF17A7506DC74277B6902E255AE;

    // Test vector 411
    test_vectors[411].count = 412;
    test_vectors[411].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[411].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[411].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[411].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[411].size = 8'h6E;
    test_vectors[411].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CDC88272B96EA529C4048A7AE0ABAE78D2;

    // Test vector 412
    test_vectors[412].count = 413;
    test_vectors[412].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[412].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[412].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[412].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[412].size = 8'h6E;
    test_vectors[412].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF15AC8A99F8CB0266C78B50D91CCAD754;

    // Test vector 413
    test_vectors[413].count = 414;
    test_vectors[413].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[413].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[413].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[413].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[413].size = 8'h6E;
    test_vectors[413].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBFDBEB3239CFF163A4B9882ED42B2DC605;

    // Test vector 414
    test_vectors[414].count = 415;
    test_vectors[414].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[414].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[414].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[414].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[414].size = 8'h6E;
    test_vectors[414].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532C8B665A6F67EA3BCBF6FEFE500AF6D693;

    // Test vector 415
    test_vectors[415].count = 416;
    test_vectors[415].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[415].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[415].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[415].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[415].size = 8'h6F;
    test_vectors[415].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C17FFDCA13AB0A67F9128318314C5503;

    // Test vector 416
    test_vectors[416].count = 417;
    test_vectors[416].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[416].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[416].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[416].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[416].size = 8'h60;
    test_vectors[416].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D6EE49B6E937C64F8563D73B41858B25C;

    // Test vector 417
    test_vectors[417].count = 418;
    test_vectors[417].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[417].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[417].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[417].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[417].size = 8'h60;
    test_vectors[417].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05D9023E08D69BF278288C938CEEFEF4DE;

    // Test vector 418
    test_vectors[418].count = 419;
    test_vectors[418].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[418].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[418].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[418].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[418].size = 8'h60;
    test_vectors[418].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1603484B7F35987F988E281D6D7D346C864;

    // Test vector 419
    test_vectors[419].count = 420;
    test_vectors[419].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[419].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[419].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[419].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[419].size = 8'h60;
    test_vectors[419].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB0E880076ACCFE882CFF9FF6D68A4B3B3;

    // Test vector 420
    test_vectors[420].count = 421;
    test_vectors[420].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[420].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[420].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[420].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[420].size = 8'h60;
    test_vectors[420].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C415BC84E9DB6681A9847E6A6D1EDD92AB;

    // Test vector 421
    test_vectors[421].count = 422;
    test_vectors[421].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[421].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[421].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[421].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[421].size = 8'h60;
    test_vectors[421].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A11A501E889E8E5DE47FDF7812927F96D;

    // Test vector 422
    test_vectors[422].count = 423;
    test_vectors[422].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[422].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[422].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[422].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[422].size = 8'h60;
    test_vectors[422].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4F103E54ECA1A291ED8E986106A81457B;

    // Test vector 423
    test_vectors[423].count = 424;
    test_vectors[423].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[423].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[423].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[423].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[423].size = 8'h61;
    test_vectors[423].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9A15A92079F07A56C2FF646A6D2FC3E95;

    // Test vector 424
    test_vectors[424].count = 425;
    test_vectors[424].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[424].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[424].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[424].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[424].size = 8'h62;
    test_vectors[424].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D64D87481AA719E06543A6CE84860D96;

    // Test vector 425
    test_vectors[425].count = 426;
    test_vectors[425].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[425].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[425].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[425].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[425].size = 8'h62;
    test_vectors[425].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C0853EA927D2A14E5660C51DF10FC8E3BA26F;

    // Test vector 426
    test_vectors[426].count = 427;
    test_vectors[426].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[426].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[426].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[426].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[426].size = 8'h62;
    test_vectors[426].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB65290AEEEFBEF1E0E2E1CEA5F8D1A7357F7CA;

    // Test vector 427
    test_vectors[427].count = 428;
    test_vectors[427].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[427].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[427].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[427].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[427].size = 8'h62;
    test_vectors[427].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE1DA74CC16E8833B9616DF8C4CB9AB092;

    // Test vector 428
    test_vectors[428].count = 429;
    test_vectors[428].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[428].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[428].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[428].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[428].size = 8'h62;
    test_vectors[428].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F806934362F77D391E5695A108171EB79935542;

    // Test vector 429
    test_vectors[429].count = 430;
    test_vectors[429].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[429].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[429].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[429].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[429].size = 8'h62;
    test_vectors[429].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC20831567A8DE5342EEF40D554B4D95FB7CA;

    // Test vector 430
    test_vectors[430].count = 431;
    test_vectors[430].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[430].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[430].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[430].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[430].size = 8'h62;
    test_vectors[430].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C8ADC5F11DDD7FC27CC69C4DF910C41E9;

    // Test vector 431
    test_vectors[431].count = 432;
    test_vectors[431].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[431].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[431].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[431].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[431].size = 8'h63;
    test_vectors[431].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7AF7C8A008DB779394DC40E53A92F38D36;

    // Test vector 432
    test_vectors[432].count = 433;
    test_vectors[432].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[432].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[432].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[432].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[432].size = 8'h66;
    test_vectors[432].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E33E5704281C6335F8A0347ECAB1584AD7;

    // Test vector 433
    test_vectors[433].count = 434;
    test_vectors[433].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[433].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[433].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[433].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[433].size = 8'h66;
    test_vectors[433].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC1955504D38F3873373A2F928FE37CF2E40C8AF0;

    // Test vector 434
    test_vectors[434].count = 435;
    test_vectors[434].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[434].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[434].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[434].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[434].size = 8'h66;
    test_vectors[434].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986507A49F5C62CDCE3347FBB1E25802857;

    // Test vector 435
    test_vectors[435].count = 436;
    test_vectors[435].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[435].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[435].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[435].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[435].size = 8'h66;
    test_vectors[435].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FF9D369EB92EB8C86CE063D3C2CB4FD9FC;

    // Test vector 436
    test_vectors[436].count = 437;
    test_vectors[436].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[436].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[436].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[436].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[436].size = 8'h66;
    test_vectors[436].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0F341C23E36DE39237539BBDCB2F31A1C;

    // Test vector 437
    test_vectors[437].count = 438;
    test_vectors[437].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[437].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[437].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[437].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[437].size = 8'h66;
    test_vectors[437].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A2145F10DB1FC76FD4A9FA4DEDA878119410;

    // Test vector 438
    test_vectors[438].count = 439;
    test_vectors[438].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[438].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[438].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[438].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[438].size = 8'h66;
    test_vectors[438].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA989EF8B65AF74F0402AEB729531D5DDB96;

    // Test vector 439
    test_vectors[439].count = 440;
    test_vectors[439].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[439].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[439].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[439].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[439].size = 8'h67;
    test_vectors[439].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E3CF59DA93C148770F1675DA6F322A215;

    // Test vector 440
    test_vectors[440].count = 441;
    test_vectors[440].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[440].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[440].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[440].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[440].size = 8'h6E;
    test_vectors[440].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A5BA4DDD33A90B662AD6E87CAD401FFB7;

    // Test vector 441
    test_vectors[441].count = 442;
    test_vectors[441].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[441].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[441].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[441].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[441].size = 8'h6E;
    test_vectors[441].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412813EF6CB958C4C45584E73E556EAD741;

    // Test vector 442
    test_vectors[442].count = 443;
    test_vectors[442].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[442].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[442].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[442].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[442].size = 8'h6E;
    test_vectors[442].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73A1C71FBC49968D795D067B87A186E5518;

    // Test vector 443
    test_vectors[443].count = 444;
    test_vectors[443].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[443].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[443].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[443].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[443].size = 8'h6E;
    test_vectors[443].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1D1B01CF7967922515B6004602C231F7ED;

    // Test vector 444
    test_vectors[444].count = 445;
    test_vectors[444].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[444].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[444].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[444].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[444].size = 8'h6E;
    test_vectors[444].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01F015E4C8DFEAD291D17874054B2DEE6D;

    // Test vector 445
    test_vectors[445].count = 446;
    test_vectors[445].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[445].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[445].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[445].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[445].size = 8'h6E;
    test_vectors[445].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF23CC35F4030BA459DD2BBCA0660F9C20F9;

    // Test vector 446
    test_vectors[446].count = 447;
    test_vectors[446].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[446].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[446].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[446].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[446].size = 8'h6E;
    test_vectors[446].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC987471BC5C9E9F53E9A9B060571784FCC;

    // Test vector 447
    test_vectors[447].count = 448;
    test_vectors[447].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[447].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[447].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[447].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[447].size = 8'h6F;
    test_vectors[447].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C8AA0A0F9E058EE1E251F427171C2CF441;

    // Test vector 448
    test_vectors[448].count = 449;
    test_vectors[448].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[448].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[448].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[448].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[448].size = 8'h60;
    test_vectors[448].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D41A6D8931E36E84D1496D1AB75D3AA5487;

    // Test vector 449
    test_vectors[449].count = 450;
    test_vectors[449].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[449].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[449].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[449].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[449].size = 8'h60;
    test_vectors[449].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F124E9D1EB41B0FEFF2DE7D4C4BF30854D;

    // Test vector 450
    test_vectors[450].count = 451;
    test_vectors[450].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[450].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[450].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[450].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[450].size = 8'h60;
    test_vectors[450].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B222EC07BC8E0942710299418DC36ACBE;

    // Test vector 451
    test_vectors[451].count = 452;
    test_vectors[451].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[451].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[451].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[451].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[451].size = 8'h60;
    test_vectors[451].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6651F83475F62B6074BF9BF56FECD6DAF2;

    // Test vector 452
    test_vectors[452].count = 453;
    test_vectors[452].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[452].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[452].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[452].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[452].size = 8'h60;
    test_vectors[452].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B16452612C34BA6BBE04D64A305A6B0951;

    // Test vector 453
    test_vectors[453].count = 454;
    test_vectors[453].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[453].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[453].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[453].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[453].size = 8'h60;
    test_vectors[453].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A67D95E9AA228D0F8B2B244FB0453A4DE;

    // Test vector 454
    test_vectors[454].count = 455;
    test_vectors[454].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[454].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[454].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[454].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[454].size = 8'h60;
    test_vectors[454].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A21D189AACA8468EE7D25F01E77115772C;

    // Test vector 455
    test_vectors[455].count = 456;
    test_vectors[455].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[455].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[455].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[455].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[455].size = 8'h61;
    test_vectors[455].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F01A33A62D9CE9B4EE36192E494A99F5BD;

    // Test vector 456
    test_vectors[456].count = 457;
    test_vectors[456].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[456].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[456].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[456].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[456].size = 8'h62;
    test_vectors[456].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D91BFD5CFA3B375ECE6BE51E8E2436200F;

    // Test vector 457
    test_vectors[457].count = 458;
    test_vectors[457].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[457].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[457].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[457].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[457].size = 8'h62;
    test_vectors[457].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535477AE28AD31030BC968CDE0E97F75F18A;

    // Test vector 458
    test_vectors[458].count = 459;
    test_vectors[458].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[458].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[458].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[458].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[458].size = 8'h62;
    test_vectors[458].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB65290908AF03C9263F45B7D255F0A5970663053;

    // Test vector 459
    test_vectors[459].count = 460;
    test_vectors[459].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[459].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[459].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[459].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[459].size = 8'h62;
    test_vectors[459].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0D89FC03B86FC0740E0CD4134B3402FE7F;

    // Test vector 460
    test_vectors[460].count = 461;
    test_vectors[460].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[460].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[460].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[460].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[460].size = 8'h62;
    test_vectors[460].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F806934841E25D76273169313868A236E1F4D56B2;

    // Test vector 461
    test_vectors[461].count = 462;
    test_vectors[461].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[461].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[461].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[461].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[461].size = 8'h62;
    test_vectors[461].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080EAD055B10FA38747852EE3B2C57D6B2D4;

    // Test vector 462
    test_vectors[462].count = 463;
    test_vectors[462].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[462].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[462].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[462].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[462].size = 8'h62;
    test_vectors[462].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C09D95B28B3957C642228E5F6EA29B42864;

    // Test vector 463
    test_vectors[463].count = 464;
    test_vectors[463].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[463].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[463].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[463].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[463].size = 8'h63;
    test_vectors[463].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A89F48A2E97FCC7BB3562D7D232CD10E578;

    // Test vector 464
    test_vectors[464].count = 465;
    test_vectors[464].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[464].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[464].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[464].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[464].size = 8'h66;
    test_vectors[464].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4467F70806C38F2F354CEB1CF9375236F;

    // Test vector 465
    test_vectors[465].count = 466;
    test_vectors[465].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[465].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[465].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[465].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[465].size = 8'h66;
    test_vectors[465].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042B2BA86B15A6EE4DFB5719A67D64D0062C;

    // Test vector 466
    test_vectors[466].count = 467;
    test_vectors[466].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[466].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[466].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[466].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[466].size = 8'h66;
    test_vectors[466].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E7E740974BCFCE2B68BB856E786FA0EF91;

    // Test vector 467
    test_vectors[467].count = 468;
    test_vectors[467].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[467].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[467].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[467].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[467].size = 8'h66;
    test_vectors[467].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE09BCD4A124E0C35C01C5DBA644BC8EE81;

    // Test vector 468
    test_vectors[468].count = 469;
    test_vectors[468].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[468].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[468].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[468].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[468].size = 8'h66;
    test_vectors[468].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE020AEE4FA74CA507E2D564727DC3A112531;

    // Test vector 469
    test_vectors[469].count = 470;
    test_vectors[469].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[469].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[469].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[469].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[469].size = 8'h66;
    test_vectors[469].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D761FFBF2C2A4AC9E41B0BEBD6626E304B;

    // Test vector 470
    test_vectors[470].count = 471;
    test_vectors[470].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[470].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[470].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[470].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[470].size = 8'h66;
    test_vectors[470].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FC0EA6BEDD44C9A0F3A4301A5495E58845;

    // Test vector 471
    test_vectors[471].count = 472;
    test_vectors[471].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[471].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[471].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[471].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[471].size = 8'h67;
    test_vectors[471].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E984322DCFE040398FBFDE3C75FE89C0971;

    // Test vector 472
    test_vectors[472].count = 473;
    test_vectors[472].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[472].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[472].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[472].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[472].size = 8'h6E;
    test_vectors[472].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0EEDCECF32C92D6EEA510A9C49EB6BAAFE;

    // Test vector 473
    test_vectors[473].count = 474;
    test_vectors[473].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[473].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[473].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[473].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[473].size = 8'h6E;
    test_vectors[473].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F80871DDD9112DC97302F5F586203F3D7A;

    // Test vector 474
    test_vectors[474].count = 475;
    test_vectors[474].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[474].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[474].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[474].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[474].size = 8'h6E;
    test_vectors[474].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC1FAD2C6E9571E7FBB43329DD7720176D;

    // Test vector 475
    test_vectors[475].count = 476;
    test_vectors[475].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[475].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[475].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[475].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[475].size = 8'h6E;
    test_vectors[475].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB6CC6B7E9CBDA189847288489CB4532AD2;

    // Test vector 476
    test_vectors[476].count = 477;
    test_vectors[476].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[476].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[476].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[476].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[476].size = 8'h6E;
    test_vectors[476].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2E0818FCA30F31F2464B3546EA37EE996;

    // Test vector 477
    test_vectors[477].count = 478;
    test_vectors[477].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[477].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[477].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[477].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[477].size = 8'h6E;
    test_vectors[477].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D45E7F7F580F7AAC047E762E97C1E9323;

    // Test vector 478
    test_vectors[478].count = 479;
    test_vectors[478].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[478].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[478].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[478].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[478].size = 8'h6E;
    test_vectors[478].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD27B4143C2D2B99DC9AFFC418AA665448;

    // Test vector 479
    test_vectors[479].count = 480;
    test_vectors[479].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[479].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[479].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[479].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[479].size = 8'h6F;
    test_vectors[479].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FC6A1DE7265ED2C51EEE05B80DFDC2E8F;

    // Test vector 480
    test_vectors[480].count = 481;
    test_vectors[480].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[480].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[480].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[480].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[480].size = 8'h60;
    test_vectors[480].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D4109DA4E9F2A6437A4D5705B5855A03DA818;

    // Test vector 481
    test_vectors[481].count = 482;
    test_vectors[481].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[481].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[481].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[481].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[481].size = 8'h60;
    test_vectors[481].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F137B3F2EE767328417D66F98758404B872D;

    // Test vector 482
    test_vectors[482].count = 483;
    test_vectors[482].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[482].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[482].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[482].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[482].size = 8'h60;
    test_vectors[482].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BDB9904228A69869C63A7E0176C3D5DE7;

    // Test vector 483
    test_vectors[483].count = 484;
    test_vectors[483].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[483].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[483].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[483].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[483].size = 8'h60;
    test_vectors[483].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693364EF207E91DCAD6A0F8F27D23524489;

    // Test vector 484
    test_vectors[484].count = 485;
    test_vectors[484].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[484].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[484].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[484].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[484].size = 8'h60;
    test_vectors[484].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E40EDE2092124E1CDF0FC59D98C85ADDB8;

    // Test vector 485
    test_vectors[485].count = 486;
    test_vectors[485].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[485].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[485].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[485].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[485].size = 8'h60;
    test_vectors[485].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A475EADC04CD4A455AF3066492AC4608288;

    // Test vector 486
    test_vectors[486].count = 487;
    test_vectors[486].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[486].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[486].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[486].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[486].size = 8'h60;
    test_vectors[486].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282E40DB2D0AE201F00FB789D718AD7A6B5;

    // Test vector 487
    test_vectors[487].count = 488;
    test_vectors[487].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[487].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[487].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[487].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[487].size = 8'h61;
    test_vectors[487].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0551D0A3C6E1FC1CFB97AEA2E71F1A5CBE3;

    // Test vector 488
    test_vectors[488].count = 489;
    test_vectors[488].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[488].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[488].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[488].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[488].size = 8'h62;
    test_vectors[488].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9F2CAEDB27FC7EC0CE1CCAE445408C99;

    // Test vector 489
    test_vectors[489].count = 490;
    test_vectors[489].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[489].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[489].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[489].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[489].size = 8'h62;
    test_vectors[489].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464BAB4F3D1DBA0E8421BC043457F605E24;

    // Test vector 490
    test_vectors[490].count = 491;
    test_vectors[490].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[490].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[490].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[490].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[490].size = 8'h62;
    test_vectors[490].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB65290907437924DA4CF8ACD21E07D6D6960B8D848;

    // Test vector 491
    test_vectors[491].count = 492;
    test_vectors[491].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[491].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[491].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[491].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[491].size = 8'h62;
    test_vectors[491].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC3A58BBDE6B0A855F270B25EF743C46BF8;

    // Test vector 492
    test_vectors[492].count = 493;
    test_vectors[492].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[492].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[492].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[492].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[492].size = 8'h62;
    test_vectors[492].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B3B3FE6DDEFBDF00AB4A2040521907EE26;

    // Test vector 493
    test_vectors[493].count = 494;
    test_vectors[493].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[493].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[493].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[493].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[493].size = 8'h62;
    test_vectors[493].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6A24F417088A0A96CC18E7EA3830756163;

    // Test vector 494
    test_vectors[494].count = 495;
    test_vectors[494].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[494].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[494].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[494].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[494].size = 8'h62;
    test_vectors[494].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BB9412C3EF9C125D7A7A11C3D5B3A673A;

    // Test vector 495
    test_vectors[495].count = 496;
    test_vectors[495].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[495].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[495].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[495].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[495].size = 8'h63;
    test_vectors[495].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891CA6C1E2015C0CFE78C1F1D71CEA005215;

    // Test vector 496
    test_vectors[496].count = 497;
    test_vectors[496].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[496].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[496].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[496].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[496].size = 8'h66;
    test_vectors[496].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A175AB86DCD029D41C44A3B501873AE01F;

    // Test vector 497
    test_vectors[497].count = 498;
    test_vectors[497].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[497].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[497].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[497].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[497].size = 8'h66;
    test_vectors[497].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23CA500F82A658D94B456F9BC0A19EABE;

    // Test vector 498
    test_vectors[498].count = 499;
    test_vectors[498].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[498].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[498].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[498].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[498].size = 8'h66;
    test_vectors[498].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757457A57DF427CDA6B118124DBCEF4C65B;

    // Test vector 499
    test_vectors[499].count = 500;
    test_vectors[499].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[499].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[499].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[499].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[499].size = 8'h66;
    test_vectors[499].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01DE4E38998AD8E297AD2F73BF2AF9653A3;

    // Test vector 500
    test_vectors[500].count = 501;
    test_vectors[500].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[500].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[500].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[500].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[500].size = 8'h66;
    test_vectors[500].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E9900500B069679CFC212442DCDA8045C;

    // Test vector 501
    test_vectors[501].count = 502;
    test_vectors[501].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[501].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[501].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[501].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[501].size = 8'h66;
    test_vectors[501].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74E6CEBDB228B7FB3A95876EB288F4D5BA4;

    // Test vector 502
    test_vectors[502].count = 503;
    test_vectors[502].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[502].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[502].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[502].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[502].size = 8'h66;
    test_vectors[502].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD1F4347068137100D0A74BD68798DE8EEC;

    // Test vector 503
    test_vectors[503].count = 504;
    test_vectors[503].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[503].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[503].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[503].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[503].size = 8'h67;
    test_vectors[503].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983BFEAE871A53C2291A4D39BDF18EFCC25B;

    // Test vector 504
    test_vectors[504].count = 505;
    test_vectors[504].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[504].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[504].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[504].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[504].size = 8'h6E;
    test_vectors[504].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26B222A5A06291AAA4CC751B7FAA96B79E;

    // Test vector 505
    test_vectors[505].count = 506;
    test_vectors[505].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[505].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[505].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[505].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[505].size = 8'h6E;
    test_vectors[505].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875DCC39FC0CFFA1A3F27F29205B5E0DB52;

    // Test vector 506
    test_vectors[506].count = 507;
    test_vectors[506].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[506].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[506].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[506].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[506].size = 8'h6E;
    test_vectors[506].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23302F59B0558B2CDB78A6EF7F64CACCDE;

    // Test vector 507
    test_vectors[507].count = 508;
    test_vectors[507].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[507].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[507].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[507].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[507].size = 8'h6E;
    test_vectors[507].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63BAEBAB2C7BE2CADDBFA004A92BE881F9A;

    // Test vector 508
    test_vectors[508].count = 509;
    test_vectors[508].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[508].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[508].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[508].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[508].size = 8'h6E;
    test_vectors[508].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D9C0236B89A918CDE2E3A1401914F2E820;

    // Test vector 509
    test_vectors[509].count = 510;
    test_vectors[509].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[509].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[509].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[509].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[509].size = 8'h6E;
    test_vectors[509].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F1AFDE667A838C43DAB0AF4D640F08049;

    // Test vector 510
    test_vectors[510].count = 511;
    test_vectors[510].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[510].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[510].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[510].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[510].size = 8'h6E;
    test_vectors[510].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD768A6B7195D48D3C465BDFFF1215D678CE;

    // Test vector 511
    test_vectors[511].count = 512;
    test_vectors[511].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[511].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[511].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[511].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[511].size = 8'h6F;
    test_vectors[511].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF722DEBC542D353C6A7C0A1E008ACA40B5;

    // Test vector 512
    test_vectors[512].count = 513;
    test_vectors[512].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[512].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[512].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[512].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[512].size = 8'h70;
    test_vectors[512].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992180BD49BBF94A3C6E7906843DE7A3473;

    // Test vector 513
    test_vectors[513].count = 514;
    test_vectors[513].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[513].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[513].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[513].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[513].size = 8'h70;
    test_vectors[513].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375E7D3D35961F0C8AF8F8353708A134DBB2;

    // Test vector 514
    test_vectors[514].count = 515;
    test_vectors[514].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[514].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[514].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[514].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[514].size = 8'h70;
    test_vectors[514].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD926CA0A75C2EF9C7564C7F1FB92DA110C;

    // Test vector 515
    test_vectors[515].count = 516;
    test_vectors[515].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[515].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[515].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[515].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[515].size = 8'h70;
    test_vectors[515].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FF05F091FBF4246253362C3EB4C849475D;

    // Test vector 516
    test_vectors[516].count = 517;
    test_vectors[516].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[516].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[516].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[516].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[516].size = 8'h70;
    test_vectors[516].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43ADC2BE72FCB952E150F6C6C80ADDFA23C;

    // Test vector 517
    test_vectors[517].count = 518;
    test_vectors[517].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[517].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[517].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[517].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[517].size = 8'h70;
    test_vectors[517].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470B574DD66B95A132ACB01E69D943563B8E;

    // Test vector 518
    test_vectors[518].count = 519;
    test_vectors[518].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[518].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[518].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[518].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[518].size = 8'h70;
    test_vectors[518].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A28231840763CC8E126EF827687332BAD2AF2B;

    // Test vector 519
    test_vectors[519].count = 520;
    test_vectors[519].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[519].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[519].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[519].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[519].size = 8'h71;
    test_vectors[519].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DF5A1AEB7BBDCDC273D47815F12381BA1;

    // Test vector 520
    test_vectors[520].count = 521;
    test_vectors[520].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[520].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[520].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[520].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[520].size = 8'h72;
    test_vectors[520].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9C0BA721D65DA4D1D5A0D3DD9969E48CBB;

    // Test vector 521
    test_vectors[521].count = 522;
    test_vectors[521].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[521].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[521].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[521].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[521].size = 8'h72;
    test_vectors[521].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C085354649956A3B317872019EDC88FAFD03F8D2AF6;

    // Test vector 522
    test_vectors[522].count = 523;
    test_vectors[522].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[522].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[522].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[522].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[522].size = 8'h72;
    test_vectors[522].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB652909074643B0CC64DE8B3850D74AFBA6DC4563B3F;

    // Test vector 523
    test_vectors[523].count = 524;
    test_vectors[523].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[523].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[523].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[523].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[523].size = 8'h72;
    test_vectors[523].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC3783BF0736218EE2F85B2A4F82B7E1D5857;

    // Test vector 524
    test_vectors[524].count = 525;
    test_vectors[524].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[524].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[524].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[524].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[524].size = 8'h72;
    test_vectors[524].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36FB1B1086A71A6C709EA44C53DD09E3EBE;

    // Test vector 525
    test_vectors[525].count = 526;
    test_vectors[525].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[525].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[525].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[525].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[525].size = 8'h72;
    test_vectors[525].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA8CF12A5E0C46FC28EBEBCA1CB9E7B6381;

    // Test vector 526
    test_vectors[526].count = 527;
    test_vectors[526].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[526].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[526].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[526].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[526].size = 8'h72;
    test_vectors[526].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE552C15DDB95F6F03E2A1F8AC8DC705CC4;

    // Test vector 527
    test_vectors[527].count = 528;
    test_vectors[527].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[527].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[527].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[527].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[527].size = 8'h73;
    test_vectors[527].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C70AB28EF00EF3CC76A5F7F51EEB45300F1;

    // Test vector 528
    test_vectors[528].count = 529;
    test_vectors[528].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[528].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[528].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[528].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[528].size = 8'h76;
    test_vectors[528].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA75A09A60A2DA5D560900705ACEA6AD00;

    // Test vector 529
    test_vectors[529].count = 530;
    test_vectors[529].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[529].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[529].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[529].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[529].size = 8'h76;
    test_vectors[529].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23257D5DE12D1DBE7F1788472540B15314F;

    // Test vector 530
    test_vectors[530].count = 531;
    test_vectors[530].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[530].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[530].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[530].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[530].size = 8'h76;
    test_vectors[530].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E75720825C98BF0EA1902DCC403C7E96CC91A2;

    // Test vector 531
    test_vectors[531].count = 532;
    test_vectors[531].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[531].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[531].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[531].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[531].size = 8'h76;
    test_vectors[531].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6ACEB4F040182B0E74AB6E61D9C596B036;

    // Test vector 532
    test_vectors[532].count = 533;
    test_vectors[532].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[532].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[532].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[532].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[532].size = 8'h76;
    test_vectors[532].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10D04E04416D136EB87E3BCA625A9A76C5;

    // Test vector 533
    test_vectors[533].count = 534;
    test_vectors[533].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[533].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[533].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[533].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[533].size = 8'h76;
    test_vectors[533].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1CBD2E384284F0D139998B66FC66A542C;

    // Test vector 534
    test_vectors[534].count = 535;
    test_vectors[534].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[534].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[534].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[534].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[534].size = 8'h76;
    test_vectors[534].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109F99F4DC1D25CD477BF08E65E0B0BDDBB;

    // Test vector 535
    test_vectors[535].count = 536;
    test_vectors[535].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[535].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[535].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[535].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[535].size = 8'h77;
    test_vectors[535].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2ACC16D366B2FD9247F0F1E8B27EB10431;

    // Test vector 536
    test_vectors[536].count = 537;
    test_vectors[536].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[536].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[536].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[536].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[536].size = 8'h7E;
    test_vectors[536].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C8C9DB6DEC720BBA6E2D3077CE5C281995;

    // Test vector 537
    test_vectors[537].count = 538;
    test_vectors[537].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[537].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[537].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[537].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[537].size = 8'h7E;
    test_vectors[537].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875AB983D8BBF7F40282891FB14B994941E69;

    // Test vector 538
    test_vectors[538].count = 539;
    test_vectors[538].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[538].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[538].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[538].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[538].size = 8'h7E;
    test_vectors[538].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C029D8A4167C87EEC5755B08357307B6A0;

    // Test vector 539
    test_vectors[539].count = 540;
    test_vectors[539].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[539].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[539].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[539].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[539].size = 8'h7E;
    test_vectors[539].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5B73CD969AB4D41A6955A0E07D9663CCEA;

    // Test vector 540
    test_vectors[540].count = 541;
    test_vectors[540].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[540].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[540].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[540].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[540].size = 8'h7E;
    test_vectors[540].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DE36869A3FD8A7B2727D907B2E49C9887;

    // Test vector 541
    test_vectors[541].count = 542;
    test_vectors[541].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[541].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[541].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[541].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[541].size = 8'h7E;
    test_vectors[541].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52287759C77E60BFCEB6E2BAE6E2AA5804;

    // Test vector 542
    test_vectors[542].count = 543;
    test_vectors[542].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[542].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[542].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[542].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[542].size = 8'h7E;
    test_vectors[542].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD769316E1D66DB4E7994C9EF805BD6BE07E51;

    // Test vector 543
    test_vectors[543].count = 544;
    test_vectors[543].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[543].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[543].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[543].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[543].size = 8'h7F;
    test_vectors[543].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF755EBE187708B5692098CD19A0DD3519714;

    // Test vector 544
    test_vectors[544].count = 545;
    test_vectors[544].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[544].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[544].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[544].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[544].size = 8'hE0;
    test_vectors[544].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3069185015DF984F4171FD347FDCEE1FA;

    // Test vector 545
    test_vectors[545].count = 546;
    test_vectors[545].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[545].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[545].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[545].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[545].size = 8'hE0;
    test_vectors[545].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EECF98B2720DD51CE26B83244976FC17685;

    // Test vector 546
    test_vectors[546].count = 547;
    test_vectors[546].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[546].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[546].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[546].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[546].size = 8'hE0;
    test_vectors[546].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DE187CA55075776A8A11AFF57B2C8E41D4;

    // Test vector 547
    test_vectors[547].count = 548;
    test_vectors[547].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[547].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[547].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[547].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[547].size = 8'hE0;
    test_vectors[547].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE450214E4BBB0102A409D1EFEEC38788E9;

    // Test vector 548
    test_vectors[548].count = 549;
    test_vectors[548].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[548].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[548].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[548].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[548].size = 8'hE0;
    test_vectors[548].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A96FA6DF62260C9BC7B129BA2C12021D0A7;

    // Test vector 549
    test_vectors[549].count = 550;
    test_vectors[549].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[549].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[549].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[549].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[549].size = 8'hE0;
    test_vectors[549].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB686EA16FC42692D11F6867743000A6EC4;

    // Test vector 550
    test_vectors[550].count = 551;
    test_vectors[550].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[550].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[550].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[550].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[550].size = 8'hE0;
    test_vectors[550].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A28231348EB27AAC42DA207B09656612C7531316;

    // Test vector 551
    test_vectors[551].count = 552;
    test_vectors[551].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[551].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[551].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[551].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[551].size = 8'hE1;
    test_vectors[551].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8C73EAB1760278047B39F6049813A54E0;

    // Test vector 552
    test_vectors[552].count = 553;
    test_vectors[552].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[552].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[552].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[552].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[552].size = 8'hE2;
    test_vectors[552].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4CF9284A0935A38D8FBE0F5F5CF926A37;

    // Test vector 553
    test_vectors[553].count = 554;
    test_vectors[553].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[553].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[553].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[553].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[553].size = 8'hE2;
    test_vectors[553].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464992676675DA68B7189CFBE1E46EA123B845C;

    // Test vector 554
    test_vectors[554].count = 555;
    test_vectors[554].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[554].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[554].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[554].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[554].size = 8'hE2;
    test_vectors[554].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472DDA6711039B45C61CE34479396E8CA0D;

    // Test vector 555
    test_vectors[555].count = 556;
    test_vectors[555].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[555].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[555].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[555].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[555].size = 8'hE2;
    test_vectors[555].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831DB6B80A3FE7BDE93504166900EB3EB3F;

    // Test vector 556
    test_vectors[556].count = 557;
    test_vectors[556].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[556].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[556].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[556].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[556].size = 8'hE2;
    test_vectors[556].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F78BC1A0E5586816C2FE8EA0CBB50818495;

    // Test vector 557
    test_vectors[557].count = 558;
    test_vectors[557].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[557].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[557].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[557].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[557].size = 8'hE2;
    test_vectors[557].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA8990930395232C5357E7A850AB377CCAAE6;

    // Test vector 558
    test_vectors[558].count = 559;
    test_vectors[558].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[558].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[558].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[558].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[558].size = 8'hE2;
    test_vectors[558].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53D8CE1646F2FAF06A42BC9090A1F20B78C;

    // Test vector 559
    test_vectors[559].count = 560;
    test_vectors[559].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[559].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[559].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[559].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[559].size = 8'hE3;
    test_vectors[559].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701FA49D4069590DA696AB29CE2711CA8B58;

    // Test vector 560
    test_vectors[560].count = 561;
    test_vectors[560].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[560].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[560].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[560].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[560].size = 8'hE6;
    test_vectors[560].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8E9DA0DC01F01F78EBB257D15808DCA879;

    // Test vector 561
    test_vectors[561].count = 562;
    test_vectors[561].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[561].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[561].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[561].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[561].size = 8'hE6;
    test_vectors[561].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC232784B16A3836EE8C36EC7E7ED5B36F96DC1;

    // Test vector 562
    test_vectors[562].count = 563;
    test_vectors[562].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[562].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[562].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[562].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[562].size = 8'hE6;
    test_vectors[562].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D647B2AAFEFC18596B55F31E6FB57F8CE;

    // Test vector 563
    test_vectors[563].count = 564;
    test_vectors[563].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[563].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[563].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[563].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[563].size = 8'hE6;
    test_vectors[563].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A741F1F8D2002BECCD14C32AA0136C65431;

    // Test vector 564
    test_vectors[564].count = 565;
    test_vectors[564].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[564].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[564].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[564].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[564].size = 8'hE6;
    test_vectors[564].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFB1D98ED066141CF4A8D2503EAA6AC4C6;

    // Test vector 565
    test_vectors[565].count = 566;
    test_vectors[565].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[565].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[565].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[565].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[565].size = 8'hE6;
    test_vectors[565].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1774FF470A185D318EDEDD4AB55DFE972E5;

    // Test vector 566
    test_vectors[566].count = 567;
    test_vectors[566].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[566].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[566].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[566].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[566].size = 8'hE6;
    test_vectors[566].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD10951129B6A9CBD31BA01509DA89388D9DC72;

    // Test vector 567
    test_vectors[567].count = 568;
    test_vectors[567].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[567].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[567].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[567].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[567].size = 8'hE7;
    test_vectors[567].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6E8195DBAB4D1CE0B4B2A7E85168C65E2;

    // Test vector 568
    test_vectors[568].count = 569;
    test_vectors[568].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[568].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[568].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[568].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[568].size = 8'hEE;
    test_vectors[568].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C98356316980FD343CEB7ECBC66ABE4FB;

    // Test vector 569
    test_vectors[569].count = 570;
    test_vectors[569].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[569].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[569].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[569].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[569].size = 8'hEE;
    test_vectors[569].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED3ECD6CC29E734AFA4D3028F1400A6359;

    // Test vector 570
    test_vectors[570].count = 571;
    test_vectors[570].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[570].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[570].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[570].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[570].size = 8'hEE;
    test_vectors[570].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A4F3E48A57D9E30C29F6B44EF894530AE;

    // Test vector 571
    test_vectors[571].count = 572;
    test_vectors[571].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[571].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[571].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[571].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[571].size = 8'hEE;
    test_vectors[571].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC7A77CA5B2A9F10A9C605C4EFFBABA2506;

    // Test vector 572
    test_vectors[572].count = 573;
    test_vectors[572].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[572].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[572].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[572].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[572].size = 8'hEE;
    test_vectors[572].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDA5E8A8EFE3C83052CA36263EA0FB1378F;

    // Test vector 573
    test_vectors[573].count = 574;
    test_vectors[573].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[573].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[573].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[573].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[573].size = 8'hEE;
    test_vectors[573].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F14C249D4FDAB73D5DB9D69120257D8934;

    // Test vector 574
    test_vectors[574].count = 575;
    test_vectors[574].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[574].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[574].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[574].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[574].size = 8'hEE;
    test_vectors[574].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD7693974D1E2912AD6716F6CCD98DB715842E8C;

    // Test vector 575
    test_vectors[575].count = 576;
    test_vectors[575].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[575].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[575].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[575].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[575].size = 8'hEF;
    test_vectors[575].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E2FE840AEA723B399FFD2D9AF468D10AA;

    // Test vector 576
    test_vectors[576].count = 577;
    test_vectors[576].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[576].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[576].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[576].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[576].size = 8'hE0;
    test_vectors[576].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3161CD8C509D656A925B5D3E526F1554A1E;

    // Test vector 577
    test_vectors[577].count = 578;
    test_vectors[577].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[577].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[577].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[577].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[577].size = 8'hE0;
    test_vectors[577].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44420DD88CEE890E683792B68542C8CBB1;

    // Test vector 578
    test_vectors[578].count = 579;
    test_vectors[578].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[578].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[578].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[578].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[578].size = 8'hE0;
    test_vectors[578].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDE85C199F8F0328E5427AA28DD02F89F06;

    // Test vector 579
    test_vectors[579].count = 580;
    test_vectors[579].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[579].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[579].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[579].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[579].size = 8'hE0;
    test_vectors[579].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F5B4A12511F2AB8E05DDB14D028244BDAC;

    // Test vector 580
    test_vectors[580].count = 581;
    test_vectors[580].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[580].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[580].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[580].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[580].size = 8'hE0;
    test_vectors[580].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A969332F35444AC982E27A37CF34DD75BFEF4;

    // Test vector 581
    test_vectors[581].count = 582;
    test_vectors[581].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[581].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[581].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[581].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[581].size = 8'hE0;
    test_vectors[581].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB6059E8AD9F4678FF904E0E1252088C3EBFB;

    // Test vector 582
    test_vectors[582].count = 583;
    test_vectors[582].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[582].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[582].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[582].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[582].size = 8'hE0;
    test_vectors[582].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453CFBA0E8EC42A6A85793CD607B6CB85D8;

    // Test vector 583
    test_vectors[583].count = 584;
    test_vectors[583].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[583].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[583].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[583].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[583].size = 8'hE1;
    test_vectors[583].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1917987A3711E7F08BC81B473D30099B0;

    // Test vector 584
    test_vectors[584].count = 585;
    test_vectors[584].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[584].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[584].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[584].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[584].size = 8'hE2;
    test_vectors[584].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB1B48FFBB74A41F99CE87DAFE57E0DB88;

    // Test vector 585
    test_vectors[585].count = 586;
    test_vectors[585].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[585].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[585].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[585].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[585].size = 8'hE2;
    test_vectors[585].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C085354649926785402AE77E74A99BA3E2125468EA8F262;

    // Test vector 586
    test_vectors[586].count = 587;
    test_vectors[586].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[586].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[586].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[586].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[586].size = 8'hE2;
    test_vectors[586].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BA08BC69E194F0FB8513BEF8B1D0D004C4;

    // Test vector 587
    test_vectors[587].count = 588;
    test_vectors[587].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[587].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[587].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[587].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[587].size = 8'hE2;
    test_vectors[587].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFB03C8334660527E9228F1D8F5B758F9D;

    // Test vector 588
    test_vectors[588].count = 589;
    test_vectors[588].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[588].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[588].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[588].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[588].size = 8'hE2;
    test_vectors[588].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788D09DED3F82648CE6599BDD99C9B2909FC;

    // Test vector 589
    test_vectors[589].count = 590;
    test_vectors[589].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[589].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[589].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[589].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[589].size = 8'hE2;
    test_vectors[589].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941A6281CEE7B75E50AE883FCF3699CDE50;

    // Test vector 590
    test_vectors[590].count = 591;
    test_vectors[590].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[590].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[590].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[590].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[590].size = 8'hE2;
    test_vectors[590].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEC8FED67CE13064BEE9657CAEDDB174F2;

    // Test vector 591
    test_vectors[591].count = 592;
    test_vectors[591].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[591].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[591].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[591].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[591].size = 8'hE3;
    test_vectors[591].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3B27EEE5034AA234C48A9FA6A9324949DC;

    // Test vector 592
    test_vectors[592].count = 593;
    test_vectors[592].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[592].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[592].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[592].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[592].size = 8'hE6;
    test_vectors[592].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9AB18B5D4822A6C2706E1EC865755F582;

    // Test vector 593
    test_vectors[593].count = 594;
    test_vectors[593].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[593].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[593].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[593].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[593].size = 8'hE6;
    test_vectors[593].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC2327818502E0B800003346FCBC1F9171662F46D;

    // Test vector 594
    test_vectors[594].count = 595;
    test_vectors[594].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[594].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[594].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[594].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[594].size = 8'hE6;
    test_vectors[594].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86FB1C0FBAA2A1D5E0092F0DCBC6DB0192;

    // Test vector 595
    test_vectors[595].count = 596;
    test_vectors[595].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[595].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[595].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[595].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[595].size = 8'hE6;
    test_vectors[595].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A7406B83088B22937BD390F9B03778B433241;

    // Test vector 596
    test_vectors[596].count = 597;
    test_vectors[596].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[596].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[596].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[596].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[596].size = 8'hE6;
    test_vectors[596].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA74ED4940CFD99E0EF8C32B81EA4003F6D;

    // Test vector 597
    test_vectors[597].count = 598;
    test_vectors[597].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[597].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[597].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[597].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[597].size = 8'hE6;
    test_vectors[597].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EEFB5D76C1C6E1FABCFFFE91E7EAB349B;

    // Test vector 598
    test_vectors[598].count = 599;
    test_vectors[598].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[598].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[598].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[598].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[598].size = 8'hE6;
    test_vectors[598].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512F39F64EAAB8B1B4130DCFC3EDBB19D5FE;

    // Test vector 599
    test_vectors[599].count = 600;
    test_vectors[599].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[599].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[599].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[599].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[599].size = 8'hE7;
    test_vectors[599].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A59DA01069D5A883D88871D0F361E625FE;

    // Test vector 600
    test_vectors[600].count = 601;
    test_vectors[600].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[600].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[600].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[600].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[600].size = 8'hEE;
    test_vectors[600].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38752A8817E18CD8B00F3B4C8707A9E595;

    // Test vector 601
    test_vectors[601].count = 602;
    test_vectors[601].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[601].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[601].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[601].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[601].size = 8'hEE;
    test_vectors[601].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8360C8E6F69B261E065B4A91BDE5461814;

    // Test vector 602
    test_vectors[602].count = 603;
    test_vectors[602].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[602].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[602].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[602].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[602].size = 8'hEE;
    test_vectors[602].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A4571FE052CB4B91205482143B9D1A9F9F7;

    // Test vector 603
    test_vectors[603].count = 604;
    test_vectors[603].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[603].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[603].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[603].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[603].size = 8'hEE;
    test_vectors[603].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FE0B31C962697BA8DFB9C9E183BD9A07D;

    // Test vector 604
    test_vectors[604].count = 605;
    test_vectors[604].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[604].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[604].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[604].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[604].size = 8'hEE;
    test_vectors[604].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFE2BB613424C6957CB323CF414B7DDBD9;

    // Test vector 605
    test_vectors[605].count = 606;
    test_vectors[605].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[605].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[605].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[605].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[605].size = 8'hEE;
    test_vectors[605].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FCD9CDF7620357AADABB2A40B1FE4F772;

    // Test vector 606
    test_vectors[606].count = 607;
    test_vectors[606].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[606].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[606].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[606].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[606].size = 8'hEE;
    test_vectors[606].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD76939715008974D930FE0FFFBF0A2540A8F613DC;

    // Test vector 607
    test_vectors[607].count = 608;
    test_vectors[607].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[607].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[607].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[607].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[607].size = 8'hEF;
    test_vectors[607].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80C30EA1E46C56B661E4BA404E4C1BE302;

    // Test vector 608
    test_vectors[608].count = 609;
    test_vectors[608].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[608].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[608].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[608].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[608].size = 8'hE0;
    test_vectors[608].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3168438904EFFEE8A81DD4280028D5045C2B2;

    // Test vector 609
    test_vectors[609].count = 610;
    test_vectors[609].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[609].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[609].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[609].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[609].size = 8'hE0;
    test_vectors[609].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA11600FE1FC4B67C525A83358A8FE874F;

    // Test vector 610
    test_vectors[610].count = 611;
    test_vectors[610].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[610].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[610].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[610].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[610].size = 8'hE0;
    test_vectors[610].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB52B548C2DFE130F63A3BD36842BD1BB2B;

    // Test vector 611
    test_vectors[611].count = 612;
    test_vectors[611].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[611].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[611].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[611].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[611].size = 8'hE0;
    test_vectors[611].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F55979110981588B924D4883166A09100697;

    // Test vector 612
    test_vectors[612].count = 613;
    test_vectors[612].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[612].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[612].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[612].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[612].size = 8'hE0;
    test_vectors[612].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B6192A31BACD7DEBC33B8B717DA68439D0;

    // Test vector 613
    test_vectors[613].count = 614;
    test_vectors[613].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[613].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[613].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[613].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[613].size = 8'hE0;
    test_vectors[613].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0759F899EB90CB122B8878681368FDDEB;

    // Test vector 614
    test_vectors[614].count = 615;
    test_vectors[614].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[614].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[614].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[614].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[614].size = 8'hE0;
    test_vectors[614].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA69208212078EDA68F60F5EBB346F2AC5;

    // Test vector 615
    test_vectors[615].count = 616;
    test_vectors[615].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[615].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[615].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[615].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[615].size = 8'hE1;
    test_vectors[615].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE24713E5D3345FE237F7B7C398E0E2ACD;

    // Test vector 616
    test_vectors[616].count = 617;
    test_vectors[616].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[616].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[616].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[616].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[616].size = 8'hE2;
    test_vectors[616].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB94701E8C3385DA9A0CBE685B0D5DC72B41;

    // Test vector 617
    test_vectors[617].count = 618;
    test_vectors[617].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[617].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[617].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[617].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[617].size = 8'hE2;
    test_vectors[617].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C085354649926781242BFE225E31D711CF97D3EC70FAFBEAD;

    // Test vector 618
    test_vectors[618].count = 619;
    test_vectors[618].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[618].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[618].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[618].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[618].size = 8'hE2;
    test_vectors[618].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4EE649160CEFE1874C2989A233C92492E;

    // Test vector 619
    test_vectors[619].count = 620;
    test_vectors[619].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[619].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[619].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[619].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[619].size = 8'hE2;
    test_vectors[619].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAE7EB8D1BF143FD71CE625AE7A284E5995;

    // Test vector 620
    test_vectors[620].count = 621;
    test_vectors[620].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[620].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[620].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[620].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[620].size = 8'hE2;
    test_vectors[620].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDF6AF77667FF920C8ED1E7F10811F643E;

    // Test vector 621
    test_vectors[621].count = 622;
    test_vectors[621].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[621].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[621].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[621].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[621].size = 8'hE2;
    test_vectors[621].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DB22379D7C3B92D6B250079744357E1225;

    // Test vector 622
    test_vectors[622].count = 623;
    test_vectors[622].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[622].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[622].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[622].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[622].size = 8'hE2;
    test_vectors[622].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF955EAD78DACC62516560489E0043C8E08;

    // Test vector 623
    test_vectors[623].count = 624;
    test_vectors[623].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[623].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[623].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[623].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[623].size = 8'hE3;
    test_vectors[623].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCA502F6B082E1E7D1E0A77B62C838C5E32;

    // Test vector 624
    test_vectors[624].count = 625;
    test_vectors[624].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[624].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[624].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[624].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[624].size = 8'hE6;
    test_vectors[624].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B0EF4A6410F51E2D72E2B9D77A19AC6233;

    // Test vector 625
    test_vectors[625].count = 626;
    test_vectors[625].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[625].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[625].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[625].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[625].size = 8'hE6;
    test_vectors[625].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC2327818688E470625F7414C3E058427FEEA54847B;

    // Test vector 626
    test_vectors[626].count = 627;
    test_vectors[626].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[626].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[626].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[626].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[626].size = 8'hE6;
    test_vectors[626].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D8614F1F04AEE756A9E2183944CD5C3084519;

    // Test vector 627
    test_vectors[627].count = 628;
    test_vectors[627].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[627].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[627].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[627].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[627].size = 8'hE6;
    test_vectors[627].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E943FD5FCC8A1673A4069AB3E5200F36C;

    // Test vector 628
    test_vectors[628].count = 629;
    test_vectors[628].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[628].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[628].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[628].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[628].size = 8'hE6;
    test_vectors[628].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D05F591D19A4A46186FDA5D044C70791BF;

    // Test vector 629
    test_vectors[629].count = 630;
    test_vectors[629].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[629].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[629].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[629].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[629].size = 8'hE6;
    test_vectors[629].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC158C70F6AEE45807467452EFF51D561CA;

    // Test vector 630
    test_vectors[630].count = 631;
    test_vectors[630].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[630].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[630].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[630].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[630].size = 8'hE6;
    test_vectors[630].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDFD76633EF10BBC588A95DE7D6F194B87;

    // Test vector 631
    test_vectors[631].count = 632;
    test_vectors[631].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[631].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[631].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[631].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[631].size = 8'hE7;
    test_vectors[631].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A5290D10DEF7A51895A309B9DE1BDF814C66;

    // Test vector 632
    test_vectors[632].count = 633;
    test_vectors[632].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[632].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[632].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[632].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[632].size = 8'hEE;
    test_vectors[632].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38327B73D85933E18AD255A79F642EDD2268;

    // Test vector 633
    test_vectors[633].count = 634;
    test_vectors[633].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[633].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[633].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[633].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[633].size = 8'hEE;
    test_vectors[633].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389AF963147AC6230D107C0D3BA4DB87FA6;

    // Test vector 634
    test_vectors[634].count = 635;
    test_vectors[634].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[634].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[634].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[634].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[634].size = 8'hEE;
    test_vectors[634].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EAF0C08C8A370DAF74FC236249CF15C4A;

    // Test vector 635
    test_vectors[635].count = 636;
    test_vectors[635].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[635].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[635].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[635].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[635].size = 8'hEE;
    test_vectors[635].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC113B7280CFD4E4EA0A8CB15DDDD5A5E30;

    // Test vector 636
    test_vectors[636].count = 637;
    test_vectors[636].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[636].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[636].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[636].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[636].size = 8'hEE;
    test_vectors[636].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4CF050174892D8B613D9563E5D1C76805;

    // Test vector 637
    test_vectors[637].count = 638;
    test_vectors[637].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[637].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[637].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[637].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[637].size = 8'hEE;
    test_vectors[637].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0A22C81F3701BE25FD4016A0D24CBA9;

    // Test vector 638
    test_vectors[638].count = 639;
    test_vectors[638].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[638].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[638].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[638].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[638].size = 8'hEE;
    test_vectors[638].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD7693971527CB2B6DC91F51D00A5AC6B3A8BB631FE0;

    // Test vector 639
    test_vectors[639].count = 640;
    test_vectors[639].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[639].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[639].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[639].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[639].size = 8'hEF;
    test_vectors[639].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F619203CFC1B7384858570D4B57A97E877;

    // Test vector 640
    test_vectors[640].count = 641;
    test_vectors[640].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[640].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[640].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[640].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[640].size = 8'hE0;
    test_vectors[640].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F31684054605D94E663BE27AEA2C030886550E0E;

    // Test vector 641
    test_vectors[641].count = 642;
    test_vectors[641].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[641].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[641].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[641].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[641].size = 8'hE0;
    test_vectors[641].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA2C15E666F85A27AA63D86C6974EA8CE0EE;

    // Test vector 642
    test_vectors[642].count = 643;
    test_vectors[642].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[642].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[642].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[642].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[642].size = 8'hE0;
    test_vectors[642].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB512A579365FB453AA7BCDD15EC873AB484D;

    // Test vector 643
    test_vectors[643].count = 644;
    test_vectors[643].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[643].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[643].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[643].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[643].size = 8'hE0;
    test_vectors[643].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F5591362333CA9601BA62E1B7A61A653D8B862;

    // Test vector 644
    test_vectors[644].count = 645;
    test_vectors[644].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[644].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[644].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[644].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[644].size = 8'hE0;
    test_vectors[644].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B652AE6795F80AEEFC00BCC0CB80DA738FD9;

    // Test vector 645
    test_vectors[645].count = 646;
    test_vectors[645].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[645].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[645].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[645].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[645].size = 8'hE0;
    test_vectors[645].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0DD4DB1ABFDD80B5CCF5E6B56C0B65352F8;

    // Test vector 646
    test_vectors[646].count = 647;
    test_vectors[646].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[646].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[646].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[646].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[646].size = 8'hE0;
    test_vectors[646].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA696697F7B239B4BD120DA8ACC8EDB649DD;

    // Test vector 647
    test_vectors[647].count = 648;
    test_vectors[647].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[647].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[647].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[647].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[647].size = 8'hE1;
    test_vectors[647].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE930B04BAB5FA5C17BDA278150C2473045B;

    // Test vector 648
    test_vectors[648].count = 649;
    test_vectors[648].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[648].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[648].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[648].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[648].size = 8'hE2;
    test_vectors[648].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB94699F4604040A14EECEAD11A0802EB6036C;

    // Test vector 649
    test_vectors[649].count = 650;
    test_vectors[649].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[649].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[649].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[649].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[649].size = 8'hE2;
    test_vectors[649].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C0853546499267812659AB06AD01BB584C229E27B9068DD7A15;

    // Test vector 650
    test_vectors[650].count = 651;
    test_vectors[650].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[650].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[650].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[650].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[650].size = 8'hE2;
    test_vectors[650].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4C0C66B06B0CB534AFFD8F6F95E09978B4C;

    // Test vector 651
    test_vectors[651].count = 652;
    test_vectors[651].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[651].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[651].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[651].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[651].size = 8'hE2;
    test_vectors[651].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAEFA298694D03E78359618DF46E7E8BA96B4;

    // Test vector 652
    test_vectors[652].count = 653;
    test_vectors[652].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[652].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[652].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[652].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[652].size = 8'hE2;
    test_vectors[652].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDA843A0914F5F5BC257F9F1BCEC90AAFE29;

    // Test vector 653
    test_vectors[653].count = 654;
    test_vectors[653].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[653].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[653].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[653].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[653].size = 8'hE2;
    test_vectors[653].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DBDFE683A3BEF3C358B57237DFDE9ECF58B2;

    // Test vector 654
    test_vectors[654].count = 655;
    test_vectors[654].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[654].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[654].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[654].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[654].size = 8'hE2;
    test_vectors[654].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF994E727FA1680789DD23FA59F55F6075DD2;

    // Test vector 655
    test_vectors[655].count = 656;
    test_vectors[655].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[655].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[655].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[655].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[655].size = 8'hE3;
    test_vectors[655].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCADAA59D12FFDA3CA2F82AFF8E6EEE80ACCE;

    // Test vector 656
    test_vectors[656].count = 657;
    test_vectors[656].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[656].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[656].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[656].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[656].size = 8'hE6;
    test_vectors[656].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B02B3791A6606947A34DD4A89FB1E879B1E9;

    // Test vector 657
    test_vectors[657].count = 658;
    test_vectors[657].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[657].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[657].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[657].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[657].size = 8'hE6;
    test_vectors[657].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23278186814F6667420E304D7D8749B811AAB889D48;

    // Test vector 658
    test_vectors[658].count = 659;
    test_vectors[658].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[658].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[658].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[658].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[658].size = 8'hE6;
    test_vectors[658].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86144D72109DB8AE6D63531F9A0824BDAEC0F3;

    // Test vector 659
    test_vectors[659].count = 660;
    test_vectors[659].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[659].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[659].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[659].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[659].size = 8'hE6;
    test_vectors[659].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E72B6593C27843538B80EF1B4C88FECAAB1;

    // Test vector 660
    test_vectors[660].count = 661;
    test_vectors[660].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[660].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[660].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[660].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[660].size = 8'hE6;
    test_vectors[660].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D09B27AF7CD6FF918A470A84ABB9EE6683BB;

    // Test vector 661
    test_vectors[661].count = 662;
    test_vectors[661].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[661].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[661].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[661].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[661].size = 8'hE6;
    test_vectors[661].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC193DDB85D865DDAA6BD4599790BE248BB6C;

    // Test vector 662
    test_vectors[662].count = 663;
    test_vectors[662].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[662].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[662].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[662].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[662].size = 8'hE6;
    test_vectors[662].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDD51C6B64CB04575D994C0E668493035B02;

    // Test vector 663
    test_vectors[663].count = 664;
    test_vectors[663].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[663].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[663].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[663].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[663].size = 8'hE7;
    test_vectors[663].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A52938E0E493B057A4703C603EDCB062410194;

    // Test vector 664
    test_vectors[664].count = 665;
    test_vectors[664].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[664].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[664].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[664].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[664].size = 8'hEE;
    test_vectors[664].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38321ABCA7CEFF538275BE6E93888DE7C11165;

    // Test vector 665
    test_vectors[665].count = 666;
    test_vectors[665].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[665].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[665].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[665].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[665].size = 8'hEE;
    test_vectors[665].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389B5443B8BB820DCD8B2A8DB6AEE8A4692B7;

    // Test vector 666
    test_vectors[666].count = 667;
    test_vectors[666].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[666].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[666].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[666].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[666].size = 8'hEE;
    test_vectors[666].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EA4073AF8B7F533C6746F4FBE1881B3ACDE;

    // Test vector 667
    test_vectors[667].count = 668;
    test_vectors[667].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[667].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[667].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[667].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[667].size = 8'hEE;
    test_vectors[667].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC158D43C088F4D22B806BEADE5E2BAAC8D7A;

    // Test vector 668
    test_vectors[668].count = 669;
    test_vectors[668].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[668].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[668].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[668].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[668].size = 8'hEE;
    test_vectors[668].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4FF4C47781595E863D8576315EE78F2E5F9;

    // Test vector 669
    test_vectors[669].count = 670;
    test_vectors[669].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[669].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[669].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[669].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[669].size = 8'hEE;
    test_vectors[669].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0BD1CB4418ADC11BACD6DCFDDDAE9AAC1;

    // Test vector 670
    test_vectors[670].count = 671;
    test_vectors[670].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[670].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[670].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[670].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[670].size = 8'hEE;
    test_vectors[670].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD7693971527404FAC3209CD0E96FE2367C2210A3913FC;

    // Test vector 671
    test_vectors[671].count = 672;
    test_vectors[671].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[671].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[671].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[671].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[671].size = 8'hEF;
    test_vectors[671].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F629518A50F7715F1C3A57371E7EC73CCA38;

    // Test vector 672
    test_vectors[672].count = 673;
    test_vectors[672].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[672].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[672].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[672].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[672].size = 8'hE0;
    test_vectors[672].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3168405AA8A6E64D0167E1EB3455922F821DBD4F1;

    // Test vector 673
    test_vectors[673].count = 674;
    test_vectors[673].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[673].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[673].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[673].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[673].size = 8'hE0;
    test_vectors[673].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA2CFB0F6DD1E153F0799196111F3893798EAD;

    // Test vector 674
    test_vectors[674].count = 675;
    test_vectors[674].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[674].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[674].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[674].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[674].size = 8'hE0;
    test_vectors[674].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB512C9EE50921613238B880B1E91F6BCD1740E;

    // Test vector 675
    test_vectors[675].count = 676;
    test_vectors[675].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[675].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[675].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[675].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[675].size = 8'hE0;
    test_vectors[675].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F55913AFC06D271867B76F695528E2AA3748A7CC;

    // Test vector 676
    test_vectors[676].count = 677;
    test_vectors[676].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[676].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[676].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[676].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[676].size = 8'hE0;
    test_vectors[676].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B65270C2EAFE97CBEC716D1C333091091B12C2;

    // Test vector 677
    test_vectors[677].count = 678;
    test_vectors[677].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[677].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[677].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[677].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[677].size = 8'hE0;
    test_vectors[677].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0DDBD779E815FBC29BA04BC9708DF2ECAD90A;

    // Test vector 678
    test_vectors[678].count = 679;
    test_vectors[678].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[678].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[678].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[678].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[678].size = 8'hE0;
    test_vectors[678].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA6971D04F4DCA79A1FA5A84BE8E5D3FA0BF1B;

    // Test vector 679
    test_vectors[679].count = 680;
    test_vectors[679].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[679].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[679].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[679].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[679].size = 8'hE1;
    test_vectors[679].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE930DB711B9663AC3F923658838FCD6695ED9;

    // Test vector 680
    test_vectors[680].count = 681;
    test_vectors[680].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[680].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[680].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[680].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[680].size = 8'hE2;
    test_vectors[680].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB9469E8D7FA749181CBF288F1DC5FBC546C050B;

    // Test vector 681
    test_vectors[681].count = 682;
    test_vectors[681].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[681].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[681].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[681].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[681].size = 8'hE2;
    test_vectors[681].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464992678126568BF5D40BC7274BEBA21720D913C7C494A;

    // Test vector 682
    test_vectors[682].count = 683;
    test_vectors[682].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[682].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[682].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[682].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[682].size = 8'hE2;
    test_vectors[682].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4C0283880603581381E3507F8EE957E364EBF;

    // Test vector 683
    test_vectors[683].count = 684;
    test_vectors[683].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[683].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[683].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[683].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[683].size = 8'hE2;
    test_vectors[683].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAEFAB14850D4B3972E57AE7169417A66226AA6;

    // Test vector 684
    test_vectors[684].count = 685;
    test_vectors[684].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[684].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[684].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[684].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[684].size = 8'hE2;
    test_vectors[684].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDA87E85AE494565E0B1DAD945C690ABF2D516;

    // Test vector 685
    test_vectors[685].count = 686;
    test_vectors[685].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[685].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[685].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[685].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[685].size = 8'hE2;
    test_vectors[685].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DBDFCCD094E604A2E3E29ACFC507C326DFD1E2;

    // Test vector 686
    test_vectors[686].count = 687;
    test_vectors[686].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[686].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[686].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[686].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[686].size = 8'hE2;
    test_vectors[686].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF994C1F75D862824D1D9A8FBAC799F3E384B45;

    // Test vector 687
    test_vectors[687].count = 688;
    test_vectors[687].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[687].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[687].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[687].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[687].size = 8'hE3;
    test_vectors[687].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCADA49A2A2DC43A8009EBC97278F5FF947543B;

    // Test vector 688
    test_vectors[688].count = 689;
    test_vectors[688].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[688].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[688].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[688].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[688].size = 8'hE6;
    test_vectors[688].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B02BAB1312EA919C3E24D223E58A31E85BA844;

    // Test vector 689
    test_vectors[689].count = 690;
    test_vectors[689].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[689].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[689].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[689].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[689].size = 8'hE6;
    test_vectors[689].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23278186814B0729C1552F236E06AFF42A9542020C928;

    // Test vector 690
    test_vectors[690].count = 691;
    test_vectors[690].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[690].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[690].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[690].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[690].size = 8'hE6;
    test_vectors[690].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86144DB4EE0EF086CE09655A53C554BA5AE20EE4;

    // Test vector 691
    test_vectors[691].count = 692;
    test_vectors[691].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[691].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[691].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[691].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[691].size = 8'hE6;
    test_vectors[691].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E72A03726B9C17F3DDE1ADBC4382E3608DCC4;

    // Test vector 692
    test_vectors[692].count = 693;
    test_vectors[692].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[692].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[692].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[692].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[692].size = 8'hE6;
    test_vectors[692].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D09B25683C6B8503B4CE1C89AC8EF55FE97ECA;

    // Test vector 693
    test_vectors[693].count = 694;
    test_vectors[693].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[693].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[693].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[693].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[693].size = 8'hE6;
    test_vectors[693].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC1932724E7CEE17BCA627040D71E42A6145203;

    // Test vector 694
    test_vectors[694].count = 695;
    test_vectors[694].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[694].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[694].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[694].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[694].size = 8'hE6;
    test_vectors[694].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDD509AE14678DBD1184EFA36B3BC603558535;

    // Test vector 695
    test_vectors[695].count = 696;
    test_vectors[695].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[695].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[695].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[695].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[695].size = 8'hE7;
    test_vectors[695].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A52938559D75B37977C7CD42498A9B7CB22030D6;

    // Test vector 696
    test_vectors[696].count = 697;
    test_vectors[696].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[696].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[696].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[696].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[696].size = 8'hEE;
    test_vectors[696].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38321A65831C2E0653487120FE5669659065B4CF;

    // Test vector 697
    test_vectors[697].count = 698;
    test_vectors[697].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[697].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[697].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[697].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[697].size = 8'hEE;
    test_vectors[697].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389B53ED3DDFE3A407E2A617FD8A2464BA2937E;

    // Test vector 698
    test_vectors[698].count = 699;
    test_vectors[698].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[698].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[698].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[698].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[698].size = 8'hEE;
    test_vectors[698].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EA4799CA81CE219CF391146AC5012F21A7E59;

    // Test vector 699
    test_vectors[699].count = 700;
    test_vectors[699].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[699].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[699].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[699].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[699].size = 8'hEE;
    test_vectors[699].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC158FA09BC45149C8777377A08DC09748D5806;

    // Test vector 700
    test_vectors[700].count = 701;
    test_vectors[700].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[700].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[700].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[700].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[700].size = 8'hEE;
    test_vectors[700].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4FF311939F9983E123A5080E8B243D5A8AD9E;

    // Test vector 701
    test_vectors[701].count = 702;
    test_vectors[701].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[701].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[701].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[701].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[701].size = 8'hEE;
    test_vectors[701].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0842CC0B017D06E08A037C4E360080D1ED6;

    // Test vector 702
    test_vectors[702].count = 703;
    test_vectors[702].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[702].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[702].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[702].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[702].size = 8'hEE;
    test_vectors[702].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD769397152740DB25CDA530D53EF24A0E2C0D15DB8C61B0;

    // Test vector 703
    test_vectors[703].count = 704;
    test_vectors[703].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[703].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[703].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[703].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[703].size = 8'hEF;
    test_vectors[703].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F629820FBDDAE6FFD558B97CF6A412757F3899;

    // Test vector 704
    test_vectors[704].count = 705;
    test_vectors[704].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[704].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[704].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[704].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[704].size = 8'hE0;
    test_vectors[704].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3168405AA18CD7A59944EDE64997B76E25F34B08FD5;

    // Test vector 705
    test_vectors[705].count = 706;
    test_vectors[705].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[705].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[705].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[705].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[705].size = 8'hE0;
    test_vectors[705].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA2CFB404E70BC3EC1242D5A56316432ED8C94D9;

    // Test vector 706
    test_vectors[706].count = 707;
    test_vectors[706].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[706].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[706].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[706].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[706].size = 8'hE0;
    test_vectors[706].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB512C99BC196C19F38B432509D7BC00A33C41FDF;

    // Test vector 707
    test_vectors[707].count = 708;
    test_vectors[707].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[707].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[707].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[707].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[707].size = 8'hE0;
    test_vectors[707].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F55913AF43B15E800665AE2CCD20B3BD6C25E13A20;

    // Test vector 708
    test_vectors[708].count = 709;
    test_vectors[708].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[708].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[708].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[708].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[708].size = 8'hE0;
    test_vectors[708].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B6527073D4F7EE1A6D2FF9FFFDE4AFF788B6DDCF;

    // Test vector 709
    test_vectors[709].count = 710;
    test_vectors[709].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[709].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[709].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[709].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[709].size = 8'hE0;
    test_vectors[709].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0DDBDEDE7E45219DE291446096E8C5B0D28EF99;

    // Test vector 710
    test_vectors[710].count = 711;
    test_vectors[710].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[710].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[710].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[710].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[710].size = 8'hE0;
    test_vectors[710].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA6971F6C820C4B05B4C66320A68EA82B9115227;

    // Test vector 711
    test_vectors[711].count = 712;
    test_vectors[711].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[711].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[711].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[711].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[711].size = 8'hE1;
    test_vectors[711].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE930D62B4911E24E774D4006F37616B47321815;

    // Test vector 712
    test_vectors[712].count = 713;
    test_vectors[712].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[712].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[712].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[712].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[712].size = 8'hE2;
    test_vectors[712].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB9469E8416314554C0802A0EE62172EE0BD251BCD;

    // Test vector 713
    test_vectors[713].count = 714;
    test_vectors[713].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[713].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[713].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[713].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[713].size = 8'hE2;
    test_vectors[713].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464992678126568D77D84BCB44B8888500FB6A1C48E29971E;

    // Test vector 714
    test_vectors[714].count = 715;
    test_vectors[714].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[714].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[714].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[714].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[714].size = 8'hE2;
    test_vectors[714].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4C02880D59669DC8C4BB3FB2CCCE7BAD058E476;

    // Test vector 715
    test_vectors[715].count = 716;
    test_vectors[715].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[715].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[715].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[715].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[715].size = 8'hE2;
    test_vectors[715].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAEFAB1CCE702159FAA92565E2ECB786CDCD6721D;

    // Test vector 716
    test_vectors[716].count = 717;
    test_vectors[716].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[716].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[716].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[716].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[716].size = 8'hE2;
    test_vectors[716].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDA87EB5D49D6807D869308750C263E9BF840691;

    // Test vector 717
    test_vectors[717].count = 718;
    test_vectors[717].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[717].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[717].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[717].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[717].size = 8'hE2;
    test_vectors[717].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DBDFCCCD1ABDA25C05373AFE0FD264D18023A854;

    // Test vector 718
    test_vectors[718].count = 719;
    test_vectors[718].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[718].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[718].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[718].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[718].size = 8'hE2;
    test_vectors[718].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF994C1003A58FD23160B228CD130D8B007DDCF4E;

    // Test vector 719
    test_vectors[719].count = 720;
    test_vectors[719].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[719].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[719].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[719].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[719].size = 8'hE3;
    test_vectors[719].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCADA49FECA7E9B92DB8558487DCADA798C8F3AF0;

    // Test vector 720
    test_vectors[720].count = 721;
    test_vectors[720].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[720].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[720].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[720].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[720].size = 8'hE6;
    test_vectors[720].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B02BABAC785C80238868408CC113324346083A0D;

    // Test vector 721
    test_vectors[721].count = 722;
    test_vectors[721].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[721].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[721].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[721].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[721].size = 8'hE6;
    test_vectors[721].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23278186814B04B09BB1BC5D572984D1D6C43C8AD4BB31E;

    // Test vector 722
    test_vectors[722].count = 723;
    test_vectors[722].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[722].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[722].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[722].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[722].size = 8'hE6;
    test_vectors[722].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86144DB4C9A5C3E7C5B1858149CD58A344319E374A;

    // Test vector 723
    test_vectors[723].count = 724;
    test_vectors[723].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[723].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[723].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[723].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[723].size = 8'hE6;
    test_vectors[723].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E72A05CBCB629A6C11BD8660D5C00657B70CDC9;

    // Test vector 724
    test_vectors[724].count = 725;
    test_vectors[724].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[724].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[724].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[724].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[724].size = 8'hE6;
    test_vectors[724].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D09B25024ABA0324C7A7DF4A2E78EF91228E0D04;

    // Test vector 725
    test_vectors[725].count = 726;
    test_vectors[725].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[725].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[725].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[725].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[725].size = 8'hE6;
    test_vectors[725].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC193273907C0CFFD7A0E8C438CD39154D886201F;

    // Test vector 726
    test_vectors[726].count = 727;
    test_vectors[726].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[726].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[726].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[726].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[726].size = 8'hE6;
    test_vectors[726].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDD5090DB8C957CFE343288977F1395623A65FBF;

    // Test vector 727
    test_vectors[727].count = 728;
    test_vectors[727].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[727].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[727].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[727].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[727].size = 8'hE7;
    test_vectors[727].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A529385561A2E8EF865445E3C6D7F1162F4B5416C7;

    // Test vector 728
    test_vectors[728].count = 729;
    test_vectors[728].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[728].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[728].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[728].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[728].size = 8'hEE;
    test_vectors[728].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38321A65D6E38A3FA6DA450E597FFB94FF739431DA;

    // Test vector 729
    test_vectors[729].count = 730;
    test_vectors[729].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[729].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[729].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[729].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[729].size = 8'hEE;
    test_vectors[729].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389B53EDAFBA1637C5450D7C8CBEBF14DA010698A;

    // Test vector 730
    test_vectors[730].count = 731;
    test_vectors[730].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[730].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[730].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[730].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[730].size = 8'hEE;
    test_vectors[730].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EA479C9A358B1ABA18B385F90999ADAC8AA4713;

    // Test vector 731
    test_vectors[731].count = 732;
    test_vectors[731].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[731].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[731].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[731].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[731].size = 8'hEE;
    test_vectors[731].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC158FA4AE493DD88A876BC14051724A5482453AF;

    // Test vector 732
    test_vectors[732].count = 733;
    test_vectors[732].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[732].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[732].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[732].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[732].size = 8'hEE;
    test_vectors[732].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4FF3145BD9AF9CFECBFA19FB59BFBCB9DE33A7A;

    // Test vector 733
    test_vectors[733].count = 734;
    test_vectors[733].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[733].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[733].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[733].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[733].size = 8'hEE;
    test_vectors[733].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0840D92B0F60074DD158C6B2D3917308F5529;

    // Test vector 734
    test_vectors[734].count = 735;
    test_vectors[734].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[734].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[734].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[734].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[734].size = 8'hEE;
    test_vectors[734].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD769397152740DB6311492A10A8AC4DC413E2D991564F3E45;

    // Test vector 735
    test_vectors[735].count = 736;
    test_vectors[735].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[735].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[735].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[735].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[735].size = 8'hEF;
    test_vectors[735].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F62982D93A64AD9165078EADCCE9CA36B90F6570;

    // Test vector 736
    test_vectors[736].count = 737;
    test_vectors[736].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[736].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[736].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[736].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[736].size = 8'hE0;
    test_vectors[736].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3168405AA182C271F8854E50A23BA95BF640B883A455F;

    // Test vector 737
    test_vectors[737].count = 738;
    test_vectors[737].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[737].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[737].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[737].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[737].size = 8'hE0;
    test_vectors[737].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA2CFB401AB8F8099532E82729053840B827ABB599;

    // Test vector 738
    test_vectors[738].count = 739;
    test_vectors[738].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[738].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[738].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[738].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[738].size = 8'hE0;
    test_vectors[738].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB512C99B59FBE56FA5E22BD1353E0A44FFF7F8DDB3;

    // Test vector 739
    test_vectors[739].count = 740;
    test_vectors[739].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[739].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[739].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[739].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[739].size = 8'hE0;
    test_vectors[739].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F55913AF437ED9242DE491DD1E519AB6AD103A26EBF0;

    // Test vector 740
    test_vectors[740].count = 741;
    test_vectors[740].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[740].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[740].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[740].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[740].size = 8'hE0;
    test_vectors[740].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B65270737231742504C607E2C4CA55B3055CC6B094;

    // Test vector 741
    test_vectors[741].count = 742;
    test_vectors[741].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[741].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[741].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[741].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[741].size = 8'hE0;
    test_vectors[741].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0DDBDED6A10C9E756E3E10F6F382C46038E794835;

    // Test vector 742
    test_vectors[742].count = 743;
    test_vectors[742].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[742].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[742].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[742].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[742].size = 8'hE0;
    test_vectors[742].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA6971F6431FFC7155C945C2CEEE3862463F88EEF6;

    // Test vector 743
    test_vectors[743].count = 744;
    test_vectors[743].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[743].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[743].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[743].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[743].size = 8'hE1;
    test_vectors[743].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE930D626B4B29F6483E6D145F904C620CB73AC9FD;

    // Test vector 744
    test_vectors[744].count = 745;
    test_vectors[744].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[744].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[744].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[744].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[744].size = 8'hE2;
    test_vectors[744].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB9469E841D1EE5AC7EF6B0047C1CB5DD9CDA033AB32;

    // Test vector 745
    test_vectors[745].count = 746;
    test_vectors[745].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[745].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[745].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[745].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[745].size = 8'hE2;
    test_vectors[745].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464992678126568D76C7FA3CC731EC5CD7EFAB252A3577BC8A4;

    // Test vector 746
    test_vectors[746].count = 747;
    test_vectors[746].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[746].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[746].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[746].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[746].size = 8'hE2;
    test_vectors[746].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4C0288071B9A22419245119563FEB95E86C28CEC8;

    // Test vector 747
    test_vectors[747].count = 748;
    test_vectors[747].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[747].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[747].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[747].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[747].size = 8'hE2;
    test_vectors[747].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAEFAB1CC2D0DCB4D12DC87AD78D797F4654320E784;

    // Test vector 748
    test_vectors[748].count = 749;
    test_vectors[748].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[748].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[748].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[748].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[748].size = 8'hE2;
    test_vectors[748].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDA87EB5ED7B298A3B6C41A07EE099A187B2CB4B56;

    // Test vector 749
    test_vectors[749].count = 750;
    test_vectors[749].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[749].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[749].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[749].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[749].size = 8'hE2;
    test_vectors[749].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DBDFCCCD7D7B94B849E0768F4F409BDEA0C1AEDB1C;

    // Test vector 750
    test_vectors[750].count = 751;
    test_vectors[750].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[750].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[750].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[750].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[750].size = 8'hE2;
    test_vectors[750].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF994C1009A7F666BFAEDECA4003E889997FC6BC6CE;

    // Test vector 751
    test_vectors[751].count = 752;
    test_vectors[751].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[751].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[751].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[751].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[751].size = 8'hE3;
    test_vectors[751].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCADA49FEFD8DAD6994AA0DF822467C8522D1A12531;

    // Test vector 752
    test_vectors[752].count = 753;
    test_vectors[752].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[752].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[752].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[752].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[752].size = 8'hE6;
    test_vectors[752].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B02BABAC6A9F28B9B7A2E7D862B428C1913E438DD3;

    // Test vector 753
    test_vectors[753].count = 754;
    test_vectors[753].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[753].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[753].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[753].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[753].size = 8'hE6;
    test_vectors[753].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23278186814B04B79A4A0287276A2B5963425168D9785B6AD;

    // Test vector 754
    test_vectors[754].count = 755;
    test_vectors[754].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[754].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[754].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[754].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[754].size = 8'hE6;
    test_vectors[754].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86144DB4C964AE4E87CEDA4CBEC6AC7CF4641EDBA006;

    // Test vector 755
    test_vectors[755].count = 756;
    test_vectors[755].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[755].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[755].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[755].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[755].size = 8'hE6;
    test_vectors[755].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E72A05C2AD59415FEA42EFE8A5F42AAE6FB4CC884;

    // Test vector 756
    test_vectors[756].count = 757;
    test_vectors[756].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[756].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[756].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[756].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[756].size = 8'hE6;
    test_vectors[756].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D09B250266493C94F5D7DB8F4C2EDFDF517DAA89E6;

    // Test vector 757
    test_vectors[757].count = 758;
    test_vectors[757].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[757].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[757].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[757].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[757].size = 8'hE6;
    test_vectors[757].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC1932739606F00D59EC13576BDDC551A9F0503AD0D;

    // Test vector 758
    test_vectors[758].count = 759;
    test_vectors[758].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[758].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[758].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[758].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[758].size = 8'hE6;
    test_vectors[758].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDD5090D81E1D4E7C11D4929FBDAF9AB026535600E;

    // Test vector 759
    test_vectors[759].count = 760;
    test_vectors[759].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[759].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[759].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[759].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[759].size = 8'hE7;
    test_vectors[759].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A529385561E366DF9EC27120A37E92DBDF11AFB64DC8;

    // Test vector 760
    test_vectors[760].count = 761;
    test_vectors[760].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[760].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[760].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[760].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[760].size = 8'hEE;
    test_vectors[760].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38321A65D693936D50BDD2EF988ECBA39DC4C3FEE515;

    // Test vector 761
    test_vectors[761].count = 762;
    test_vectors[761].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[761].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[761].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[761].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[761].size = 8'hEE;
    test_vectors[761].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389B53EDAC8CBAA794DEE9C4AA3E2D7650E603B4EEB;

    // Test vector 762
    test_vectors[762].count = 763;
    test_vectors[762].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[762].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[762].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[762].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[762].size = 8'hEE;
    test_vectors[762].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EA479C996CA3EE1B6842CDA9C375202F20D48B364;

    // Test vector 763
    test_vectors[763].count = 764;
    test_vectors[763].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[763].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[763].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[763].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[763].size = 8'hEE;
    test_vectors[763].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC158FA4A4B730A338C600ED669B88E1F6412EBDDE9;

    // Test vector 764
    test_vectors[764].count = 765;
    test_vectors[764].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[764].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[764].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[764].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[764].size = 8'hEE;
    test_vectors[764].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4FF314554D9352043A2238927927E5B99DBE33000;

    // Test vector 765
    test_vectors[765].count = 766;
    test_vectors[765].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[765].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[765].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[765].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[765].size = 8'hEE;
    test_vectors[765].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0840D4BBAF60E19A75A1C0155733452EF69B632;

    // Test vector 766
    test_vectors[766].count = 767;
    test_vectors[766].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[766].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[766].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[766].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[766].size = 8'hEE;
    test_vectors[766].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD769397152740DB63A5281E1A4010B11189590D8704DC2320AC;

    // Test vector 767
    test_vectors[767].count = 768;
    test_vectors[767].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[767].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[767].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[767].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[767].size = 8'hEF;
    test_vectors[767].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F62982D9969DF00E1A1AE660D74A9B98A1ECD7836A;

    // Test vector 768
    test_vectors[768].count = 769;
    test_vectors[768].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[768].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[768].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[768].ad = '{8'h30, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[768].size = 8'hF0;
    test_vectors[768].expected_ct = 448'h5EFAB113B0EA404775ADE744963D338C1CA3C7F40D410992F3168405AA182CA9B79C2F5C72758625CE898180D4C26DB1;

    // Test vector 769
    test_vectors[769].count = 770;
    test_vectors[769].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[769].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[769].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[769].ad = '{8'h30, 8'h31, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[769].size = 8'hF0;
    test_vectors[769].expected_ct = 448'hBF72723D152FD9E320DBAF578F1EFB6EE2E88CCB05F1375EEC44AA2CFB401A7ADD8E215197F2576306604A255DB605F7;

    // Test vector 770
    test_vectors[770].count = 771;
    test_vectors[770].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[770].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[770].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[770].ad = '{8'h30, 8'h31, 8'h32, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[770].size = 8'hF0;
    test_vectors[770].expected_ct = 448'h08AEF97669321B6F58AC264F41881686040A54D1608B9BD9DEDEB512C99B59E252F3EA6B3EA7E77FB1CD3E70C7467FD5;

    // Test vector 771
    test_vectors[771].count = 772;
    test_vectors[771].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[771].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[771].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[771].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[771].size = 8'hF0;
    test_vectors[771].expected_ct = 448'h900740A4EA051B0C002C55686406EECBC80CFE91CB6693FFE4F55913AF437EB77FD4DD1F65E771F1B1D56799774A52B7;

    // Test vector 772
    test_vectors[772].count = 773;
    test_vectors[772].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[772].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[772].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[772].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h80, 8'h00, 8'h00};
    test_vectors[772].size = 8'hF0;
    test_vectors[772].expected_ct = 448'h9F9D9AA1EF72D88E771E18DB98B7BE9DDC921CA0C4B1E43A9693B65270737266D1FE62F4D86C712272219CB25FFC63CF;

    // Test vector 773
    test_vectors[773].count = 774;
    test_vectors[773].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[773].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[773].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[773].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h80, 8'h00};
    test_vectors[773].size = 8'hF0;
    test_vectors[773].expected_ct = 448'h0C6C19B0FF039E9FD1534F90276643D6241CF0668A1A470BB605D0DDBDED6AAAD8996078540F32D0C890D5B1A040DC99;

    // Test vector 774
    test_vectors[774].count = 775;
    test_vectors[774].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[774].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[774].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[774].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h80};
    test_vectors[774].size = 8'hF0;
    test_vectors[774].expected_ct = 448'h46F20A6BB802E571BF2A65BE0431F9DF73C082ADA4A282313453FA6971F64372353833A805D111B9CE10D752A13FF1C1;

    // Test vector 775
    test_vectors[775].count = 776;
    test_vectors[775].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[775].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[775].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[775].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[775].size = 8'hF1;
    test_vectors[775].expected_ct = 448'hF338928A2BB8DA348E39F22DB602E797E3ECDF2FE9F0559DE8F1EE930D626BBC73BC6C9EE2C62540F3762205F544B47F;

    // Test vector 776
    test_vectors[776].count = 777;
    test_vectors[776].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[776].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[776].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[776].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[776].size = 8'hF2;
    test_vectors[776].expected_ct = 448'hB38613AA4F88677DD583CECDA38CDAA2D82010AA63D9CB9CE4AB9469E841D1B9F4743F16882CB06798F892581B544DFD;

    // Test vector 777
    test_vectors[777].count = 778;
    test_vectors[777].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[777].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[777].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[777].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[777].size = 8'hF2;
    test_vectors[777].expected_ct = 448'h41686728116E749BFEE5AC021874C5BF82A00C08535464992678126568D76C593925A0B23BD530B34F6ABB38FED5CBF1;

    // Test vector 778
    test_vectors[778].count = 779;
    test_vectors[778].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[778].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[778].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[778].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[778].size = 8'hF2;
    test_vectors[778].expected_ct = 448'h9A3CE30D7741D446557C2E080FC2200BEB6BB6529090746472BAF4C02880715BFDE5DC75F1EC65BE518EEED9546E0B41;

    // Test vector 779
    test_vectors[779].count = 780;
    test_vectors[779].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[779].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[779].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[779].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[779].size = 8'hF2;
    test_vectors[779].expected_ct = 448'h8E1B97083F429364FB7AE590D2EAD6BF7FB1FA59EE0DC37831FFAEFAB1CC2DB0D52D9D83F518CF6928B8A8143BB5FE46;

    // Test vector 780
    test_vectors[780].count = 781;
    test_vectors[780].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[780].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[780].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[780].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h80, 8'h00, 8'h00};
    test_vectors[780].size = 8'hF2;
    test_vectors[780].expected_ct = 448'h2635F718A34B62D83FAB15B1A9928DD7AF1F80693484B36F788DDDA87EB5EDF04B9DD3CEE7AE6C001FF113078A824EF2;

    // Test vector 781
    test_vectors[781].count = 782;
    test_vectors[781].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[781].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[781].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[781].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h80, 8'h00};
    test_vectors[781].size = 8'hF2;
    test_vectors[781].expected_ct = 448'hAAE06C75966BB029C70F80DC75907433C6897FC2080E6AA89941DBDFCCCD7D8F0A8CF0C9474275C8AC73FC26A910E94E;

    // Test vector 782
    test_vectors[782].count = 783;
    test_vectors[782].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[782].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[782].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[782].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h80};
    test_vectors[782].size = 8'hF2;
    test_vectors[782].expected_ct = 448'hA8D3C39D34CF5EE7A935405DD24E6A9D4845382F0C098BE53DFEF994C1009ABD4E0910A1ADFC9A3940F0E1506BB5FE6C;

    // Test vector 783
    test_vectors[783].count = 784;
    test_vectors[783].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[783].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[783].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[783].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[783].size = 8'hF3;
    test_vectors[783].expected_ct = 448'h42CD8C3F62DECC6B03BDEEED341917590A1EF78E7A891C701F3BCADA49FEFDBFACD618E77797AB6B4356ACB15109BC51;

    // Test vector 784
    test_vectors[784].count = 785;
    test_vectors[784].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[784].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[784].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[784].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[784].size = 8'hF6;
    test_vectors[784].expected_ct = 448'hE7E5C7F71D251D49C2E0C5F5D95719FC6F865ED2E3A4A1FA8EE9B02BABAC6A549688EC88ED00B8BBE7B932AA2CA686CB;

    // Test vector 785
    test_vectors[785].count = 786;
    test_vectors[785].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[785].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[785].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[785].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[785].size = 8'hF6;
    test_vectors[785].expected_ct = 448'h8EA432E4B02739697DFE3EDF3609C8E53BC19555042BC23278186814B04B79EFCE1151A83986A2335FE09BA74E4B36F0;

    // Test vector 786
    test_vectors[786].count = 787;
    test_vectors[786].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[786].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[786].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[786].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[786].size = 8'hF6;
    test_vectors[786].expected_ct = 448'h732AAF0D04E6361071636396ADABAF5FBC8FB7D986E757202D86144DB4C964042C83F23AFCEE6EED3E3CBE24B37660DC;

    // Test vector 787
    test_vectors[787].count = 788;
    test_vectors[787].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[787].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[787].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[787].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[787].size = 8'hF6;
    test_vectors[787].expected_ct = 448'hF0A4B91928FFF758A31A4659C710D78B5B196828FFE01D6A74064E72A05C2A2083A74B101D4F8EFD6DA921408209572F;

    // Test vector 788
    test_vectors[788].count = 789;
    test_vectors[788].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[788].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[788].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[788].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h80, 8'h00, 8'h00};
    test_vectors[788].size = 8'hF6;
    test_vectors[788].expected_ct = 448'h652289701299914EF7AAF77F70050DF55774A54DE0208E10BFA7D09B2502660EBBD005462B471BEFBD65587A3F224219;

    // Test vector 789
    test_vectors[789].count = 790;
    test_vectors[789].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[789].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[789].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[789].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h80, 8'h00};
    test_vectors[789].size = 8'hF6;
    test_vectors[789].expected_ct = 448'hB77ECCCA41E9076DF4C629BFE9F03C446002A1A214D74EE1771EC193273960362E5AF88F80223E9EE940F104C7C381FD;

    // Test vector 790
    test_vectors[790].count = 791;
    test_vectors[790].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[790].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[790].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[790].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h80};
    test_vectors[790].size = 8'hF6;
    test_vectors[790].expected_ct = 448'hEB2FD4A53E8D44DBBF5DC4474B2CAD13922B8ADA98FCD109512FDDD5090D81BD0F40ABC61BE3FD8BC442B8544BCDD0C5;

    // Test vector 791
    test_vectors[791].count = 792;
    test_vectors[791].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[791].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[791].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[791].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[791].size = 8'hF7;
    test_vectors[791].expected_ct = 448'h73D4CD3CF96F0875CC332469844464794F428E928E983B2AB6A529385561E33B19AEC23CFED1ADD12A7CC2D840AA5021;

    // Test vector 792
    test_vectors[792].count = 793;
    test_vectors[792].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[792].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[792].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[792].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[792].size = 8'hFE;
    test_vectors[792].expected_ct = 448'h758522EE8F9B166DB3E2A5E60A3E4C234D282CA97A0E26C82C38321A65D69317D74D58611054BCC209BF89A2A6AC5F1B;

    // Test vector 793
    test_vectors[793].count = 794;
    test_vectors[793].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[793].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[793].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[793].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[793].size = 8'hFE;
    test_vectors[793].expected_ct = 448'h161AC3E4ADE7B8CF2888DC389DF4C9A45737C25412F875ABED8389B53EDAC8904DBF82D34C16EE08725B9FEB79694DC1;

    // Test vector 794
    test_vectors[794].count = 795;
    test_vectors[794].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[794].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[794].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[794].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[794].size = 8'hFE;
    test_vectors[794].expected_ct = 448'h09A8849000D117940BBA30BD0FC537C5F9F009B73AEC23C09A454EA479C9960BE52202FA92E4ADEF473AD3B277BD3565;

    // Test vector 795
    test_vectors[795].count = 796;
    test_vectors[795].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[795].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[795].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[795].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h80, 8'h00, 8'h00, 8'h00};
    test_vectors[795].size = 8'hFE;
    test_vectors[795].expected_ct = 448'h01CD32715DFD630B2347DFD1C9B92DADBDF647CD1DB63B5BC76FC158FA4A4BC4848EE9AEAADFE71DC4CE64ABBA3895E0;

    // Test vector 796
    test_vectors[796].count = 797;
    test_vectors[796].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[796].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[796].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[796].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h80, 8'h00, 8'h00};
    test_vectors[796].size = 8'hFE;
    test_vectors[796].expected_ct = 448'h18AFB984F1C3BEDCE5ECFD3996940BE2AD4018CF01D2D95DDAFFD4FF3145549B1CAD2697332D1BAE3A48EA88536A9ED0;

    // Test vector 797
    test_vectors[797].count = 798;
    test_vectors[797].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[797].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[797].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[797].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h80, 8'h00};
    test_vectors[797].size = 8'hFE;
    test_vectors[797].expected_ct = 448'hB2CB543086A1E9F26227ADB361F2D037BBE7FDBF237D3F52F13FB3B0840D4BDB85A1009DF72E58903F954F6D8ECEC54B;

    // Test vector 798
    test_vectors[798].count = 799;
    test_vectors[798].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[798].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[798].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[798].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h80};
    test_vectors[798].size = 8'hFE;
    test_vectors[798].expected_ct = 448'hF328DF5AA680D8D527EAACC5047AA05541F9532CC9BD769397152740DB63A5133DEA078CC9888B4A00B390D94121C871;

    // Test vector 799
    test_vectors[799].count = 800;
    test_vectors[799].key = 128'h000102030405060708090A0B0C0D0E0F;
    test_vectors[799].nonce = 128'h101112131415161718191A1B1C1D1E1F;
    test_vectors[799].pt = '{8'h20, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D, 8'h2E, 8'h2F, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[799].ad = '{8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3A, 8'h3B, 8'h3C, 8'h3D, 8'h3E, 8'h3F, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h4A, 8'h4B, 8'h4C, 8'h4D, 8'h4E, 8'h4F, 8'h80, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
    test_vectors[799].size = 8'hFF;
    test_vectors[799].expected_ct = 448'hE1B2C05F6F1FC804AF8A6FADAAD65F75DD004933C88FF7552E80F62982D9963E0A4218034EB281B76DAC569CDE078990;

endfunction