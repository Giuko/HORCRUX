
/home/thesis/giuseppe.maganuco/HORCRUX/hw/vendor/x-heep/sw/build/CMakeFiles/main.elf.dir//home/thesis/giuseppe.maganuco/HORCRUX/sw/applications/tests/keccak-abs/main.c.obj:     file format elf32-littleriscv


Disassembly of section .text.startup.main:

00000000 <main>:
    } else {
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
    }
}

int main(void) {
   0:	7159                	addi	sp,sp,-112
   2:	d686                	sw	ra,108(sp)
   4:	d4a2                	sw	s0,104(sp)
   6:	d2a6                	sw	s1,100(sp)
   8:	d0ca                	sw	s2,96(sp)
    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
   a:	4785                	li	a5,1
   c:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  10:	4401                	li	s0,0
  12:	b0041073          	csrw	mcycle,s0

    printf("   KECCAK ABSORPTION TEST            \n");
  16:	00000537          	lui	a0,0x0
  1a:	00050513          	mv	a0,a0
  1e:	00000097          	auipc	ra,0x0
  22:	000080e7          	jalr	ra # 1e <main+0x1e>

00000026 <.LVL0>:
    printf("Testing SHA3/SHAKE with HW acceleration\n\n");
  26:	00000537          	lui	a0,0x0
  2a:	00050513          	mv	a0,a0
  2e:	00000097          	auipc	ra,0x0
  32:	000080e7          	jalr	ra # 2e <.LVL0+0x8>

00000036 <.LBB12>:
    printf("Test: SHA3-256 single block\n");
  36:	00000537          	lui	a0,0x0
  3a:	00050513          	mv	a0,a0
  3e:	00000097          	auipc	ra,0x0
  42:	000080e7          	jalr	ra # 3e <.LBB12+0x8>

00000046 <.LVL2>:
    const uint8_t expected[32] = {
  46:	000007b7          	lui	a5,0x0
  4a:	00078793          	mv	a5,a5
  4e:	0007a303          	lw	t1,0(a5) # 0 <main>
  52:	0047a883          	lw	a7,4(a5)
  56:	0087a803          	lw	a6,8(a5)
  5a:	47c8                	lw	a0,12(a5)
  5c:	4b8c                	lw	a1,16(a5)
  5e:	4bd0                	lw	a2,20(a5)
  60:	4f94                	lw	a3,24(a5)
  62:	4fd8                	lw	a4,28(a5)
    const uint8_t msg[] = "abc";
  64:	006367b7          	lui	a5,0x636
  68:	26178793          	addi	a5,a5,609 # 636261 <.LASF26+0x63607a>
  6c:	c63e                	sw	a5,12(sp)
    const uint8_t expected[32] = {
  6e:	d81a                	sw	t1,48(sp)
  70:	da46                	sw	a7,52(sp)
  72:	dc42                	sw	a6,56(sp)
  74:	de2a                	sw	a0,60(sp)
  76:	c0ae                	sw	a1,64(sp)
  78:	c2b2                	sw	a2,68(sp)
  7a:	c4b6                	sw	a3,72(sp)
  7c:	c6ba                	sw	a4,76(sp)

0000007e <.LVL3>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  7e:	b0041073          	csrw	mcycle,s0
    sha3_256(hash, msg, sizeof(msg)-1);
  82:	460d                	li	a2,3
  84:	0808                	addi	a0,sp,16
  86:	006c                	addi	a1,sp,12
  88:	00000097          	auipc	ra,0x0
  8c:	000080e7          	jalr	ra # 88 <.LVL3+0xa>

00000090 <.LVL4>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
  90:	b00025f3          	csrr	a1,mcycle

00000094 <.LVL5>:
    printf("  Cycles: %u\n", cycles);
  94:	00000537          	lui	a0,0x0

00000098 <.LBB14>:
    total_tests++;
  98:	00000937          	lui	s2,0x0

0000009c <.LBE14>:
    printf("  Cycles: %u\n", cycles);
  9c:	00050513          	mv	a0,a0
  a0:	00000097          	auipc	ra,0x0
  a4:	000080e7          	jalr	ra # a0 <.LBE14+0x4>

000000a8 <.LBB21>:
    total_tests++;
  a8:	00092403          	lw	s0,0(s2) # 0 <main>
    if(memcmp(result, expected, len) == 0) {
  ac:	180c                	addi	a1,sp,48

000000ae <.LVL7>:
  ae:	0808                	addi	a0,sp,16

000000b0 <.LVL8>:
    total_tests++;
  b0:	0405                	addi	s0,s0,1
    if(memcmp(result, expected, len) == 0) {
  b2:	02000613          	li	a2,32
    total_tests++;
  b6:	00892023          	sw	s0,0(s2)
    if(memcmp(result, expected, len) == 0) {
  ba:	00000097          	auipc	ra,0x0
  be:	000080e7          	jalr	ra # ba <.LVL8+0xa>

000000c2 <.LVL9>:
  c2:	ed39                	bnez	a0,120 <.L2>
        passed_tests++;
  c4:	000004b7          	lui	s1,0x0
  c8:	0004a583          	lw	a1,0(s1) # 0 <main>
  cc:	0585                	addi	a1,a1,1
  ce:	00b4a023          	sw	a1,0(s1)

000000d2 <.L3>:
    test_sha3_256_multi_block();
    test_shake128();
    test_shake256();
    test_multi_squeeze();
    */
    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
  d2:	00000537          	lui	a0,0x0
  d6:	8622                	mv	a2,s0
  d8:	00050513          	mv	a0,a0
  dc:	00000097          	auipc	ra,0x0
  e0:	000080e7          	jalr	ra # dc <.L3+0xa>

000000e4 <.LVL11>:

    if (passed_tests == total_tests) {
  e4:	0004a703          	lw	a4,0(s1)
  e8:	00092783          	lw	a5,0(s2)
  ec:	02f70163          	beq	a4,a5,10e <.L12>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
  f0:	00000537          	lui	a0,0x0
  f4:	00050513          	mv	a0,a0
  f8:	00000097          	auipc	ra,0x0
  fc:	000080e7          	jalr	ra # f8 <.LVL11+0x14>

00000100 <.L7>:
    }

    return EXIT_SUCCESS;
}
 100:	50b6                	lw	ra,108(sp)
 102:	5426                	lw	s0,104(sp)
 104:	5496                	lw	s1,100(sp)
 106:	5906                	lw	s2,96(sp)
 108:	4501                	li	a0,0
 10a:	6165                	addi	sp,sp,112
 10c:	8082                	ret

0000010e <.L12>:
        printf("FINAL STATUS: ALL TESTS PASSED\n");
 10e:	00000537          	lui	a0,0x0
 112:	00050513          	mv	a0,a0
 116:	00000097          	auipc	ra,0x0
 11a:	000080e7          	jalr	ra # 116 <.L12+0x8>

0000011e <.LVL13>:
 11e:	b7cd                	j	100 <.L7>

00000120 <.L2>:
        printf("[FAIL] %s\n", test_name);
 120:	000005b7          	lui	a1,0x0
 124:	00000537          	lui	a0,0x0
 128:	00058593          	mv	a1,a1
 12c:	00050513          	mv	a0,a0
 130:	cece                	sw	s3,92(sp)
 132:	ccd2                	sw	s4,88(sp)
 134:	00000097          	auipc	ra,0x0
 138:	000080e7          	jalr	ra # 134 <.L2+0x14>

0000013c <.LVL15>:
        printf("  Expected: ");
 13c:	00000537          	lui	a0,0x0
 140:	00050513          	mv	a0,a0
 144:	00000097          	auipc	ra,0x0
 148:	000080e7          	jalr	ra # 144 <.LVL15+0x8>

0000014c <.LBB16>:
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", expected[i]);
 14c:	1800                	addi	s0,sp,48

0000014e <.LVL17>:
 14e:	04010993          	addi	s3,sp,64
 152:	000004b7          	lui	s1,0x0

00000156 <.L4>:
 156:	00044583          	lbu	a1,0(s0)
 15a:	00048513          	mv	a0,s1
 15e:	0405                	addi	s0,s0,1

00000160 <.LVL19>:
 160:	00000097          	auipc	ra,0x0
 164:	000080e7          	jalr	ra # 160 <.LVL19>

00000168 <.LVL20>:
 168:	ff3417e3          	bne	s0,s3,156 <.L4>

0000016c <.LBE16>:
        if(len > 16) printf("...");
 16c:	00000a37          	lui	s4,0x0
 170:	000a0513          	mv	a0,s4
 174:	00000097          	auipc	ra,0x0
 178:	000080e7          	jalr	ra # 174 <.LBE16+0x8>

0000017c <.LVL21>:
        printf("\n  Got:      ");
 17c:	00000537          	lui	a0,0x0
 180:	00050513          	mv	a0,a0
 184:	00000097          	auipc	ra,0x0
 188:	000080e7          	jalr	ra # 184 <.LVL21+0x8>

0000018c <.LBB17>:
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", result[i]);
 18c:	0800                	addi	s0,sp,16

0000018e <.LVL23>:
 18e:	02010993          	addi	s3,sp,32

00000192 <.L5>:
 192:	00044583          	lbu	a1,0(s0)
 196:	00048513          	mv	a0,s1
 19a:	0405                	addi	s0,s0,1

0000019c <.LVL25>:
 19c:	00000097          	auipc	ra,0x0
 1a0:	000080e7          	jalr	ra # 19c <.LVL25>

000001a4 <.LVL26>:
 1a4:	ff3417e3          	bne	s0,s3,192 <.L5>

000001a8 <.LBE17>:
        if(len > 16) printf("...");
 1a8:	000a0513          	mv	a0,s4
 1ac:	00000097          	auipc	ra,0x0
 1b0:	000080e7          	jalr	ra # 1ac <.LBE17+0x4>

000001b4 <.LVL27>:
        printf("\n");
 1b4:	4529                	li	a0,10
 1b6:	00000097          	auipc	ra,0x0
 1ba:	000080e7          	jalr	ra # 1b6 <.LVL27+0x2>

000001be <.LBE22>:
    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
 1be:	000004b7          	lui	s1,0x0
 1c2:	00092403          	lw	s0,0(s2)
 1c6:	0004a583          	lw	a1,0(s1) # 0 <main>
 1ca:	49f6                	lw	s3,92(sp)
 1cc:	4a66                	lw	s4,88(sp)

000001ce <.LBB23>:
        return 0;
 1ce:	b711                	j	d2 <.L3>
