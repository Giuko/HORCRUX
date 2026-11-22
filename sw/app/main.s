
/home/thesis/giuseppe.maganuco/HORCRUX/hw/vendor/x-heep/sw/build/CMakeFiles/main.elf.dir//home/thesis/giuseppe.maganuco/HORCRUX/sw/applications/tests/dilithium-ntt/main.c.obj:     file format elf32-littleriscv


Disassembly of section .text.startup.main:

00000000 <main>:
    }
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
    return ok;
}

int main(void) {
   0:	711d                	addi	sp,sp,-96
   2:	ce86                	sw	ra,92(sp)
   4:	cca2                	sw	s0,88(sp)
   6:	caa6                	sw	s1,84(sp)
   8:	c8ca                	sw	s2,80(sp)
   a:	c6ce                	sw	s3,76(sp)
   c:	c4d2                	sw	s4,72(sp)
   e:	c2d6                	sw	s5,68(sp)
  10:	c0da                	sw	s6,64(sp)
  12:	de5e                	sw	s7,60(sp)
  14:	dc62                	sw	s8,56(sp)
  16:	da66                	sw	s9,52(sp)
  18:	d86a                	sw	s10,48(sp)
  1a:	d66e                	sw	s11,44(sp)
    unsigned int cycles_sw = 0;
    unsigned int cycles_hw = 0;
    dsa_poly a_sw, a_hw;

    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
  1c:	4785                	li	a5,1
int main(void) {
  1e:	81010113          	addi	sp,sp,-2032
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
  22:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  26:	4781                	li	a5,0
  28:	b0079073          	csrw	mcycle,a5

    printf("    DILITHIUM NTT TEST               \n");
  2c:	00000537          	lui	a0,0x0
  30:	00050513          	mv	a0,a0
  34:	00000097          	auipc	ra,0x0
  38:	000080e7          	jalr	ra # 34 <main+0x34>

0000003c <.LVL1>:

#if SW_TEST_ENABLED
    a_sw = dsa_tv_ntt_in;
  3c:	000007b7          	lui	a5,0x0
  40:	00078b13          	mv	s6,a5
  44:	0818                	addi	a4,sp,16
  46:	00078793          	mv	a5,a5
  4a:	400b0b93          	addi	s7,s6,1024

0000004e <.L2>:
  4e:	4388                	lw	a0,0(a5)
  50:	43cc                	lw	a1,4(a5)
  52:	4790                	lw	a2,8(a5)
  54:	47d4                	lw	a3,12(a5)
  56:	c308                	sw	a0,0(a4)
  58:	c34c                	sw	a1,4(a4)
  5a:	c710                	sw	a2,8(a4)
  5c:	c754                	sw	a3,12(a4)
  5e:	07c1                	addi	a5,a5,16 # 10 <main+0x10>
  60:	0741                	addi	a4,a4,16
  62:	ff7796e3          	bne	a5,s7,4e <.L2>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
  66:	4781                	li	a5,0
  68:	b0079073          	csrw	mcycle,a5

0000006c <.LBB27>:
    dilithium_ntt(a->coeffs);
  6c:	0808                	addi	a0,sp,16

0000006e <.LVL3>:
  6e:	00000097          	auipc	ra,0x0
  72:	000080e7          	jalr	ra # 6e <.LVL3>

00000076 <.LBE27>:
    dilithium_ntt_sw_compute(&a_sw);
    CSR_READ(CSR_REG_MCYCLE, &cycles_sw);
  76:	b00029f3          	csrr	s3,mcycle

0000007a <.LBB29>:
    int ok = 1;
  7a:	4905                	li	s2,1
  7c:	01010a93          	addi	s5,sp,16

00000080 <.LVL6>:
  80:	84de                	mv	s1,s7

00000082 <.LBE29>:
    CSR_READ(CSR_REG_MCYCLE, &cycles_sw);
  82:	8c5e                	mv	s8,s7

00000084 <.LBB38>:
    for (int i = 0; i < DSA_N; i++) {
  84:	4401                	li	s0,0

00000086 <.LBB32>:
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
  86:	00000db7          	lui	s11,0x0
  8a:	00000d37          	lui	s10,0x0

0000008e <.LBE32>:
    for (int i = 0; i < DSA_N; i++) {
  8e:	10000c93          	li	s9,256

00000092 <.L4>:
        ok &= compare_coeffs("D-NTT-SW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
  92:	000aa683          	lw	a3,0(s5)
  96:	000c2703          	lw	a4,0(s8)

0000009a <.LBB37>:
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
  9a:	8622                	mv	a2,s0
  9c:	000d8593          	mv	a1,s11
    int match = (got == exp);
  a0:	40e68a33          	sub	s4,a3,a4
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
  a4:	000d0513          	mv	a0,s10
    int match = (got == exp);
  a8:	001a3a13          	seqz	s4,s4

000000ac <.LVL9>:
    if (!match && !DEBUG) {
  ac:	00e68663          	beq	a3,a4,b8 <.L3>
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
  b0:	00000097          	auipc	ra,0x0
  b4:	000080e7          	jalr	ra # b0 <.LVL9+0x4>

000000b8 <.L3>:
    for (int i = 0; i < DSA_N; i++) {
  b8:	0405                	addi	s0,s0,1

000000ba <.LVL11>:
        ok &= compare_coeffs("D-NTT-SW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
  ba:	01497933          	and	s2,s2,s4

000000be <.LVL12>:
    for (int i = 0; i < DSA_N; i++) {
  be:	0a91                	addi	s5,s5,4
  c0:	0c11                	addi	s8,s8,4
  c2:	fd9418e3          	bne	s0,s9,92 <.L4>

000000c6 <.LBE38>:
    if (ok) printf("PASSED: Dilithium NTT (Software)\n");
  c6:	1e091463          	bnez	s2,2ae <.L44>

000000ca <.L5>:
    all_passed &= dilithium_ntt_sw_verify(&a_sw);
    printf("Software Cycles: %u\n\n", cycles_sw);
  ca:	00000537          	lui	a0,0x0
  ce:	00050513          	mv	a0,a0
  d2:	85ce                	mv	a1,s3
  d4:	00000097          	auipc	ra,0x0
  d8:	000080e7          	jalr	ra # d4 <.L5+0xa>

000000dc <.LVL14>:
#else
    printf("--- SOFTWARE TEST SKIPPED ---\n\n");
#endif

    a_hw = dsa_tv_ntt_in;
  dc:	41010793          	addi	a5,sp,1040

000000e0 <.L6>:
  e0:	000b2583          	lw	a1,0(s6)
  e4:	004b2603          	lw	a2,4(s6)
  e8:	008b2683          	lw	a3,8(s6)
  ec:	00cb2703          	lw	a4,12(s6)
  f0:	c38c                	sw	a1,0(a5)
  f2:	c3d0                	sw	a2,4(a5)
  f4:	c794                	sw	a3,8(a5)
  f6:	c7d8                	sw	a4,12(a5)
  f8:	0b41                	addi	s6,s6,16
  fa:	07c1                	addi	a5,a5,16
  fc:	ff7b12e3          	bne	s6,s7,e0 <.L6>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 100:	4781                	li	a5,0
 102:	b0079073          	csrw	mcycle,a5

00000106 <.LBB42>:
    for (int len = 128; len > 0; len >>= 1) {
 106:	00000d37          	lui	s10,0x0
 10a:	800d0793          	addi	a5,s10,-2048 # fffff800 <.LANCHOR1+0xffffe800>
 10e:	c63e                	sw	a5,12(sp)

00000110 <.LBE42>:
    CSR_WRITE(CSR_REG_MCYCLE, 0);
 110:	4ea1                	li	t4,8

00000112 <.LBB51>:
    int k = 0;
 112:	4f81                	li	t6,0

00000114 <.LBB49>:
    for (int len = 128; len > 0; len >>= 1) {
 114:	08000e13          	li	t3,128

00000118 <.L7>:
        for (int start = 0; start < 256; start = start + 2 * len) {
 118:	47b2                	lw	a5,12(sp)
 11a:	001f8893          	addi	a7,t6,1
 11e:	00289593          	slli	a1,a7,0x2
 122:	95be                	add	a1,a1,a5
 124:	41010413          	addi	s0,sp,1040

00000128 <.LVL17>:
 128:	8c46                	mv	s8,a7
 12a:	fffe0513          	addi	a0,t3,-1
 12e:	4781                	li	a5,0

00000130 <.LBB46>:
            int32_t zeta = zetas_DSA[++k];
 130:	4190                	lw	a2,0(a1)

00000132 <.LBE46>:
        for (int start = 0; start < 256; start = start + 2 * len) {
 132:	001e1813          	slli	a6,t3,0x1
 136:	8772                	mv	a4,t3
 138:	003e1b93          	slli	s7,t3,0x3
 13c:	002e1313          	slli	t1,t3,0x2
 140:	86a2                	mv	a3,s0

00000142 <.LBB47>:
            int32_t zeta = zetas_DSA[++k];
 142:	8fe2                	mv	t6,s8

00000144 <.LVL19>:
            for (j = start; j < start + len - 1; j += 2) {
 144:	0aa7db63          	bge	a5,a0,1fa <.L23>

00000148 <.L45>:
 148:	006683b3          	add	t2,a3,t1
 14c:	8f36                	mv	t5,a3
 14e:	c43e                	sw	a5,8(sp)
 150:	c23e                	sw	a5,4(sp)

00000152 <.L9>:
                asm volatile ( 
 152:	000f2a83          	lw	s5,0(t5)
 156:	0003aa03          	lw	s4,0(t2)
 15a:	004f2b03          	lw	s6,4(t5)
 15e:	0043a783          	lw	a5,4(t2)
 162:	82d2                	mv	t0,s4
 164:	645afd6b          	.insn	4, 0x645afd6b
 168:	2e007dbb          	.insn	4, 0x2e007dbb
 16c:	82be                	mv	t0,a5
 16e:	645b7ceb          	.insn	4, 0x645b7ceb
 172:	2e0078bb          	.insn	4, 0x2e0078bb

00000176 <.LVL22>:
            for (j = start; j < start + len - 1; j += 2) {
 176:	47a2                	lw	a5,8(sp)
                a->coeffs[j]       = (int32_t)out0.rd_lo;
 178:	01af2023          	sw	s10,0(t5)
                a->coeffs[j+len]   = (int32_t)out0.rd_hi;
 17c:	01b3a023          	sw	s11,0(t2)
                a->coeffs[j+1]     = (int32_t)out1.rd_lo;
 180:	019f2223          	sw	s9,4(t5)
            for (j = start; j < start + len - 1; j += 2) {
 184:	0789                	addi	a5,a5,2
                a->coeffs[j+1+len] = (int32_t)out1.rd_hi;
 186:	0113a223          	sw	a7,4(t2)
            for (j = start; j < start + len - 1; j += 2) {
 18a:	c43e                	sw	a5,8(sp)

0000018c <.LVL23>:
 18c:	0f21                	addi	t5,t5,8
 18e:	03a1                	addi	t2,t2,8
 190:	fca7c1e3          	blt	a5,a0,152 <.L9>
 194:	4792                	lw	a5,4(sp)

00000196 <.LVL24>:
 196:	ffe70293          	addi	t0,a4,-2
 19a:	40f282b3          	sub	t0,t0,a5
 19e:	ffe2f293          	andi	t0,t0,-2
 1a2:	00278893          	addi	a7,a5,2

000001a6 <.LVL25>:
 1a6:	011283b3          	add	t2,t0,a7

000001aa <.L8>:
            for (; j < start + len; ++j) {
 1aa:	02e3da63          	bge	t2,a4,1de <.L14>
 1ae:	00239893          	slli	a7,t2,0x2
 1b2:	41010f13          	addi	t5,sp,1040
 1b6:	98fa                	add	a7,a7,t5

000001b8 <.L13>:
            asm volatile (
 1b8:	00688f33          	add	t5,a7,t1
 1bc:	000f2b03          	lw	s6,0(t5)
 1c0:	0008ad03          	lw	s10,0(a7)
 1c4:	82da                	mv	t0,s6
 1c6:	645d7deb          	.insn	4, 0x645d7deb
 1ca:	2e007cbb          	.insn	4, 0x2e007cbb

000001ce <.LVL27>:
            a->coeffs[j]     = (int32_t)out0.rd_lo;
 1ce:	01b8a023          	sw	s11,0(a7)
            a->coeffs[j+len] = (int32_t)out0.rd_hi;
 1d2:	019f2023          	sw	s9,0(t5)
            for (; j < start + len; ++j) {
 1d6:	0385                	addi	t2,t2,1
 1d8:	0891                	addi	a7,a7,4
 1da:	fce39fe3          	bne	t2,a4,1b8 <.L13>

000001de <.L14>:
        for (int start = 0; start < 256; start = start + 2 * len) {
 1de:	97c2                	add	a5,a5,a6

000001e0 <.LVL30>:
 1e0:	0ff00613          	li	a2,255

000001e4 <.LVL31>:
 1e4:	0591                	addi	a1,a1,4
 1e6:	9542                	add	a0,a0,a6
 1e8:	9742                	add	a4,a4,a6
 1ea:	96de                	add	a3,a3,s7
 1ec:	00f64963          	blt	a2,a5,1fe <.L40>
 1f0:	0c05                	addi	s8,s8,1

000001f2 <.LBB48>:
            int32_t zeta = zetas_DSA[++k];
 1f2:	4190                	lw	a2,0(a1)
 1f4:	8fe2                	mv	t6,s8

000001f6 <.LVL33>:
            for (j = start; j < start + len - 1; j += 2) {
 1f6:	f4a7c9e3          	blt	a5,a0,148 <.L45>

000001fa <.L23>:
 1fa:	83be                	mv	t2,a5
 1fc:	b77d                	j	1aa <.L8>

000001fe <.L40>:
    for (int len = 128; len > 0; len >>= 1) {
 1fe:	1efd                	addi	t4,t4,-1
 200:	401e5e13          	srai	t3,t3,0x1
 204:	f00e9ae3          	bnez	t4,118 <.L7>

00000208 <.LBE49>:
    dilithium_ntt_hw_compute(&a_hw);
    CSR_READ(CSR_REG_MCYCLE, &cycles_hw);
 208:	b0002af3          	csrr	s5,mcycle

0000020c <.LBB52>:
    int ok = 1;
 20c:	4b05                	li	s6,1

0000020e <.LBB61>:
    for (int i = 0; i < 256; i++) {
 20e:	4a01                	li	s4,0

00000210 <.LBB55>:
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
 210:	00000cb7          	lui	s9,0x0
 214:	00000c37          	lui	s8,0x0

00000218 <.LBE55>:
    for (int i = 0; i < 256; i++) {
 218:	10000b93          	li	s7,256

0000021c <.L17>:
        ok &= compare_coeffs("D-NTT-HW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
 21c:	4014                	lw	a3,0(s0)
 21e:	4098                	lw	a4,0(s1)

00000220 <.LBB60>:
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
 220:	8652                	mv	a2,s4
 222:	000c8593          	mv	a1,s9
    int match = (got == exp);
 226:	40e68d33          	sub	s10,a3,a4
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
 22a:	000c0513          	mv	a0,s8
    int match = (got == exp);
 22e:	001d3d13          	seqz	s10,s10

00000232 <.LVL40>:
    if (!match && !DEBUG) {
 232:	00e68663          	beq	a3,a4,23e <.L16>
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
 236:	00000097          	auipc	ra,0x0
 23a:	000080e7          	jalr	ra # 236 <.LVL40+0x4>

0000023e <.L16>:
    for (int i = 0; i < 256; i++) {
 23e:	0a05                	addi	s4,s4,1

00000240 <.LVL42>:
        ok &= compare_coeffs("D-NTT-HW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
 240:	01ab7b33          	and	s6,s6,s10

00000244 <.LVL43>:
    for (int i = 0; i < 256; i++) {
 244:	0411                	addi	s0,s0,4
 246:	0491                	addi	s1,s1,4
 248:	fd7a1ae3          	bne	s4,s7,21c <.L17>

0000024c <.LBE61>:
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
 24c:	060b1a63          	bnez	s6,2c0 <.L46>

00000250 <.LBE52>:
    all_passed &= dilithium_ntt_hw_verify(&a_hw);
    printf("Hardware Cycles: %u\n", cycles_hw);
 250:	00000537          	lui	a0,0x0
 254:	85d6                	mv	a1,s5
 256:	00050513          	mv	a0,a0
 25a:	00000097          	auipc	ra,0x0
 25e:	000080e7          	jalr	ra # 25a <.LBE52+0xa>

00000262 <.LVL45>:

#if SW_TEST_ENABLED
    printf("SW Cycles: %u | HW Cycles: %u\n", cycles_sw, cycles_hw);
 262:	00000537          	lui	a0,0x0
 266:	8656                	mv	a2,s5
 268:	85ce                	mv	a1,s3
 26a:	00050513          	mv	a0,a0
 26e:	00000097          	auipc	ra,0x0
 272:	000080e7          	jalr	ra # 26e <.LVL45+0xc>

00000276 <.LVL46>:
    if (cycles_sw > 0) {
 276:	08099263          	bnez	s3,2fa <.L22>

0000027a <.L20>:
#endif

    if (all_passed) {
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
 27a:	00000537          	lui	a0,0x0
 27e:	00050513          	mv	a0,a0
 282:	00000097          	auipc	ra,0x0
 286:	000080e7          	jalr	ra # 282 <.L20+0x8>

0000028a <.L41>:
    }

    return EXIT_SUCCESS;
}
 28a:	7f010113          	addi	sp,sp,2032
 28e:	40f6                	lw	ra,92(sp)
 290:	4466                	lw	s0,88(sp)
 292:	44d6                	lw	s1,84(sp)
 294:	4946                	lw	s2,80(sp)
 296:	49b6                	lw	s3,76(sp)

00000298 <.LVL49>:
 298:	4a26                	lw	s4,72(sp)
 29a:	4a96                	lw	s5,68(sp)

0000029c <.LVL50>:
 29c:	4b06                	lw	s6,64(sp)
 29e:	5bf2                	lw	s7,60(sp)
 2a0:	5c62                	lw	s8,56(sp)
 2a2:	5cd2                	lw	s9,52(sp)
 2a4:	5d42                	lw	s10,48(sp)
 2a6:	5db2                	lw	s11,44(sp)
 2a8:	4501                	li	a0,0
 2aa:	6125                	addi	sp,sp,96
 2ac:	8082                	ret

000002ae <.L44>:
    if (ok) printf("PASSED: Dilithium NTT (Software)\n");
 2ae:	00000537          	lui	a0,0x0
 2b2:	00050513          	mv	a0,a0
 2b6:	00000097          	auipc	ra,0x0
 2ba:	000080e7          	jalr	ra # 2b6 <.L44+0x8>

000002be <.LVL52>:
 2be:	b531                	j	ca <.L5>

000002c0 <.L46>:
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
 2c0:	00000537          	lui	a0,0x0
 2c4:	00050513          	mv	a0,a0
 2c8:	00000097          	auipc	ra,0x0
 2cc:	000080e7          	jalr	ra # 2c8 <.L46+0x8>

000002d0 <.LBE64>:
    printf("Hardware Cycles: %u\n", cycles_hw);
 2d0:	00000537          	lui	a0,0x0
 2d4:	85d6                	mv	a1,s5
 2d6:	00050513          	mv	a0,a0
 2da:	00000097          	auipc	ra,0x0
 2de:	000080e7          	jalr	ra # 2da <.LBE64+0xa>

000002e2 <.LVL55>:
    printf("SW Cycles: %u | HW Cycles: %u\n", cycles_sw, cycles_hw);
 2e2:	00000537          	lui	a0,0x0
 2e6:	8656                	mv	a2,s5
 2e8:	85ce                	mv	a1,s3
 2ea:	00050513          	mv	a0,a0
 2ee:	00000097          	auipc	ra,0x0
 2f2:	000080e7          	jalr	ra # 2ee <.LVL55+0xc>

000002f6 <.LVL56>:
    if (cycles_sw > 0) {
 2f6:	02098463          	beqz	s3,31e <.L19>

000002fa <.L22>:
        printf("Speedup: %u.%02ux\n", cycles_sw / cycles_hw, ((cycles_sw * 100) / cycles_hw) % 100);
 2fa:	06400613          	li	a2,100
 2fe:	02c987b3          	mul	a5,s3,a2
 302:	00000537          	lui	a0,0x0
 306:	00050513          	mv	a0,a0
 30a:	0357d7b3          	divu	a5,a5,s5
 30e:	0359d5b3          	divu	a1,s3,s5
 312:	02c7f633          	remu	a2,a5,a2
 316:	00000097          	auipc	ra,0x0
 31a:	000080e7          	jalr	ra # 316 <.L22+0x1c>

0000031e <.L19>:
    all_passed &= dilithium_ntt_hw_verify(&a_hw);
 31e:	012b7b33          	and	s6,s6,s2
    if (all_passed) {
 322:	f40b0ce3          	beqz	s6,27a <.L20>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
 326:	00000537          	lui	a0,0x0
 32a:	00050513          	mv	a0,a0
 32e:	00000097          	auipc	ra,0x0
 332:	000080e7          	jalr	ra # 32e <.L19+0x10>

00000336 <.LVL59>:
 336:	bf91                	j	28a <.L41>
