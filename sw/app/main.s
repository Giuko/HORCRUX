
/home/thesis/giuseppe.maganuco/HORCRUX/hw/vendor/x-heep/sw/build/CMakeFiles/main.elf.dir//home/thesis/giuseppe.maganuco/HORCRUX/sw/applications/tests/keccak-abs/main.c.obj:     file format elf32-littleriscv


Disassembly of section .text.test_multi_squeeze:

00000000 <test_multi_squeeze>:
    verify_hash(out1, out2, 64, "SHAKE256 consistency");
}

// Test: Multi-block squeeze (large output)
static void test_multi_squeeze(void) {
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
   0:	00000537          	lui	a0,0x0
static void test_multi_squeeze(void) {
   4:	dc010113          	addi	sp,sp,-576
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
   8:	00050513          	mv	a0,a0
static void test_multi_squeeze(void) {
   c:	22112e23          	sw	ra,572(sp)
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
  10:	00000097          	auipc	ra,0x0
  14:	000080e7          	jalr	ra # 10 <test_multi_squeeze+0x10>

00000018 <.LBB4>:
    
    uint8_t msg[50];
    for(int i = 0; i < 50; i++) msg[i] = i & 0xFF;
  18:	003c                	addi	a5,sp,8
  1a:	4681                	li	a3,0
  1c:	03200713          	li	a4,50

00000020 <.L2>:
  20:	00d78023          	sb	a3,0(a5)
  24:	0685                	addi	a3,a3,1
  26:	0785                	addi	a5,a5,1
  28:	fee69ce3          	bne	a3,a4,20 <.L2>

0000002c <.LBE4>:
    
    uint8_t output[500];
    uint32_t cycles = 0;
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  2c:	4781                	li	a5,0
  2e:	b0079073          	csrw	mcycle,a5
    shake128(output, 500, msg, 50);
  32:	1f400593          	li	a1,500
  36:	0030                	addi	a2,sp,8
  38:	1868                	addi	a0,sp,60
  3a:	00000097          	auipc	ra,0x0
  3e:	000080e7          	jalr	ra # 3a <.LBE4+0xe>

00000042 <.LVL4>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
  42:	b00025f3          	csrr	a1,mcycle

00000046 <.LVL5>:
    printf("  Cycles: %u\n", cycles);
  46:	00000537          	lui	a0,0x0
  4a:	00050513          	mv	a0,a0
  4e:	00000097          	auipc	ra,0x0
  52:	000080e7          	jalr	ra # 4e <.LVL5+0x8>

00000056 <.LBB5>:
    
    // Verify non-zero output
    int non_zero = 0;
    for(int i = 0; i < 500; i++) {
  56:	187c                	addi	a5,sp,60

00000058 <.LBE5>:
    int non_zero = 0;
  58:	4681                	li	a3,0

0000005a <.L3>:
        if(output[i] != 0) non_zero = 1;
  5a:	0007c703          	lbu	a4,0(a5)
    for(int i = 0; i < 500; i++) {
  5e:	0785                	addi	a5,a5,1

00000060 <.LVL8>:
        if(output[i] != 0) non_zero = 1;
  60:	00e03733          	snez	a4,a4
  64:	8ed9                	or	a3,a3,a4

00000066 <.LVL9>:
    for(int i = 0; i < 500; i++) {
  66:	1c18                	addi	a4,sp,560
  68:	fee799e3          	bne	a5,a4,5a <.L3>

0000006c <.LBE6>:
    }
    
    total_tests++;
  6c:	00000737          	lui	a4,0x0
  70:	00072783          	lw	a5,0(a4) # 0 <test_multi_squeeze>
  74:	0785                	addi	a5,a5,1
  76:	00f72023          	sw	a5,0(a4)
    if(non_zero) {
  7a:	ce89                	beqz	a3,94 <.L4>
        passed_tests++;
  7c:	00000737          	lui	a4,0x0
  80:	00072783          	lw	a5,0(a4) # 0 <test_multi_squeeze>
  84:	0785                	addi	a5,a5,1
  86:	00f72023          	sw	a5,0(a4)

0000008a <.L1>:
    } else {
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
    }
}
  8a:	23c12083          	lw	ra,572(sp)
  8e:	24010113          	addi	sp,sp,576
  92:	8082                	ret

00000094 <.L4>:
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
  94:	00000537          	lui	a0,0x0
  98:	00050513          	mv	a0,a0
  9c:	00000097          	auipc	ra,0x0
  a0:	000080e7          	jalr	ra # 9c <.L4+0x8>

000000a4 <.LVL12>:
}
  a4:	b7dd                	j	8a <.L1>

Disassembly of section .text.verify_hash.isra.0:

00000000 <verify_hash.isra.0>:
    total_tests++;
   0:	00000737          	lui	a4,0x0
   4:	00072783          	lw	a5,0(a4) # 0 <verify_hash.isra.0>
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
   8:	1101                	addi	sp,sp,-32
   a:	cc22                	sw	s0,24(sp)
    total_tests++;
   c:	0785                	addi	a5,a5,1
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
   e:	ca26                	sw	s1,20(sp)
  10:	c84a                	sw	s2,16(sp)
  12:	ce06                	sw	ra,28(sp)
  14:	8936                	mv	s2,a3
    total_tests++;
  16:	00f72023          	sw	a5,0(a4)
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
  1a:	842a                	mv	s0,a0
  1c:	84ae                	mv	s1,a1
    if(memcmp(result, expected, len) == 0) {
  1e:	00000097          	auipc	ra,0x0
  22:	000080e7          	jalr	ra # 1e <verify_hash.isra.0+0x1e>

00000026 <.LVL14>:
  26:	ed11                	bnez	a0,42 <.L11>
        passed_tests++;
  28:	00000737          	lui	a4,0x0
  2c:	00072783          	lw	a5,0(a4) # 0 <verify_hash.isra.0>
}
  30:	40f2                	lw	ra,28(sp)
  32:	4462                	lw	s0,24(sp)

00000034 <.LVL15>:
        passed_tests++;
  34:	0785                	addi	a5,a5,1
  36:	00f72023          	sw	a5,0(a4)
}
  3a:	44d2                	lw	s1,20(sp)

0000003c <.LVL16>:
  3c:	4942                	lw	s2,16(sp)

0000003e <.LVL17>:
  3e:	6105                	addi	sp,sp,32
  40:	8082                	ret

00000042 <.L11>:
        printf("[FAIL] %s\n", test_name);
  42:	00000537          	lui	a0,0x0
  46:	85ca                	mv	a1,s2
  48:	00050513          	mv	a0,a0
  4c:	c64e                	sw	s3,12(sp)

0000004e <.LVL19>:
  4e:	00000097          	auipc	ra,0x0
  52:	000080e7          	jalr	ra # 4e <.LVL19>

00000056 <.LVL20>:
        printf("  Expected: ");
  56:	00000537          	lui	a0,0x0
  5a:	00050513          	mv	a0,a0
  5e:	00000097          	auipc	ra,0x0
  62:	000080e7          	jalr	ra # 5e <.LVL20+0x8>

00000066 <.LBB15>:
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", expected[i]);
  66:	01048993          	addi	s3,s1,16
  6a:	00000937          	lui	s2,0x0

0000006e <.L13>:
  6e:	0004c583          	lbu	a1,0(s1)
  72:	00090513          	mv	a0,s2
  76:	0485                	addi	s1,s1,1

00000078 <.LVL23>:
  78:	00000097          	auipc	ra,0x0
  7c:	000080e7          	jalr	ra # 78 <.LVL23>

00000080 <.LVL24>:
  80:	ff3497e3          	bne	s1,s3,6e <.L13>

00000084 <.LBE15>:
        if(len > 16) printf("...");
  84:	000009b7          	lui	s3,0x0

00000088 <.LVL25>:
  88:	00098513          	mv	a0,s3
  8c:	00000097          	auipc	ra,0x0
  90:	000080e7          	jalr	ra # 8c <.LVL25+0x4>

00000094 <.LVL26>:
        printf("\n  Got:      ");
  94:	00000537          	lui	a0,0x0
  98:	00050513          	mv	a0,a0
  9c:	00000097          	auipc	ra,0x0
  a0:	000080e7          	jalr	ra # 9c <.LVL26+0x8>

000000a4 <.LBB16>:
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", result[i]);
  a4:	01040493          	addi	s1,s0,16

000000a8 <.L14>:
  a8:	00044583          	lbu	a1,0(s0)
  ac:	00090513          	mv	a0,s2
  b0:	0405                	addi	s0,s0,1

000000b2 <.LVL29>:
  b2:	00000097          	auipc	ra,0x0
  b6:	000080e7          	jalr	ra # b2 <.LVL29>

000000ba <.LVL30>:
  ba:	fe9417e3          	bne	s0,s1,a8 <.L14>

000000be <.LBE16>:
        if(len > 16) printf("...");
  be:	00098513          	mv	a0,s3
  c2:	00000097          	auipc	ra,0x0
  c6:	000080e7          	jalr	ra # c2 <.LBE16+0x4>

000000ca <.LBE13>:
}
  ca:	4462                	lw	s0,24(sp)

000000cc <.LBB20>:
        printf("\n");
  cc:	49b2                	lw	s3,12(sp)

000000ce <.LBE20>:
}
  ce:	40f2                	lw	ra,28(sp)
  d0:	44d2                	lw	s1,20(sp)

000000d2 <.LVL32>:
  d2:	4942                	lw	s2,16(sp)

000000d4 <.LBB21>:
        printf("\n");
  d4:	4529                	li	a0,10

000000d6 <.LBE21>:
}
  d6:	6105                	addi	sp,sp,32

000000d8 <.LBB22>:
        printf("\n");
  d8:	00000317          	auipc	t1,0x0
  dc:	00030067          	jr	t1 # d8 <.LBB22>

Disassembly of section .text.startup.main:

00000000 <main>:

int main(void) {
   0:	7149                	addi	sp,sp,-368
   2:	16112623          	sw	ra,364(sp)
   6:	16812423          	sw	s0,360(sp)
   a:	16912223          	sw	s1,356(sp)
   e:	17212023          	sw	s2,352(sp)
  12:	15312e23          	sw	s3,348(sp)
    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
  16:	4785                	li	a5,1
  18:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  1c:	4481                	li	s1,0
  1e:	b0049073          	csrw	mcycle,s1

    printf("   KECCAK ABSORPTION TEST            \n");
  22:	00000537          	lui	a0,0x0
  26:	00050513          	mv	a0,a0
  2a:	00000097          	auipc	ra,0x0
  2e:	000080e7          	jalr	ra # 2a <main+0x2a>

00000032 <.LVL34>:
    printf("Testing SHA3/SHAKE with HW acceleration\n\n");
  32:	00000537          	lui	a0,0x0
  36:	00050513          	mv	a0,a0
  3a:	00000097          	auipc	ra,0x0
  3e:	000080e7          	jalr	ra # 3a <.LVL34+0x8>

00000042 <.LBB35>:
    printf("Test: SHA3-256 single block\n");
  42:	00000537          	lui	a0,0x0
  46:	00050513          	mv	a0,a0
  4a:	00000097          	auipc	ra,0x0
  4e:	000080e7          	jalr	ra # 4a <.LBB35+0x8>

00000052 <.LVL36>:
    const uint8_t expected[32] = {
  52:	000007b7          	lui	a5,0x0
  56:	00078793          	mv	a5,a5
  5a:	0007a883          	lw	a7,0(a5) # 0 <main>
  5e:	0047a803          	lw	a6,4(a5)
  62:	4788                	lw	a0,8(a5)
  64:	47cc                	lw	a1,12(a5)
  66:	4b90                	lw	a2,16(a5)
  68:	4bd4                	lw	a3,20(a5)
  6a:	4f98                	lw	a4,24(a5)
  6c:	4fdc                	lw	a5,28(a5)
    const uint8_t msg[] = "abc";
  6e:	00636437          	lui	s0,0x636
  72:	26140413          	addi	s0,s0,609 # 636261 <.LFE11+0x635f65>
    const uint8_t expected[32] = {
  76:	c546                	sw	a7,136(sp)
  78:	c742                	sw	a6,140(sp)
  7a:	c92a                	sw	a0,144(sp)
  7c:	cb2e                	sw	a1,148(sp)
  7e:	cd32                	sw	a2,152(sp)
  80:	cf36                	sw	a3,156(sp)
  82:	d13a                	sw	a4,160(sp)
  84:	d33e                	sw	a5,164(sp)
    const uint8_t msg[] = "abc";
  86:	c422                	sw	s0,8(sp)

00000088 <.LVL37>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  88:	b0049073          	csrw	mcycle,s1
    sha3_256(hash, msg, sizeof(msg)-1);
  8c:	460d                	li	a2,3
  8e:	002c                	addi	a1,sp,8
  90:	00a8                	addi	a0,sp,72
  92:	00000097          	auipc	ra,0x0
  96:	000080e7          	jalr	ra # 92 <.LVL37+0xa>

0000009a <.LVL38>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
  9a:	b00025f3          	csrr	a1,mcycle

0000009e <.LVL39>:
    printf("  Cycles: %u\n", cycles);
  9e:	000004b7          	lui	s1,0x0
  a2:	00048513          	mv	a0,s1
  a6:	00000097          	auipc	ra,0x0
  aa:	000080e7          	jalr	ra # a6 <.LVL39+0x8>

000000ae <.LVL40>:
    verify_hash(hash, expected, 32, "SHA3-256 single block");
  ae:	000006b7          	lui	a3,0x0
  b2:	00068693          	mv	a3,a3
  b6:	012c                	addi	a1,sp,136
  b8:	00a8                	addi	a0,sp,72
  ba:	02000613          	li	a2,32
  be:	00000097          	auipc	ra,0x0
  c2:	000080e7          	jalr	ra # be <.LVL40+0x10>

000000c6 <.LBB37>:
    printf("Test: SHA3-512 single block\n");
  c6:	00000537          	lui	a0,0x0
  ca:	00050513          	mv	a0,a0
  ce:	00000097          	auipc	ra,0x0
  d2:	000080e7          	jalr	ra # ce <.LBB37+0x8>

000000d6 <.LVL42>:
    const uint8_t expected[64] = {
  d6:	000007b7          	lui	a5,0x0
  da:	00078793          	mv	a5,a5
    const uint8_t msg[] = "abc";
  de:	c422                	sw	s0,8(sp)
    const uint8_t expected[64] = {
  e0:	0138                	addi	a4,sp,136
  e2:	04078693          	addi	a3,a5,64 # 40 <.LVL34+0xe>

000000e6 <.L20>:
  e6:	0007a803          	lw	a6,0(a5)
  ea:	43c8                	lw	a0,4(a5)
  ec:	478c                	lw	a1,8(a5)
  ee:	47d0                	lw	a2,12(a5)
  f0:	01072023          	sw	a6,0(a4)
  f4:	c348                	sw	a0,4(a4)
  f6:	c70c                	sw	a1,8(a4)
  f8:	c750                	sw	a2,12(a4)
  fa:	07c1                	addi	a5,a5,16
  fc:	0741                	addi	a4,a4,16
  fe:	fed794e3          	bne	a5,a3,e6 <.L20>

00000102 <.LVL43>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 102:	4781                	li	a5,0
 104:	b0079073          	csrw	mcycle,a5
    sha3_512(hash, msg, sizeof(msg)-1);
 108:	460d                	li	a2,3
 10a:	002c                	addi	a1,sp,8
 10c:	00a8                	addi	a0,sp,72
 10e:	00000097          	auipc	ra,0x0
 112:	000080e7          	jalr	ra # 10e <.LVL43+0xc>

00000116 <.LVL44>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
 116:	b00025f3          	csrr	a1,mcycle

0000011a <.LVL45>:
    printf("  Cycles: %u\n", cycles);
 11a:	00048513          	mv	a0,s1
 11e:	00000097          	auipc	ra,0x0
 122:	000080e7          	jalr	ra # 11e <.LVL45+0x4>

00000126 <.LVL46>:
    verify_hash(hash, expected, 64, "SHA3-512 single block");
 126:	000006b7          	lui	a3,0x0
 12a:	04000613          	li	a2,64
 12e:	012c                	addi	a1,sp,136
 130:	00a8                	addi	a0,sp,72
 132:	00068693          	mv	a3,a3
 136:	00000097          	auipc	ra,0x0
 13a:	000080e7          	jalr	ra # 136 <.LVL46+0x10>

0000013e <.LBB39>:
    printf("Test: SHA3-256 multi-block (200B input)\n");
 13e:	00000537          	lui	a0,0x0
 142:	00050513          	mv	a0,a0
 146:	00000097          	auipc	ra,0x0
 14a:	000080e7          	jalr	ra # 146 <.LBB39+0x8>

0000014e <.LBB41>:
    for(int i = 0; i < 200; i++) msg[i] = i & 0xFF;
 14e:	013c                	addi	a5,sp,136
 150:	4601                	li	a2,0
 152:	0c800713          	li	a4,200

00000156 <.L21>:
 156:	00c78023          	sb	a2,0(a5)
 15a:	0605                	addi	a2,a2,1
 15c:	0785                	addi	a5,a5,1
 15e:	fee61ce3          	bne	a2,a4,156 <.L21>

00000162 <.LBE41>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 162:	4401                	li	s0,0
 164:	b0041073          	csrw	mcycle,s0
    sha3_256(hash, msg, 200);
 168:	012c                	addi	a1,sp,136
 16a:	00a8                	addi	a0,sp,72
 16c:	00000097          	auipc	ra,0x0
 170:	000080e7          	jalr	ra # 16c <.LBE41+0xa>

00000174 <.LVL52>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
 174:	b00025f3          	csrr	a1,mcycle

00000178 <.LVL53>:
    printf("  Cycles: %u\n", cycles);
 178:	00048513          	mv	a0,s1
 17c:	00000097          	auipc	ra,0x0
 180:	000080e7          	jalr	ra # 17c <.LVL53+0x4>

00000184 <.LVL54>:
    total_tests++;
 184:	00000937          	lui	s2,0x0
    passed_tests++;
 188:	000009b7          	lui	s3,0x0
    total_tests++;
 18c:	00092703          	lw	a4,0(s2) # 0 <main>
    passed_tests++;
 190:	0009a783          	lw	a5,0(s3) # 0 <main>

00000194 <.LBB44>:
    printf("Test: SHAKE128 XOF\n");
 194:	00000537          	lui	a0,0x0

00000198 <.LBB48>:
    total_tests++;
 198:	0705                	addi	a4,a4,1
    passed_tests++;
 19a:	0785                	addi	a5,a5,1

0000019c <.LBB49>:
    printf("Test: SHAKE128 XOF\n");
 19c:	00050513          	mv	a0,a0

000001a0 <.LBB50>:
    total_tests++;
 1a0:	00e92023          	sw	a4,0(s2)
    passed_tests++;
 1a4:	00f9a023          	sw	a5,0(s3)

000001a8 <.LBB51>:
    printf("Test: SHAKE128 XOF\n");
 1a8:	00000097          	auipc	ra,0x0
 1ac:	000080e7          	jalr	ra # 1a8 <.LBB51>

000001b0 <.LVL56>:
    uint8_t msg[50] = {0};
 1b0:	c502                	sw	zero,136(sp)
 1b2:	c702                	sw	zero,140(sp)
 1b4:	c902                	sw	zero,144(sp)
 1b6:	cb02                	sw	zero,148(sp)
 1b8:	cd02                	sw	zero,152(sp)
 1ba:	cf02                	sw	zero,156(sp)
 1bc:	d102                	sw	zero,160(sp)
 1be:	d302                	sw	zero,164(sp)
 1c0:	d502                	sw	zero,168(sp)
 1c2:	d702                	sw	zero,172(sp)
 1c4:	d902                	sw	zero,176(sp)
 1c6:	db02                	sw	zero,180(sp)
 1c8:	0a011c23          	sh	zero,184(sp)

000001cc <.LVL57>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 1cc:	b0041073          	csrw	mcycle,s0
    shake128(out1, 32, msg, 50);
 1d0:	03200693          	li	a3,50
 1d4:	0130                	addi	a2,sp,136
 1d6:	0028                	addi	a0,sp,8
 1d8:	02000593          	li	a1,32
 1dc:	00000097          	auipc	ra,0x0
 1e0:	000080e7          	jalr	ra # 1dc <.LVL57+0x10>

000001e4 <.LVL58>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
 1e4:	b00025f3          	csrr	a1,mcycle

000001e8 <.LVL59>:
    printf("  Cycles: %u\n", cycles);
 1e8:	00048513          	mv	a0,s1
 1ec:	00000097          	auipc	ra,0x0
 1f0:	000080e7          	jalr	ra # 1ec <.LVL59+0x4>

000001f4 <.LVL60>:
    shake128(out2, 32, msg, 50);
 1f4:	0130                	addi	a2,sp,136
 1f6:	00a8                	addi	a0,sp,72
 1f8:	03200693          	li	a3,50
 1fc:	02000593          	li	a1,32
 200:	00000097          	auipc	ra,0x0
 204:	000080e7          	jalr	ra # 200 <.LVL60+0xc>

00000208 <.LVL61>:
    verify_hash(out1, out2, 32, "SHAKE128 consistency");
 208:	000006b7          	lui	a3,0x0
 20c:	00ac                	addi	a1,sp,72
 20e:	0028                	addi	a0,sp,8
 210:	00068693          	mv	a3,a3
 214:	02000613          	li	a2,32
 218:	00000097          	auipc	ra,0x0
 21c:	000080e7          	jalr	ra # 218 <.LVL61+0x10>

00000220 <.LBB52>:
    printf("Test: SHAKE256 XOF\n");
 220:	00000537          	lui	a0,0x0
 224:	00050513          	mv	a0,a0
 228:	00000097          	auipc	ra,0x0
 22c:	000080e7          	jalr	ra # 228 <.LBB52+0x8>

00000230 <.LBB54>:
    for(int i = 0; i < 100; i++) msg[i] = i & 0xFF;
 230:	013c                	addi	a5,sp,136
 232:	06400713          	li	a4,100

00000236 <.L22>:
 236:	00878023          	sb	s0,0(a5)
 23a:	0405                	addi	s0,s0,1
 23c:	0785                	addi	a5,a5,1
 23e:	fee41ce3          	bne	s0,a4,236 <.L22>

00000242 <.LBE54>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 242:	4781                	li	a5,0
 244:	b0079073          	csrw	mcycle,a5
    shake256(out1, 64, msg, 100);
 248:	04000593          	li	a1,64
 24c:	86a2                	mv	a3,s0
 24e:	0130                	addi	a2,sp,136
 250:	0028                	addi	a0,sp,8
 252:	00000097          	auipc	ra,0x0
 256:	000080e7          	jalr	ra # 252 <.LBE54+0x10>

0000025a <.LVL67>:
    CSR_READ(CSR_REG_MCYCLE, &cycles);
 25a:	b00025f3          	csrr	a1,mcycle

0000025e <.LVL68>:
    printf("  Cycles: %u\n", cycles);
 25e:	00048513          	mv	a0,s1
 262:	00000097          	auipc	ra,0x0
 266:	000080e7          	jalr	ra # 262 <.LVL68+0x4>

0000026a <.LVL69>:
    shake256(out2, 64, msg, 100);
 26a:	86a2                	mv	a3,s0
 26c:	0130                	addi	a2,sp,136
 26e:	00a8                	addi	a0,sp,72
 270:	04000593          	li	a1,64
 274:	00000097          	auipc	ra,0x0
 278:	000080e7          	jalr	ra # 274 <.LVL69+0xa>

0000027c <.LVL70>:
    verify_hash(out1, out2, 64, "SHAKE256 consistency");
 27c:	000006b7          	lui	a3,0x0
 280:	00ac                	addi	a1,sp,72
 282:	0028                	addi	a0,sp,8
 284:	00068693          	mv	a3,a3
 288:	04000613          	li	a2,64
 28c:	00000097          	auipc	ra,0x0
 290:	000080e7          	jalr	ra # 28c <.LVL70+0x10>

00000294 <.LBE52>:
    test_sha3_256_single_block();
    test_sha3_512_single_block();
    test_sha3_256_multi_block();
    test_shake128();
    test_shake256();
    test_multi_squeeze();
 294:	00000097          	auipc	ra,0x0
 298:	000080e7          	jalr	ra # 294 <.LBE52>

0000029c <.LVL72>:

    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
 29c:	00092603          	lw	a2,0(s2)
 2a0:	0009a583          	lw	a1,0(s3)
 2a4:	00000537          	lui	a0,0x0
 2a8:	00050513          	mv	a0,a0
 2ac:	00000097          	auipc	ra,0x0
 2b0:	000080e7          	jalr	ra # 2ac <.LVL72+0x10>

000002b4 <.LVL73>:

    if (passed_tests == total_tests) {
 2b4:	0009a703          	lw	a4,0(s3)
 2b8:	00092783          	lw	a5,0(s2)
 2bc:	02f70763          	beq	a4,a5,2ea <.L29>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
 2c0:	00000537          	lui	a0,0x0
 2c4:	00050513          	mv	a0,a0
 2c8:	00000097          	auipc	ra,0x0
 2cc:	000080e7          	jalr	ra # 2c8 <.LVL73+0x14>

000002d0 <.L24>:
    }

    return EXIT_SUCCESS;
}
 2d0:	16c12083          	lw	ra,364(sp)
 2d4:	16812403          	lw	s0,360(sp)
 2d8:	16412483          	lw	s1,356(sp)
 2dc:	16012903          	lw	s2,352(sp)
 2e0:	15c12983          	lw	s3,348(sp)
 2e4:	4501                	li	a0,0
 2e6:	6175                	addi	sp,sp,368
 2e8:	8082                	ret

000002ea <.L29>:
        printf("FINAL STATUS: ALL TESTS PASSED\n");
 2ea:	00000537          	lui	a0,0x0
 2ee:	00050513          	mv	a0,a0
 2f2:	00000097          	auipc	ra,0x0
 2f6:	000080e7          	jalr	ra # 2f2 <.L29+0x8>

000002fa <.LVL75>:
 2fa:	bfd9                	j	2d0 <.L24>
