
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	65d0106f          	j	1e5c <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	44a0006f          	j	44e <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	4460006f          	j	44e <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	72d0106f          	j	1f38 <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
  10:	43e0006f          	j	44e <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
  14:	43a0006f          	j	44e <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
  18:	4360006f          	j	44e <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
  1c:	7b50106f          	j	1fd0 <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
  20:	42e0006f          	j	44e <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
  24:	42a0006f          	j	44e <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
  28:	4260006f          	j	44e <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
  2c:	4c10006f          	j	cec <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
  30:	41e0006f          	j	44e <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
  34:	41a0006f          	j	44e <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
  38:	4160006f          	j	44e <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
  3c:	4120006f          	j	44e <__no_irq_handler>
	// 16 : fast interrupt - timer_1
	j handler_irq_fast_timer_1
  40:	5e90006f          	j	e28 <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	70d0006f          	j	f50 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	0300106f          	j	1078 <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	3c10106f          	j	1c0c <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	1c90006f          	j	a18 <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	3310006f          	j	b84 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	2700106f          	j	12c8 <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	3940106f          	j	13f0 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	4b80106f          	j	1518 <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	5dc0106f          	j	1640 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	7000106f          	j	1768 <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	0250106f          	j	1890 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	14d0106f          	j	19bc <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	2710106f          	j	1ae4 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	4bd0106f          	j	1d34 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	1240106f          	j	11a0 <handler_irq_fast_external_peripheral>

Disassembly of section .init:

00000180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
 180:	0000f197          	auipc	gp,0xf
   addi  gp, gp, %pcrel_lo(1b)
 184:	e8018193          	addi	gp,gp,-384 # f000 <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
 188:	0003f117          	auipc	sp,0x3f
 18c:	ab810113          	addi	sp,sp,-1352 # 3ec40 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <_sp+0x5f1f4c0>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
 19c:	cd50                	sw	a2,28(a0)
   #include "external_crt0.S"
#endif

#ifdef FLASH_LOAD

    call w25q128jw_init_crt0
 19e:	2079                	jal	22c <w25q128jw_init_crt0>

    // This assumes ram base address is 0x00000000 and the section .text stars from ram0 (in the first RAMSIZE_COPIEDBY_BOOTROM Byte)
    li     s1, RAMSIZE_COPIEDBY_BOOTROM
 1a0:	6485                	lui	s1,0x1
 1a2:	80048493          	addi	s1,s1,-2048 # 800 <spi_error_handler.isra.0+0xb4>
    li     s2, FLASH_MEM_START_ADDRESS
 1a6:	40000937          	lui	s2,0x40000

    // copy the remaining (if any) text and data sections //
    // Setup the in/out pointers and copy size knowing 1KiB as already been copied
    mv     a0, s2 // src ptr (flash)
 1aa:	854a                	mv	a0,s2
    add   a0, a0, s1
 1ac:	9526                	add	a0,a0,s1

    la     a1, _etext
 1ae:	00004597          	auipc	a1,0x4
 1b2:	76258593          	addi	a1,a1,1890 # 4910 <_etext>
    // Skip if everything has already been copied, and copy the data section
    blt    a1, s1, _load_data_section
 1b6:	0095c863          	blt	a1,s1,1c6 <_load_data_section>

    // copy size in bytes, i.e. _etext - RAMSIZE_COPIEDBY_BOOTROM
    sub   a2, a1, s1
 1ba:	40958633          	sub	a2,a1,s1

    // dst ptr (ram)
    mv     a1, s1
 1be:	85a6                	mv	a1,s1
    // copy the remaining data --> w25q128jw_read_standard(a0 is src addr, a1 is dest ptr data, a2 is length)

    // this sub is redundat as we could have simply set a0 to RAMSIZE_COPIEDBY_BOOTROM+0x0,
    // but like this is more readable as we set the FLASH address as memory mapped to FLASH_MEM_START_ADDRESS, and then remove the offset
    // as required bz the w25q128jw_read_standard function
    sub    a0,a0,s2
 1c0:	41250533          	sub	a0,a0,s2
    call w25q128jw_read_standard
 1c4:	288d                	jal	236 <w25q128jw_read_standard>

000001c6 <_load_data_section>:

_load_data_section:
    // src ptr
    la     a0, _lma_data_start
 1c6:	4000e517          	auipc	a0,0x4000e
 1ca:	63a50513          	addi	a0,a0,1594 # 4000e800 <_lma_data_start>
    // dst ptr
    la     a1, __data_start
 1ce:	0000e597          	auipc	a1,0xe
 1d2:	63258593          	addi	a1,a1,1586 # e800 <peripherals>
    // copy size in bytes
    la     a2, _lma_data_end
 1d6:	4000f617          	auipc	a2,0x4000f
 1da:	a6a60613          	addi	a2,a2,-1430 # 4000ec40 <_lma_data_end>
    sub    a2, a2, a0
 1de:	8e09                	sub	a2,a2,a0

    bltz   a2, _load_data_section_end // dont do anything if you do not have something in data
 1e0:	00064563          	bltz	a2,1ea <_init_bss>

    sub    a0,a0,s2
 1e4:	41250533          	sub	a0,a0,s2
    call w25q128jw_read_standard
 1e8:	20b9                	jal	236 <w25q128jw_read_standard>

000001ea <_init_bss>:

#endif

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
 1ea:	a3818513          	addi	a0,gp,-1480 # ea38 <dma_subsys_per>
    la     a2, __bss_end
 1ee:	c4018613          	addi	a2,gp,-960 # ec40 <__BSS_END__>
    sub    a2, a2, a0
 1f2:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1f4:	4581                	li	a1,0
    call   memset
 1f6:	2c0d                	jal	428 <memset>
    blt a1, a2, loop_init_data
    end_init_data:
#endif

/* set vector table address and vectored mode */
    la a0, __vector_start
 1f8:	00000517          	auipc	a0,0x0
 1fc:	e0850513          	addi	a0,a0,-504 # 0 <__vector_start>
    ori a0, a0, 0x1
 200:	00156513          	ori	a0,a0,1
    csrw mtvec, a0
 204:	30551073          	csrw	mtvec,a0

/* new-style constructors and destructors */
    la a0, __libc_fini_array
 208:	00002517          	auipc	a0,0x2
 20c:	1ee50513          	addi	a0,a0,494 # 23f6 <__libc_fini_array>
    call atexit
 210:	6c1010ef          	jal	20d0 <atexit>
    call __libc_init_array
 214:	194020ef          	jal	23a8 <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 218:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 21a:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 21c:	4601                	li	a2,0
    call main
 21e:	09e030ef          	jal	32bc <main>
    tail exit
 222:	6b90106f          	j	20da <exit>

00000226 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 226:	643010ef          	jal	2068 <init>

0000022a <_fini>:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
    ret
 22a:	8082                	ret

0000022c <w25q128jw_init_crt0>:
 22c:	20020737          	lui	a4,0x20020
 230:	3ee02823          	sw	a4,1008(zero) # 3f0 <spi>
 234:	8082                	ret

00000236 <w25q128jw_read_standard>:
 236:	18058563          	beqz	a1,3c0 <w25q128jw_read_standard+0x18a>
 23a:	1101                	addi	sp,sp,-32
 23c:	ca4a                	sw	s2,20(sp)
 23e:	ce06                	sw	ra,28(sp)
 240:	8932                	mv	s2,a2
 242:	4705                	li	a4,1
 244:	c26d                	beqz	a2,326 <w25q128jw_read_standard+0xf0>
 246:	00c506b3          	add	a3,a0,a2
 24a:	00a6e7b3          	or	a5,a3,a0
 24e:	010006b7          	lui	a3,0x1000
 252:	0cd7fa63          	bgeu	a5,a3,326 <w25q128jw_read_standard+0xf0>
    if (w25q128jw_sanity_checks(addr, data, length) != FLASH_OK) return FLASH_ERROR;

    // Address + Read command
    uint32_t read_byte_cmd = ((REVERT_24b_ADDR(addr & 0x00ffffff) << 8) | FC_RD);
    // Load command to TX FIFO
    spi_write_word(spi, read_byte_cmd);
 256:	cc26                	sw	s1,24(sp)
 258:	3f002483          	lw	s1,1008(zero) # 3f0 <spi>
 25c:	c84e                	sw	s3,16(sp)
 25e:	89ae                	mv	s3,a1
    return SPI_FLAG_OK;
}

spi_return_flags_e spi_write_word(spi_host_t* spi, uint32_t wdata)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 260:	c4b9                	beqz	s1,2ae <w25q128jw_read_standard+0x78>
 */
static inline __attribute__((always_inline)) 
const volatile spi_status_t spi_get_status(spi_host_t* spi)
{
    spi_status_t status;
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 262:	48dc                	lw	a5,20(s1)
    // Check we're not overflowing
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
 264:	04700713          	li	a4,71
 268:	0ff7f793          	zext.b	a5,a5
 26c:	00f76663          	bltu	a4,a5,278 <w25q128jw_read_standard+0x42>
 * @param bitfield Bitfield to reverse bytes of.
 * @return `bitfield` with the order of bytes reversed.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_byteswap32(uint32_t bitfield) {
  return __builtin_bswap32(bitfield);
 270:	2251                	jal	3f4 <__bswapsi2>
    uint32_t read_byte_cmd = ((REVERT_24b_ADDR(addr & 0x00ffffff) << 8) | FC_RD);
 272:	00356793          	ori	a5,a0,3
        return SPI_FLAG_TX_QUEUE_FULL;
    SPI_HW(spi)->TXDATA = wdata;
 276:	d4dc                	sw	a5,44(s1)
 278:	48dc                	lw	a5,20(s1)
 */
static inline __attribute__((always_inline)) 
spi_tristate_e spi_get_ready(spi_host_t* spi)
{
    SPI_NULL_CHECK(spi, SPI_TRISTATE_ERROR)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
 27a:	fe07dfe3          	bgez	a5,278 <w25q128jw_read_standard+0x42>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 27e:	48dc                	lw	a5,20(s1)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
 280:	0007d663          	bgez	a5,28c <w25q128jw_read_standard+0x56>
    SPI_HW(spi)->COMMAND = cmd_reg;
 284:	110007b7          	lui	a5,0x11000
 288:	078d                	addi	a5,a5,3 # 11000003 <_sp+0x10fc13c3>
 28a:	d0dc                	sw	a5,36(s1)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 28c:	48dc                	lw	a5,20(s1)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
 28e:	fe07dfe3          	bgez	a5,28c <w25q128jw_read_standard+0x56>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 292:	48dc                	lw	a5,20(s1)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
 294:	0007da63          	bgez	a5,2a8 <w25q128jw_read_standard+0x72>
    spi_set_command(spi, cmd_read_1);
    spi_wait_for_ready(spi);

    // Set up segment parameters -> read length bytes
    const uint32_t cmd_read_2 = spi_create_command((spi_command_t){
        .len        = length-1,          // len bytes
 298:	fff90793          	addi	a5,s2,-1 # 3fffffff <_sp+0x3ffc13bf>
  bitfield |= (value & mask) << index;
 29c:	07a2                	slli	a5,a5,0x8
 29e:	83a1                	srli	a5,a5,0x8
 2a0:	08000737          	lui	a4,0x8000
 2a4:	8fd9                	or	a5,a5,a4
 2a6:	d0dc                	sw	a5,36(s1)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 2a8:	48dc                	lw	a5,20(s1)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
 2aa:	fe07dfe3          	bgez	a5,2a8 <w25q128jw_read_standard+0x72>
    int flag = 1;
    int to_read = 0;
    int i_start = 0;
    int length_original = length;
    uint32_t *data_32bit = (uint32_t *)data;
    while (flag) {
 2ae:	86ce                	mv	a3,s3
w25q_error_codes_t w25q128jw_read_standard(uint32_t addr, void* data, uint32_t length) {
 2b0:	884a                	mv	a6,s2
    int i_start = 0;
 2b2:	4701                	li	a4,0
    int to_read = 0;
 2b4:	4881                	li	a7,0
        if (length >= SPI_HOST_PARAM_RX_DEPTH) {
 2b6:	03f00e13          	li	t3,63
 2ba:	090e6563          	bltu	t3,a6,344 <w25q128jw_read_standard+0x10e>
            spi_set_rx_watermark(spi, SPI_HOST_PARAM_RX_DEPTH>>2);
            length -= SPI_HOST_PARAM_RX_DEPTH;
            to_read += SPI_HOST_PARAM_RX_DEPTH;
        }
        else {
            spi_set_rx_watermark(spi, (length%4==0 ? length>>2 : (length>>2)+1));
 2be:	00285793          	srli	a5,a6,0x2
 2c2:	00387613          	andi	a2,a6,3
 2c6:	0ff7f793          	zext.b	a5,a5
 2ca:	c601                	beqz	a2,2d2 <w25q128jw_read_standard+0x9c>
 2cc:	0785                	addi	a5,a5,1
 2ce:	0ff7f793          	zext.b	a5,a5
            to_read += length;
 2d2:	98c2                	add	a7,a7,a6
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 2d4:	c4d1                	beqz	s1,360 <w25q128jw_read_standard+0x12a>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
 2d6:	4890                	lw	a2,16(s1)
            flag = 0;
 2d8:	4581                	li	a1,0
  bitfield &= ~(mask << index);
 2da:	f0067613          	andi	a2,a2,-256
  bitfield |= (value & mask) << index;
 2de:	8fd1                	or	a5,a5,a2
 2e0:	c89c                	sw	a5,16(s1)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 2e2:	48dc                	lw	a5,20(s1)
 */
static inline __attribute__((always_inline)) 
spi_return_flags_e spi_wait_for_rx_watermark(spi_host_t* spi)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    while (!spi_get_status(spi).rxwm);
 2e4:	00b79513          	slli	a0,a5,0xb
 2e8:	fe055de3          	bgez	a0,2e2 <w25q128jw_read_standard+0xac>
        }
        // Wait till SPI RX FIFO is full (or I read all the data)
        spi_wait_for_rx_watermark(spi);
        // Read data from SPI RX FIFO
        for (int i = i_start; i < to_read>>2; i++) {
 2ec:	4028d513          	srai	a0,a7,0x2
 2f0:	833a                	mv	t1,a4
 2f2:	8636                	mv	a2,a3
 2f4:	00a75e63          	bge	a4,a0,310 <w25q128jw_read_standard+0xda>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 2f8:	48dc                	lw	a5,20(s1)

spi_return_flags_e spi_read_word(spi_host_t* spi, uint32_t* dst)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    // Check we're not underflowing
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
 2fa:	83a1                	srli	a5,a5,0x8
 2fc:	0ff7f793          	zext.b	a5,a5
 300:	cb85                	beqz	a5,330 <w25q128jw_read_standard+0xfa>
    *dst = SPI_HW(spi)->RXDATA;
 302:	549c                	lw	a5,40(s1)
 304:	0705                	addi	a4,a4,1 # 8000001 <_sp+0x7fc13c1>
 306:	0691                	addi	a3,a3,4 # 1000004 <_sp+0xfc13c4>
 308:	fef6ae23          	sw	a5,-4(a3)
 30c:	fea746e3          	blt	a4,a0,2f8 <w25q128jw_read_standard+0xc2>
            spi_read_word(spi, &data_32bit[i]); // Writes a full word
        }
        // Update the starting index
        i_start += SPI_HOST_PARAM_RX_DEPTH>>2;
 310:	01030713          	addi	a4,t1,16
    while (flag) {
 314:	04060693          	addi	a3,a2,64
 318:	f1cd                	bnez	a1,2ba <w25q128jw_read_standard+0x84>
    }
    // Take into account the extra bytes (if any)
    if (length_original % 4 != 0) {
 31a:	00397793          	andi	a5,s2,3
 31e:	efb1                	bnez	a5,37a <w25q128jw_read_standard+0x144>
 320:	44e2                	lw	s1,24(sp)
 322:	49c2                	lw	s3,16(sp)
        for (int i = i_start; i < to_read>>2; i++) {
 324:	4701                	li	a4,0
        spi_read_word(spi, &last_word);
        memcpy(&data_32bit[length_original>>2], &last_word, length%4);
    }

    return FLASH_OK; // Success
}
 326:	40f2                	lw	ra,28(sp)
 328:	4952                	lw	s2,20(sp)
 32a:	853a                	mv	a0,a4
 32c:	6105                	addi	sp,sp,32
 32e:	8082                	ret
        for (int i = i_start; i < to_read>>2; i++) {
 330:	0705                	addi	a4,a4,1
 332:	0691                	addi	a3,a3,4
 334:	fca742e3          	blt	a4,a0,2f8 <w25q128jw_read_standard+0xc2>
        i_start += SPI_HOST_PARAM_RX_DEPTH>>2;
 338:	01030713          	addi	a4,t1,16
    while (flag) {
 33c:	04060693          	addi	a3,a2,64
 340:	fdad                	bnez	a1,2ba <w25q128jw_read_standard+0x84>
 342:	bfe1                	j	31a <w25q128jw_read_standard+0xe4>
            to_read += SPI_HOST_PARAM_RX_DEPTH;
 344:	04088893          	addi	a7,a7,64
            length -= SPI_HOST_PARAM_RX_DEPTH;
 348:	fc080813          	addi	a6,a6,-64
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 34c:	cca1                	beqz	s1,3a4 <w25q128jw_read_standard+0x16e>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
 34e:	489c                	lw	a5,16(s1)
 350:	4585                	li	a1,1
  bitfield &= ~(mask << index);
 352:	f007f793          	andi	a5,a5,-256
  bitfield |= (value & mask) << index;
 356:	0107e793          	ori	a5,a5,16
 35a:	c89c                	sw	a5,16(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 35c:	b759                	j	2e2 <w25q128jw_read_standard+0xac>
            to_read += length;
 35e:	98c2                	add	a7,a7,a6
        for (int i = i_start; i < to_read>>2; i++) {
 360:	4028d513          	srai	a0,a7,0x2
 364:	06a75163          	bge	a4,a0,3c6 <w25q128jw_read_standard+0x190>
 368:	833a                	mv	t1,a4
 36a:	8636                	mv	a2,a3
            flag = 0;
 36c:	4581                	li	a1,0
        i_start += SPI_HOST_PARAM_RX_DEPTH>>2;
 36e:	01030713          	addi	a4,t1,16
    while (flag) {
 372:	04060693          	addi	a3,a2,64
 376:	f1b1                	bnez	a1,2ba <w25q128jw_read_standard+0x84>
 378:	b74d                	j	31a <w25q128jw_read_standard+0xe4>
        uint32_t last_word = 0;
 37a:	c602                	sw	zero,12(sp)
        memcpy(&data_32bit[length_original>>2], &last_word, length%4);
 37c:	00387613          	andi	a2,a6,3
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 380:	c881                	beqz	s1,390 <w25q128jw_read_standard+0x15a>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
 382:	48dc                	lw	a5,20(s1)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
 384:	83a1                	srli	a5,a5,0x8
 386:	0ff7f793          	zext.b	a5,a5
 38a:	c399                	beqz	a5,390 <w25q128jw_read_standard+0x15a>
    *dst = SPI_HW(spi)->RXDATA;
 38c:	549c                	lw	a5,40(s1)
 38e:	c63e                	sw	a5,12(sp)
 390:	ffc97513          	andi	a0,s2,-4
 394:	954e                	add	a0,a0,s3
 396:	006c                	addi	a1,sp,12
 398:	2045                	jal	438 <memcpy>
 39a:	b759                	j	320 <w25q128jw_read_standard+0xea>
            to_read += SPI_HOST_PARAM_RX_DEPTH;
 39c:	04088893          	addi	a7,a7,64
            length -= SPI_HOST_PARAM_RX_DEPTH;
 3a0:	fc080813          	addi	a6,a6,-64
        for (int i = i_start; i < to_read>>2; i++) {
 3a4:	4028d513          	srai	a0,a7,0x2
 3a8:	02a75463          	bge	a4,a0,3d0 <w25q128jw_read_standard+0x19a>
 3ac:	833a                	mv	t1,a4
 3ae:	8636                	mv	a2,a3
 3b0:	4585                	li	a1,1
        i_start += SPI_HOST_PARAM_RX_DEPTH>>2;
 3b2:	01030713          	addi	a4,t1,16
    while (flag) {
 3b6:	04060693          	addi	a3,a2,64
 3ba:	f00590e3          	bnez	a1,2ba <w25q128jw_read_standard+0x84>
 3be:	bfb1                	j	31a <w25q128jw_read_standard+0xe4>
    if (w25q128jw_sanity_checks(addr, data, length) != FLASH_OK) return FLASH_ERROR;
 3c0:	4705                	li	a4,1
}
 3c2:	853a                	mv	a0,a4
 3c4:	8082                	ret
    if (length_original % 4 != 0) {
 3c6:	00397793          	andi	a5,s2,3
 3ca:	dbb9                	beqz	a5,320 <w25q128jw_read_standard+0xea>
        uint32_t last_word = 0;
 3cc:	c602                	sw	zero,12(sp)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
 3ce:	b7c9                	j	390 <w25q128jw_read_standard+0x15a>
        if (length >= SPI_HOST_PARAM_RX_DEPTH) {
 3d0:	03f00793          	li	a5,63
        i_start += SPI_HOST_PARAM_RX_DEPTH>>2;
 3d4:	0741                	addi	a4,a4,16
    while (flag) {
 3d6:	04068693          	addi	a3,a3,64
        if (length >= SPI_HOST_PARAM_RX_DEPTH) {
 3da:	fd07e1e3          	bltu	a5,a6,39c <w25q128jw_read_standard+0x166>
            spi_set_rx_watermark(spi, (length%4==0 ? length>>2 : (length>>2)+1));
 3de:	00387613          	andi	a2,a6,3
 3e2:	de35                	beqz	a2,35e <w25q128jw_read_standard+0x128>
 3e4:	00285793          	srli	a5,a6,0x2
 3e8:	0ff7f793          	zext.b	a5,a5
 3ec:	b5c5                	j	2cc <w25q128jw_read_standard+0x96>
	...

000003f0 <spi>:
 3f0:	0000 0000                                   ....

000003f4 <__bswapsi2>:
 3f4:	000106b7          	lui	a3,0x10
 3f8:	01851613          	slli	a2,a0,0x18
 3fc:	01855793          	srli	a5,a0,0x18
 400:	00855713          	srli	a4,a0,0x8
 404:	f0068693          	addi	a3,a3,-256 # ff00 <__global_pointer$+0xf00>
 408:	00d77733          	and	a4,a4,a3
 40c:	00c7e7b3          	or	a5,a5,a2
 410:	00ff06b7          	lui	a3,0xff0
 414:	00851513          	slli	a0,a0,0x8
 418:	00e7e7b3          	or	a5,a5,a4
 41c:	00d57533          	and	a0,a0,a3
 420:	00a7e533          	or	a0,a5,a0
 424:	00008067          	ret

Disassembly of section .text:

00000428 <memset>:
     428:	832a                	mv	t1,a0
     42a:	c611                	beqz	a2,436 <memset+0xe>
     42c:	00b30023          	sb	a1,0(t1)
     430:	167d                	addi	a2,a2,-1
     432:	0305                	addi	t1,t1,1
     434:	fe65                	bnez	a2,42c <memset+0x4>
     436:	8082                	ret

00000438 <memcpy>:
     438:	832a                	mv	t1,a0
     43a:	ca09                	beqz	a2,44c <memcpy+0x14>
     43c:	00058383          	lb	t2,0(a1)
     440:	00730023          	sb	t2,0(t1)
     444:	167d                	addi	a2,a2,-1
     446:	0305                	addi	t1,t1,1
     448:	0585                	addi	a1,a1,1
     44a:	fa6d                	bnez	a2,43c <memcpy+0x4>
     44c:	8082                	ret

0000044e <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     44e:	0000006f          	j	44e <__no_irq_handler>

00000452 <fic_irq_dma_window>:
     452:	1101                	addi	sp,sp,-32
     454:	ce06                	sw	ra,28(sp)
     456:	cc22                	sw	s0,24(sp)
     458:	1000                	addi	s0,sp,32
     45a:	fe042623          	sw	zero,-20(s0)
     45e:	a815                	j	492 <fic_irq_dma_window+0x40>
     460:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     464:	fec42703          	lw	a4,-20(s0)
     468:	87ba                	mv	a5,a4
     46a:	0786                	slli	a5,a5,0x1
     46c:	97ba                	add	a5,a5,a4
     46e:	078a                	slli	a5,a5,0x2
     470:	97b6                	add	a5,a5,a3
     472:	479c                	lw	a5,8(a5)
     474:	57b8                	lw	a4,104(a5)
     476:	4785                	li	a5,1
     478:	00f71863          	bne	a4,a5,488 <fic_irq_dma_window+0x36>
     47c:	fec42783          	lw	a5,-20(s0)
     480:	0ff7f793          	zext.b	a5,a5
     484:	853e                	mv	a0,a5
     486:	2071                	jal	512 <dma_intr_handler_trans_done>
     488:	fec42783          	lw	a5,-20(s0)
     48c:	0785                	addi	a5,a5,1
     48e:	fef42623          	sw	a5,-20(s0)
     492:	fec42703          	lw	a4,-20(s0)
     496:	478d                	li	a5,3
     498:	fce7d4e3          	bge	a5,a4,460 <fic_irq_dma_window+0xe>
     49c:	0001                	nop
     49e:	40f2                	lw	ra,28(sp)
     4a0:	4462                	lw	s0,24(sp)
     4a2:	6105                	addi	sp,sp,32
     4a4:	8082                	ret

000004a6 <fic_irq_dma_done>:
     4a6:	1101                	addi	sp,sp,-32
     4a8:	ce06                	sw	ra,28(sp)
     4aa:	cc22                	sw	s0,24(sp)
     4ac:	1000                	addi	s0,sp,32
     4ae:	fe042623          	sw	zero,-20(s0)
     4b2:	a0b1                	j	4fe <fic_irq_dma_done+0x58>
     4b4:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     4b8:	fec42703          	lw	a4,-20(s0)
     4bc:	87ba                	mv	a5,a4
     4be:	0786                	slli	a5,a5,0x1
     4c0:	97ba                	add	a5,a5,a4
     4c2:	078a                	slli	a5,a5,0x2
     4c4:	97b6                	add	a5,a5,a3
     4c6:	479c                	lw	a5,8(a5)
     4c8:	53f8                	lw	a4,100(a5)
     4ca:	4785                	li	a5,1
     4cc:	02f71463          	bne	a4,a5,4f4 <fic_irq_dma_done+0x4e>
     4d0:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     4d4:	fec42703          	lw	a4,-20(s0)
     4d8:	87ba                	mv	a5,a4
     4da:	0786                	slli	a5,a5,0x1
     4dc:	97ba                	add	a5,a5,a4
     4de:	078a                	slli	a5,a5,0x2
     4e0:	97b6                	add	a5,a5,a3
     4e2:	4705                	li	a4,1
     4e4:	00e78223          	sb	a4,4(a5)
     4e8:	fec42783          	lw	a5,-20(s0)
     4ec:	0ff7f793          	zext.b	a5,a5
     4f0:	853e                	mv	a0,a5
     4f2:	2005                	jal	512 <dma_intr_handler_trans_done>
     4f4:	fec42783          	lw	a5,-20(s0)
     4f8:	0785                	addi	a5,a5,1
     4fa:	fef42623          	sw	a5,-20(s0)
     4fe:	fec42703          	lw	a4,-20(s0)
     502:	478d                	li	a5,3
     504:	fae7d8e3          	bge	a5,a4,4b4 <fic_irq_dma_done+0xe>
     508:	0001                	nop
     50a:	40f2                	lw	ra,28(sp)
     50c:	4462                	lw	s0,24(sp)
     50e:	6105                	addi	sp,sp,32
     510:	8082                	ret

00000512 <dma_intr_handler_trans_done>:
     512:	1101                	addi	sp,sp,-32
     514:	ce06                	sw	ra,28(sp)
     516:	cc22                	sw	s0,24(sp)
     518:	1000                	addi	s0,sp,32
     51a:	87aa                	mv	a5,a0
     51c:	fef407a3          	sb	a5,-17(s0)
     520:	0001                	nop
     522:	40f2                	lw	ra,28(sp)
     524:	4462                	lw	s0,24(sp)
     526:	6105                	addi	sp,sp,32
     528:	8082                	ret

0000052a <fic_irq_timer_1>:
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    return kFastIntrCtrlOk_e;
}

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     52a:	1141                	addi	sp,sp,-16
     52c:	c606                	sw	ra,12(sp)
     52e:	c422                	sw	s0,8(sp)
     530:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     532:	0001                	nop
     534:	40b2                	lw	ra,12(sp)
     536:	4422                	lw	s0,8(sp)
     538:	0141                	addi	sp,sp,16
     53a:	8082                	ret

0000053c <_write>:
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    if (file != STDOUT_FILENO) {
     53c:	4785                	li	a5,1
     53e:	04f51c63          	bne	a0,a5,596 <_write+0x5a>
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     542:	200007b7          	lui	a5,0x20000
     546:	4fdc                	lw	a5,28(a5)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
     548:	c7b9                	beqz	a5,596 <_write+0x5a>
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     54a:	200a0737          	lui	a4,0x200a0
     54e:	00072623          	sw	zero,12(a4) # 200a000c <_sp+0x200613cc>
     552:	478d                	li	a5,3
     554:	cf5c                	sw	a5,28(a4)
     556:	02072223          	sw	zero,36(a4)
     55a:	02072623          	sw	zero,44(a4)
     55e:	00072223          	sw	zero,4(a4)
     562:	56fd                	li	a3,-1
     564:	0a7c07b7          	lui	a5,0xa7c0
     568:	c314                	sw	a3,0(a4)
     56a:	078d                	addi	a5,a5,3 # a7c0003 <_sp+0xa7813c3>
     56c:	c75c                	sw	a5,12(a4)
     56e:	00072223          	sw	zero,4(a4)
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
     572:	c205                	beqz	a2,592 <_write+0x56>
     574:	00c58833          	add	a6,a1,a2
    uart_putchar(uart, *data);
     578:	0005c683          	lbu	a3,0(a1)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     57c:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
     57e:	8b85                	andi	a5,a5,1
     580:	fff5                	bnez	a5,57c <_write+0x40>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     582:	cf14                	sw	a3,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     584:	4b1c                	lw	a5,16(a4)
  return (bitfield >> field.index) & field.mask;
     586:	838d                	srli	a5,a5,0x3
  while (!uart_tx_idle(uart)) {
     588:	8b85                	andi	a5,a5,1
     58a:	dfed                	beqz	a5,584 <_write+0x48>
    data++;
     58c:	0585                	addi	a1,a1,1
  while (len) {
     58e:	feb815e3          	bne	a6,a1,578 <_write+0x3c>
    if (uart_init(&uart) != kErrorOk) {
        errno = ENOSYS;
        return -1;
    }
    return uart_write(&uart,(uint8_t *)ptr,len);
}
     592:	8532                	mv	a0,a2
     594:	8082                	ret
        errno = ENOSYS;
     596:	05800713          	li	a4,88
        return -1;
     59a:	567d                	li	a2,-1
        errno = ENOSYS;
     59c:	c2e1a823          	sw	a4,-976(gp) # ec30 <errno>
}
     5a0:	8532                	mv	a0,a2
     5a2:	8082                	ret

000005a4 <spi_empty_rx>:
}

bool spi_empty_rx(spi_peripheral_t* peri) 
{
    // If we have a RX buffer and didn't exceed the count then read from RX FIFO
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     5a4:	514c                	lw	a1,36(a0)
{
     5a6:	872a                	mv	a4,a0
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     5a8:	cd95                	beqz	a1,5e4 <spi_empty_rx+0x40>
     5aa:	5954                	lw	a3,52(a0)
     5ac:	551c                	lw	a5,40(a0)
            peri->rxcnt < peri->txn.rxlen 
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
        ) peri->rxcnt++; // Keep track of counter
        return true;
    }
    return false;
     5ae:	4501                	li	a0,0
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     5b0:	00f6e363          	bltu	a3,a5,5b6 <spi_empty_rx+0x12>
}
     5b4:	8082                	ret
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     5b6:	4310                	lw	a2,0(a4)
     5b8:	c605                	beqz	a2,5e0 <spi_empty_rx+0x3c>
     5ba:	068a                	slli	a3,a3,0x2
     5bc:	96ae                	add	a3,a3,a1
     5be:	a821                	j	5d6 <spi_empty_rx+0x32>
    *dst = SPI_HW(spi)->RXDATA;
     5c0:	561c                	lw	a5,40(a2)
     5c2:	c29c                	sw	a5,0(a3)
        ) peri->rxcnt++; // Keep track of counter
     5c4:	5b5c                	lw	a5,52(a4)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     5c6:	5708                	lw	a0,40(a4)
        ) peri->rxcnt++; // Keep track of counter
     5c8:	0785                	addi	a5,a5,1
     5ca:	db5c                	sw	a5,52(a4)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     5cc:	00279693          	slli	a3,a5,0x2
     5d0:	00a7f863          	bgeu	a5,a0,5e0 <spi_empty_rx+0x3c>
     5d4:	96ae                	add	a3,a3,a1
     5d6:	4a5c                	lw	a5,20(a2)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     5d8:	83a1                	srli	a5,a5,0x8
     5da:	0ff7f793          	zext.b	a5,a5
     5de:	f3ed                	bnez	a5,5c0 <spi_empty_rx+0x1c>
    return false;
     5e0:	4505                	li	a0,1
     5e2:	8082                	ret
     5e4:	4501                	li	a0,0
}
     5e6:	8082                	ret

000005e8 <spi_event_handler>:
    peri->txn       = (spi_transaction_t) {0};
    peri->callbacks = NULL_CALLBACKS;
}

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
     5e8:	1141                	addi	sp,sp,-16
     5ea:	c426                	sw	s1,8(sp)
     5ec:	c24a                	sw	s2,4(sp)
     5ee:	c606                	sw	ra,12(sp)
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
     5f0:	0105f793          	andi	a5,a1,16
{
     5f4:	892e                	mv	s2,a1
     5f6:	84aa                	mv	s1,a0
    if (events & SPI_EVENT_READY) 
     5f8:	cb99                	beqz	a5,60e <spi_event_handler+0x26>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
     5fa:	4958                	lw	a4,20(a0)
     5fc:	c711                	beqz	a4,608 <spi_event_handler+0x20>
     5fe:	5554                	lw	a3,44(a0)
     600:	01854783          	lbu	a5,24(a0)
     604:	0ef6e063          	bltu	a3,a5,6e4 <spi_event_handler+0xfc>
        {
            spi_issue_next_seg(peri);
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
     608:	02097793          	andi	a5,s2,32
     60c:	efad                	bnez	a5,686 <spi_event_handler+0x9e>
            // Reset all transaction related variables
            spi_reset_transaction(peri);
            return;
        }
    }
    if (events & SPI_EVENT_TXWM)
     60e:	00897793          	andi	a5,s2,8
     612:	e79d                	bnez	a5,640 <spi_event_handler+0x58>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
     614:	00497593          	andi	a1,s2,4
     618:	e591                	bnez	a1,624 <spi_event_handler+0x3c>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
     61a:	40b2                	lw	ra,12(sp)
     61c:	44a2                	lw	s1,8(sp)
     61e:	4912                	lw	s2,4(sp)
     620:	0141                	addi	sp,sp,16
     622:	8082                	ret
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
     624:	8526                	mv	a0,s1
     626:	3fbd                	jal	5a4 <spi_empty_rx>
     628:	d96d                	beqz	a0,61a <spi_event_handler+0x32>
     62a:	40bc                	lw	a5,64(s1)
     62c:	d7fd                	beqz	a5,61a <spi_event_handler+0x32>
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     62e:	58d4                	lw	a3,52(s1)
     630:	50d0                	lw	a2,36(s1)
     632:	588c                	lw	a1,48(s1)
     634:	4cc8                	lw	a0,28(s1)
}
     636:	40b2                	lw	ra,12(sp)
     638:	44a2                	lw	s1,8(sp)
     63a:	4912                	lw	s2,4(sp)
     63c:	0141                	addi	sp,sp,16
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     63e:	8782                	jr	a5
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
     640:	4cc8                	lw	a0,28(s1)
     642:	d969                	beqz	a0,614 <spi_event_handler+0x2c>
     644:	589c                	lw	a5,48(s1)
     646:	0204a803          	lw	a6,32(s1)
     64a:	fd07f5e3          	bgeu	a5,a6,614 <spi_event_handler+0x2c>
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     64e:	4090                	lw	a2,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     650:	c605                	beqz	a2,678 <spi_event_handler+0x90>
     652:	00279693          	slli	a3,a5,0x2
     656:	96aa                	add	a3,a3,a0
     658:	428c                	lw	a1,0(a3)
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     65a:	04700893          	li	a7,71
     65e:	a031                	j	66a <spi_event_handler+0x82>
    SPI_HW(spi)->TXDATA = wdata;
     660:	d64c                	sw	a1,44(a2)
        ) peri->txcnt++; // Keep track of counter
     662:	d89c                	sw	a5,48(s1)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     664:	00f80a63          	beq	a6,a5,678 <spi_event_handler+0x90>
     668:	428c                	lw	a1,0(a3)
     66a:	4a58                	lw	a4,20(a2)
        ) peri->txcnt++; // Keep track of counter
     66c:	0785                	addi	a5,a5,1
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     66e:	0691                	addi	a3,a3,4 # ff0004 <_sp+0xfb13c4>
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     670:	0ff77713          	zext.b	a4,a4
     674:	fee8f6e3          	bgeu	a7,a4,660 <spi_event_handler+0x78>
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
     678:	5cdc                	lw	a5,60(s1)
     67a:	dfc9                	beqz	a5,614 <spi_event_handler+0x2c>
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
     67c:	58d4                	lw	a3,52(s1)
     67e:	50d0                	lw	a2,36(s1)
     680:	588c                	lw	a1,48(s1)
     682:	9782                	jalr	a5
     684:	bf41                	j	614 <spi_event_handler+0x2c>
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     686:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     688:	cb81                	beqz	a5,698 <spi_event_handler+0xb0>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     68a:	5f98                	lw	a4,56(a5)
     68c:	fc077713          	andi	a4,a4,-64
     690:	df98                	sw	a4,56(a5)
}

spi_return_flags_e spi_enable_evt_intr(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     692:	43d8                	lw	a4,4(a5)
  bitfield &= ~(mask << index);
     694:	9b75                	andi	a4,a4,-3
     696:	c3d8                	sw	a4,4(a5)
            spi_empty_rx(peri);
     698:	8526                	mv	a0,s1
     69a:	3729                	jal	5a4 <spi_empty_rx>
            if (peri->callbacks.done_cb != NULL) 
     69c:	5c9c                	lw	a5,56(s1)
            peri->state = SPI_STATE_DONE;
     69e:	4711                	li	a4,4
     6a0:	c898                	sw	a4,16(s1)
            if (peri->callbacks.done_cb != NULL) 
     6a2:	c791                	beqz	a5,6ae <spi_event_handler+0xc6>
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
     6a4:	58d4                	lw	a3,52(s1)
     6a6:	50d0                	lw	a2,36(s1)
     6a8:	588c                	lw	a1,48(s1)
     6aa:	4cc8                	lw	a0,28(s1)
     6ac:	9782                	jalr	a5
    peri->scnt      = 0;
     6ae:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     6b2:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     6b6:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     6ba:	0004aa23          	sw	zero,20(s1)
     6be:	0004ac23          	sw	zero,24(s1)
     6c2:	0004ae23          	sw	zero,28(s1)
     6c6:	0204a023          	sw	zero,32(s1)
     6ca:	0204a223          	sw	zero,36(s1)
     6ce:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     6d2:	0204ac23          	sw	zero,56(s1)
     6d6:	0204ae23          	sw	zero,60(s1)
     6da:	0404a023          	sw	zero,64(s1)
     6de:	0404a223          	sw	zero,68(s1)
            return;
     6e2:	bf25                	j	61a <spi_event_handler+0x32>
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     6e4:	00269613          	slli	a2,a3,0x2
     6e8:	9732                	add	a4,a4,a2
     6ea:	4310                	lw	a2,0(a4)
    peri->scnt++;
     6ec:	0685                	addi	a3,a3,1
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     6ee:	01000537          	lui	a0,0x1000
     6f2:	01865593          	srli	a1,a2,0x18
     6f6:	89bd                	andi	a1,a1,15
  return (bitfield >> index) & mask;
     6f8:	0025d713          	srli	a4,a1,0x2
     6fc:	157d                	addi	a0,a0,-1 # ffffff <_sp+0xfc13bf>
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
     6fe:	8f95                	sub	a5,a5,a3
                             SPI_HOST_COMMAND_LEN_OFFSET, command.len);
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
                             SPI_HOST_COMMAND_CSAAT_BIT, command.csaat);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
                             SPI_HOST_COMMAND_SPEED_OFFSET, command.speed);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
     700:	898d                	andi	a1,a1,3
     702:	00f037b3          	snez	a5,a5
  bitfield |= (value & mask) << index;
     706:	0766                	slli	a4,a4,0x19
     708:	05ee                	slli	a1,a1,0x1b
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     70a:	8e69                	and	a2,a2,a0
    spi_set_command(peri->instance, cmd_reg);
     70c:	0004a803          	lw	a6,0(s1)
     710:	07e2                	slli	a5,a5,0x18
     712:	8f4d                	or	a4,a4,a1
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
     714:	167d                	addi	a2,a2,-1
     716:	8fd9                	or	a5,a5,a4
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
     718:	8e69                	and	a2,a2,a0
    peri->scnt++;
     71a:	d4d4                	sw	a3,44(s1)
     71c:	8fd1                	or	a5,a5,a2
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     71e:	ee0808e3          	beqz	a6,60e <spi_event_handler+0x26>
  return (bitfield >> index) & mask;
     722:	0197d713          	srli	a4,a5,0x19
     726:	8b0d                	andi	a4,a4,3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     728:	468d                	li	a3,3
     72a:	00d70e63          	beq	a4,a3,746 <spi_event_handler+0x15e>
     72e:	01b7d613          	srli	a2,a5,0x1b
     732:	00d60963          	beq	a2,a3,744 <spi_event_handler+0x15c>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     736:	01482703          	lw	a4,20(a6)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
     73a:	ec075ae3          	bgez	a4,60e <spi_event_handler+0x26>
    SPI_HW(spi)->COMMAND = cmd_reg;
     73e:	02f82223          	sw	a5,36(a6)
    return SPI_FLAG_OK;
     742:	b5f1                	j	60e <spi_event_handler+0x26>
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
     744:	db6d                	beqz	a4,736 <spi_event_handler+0x14e>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     746:	01482783          	lw	a5,20(a6)
     74a:	b5d1                	j	60e <spi_event_handler+0x26>

0000074c <spi_error_handler.isra.0>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     74c:	4114                	lw	a3,0(a0)
void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
     74e:	1101                	addi	sp,sp,-32
     750:	cc26                	sw	s1,24(sp)
     752:	ce06                	sw	ra,28(sp)
     754:	84aa                	mv	s1,a0
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     756:	ca81                	beqz	a3,766 <spi_error_handler.isra.0+0x1a>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     758:	5e9c                	lw	a5,56(a3)
     75a:	fc07f793          	andi	a5,a5,-64
     75e:	de9c                	sw	a5,56(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     760:	42dc                	lw	a5,4(a3)
  bitfield &= ~(mask << index);
     762:	9bf5                	andi	a5,a5,-3
     764:	c2dc                	sw	a5,4(a3)
    spi_enable_evt_intr   (peri->instance, false);
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
     766:	40fc                	lw	a5,68(s1)
     768:	c799                	beqz	a5,776 <spi_error_handler.isra.0+0x2a>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
     76a:	58d4                	lw	a3,52(s1)
     76c:	50d0                	lw	a2,36(s1)
     76e:	588c                	lw	a1,48(s1)
     770:	4cc8                	lw	a0,28(s1)
     772:	9782                	jalr	a5
    spi_sw_reset(peri->instance);
     774:	4094                	lw	a3,0(s1)
    peri->scnt      = 0;
     776:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     77a:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     77e:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     782:	0004aa23          	sw	zero,20(s1)
     786:	0004ac23          	sw	zero,24(s1)
     78a:	0004ae23          	sw	zero,28(s1)
     78e:	0204a023          	sw	zero,32(s1)
     792:	0204a223          	sw	zero,36(s1)
     796:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     79a:	0204ac23          	sw	zero,56(s1)
     79e:	0204ae23          	sw	zero,60(s1)
     7a2:	0404a023          	sw	zero,64(s1)
     7a6:	0404a223          	sw	zero,68(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     7aa:	c6c1                	beqz	a3,832 <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     7ac:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     7ae:	40000737          	lui	a4,0x40000
     7b2:	8fd9                	or	a5,a5,a4
     7b4:	ca9c                	sw	a5,16(a3)
     7b6:	4adc                	lw	a5,20(a3)
     7b8:	c63e                	sw	a5,12(sp)
    while (status.active || status.txqd || status.rxqd);
     7ba:	47b2                	lw	a5,12(sp)
     7bc:	00179713          	slli	a4,a5,0x1
     7c0:	fe074de3          	bltz	a4,7ba <spi_error_handler.isra.0+0x6e>
     7c4:	00c14783          	lbu	a5,12(sp)
     7c8:	fbed                	bnez	a5,7ba <spi_error_handler.isra.0+0x6e>
     7ca:	00d14783          	lbu	a5,13(sp)
     7ce:	f7f5                	bnez	a5,7ba <spi_error_handler.isra.0+0x6e>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     7d0:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     7d2:	c0000737          	lui	a4,0xc0000
     7d6:	177d                	addi	a4,a4,-1 # bfffffff <_lma_data_end+0x7fff13bf>
     7d8:	8ff9                	and	a5,a5,a4
     7da:	ca9c                	sw	a5,16(a3)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     7dc:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     7de:	80000637          	lui	a2,0x80000
     7e2:	20000737          	lui	a4,0x20000
     7e6:	8fd1                	or	a5,a5,a2
     7e8:	ca9c                	sw	a5,16(a3)
}

spi_return_flags_e spi_output_enable(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     7ea:	4a9c                	lw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     7ec:	04800613          	li	a2,72
     7f0:	8fd9                	or	a5,a5,a4
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     7f2:	ca9c                	sw	a5,16(a3)
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
     7f4:	5a9c                	lw	a5,48(a3)
     7f6:	01f7e793          	ori	a5,a5,31
     7fa:	da9c                	sw	a5,48(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     7fc:	42dc                	lw	a5,4(a3)
     7fe:	0017e793          	ori	a5,a5,1
     802:	c2dc                	sw	a5,4(a3)
    spi_set_tx_watermark(peri->instance, peri->txwm);
     804:	0044c783          	lbu	a5,4(s1)
    spi_set_rx_watermark(peri->instance, peri->rxwm);
     808:	0054c703          	lbu	a4,5(s1)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     80c:	00f66a63          	bltu	a2,a5,820 <spi_error_handler.isra.0+0xd4>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     810:	4a90                	lw	a2,16(a3)
  bitfield &= ~(mask << index);
     812:	75c1                	lui	a1,0xffff0
     814:	0ff58593          	addi	a1,a1,255 # ffff00ff <_lma_data_end+0xbffe14bf>
  bitfield |= (value & mask) << index;
     818:	07a2                	slli	a5,a5,0x8
  bitfield &= ~(mask << index);
     81a:	8e6d                	and	a2,a2,a1
  bitfield |= (value & mask) << index;
     81c:	8fd1                	or	a5,a5,a2
     81e:	ca9c                	sw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     820:	04000793          	li	a5,64
     824:	00e7e763          	bltu	a5,a4,832 <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     828:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     82a:	f007f793          	andi	a5,a5,-256
  bitfield |= (value & mask) << index;
     82e:	8f5d                	or	a4,a4,a5
     830:	ca98                	sw	a4,16(a3)
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
}
     832:	40f2                	lw	ra,28(sp)
    peri->state = SPI_STATE_ERROR;
     834:	47a1                	li	a5,8
    peri->last_id = 0;
     836:	0004a423          	sw	zero,8(s1)
    peri->state = SPI_STATE_ERROR;
     83a:	c89c                	sw	a5,16(s1)
}
     83c:	44e2                	lw	s1,24(sp)
     83e:	6105                	addi	sp,sp,32
     840:	8082                	ret

00000842 <spi_get_events.isra.0>:
     842:	495c                	lw	a5,20(a0)
/**                                                                        **/
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

spi_return_flags_e spi_get_events(spi_host_t* spi, spi_event_e* events) {
     844:	1141                	addi	sp,sp,-16
  bitfield &= ~(mask << index);
     846:	0005a803          	lw	a6,0(a1)
     84a:	c63e                	sw	a5,12(sp)
    volatile spi_status_t status = spi_get_status(spi);
    // Also, we do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     84c:	47b2                	lw	a5,12(sp)
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     84e:	46b2                	lw	a3,12(sp)
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     850:	4532                	lw	a0,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     852:	83e5                	srli	a5,a5,0x19
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     854:	4732                	lw	a4,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     856:	8b85                	andi	a5,a5,1
  bitfield |= (value & mask) << index;
     858:	ffc87813          	andi	a6,a6,-4
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     85c:	82ed                	srli	a3,a3,0x1b
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     85e:	4632                	lw	a2,12(sp)
  bitfield &= ~(mask << index);
     860:	00f86833          	or	a6,a6,a5
  bitfield |= (value & mask) << index;
     864:	8a89                	andi	a3,a3,2
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     866:	47b2                	lw	a5,12(sp)
     868:	0106e6b3          	or	a3,a3,a6
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     86c:	8149                	srli	a0,a0,0x12
     86e:	9acd                	andi	a3,a3,-13
     870:	8911                	andi	a0,a0,4
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     872:	835d                	srli	a4,a4,0x17
  bitfield &= ~(mask << index);
     874:	8ec9                	or	a3,a3,a0
  bitfield |= (value & mask) << index;
     876:	8b21                	andi	a4,a4,8
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     878:	83f9                	srli	a5,a5,0x1e
     87a:	8f55                	or	a4,a4,a3
     87c:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     87e:	01f65693          	srli	a3,a2,0x1f
     882:	fcf77713          	andi	a4,a4,-49
     886:	0692                	slli	a3,a3,0x4
     888:	0017c793          	xori	a5,a5,1
  bitfield &= ~(mask << index);
     88c:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     88e:	0796                	slli	a5,a5,0x5
     890:	8fd9                	or	a5,a5,a4
    *events = bitfield_write(*events, BIT_MASK_1, 
     892:	c19c                	sw	a5,0(a1)
    return SPI_FLAG_OK;
}
     894:	0141                	addi	sp,sp,16
     896:	8082                	ret

00000898 <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     898:	1141                	addi	sp,sp,-16
     89a:	c426                	sw	s1,8(sp)
     89c:	c606                	sw	ra,12(sp)
     89e:	84aa                	mv	s1,a0
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     8a0:	282020ef          	jal	2b22 <strlen>
}
     8a4:	40b2                	lw	ra,12(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     8a6:	85a6                	mv	a1,s1
}
     8a8:	44a2                	lw	s1,8(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     8aa:	00150613          	addi	a2,a0,1
     8ae:	4505                	li	a0,1
}
     8b0:	0141                	addi	sp,sp,16
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     8b2:	b169                	j	53c <_write>

000008b4 <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     8b4:	1101                	addi	sp,sp,-32
     8b6:	ce06                	sw	ra,28(sp)
     8b8:	cc26                	sw	s1,24(sp)
  _writestr(msg );
     8ba:	3ff9                	jal	898 <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     8bc:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     8c0:	6511                	lui	a0,0x4
     8c2:	78c50513          	addi	a0,a0,1932 # 478c <zetas_DSA+0x5c0>
     8c6:	3fc9                	jal	898 <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     8c8:	01049793          	slli	a5,s1,0x10
     8cc:	83c1                	srli	a5,a5,0x10
     8ce:	00849713          	slli	a4,s1,0x8
     8d2:	83a1                	srli	a5,a5,0x8
     8d4:	0184d693          	srli	a3,s1,0x18
     8d8:	8fd9                	or	a5,a5,a4
     8da:	80c1                	srli	s1,s1,0x10
     8dc:	4729                	li	a4,10
  _writestr(p);
     8de:	0028                	addi	a0,sp,8
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     8e0:	00d10423          	sb	a3,8(sp)
     8e4:	009104a3          	sb	s1,9(sp)
     8e8:	00f11523          	sh	a5,10(sp)
     8ec:	00e11623          	sh	a4,12(sp)
  _writestr(p);
     8f0:	3765                	jal	898 <_writestr>
  while (1) {
     8f2:	a001                	j	8f2 <print_exc_msg+0x3e>

000008f4 <dilithium_ntt>:
int32_t caddq(int32_t a) {
    a += (a >> 31) & DSA_Q;
    return a;
}

void dilithium_ntt(int32_t a[DSA_N]) {
     8f4:	7179                	addi	sp,sp,-48
     8f6:	ce56                	sw	s5,28(sp)
    unsigned int len, start, j, k = 0;
    int32_t zeta, t;
    for (len = 128; len > 0; len >>= 1) {
        for (start = 0; start < DSA_N; start = j + len) {
            zeta = zetas_DSA[++k];
     8f8:	6819                	lui	a6,0x6
     8fa:	6a91                	lui	s5,0x4
    int32_t t = (int32_t)a * DSA_QINV;
     8fc:	03802e37          	lui	t3,0x3802
void dilithium_ntt(int32_t a[DSA_N]) {
     900:	d44a                	sw	s2,40(sp)
     902:	d052                	sw	s4,32(sp)
     904:	d626                	sw	s1,44(sp)
     906:	d24e                	sw	s3,36(sp)
     908:	cc5a                	sw	s6,24(sp)
     90a:	ca5e                	sw	s7,20(sp)
     90c:	c862                	sw	s8,16(sp)
     90e:	c666                	sw	s9,12(sp)
     910:	c46a                	sw	s10,8(sp)
     912:	8faa                	mv	t6,a0
            zeta = zetas_DSA[++k];
     914:	4f780813          	addi	a6,a6,1271 # 64f7 <fast_intr_ctrl.c.7d037d2d+0x2db>
     918:	1cca8a93          	addi	s5,s5,460 # 41cc <zetas_DSA>
    int32_t t = (int32_t)a * DSA_QINV;
     91c:	0e05                	addi	t3,t3,1 # 3802001 <_sp+0x37c33c1>
            zeta = zetas_DSA[++k];
     91e:	4a21                	li	s4,8
    unsigned int len, start, j, k = 0;
     920:	4f01                	li	t5,0
    for (len = 128; len > 0; len >>= 1) {
     922:	08000393          	li	t2,128
        for (start = 0; start < DSA_N; start = j + len) {
     926:	0ff00913          	li	s2,255
     92a:	002f0e93          	addi	t4,t5,2
     92e:	0e8a                	slli	t4,t4,0x2
     930:	9ed6                	add	t4,t4,s5
     932:	4301                	li	t1,0
     934:	00138493          	addi	s1,t2,1
     938:	fff38993          	addi	s3,t2,-1
            for (j = start; j < start + len; ++j) {
     93c:	006388b3          	add	a7,t2,t1
     940:	00289613          	slli	a2,a7,0x2
     944:	00231693          	slli	a3,t1,0x2
     948:	967e                	add	a2,a2,t6
     94a:	96fe                	add	a3,a3,t6
            zeta = zetas_DSA[++k];
     94c:	001f0293          	addi	t0,t5,1
            for (j = start; j < start + len; ++j) {
     950:	851a                	mv	a0,t1
                t = montgomery_reduce_dsa((int64_t)zeta * a[j + len]);
     952:	00062b83          	lw	s7,0(a2) # 80000000 <_lma_data_end+0x3fff13c0>
                a[j + len] = a[j] - t;
     956:	428c                	lw	a1,0(a3)
            for (j = start; j < start + len; ++j) {
     958:	0505                	addi	a0,a0,1
                t = montgomery_reduce_dsa((int64_t)zeta * a[j + len]);
     95a:	03780c33          	mul	s8,a6,s7
            for (j = start; j < start + len; ++j) {
     95e:	0611                	addi	a2,a2,4
     960:	0691                	addi	a3,a3,4
    int32_t t = (int32_t)a * DSA_QINV;
     962:	03cc0b33          	mul	s6,s8,t3
                t = montgomery_reduce_dsa((int64_t)zeta * a[j + len]);
     966:	03781bb3          	mulh	s7,a6,s7
    return (a - (int64_t)t * DSA_Q) >> 32;
     96a:	41fb5d13          	srai	s10,s6,0x1f
     96e:	016b5793          	srli	a5,s6,0x16
     972:	00ab1c93          	slli	s9,s6,0xa
     976:	00ad1713          	slli	a4,s10,0xa
     97a:	419b0cb3          	sub	s9,s6,s9
     97e:	8f5d                	or	a4,a4,a5
     980:	40ed0733          	sub	a4,s10,a4
     984:	019b37b3          	sltu	a5,s6,s9
     988:	8f1d                	sub	a4,a4,a5
     98a:	00d71793          	slli	a5,a4,0xd
     98e:	013cd713          	srli	a4,s9,0x13
     992:	0cb6                	slli	s9,s9,0xd
     994:	416c8b33          	sub	s6,s9,s6
     998:	8fd9                	or	a5,a5,a4
     99a:	41a78733          	sub	a4,a5,s10
     99e:	016cbcb3          	sltu	s9,s9,s6
     9a2:	41970733          	sub	a4,a4,s9
     9a6:	018b07b3          	add	a5,s6,s8
     9aa:	975e                	add	a4,a4,s7
     9ac:	0167b7b3          	sltu	a5,a5,s6
     9b0:	97ba                	add	a5,a5,a4
                a[j + len] = a[j] - t;
     9b2:	8d9d                	sub	a1,a1,a5
     9b4:	feb62e23          	sw	a1,-4(a2)
                a[j] = a[j] + t;
     9b8:	ffc6a703          	lw	a4,-4(a3)
     9bc:	97ba                	add	a5,a5,a4
     9be:	fef6ae23          	sw	a5,-4(a3)
            for (j = start; j < start + len; ++j) {
     9c2:	f91568e3          	bltu	a0,a7,952 <dilithium_ntt+0x5e>
     9c6:	00130793          	addi	a5,t1,1
     9ca:	4701                	li	a4,0
     9cc:	00f8e363          	bltu	a7,a5,9d2 <dilithium_ntt+0xde>
     9d0:	874e                	mv	a4,s3
     9d2:	9326                	add	t1,t1,s1
        for (start = 0; start < DSA_N; start = j + len) {
     9d4:	933a                	add	t1,t1,a4
     9d6:	00696763          	bltu	s2,t1,9e4 <dilithium_ntt+0xf0>
            zeta = zetas_DSA[++k];
     9da:	000ea803          	lw	a6,0(t4)
     9de:	8f16                	mv	t5,t0
     9e0:	0e91                	addi	t4,t4,4
     9e2:	bfa9                	j	93c <dilithium_ntt+0x48>
    for (len = 128; len > 0; len >>= 1) {
     9e4:	1a7d                	addi	s4,s4,-1
     9e6:	0013d393          	srli	t2,t2,0x1
     9ea:	000a0a63          	beqz	s4,9fe <dilithium_ntt+0x10a>
            zeta = zetas_DSA[++k];
     9ee:	002f0793          	addi	a5,t5,2
     9f2:	078a                	slli	a5,a5,0x2
     9f4:	97d6                	add	a5,a5,s5
     9f6:	0007a803          	lw	a6,0(a5)
     9fa:	8f16                	mv	t5,t0
     9fc:	b73d                	j	92a <dilithium_ntt+0x36>
            }
        }
    }
}
     9fe:	54b2                	lw	s1,44(sp)
     a00:	5922                	lw	s2,40(sp)
     a02:	5992                	lw	s3,36(sp)
     a04:	5a02                	lw	s4,32(sp)
     a06:	4af2                	lw	s5,28(sp)
     a08:	4b62                	lw	s6,24(sp)
     a0a:	4bd2                	lw	s7,20(sp)
     a0c:	4c42                	lw	s8,16(sp)
     a0e:	4cb2                	lw	s9,12(sp)
     a10:	4d22                	lw	s10,8(sp)
     a12:	6145                	addi	sp,sp,48
     a14:	8082                	ret
	...

00000a18 <handler_irq_fast_spi>:
    // call the weak fic handler
    fic_irq_ext_peripheral();
}

void handler_irq_fast_spi(void)
{
     a18:	710d                	addi	sp,sp,-352
     a1a:	14112e23          	sw	ra,348(sp)
     a1e:	14512c23          	sw	t0,344(sp)
     a22:	003022f3          	frcsr	t0
     a26:	14a12423          	sw	a0,328(sp)
     a2a:	12e12c23          	sw	a4,312(sp)
     a2e:	12f12a23          	sw	a5,308(sp)
     a32:	14512a23          	sw	t0,340(sp)
     a36:	14612823          	sw	t1,336(sp)
     a3a:	14712623          	sw	t2,332(sp)
     a3e:	14b12223          	sw	a1,324(sp)
     a42:	14c12023          	sw	a2,320(sp)
     a46:	12d12e23          	sw	a3,316(sp)
     a4a:	13012823          	sw	a6,304(sp)
     a4e:	13112623          	sw	a7,300(sp)
     a52:	13c12423          	sw	t3,296(sp)
     a56:	13d12223          	sw	t4,292(sp)
     a5a:	13e12023          	sw	t5,288(sp)
     a5e:	11f12e23          	sw	t6,284(sp)
     a62:	a602                	fsd	ft0,264(sp)
     a64:	a206                	fsd	ft1,256(sp)
     a66:	bd8a                	fsd	ft2,248(sp)
     a68:	b98e                	fsd	ft3,240(sp)
     a6a:	b592                	fsd	ft4,232(sp)
     a6c:	b196                	fsd	ft5,224(sp)
     a6e:	ad9a                	fsd	ft6,216(sp)
     a70:	a99e                	fsd	ft7,208(sp)
     a72:	a5a2                	fsd	fs0,200(sp)
     a74:	a1a6                	fsd	fs1,192(sp)
     a76:	bd2a                	fsd	fa0,184(sp)
     a78:	b92e                	fsd	fa1,176(sp)
     a7a:	b532                	fsd	fa2,168(sp)
     a7c:	b136                	fsd	fa3,160(sp)
     a7e:	ad3a                	fsd	fa4,152(sp)
     a80:	a93e                	fsd	fa5,144(sp)
     a82:	a542                	fsd	fa6,136(sp)
     a84:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     a86:	200607b7          	lui	a5,0x20060
{
     a8a:	bcca                	fsd	fs2,120(sp)
     a8c:	b8ce                	fsd	fs3,112(sp)
     a8e:	b4d2                	fsd	fs4,104(sp)
     a90:	b0d6                	fsd	fs5,96(sp)
     a92:	acda                	fsd	fs6,88(sp)
     a94:	a8de                	fsd	fs7,80(sp)
     a96:	a4e2                	fsd	fs8,72(sp)
     a98:	a0e6                	fsd	fs9,64(sp)
     a9a:	bc6a                	fsd	fs10,56(sp)
     a9c:	b86e                	fsd	fs11,48(sp)
     a9e:	b472                	fsd	ft8,40(sp)
     aa0:	b076                	fsd	ft9,32(sp)
     aa2:	ac7a                	fsd	ft10,24(sp)
     aa4:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     aa6:	4741                	li	a4,16
     aa8:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     aaa:	30010537          	lui	a0,0x30010
     aae:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     ab0:	03f7f793          	andi	a5,a5,63
    if (errors) {
     ab4:	cfd9                	beqz	a5,b52 <handler_irq_fast_spi+0x13a>
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     ab6:	67bd                	lui	a5,0xf
     ab8:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     abc:	4fb8                	lw	a4,88(a5)
     abe:	4789                	li	a5,2
     ac0:	0af70c63          	beq	a4,a5,b78 <handler_irq_fast_spi+0x160>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
    // call the weak fic handler
    fic_irq_spi();
}
     ac4:	15c12083          	lw	ra,348(sp)
     ac8:	15412283          	lw	t0,340(sp)
     acc:	00329073          	fscsr	t0
     ad0:	15812283          	lw	t0,344(sp)
     ad4:	15012303          	lw	t1,336(sp)
     ad8:	14c12383          	lw	t2,332(sp)
     adc:	14812503          	lw	a0,328(sp)
     ae0:	14412583          	lw	a1,324(sp)
     ae4:	14012603          	lw	a2,320(sp)
     ae8:	13c12683          	lw	a3,316(sp)
     aec:	13812703          	lw	a4,312(sp)
     af0:	13412783          	lw	a5,308(sp)
     af4:	13012803          	lw	a6,304(sp)
     af8:	12c12883          	lw	a7,300(sp)
     afc:	12812e03          	lw	t3,296(sp)
     b00:	12412e83          	lw	t4,292(sp)
     b04:	12012f03          	lw	t5,288(sp)
     b08:	11c12f83          	lw	t6,284(sp)
     b0c:	2032                	fld	ft0,264(sp)
     b0e:	2092                	fld	ft1,256(sp)
     b10:	316e                	fld	ft2,248(sp)
     b12:	31ce                	fld	ft3,240(sp)
     b14:	322e                	fld	ft4,232(sp)
     b16:	328e                	fld	ft5,224(sp)
     b18:	236e                	fld	ft6,216(sp)
     b1a:	23ce                	fld	ft7,208(sp)
     b1c:	242e                	fld	fs0,200(sp)
     b1e:	248e                	fld	fs1,192(sp)
     b20:	356a                	fld	fa0,184(sp)
     b22:	35ca                	fld	fa1,176(sp)
     b24:	362a                	fld	fa2,168(sp)
     b26:	368a                	fld	fa3,160(sp)
     b28:	276a                	fld	fa4,152(sp)
     b2a:	27ca                	fld	fa5,144(sp)
     b2c:	282a                	fld	fa6,136(sp)
     b2e:	288a                	fld	fa7,128(sp)
     b30:	3966                	fld	fs2,120(sp)
     b32:	39c6                	fld	fs3,112(sp)
     b34:	3a26                	fld	fs4,104(sp)
     b36:	3a86                	fld	fs5,96(sp)
     b38:	2b66                	fld	fs6,88(sp)
     b3a:	2bc6                	fld	fs7,80(sp)
     b3c:	2c26                	fld	fs8,72(sp)
     b3e:	2c86                	fld	fs9,64(sp)
     b40:	3d62                	fld	fs10,56(sp)
     b42:	3dc2                	fld	fs11,48(sp)
     b44:	3e22                	fld	ft8,40(sp)
     b46:	3e82                	fld	ft9,32(sp)
     b48:	2f62                	fld	ft10,24(sp)
     b4a:	2fc2                	fld	ft11,16(sp)
     b4c:	6135                	addi	sp,sp,352
     b4e:	30200073          	mret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     b52:	411c                	lw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     b54:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
     b56:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     b5a:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     b5c:	31dd                	jal	842 <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     b5e:	67bd                	lui	a5,0xf
     b60:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     b64:	4fb8                	lw	a4,88(a5)
     b66:	4789                	li	a5,2
     b68:	f4f71ee3          	bne	a4,a5,ac4 <handler_irq_fast_spi+0xac>
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     b6c:	45b2                	lw	a1,12(sp)
     b6e:	653d                	lui	a0,0xf
     b70:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     b74:	3c95                	jal	5e8 <spi_event_handler>
     b76:	b7b9                	j	ac4 <handler_irq_fast_spi+0xac>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     b78:	653d                	lui	a0,0xf
     b7a:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     b7e:	36f9                	jal	74c <spi_error_handler.isra.0>
     b80:	b791                	j	ac4 <handler_irq_fast_spi+0xac>
	...

00000b84 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     b84:	710d                	addi	sp,sp,-352
     b86:	14112e23          	sw	ra,348(sp)
     b8a:	14512c23          	sw	t0,344(sp)
     b8e:	003022f3          	frcsr	t0
     b92:	14a12423          	sw	a0,328(sp)
     b96:	12e12c23          	sw	a4,312(sp)
     b9a:	12f12a23          	sw	a5,308(sp)
     b9e:	14512a23          	sw	t0,340(sp)
     ba2:	14612823          	sw	t1,336(sp)
     ba6:	14712623          	sw	t2,332(sp)
     baa:	14b12223          	sw	a1,324(sp)
     bae:	14c12023          	sw	a2,320(sp)
     bb2:	12d12e23          	sw	a3,316(sp)
     bb6:	13012823          	sw	a6,304(sp)
     bba:	13112623          	sw	a7,300(sp)
     bbe:	13c12423          	sw	t3,296(sp)
     bc2:	13d12223          	sw	t4,292(sp)
     bc6:	13e12023          	sw	t5,288(sp)
     bca:	11f12e23          	sw	t6,284(sp)
     bce:	a602                	fsd	ft0,264(sp)
     bd0:	a206                	fsd	ft1,256(sp)
     bd2:	bd8a                	fsd	ft2,248(sp)
     bd4:	b98e                	fsd	ft3,240(sp)
     bd6:	b592                	fsd	ft4,232(sp)
     bd8:	b196                	fsd	ft5,224(sp)
     bda:	ad9a                	fsd	ft6,216(sp)
     bdc:	a99e                	fsd	ft7,208(sp)
     bde:	a5a2                	fsd	fs0,200(sp)
     be0:	a1a6                	fsd	fs1,192(sp)
     be2:	bd2a                	fsd	fa0,184(sp)
     be4:	b92e                	fsd	fa1,176(sp)
     be6:	b532                	fsd	fa2,168(sp)
     be8:	b136                	fsd	fa3,160(sp)
     bea:	ad3a                	fsd	fa4,152(sp)
     bec:	a93e                	fsd	fa5,144(sp)
     bee:	a542                	fsd	fa6,136(sp)
     bf0:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     bf2:	200607b7          	lui	a5,0x20060
{
     bf6:	bcca                	fsd	fs2,120(sp)
     bf8:	b8ce                	fsd	fs3,112(sp)
     bfa:	b4d2                	fsd	fs4,104(sp)
     bfc:	b0d6                	fsd	fs5,96(sp)
     bfe:	acda                	fsd	fs6,88(sp)
     c00:	a8de                	fsd	fs7,80(sp)
     c02:	a4e2                	fsd	fs8,72(sp)
     c04:	a0e6                	fsd	fs9,64(sp)
     c06:	bc6a                	fsd	fs10,56(sp)
     c08:	b86e                	fsd	fs11,48(sp)
     c0a:	b472                	fsd	ft8,40(sp)
     c0c:	b076                	fsd	ft9,32(sp)
     c0e:	ac7a                	fsd	ft10,24(sp)
     c10:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     c12:	02000713          	li	a4,32
     c16:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     c18:	20020537          	lui	a0,0x20020
     c1c:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     c1e:	03f7f793          	andi	a5,a5,63
    if (errors) {
     c22:	cfd9                	beqz	a5,cc0 <handler_irq_fast_spi_flash+0x13c>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     c24:	653d                	lui	a0,0xf
     c26:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
     c2a:	4b98                	lw	a4,16(a5)
     c2c:	4789                	li	a5,2
     c2e:	0af70b63          	beq	a4,a5,ce4 <handler_irq_fast_spi_flash+0x160>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
    // call the weak fic handler
    fic_irq_spi_flash();
}
     c32:	15c12083          	lw	ra,348(sp)
     c36:	15412283          	lw	t0,340(sp)
     c3a:	00329073          	fscsr	t0
     c3e:	15812283          	lw	t0,344(sp)
     c42:	15012303          	lw	t1,336(sp)
     c46:	14c12383          	lw	t2,332(sp)
     c4a:	14812503          	lw	a0,328(sp)
     c4e:	14412583          	lw	a1,324(sp)
     c52:	14012603          	lw	a2,320(sp)
     c56:	13c12683          	lw	a3,316(sp)
     c5a:	13812703          	lw	a4,312(sp)
     c5e:	13412783          	lw	a5,308(sp)
     c62:	13012803          	lw	a6,304(sp)
     c66:	12c12883          	lw	a7,300(sp)
     c6a:	12812e03          	lw	t3,296(sp)
     c6e:	12412e83          	lw	t4,292(sp)
     c72:	12012f03          	lw	t5,288(sp)
     c76:	11c12f83          	lw	t6,284(sp)
     c7a:	2032                	fld	ft0,264(sp)
     c7c:	2092                	fld	ft1,256(sp)
     c7e:	316e                	fld	ft2,248(sp)
     c80:	31ce                	fld	ft3,240(sp)
     c82:	322e                	fld	ft4,232(sp)
     c84:	328e                	fld	ft5,224(sp)
     c86:	236e                	fld	ft6,216(sp)
     c88:	23ce                	fld	ft7,208(sp)
     c8a:	242e                	fld	fs0,200(sp)
     c8c:	248e                	fld	fs1,192(sp)
     c8e:	356a                	fld	fa0,184(sp)
     c90:	35ca                	fld	fa1,176(sp)
     c92:	362a                	fld	fa2,168(sp)
     c94:	368a                	fld	fa3,160(sp)
     c96:	276a                	fld	fa4,152(sp)
     c98:	27ca                	fld	fa5,144(sp)
     c9a:	282a                	fld	fa6,136(sp)
     c9c:	288a                	fld	fa7,128(sp)
     c9e:	3966                	fld	fs2,120(sp)
     ca0:	39c6                	fld	fs3,112(sp)
     ca2:	3a26                	fld	fs4,104(sp)
     ca4:	3a86                	fld	fs5,96(sp)
     ca6:	2b66                	fld	fs6,88(sp)
     ca8:	2bc6                	fld	fs7,80(sp)
     caa:	2c26                	fld	fs8,72(sp)
     cac:	2c86                	fld	fs9,64(sp)
     cae:	3d62                	fld	fs10,56(sp)
     cb0:	3dc2                	fld	fs11,48(sp)
     cb2:	3e22                	fld	ft8,40(sp)
     cb4:	3e82                	fld	ft9,32(sp)
     cb6:	2f62                	fld	ft10,24(sp)
     cb8:	2fc2                	fld	ft11,16(sp)
     cba:	6135                	addi	sp,sp,352
     cbc:	30200073          	mret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     cc0:	411c                	lw	a5,0(a0)
        spi_get_events(spi_flash, &events);
     cc2:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
     cc4:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     cc8:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_flash, &events);
     cca:	3ea5                	jal	842 <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     ccc:	653d                	lui	a0,0xf
     cce:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
     cd2:	4b98                	lw	a4,16(a5)
     cd4:	4789                	li	a5,2
     cd6:	f4f71ee3          	bne	a4,a5,c32 <handler_irq_fast_spi_flash+0xae>
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
     cda:	45b2                	lw	a1,12(sp)
     cdc:	80050513          	addi	a0,a0,-2048
     ce0:	3221                	jal	5e8 <spi_event_handler>
     ce2:	bf81                	j	c32 <handler_irq_fast_spi_flash+0xae>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
     ce4:	80050513          	addi	a0,a0,-2048
     ce8:	3495                	jal	74c <spi_error_handler.isra.0>
     cea:	b7a1                	j	c32 <handler_irq_fast_spi_flash+0xae>

00000cec <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     cec:	710d                	addi	sp,sp,-352
     cee:	14112e23          	sw	ra,348(sp)
     cf2:	14512c23          	sw	t0,344(sp)
     cf6:	003022f3          	frcsr	t0
     cfa:	14512a23          	sw	t0,340(sp)
     cfe:	14612823          	sw	t1,336(sp)
     d02:	14712623          	sw	t2,332(sp)
     d06:	14912423          	sw	s1,328(sp)
     d0a:	14a12223          	sw	a0,324(sp)
     d0e:	14b12023          	sw	a1,320(sp)
     d12:	12c12e23          	sw	a2,316(sp)
     d16:	12d12c23          	sw	a3,312(sp)
     d1a:	12e12a23          	sw	a4,308(sp)
     d1e:	12f12823          	sw	a5,304(sp)
     d22:	13012623          	sw	a6,300(sp)
     d26:	13112423          	sw	a7,296(sp)
     d2a:	13212223          	sw	s2,292(sp)
     d2e:	13c12023          	sw	t3,288(sp)
     d32:	11d12e23          	sw	t4,284(sp)
     d36:	11e12c23          	sw	t5,280(sp)
     d3a:	11f12a23          	sw	t6,276(sp)
     d3e:	bd82                	fsd	ft0,248(sp)
     d40:	b986                	fsd	ft1,240(sp)
     d42:	b58a                	fsd	ft2,232(sp)
     d44:	b18e                	fsd	ft3,224(sp)
     d46:	ad92                	fsd	ft4,216(sp)
     d48:	a996                	fsd	ft5,208(sp)
     d4a:	a59a                	fsd	ft6,200(sp)
     d4c:	a19e                	fsd	ft7,192(sp)
     d4e:	bd22                	fsd	fs0,184(sp)
     d50:	b926                	fsd	fs1,176(sp)
     d52:	b52a                	fsd	fa0,168(sp)
     d54:	b12e                	fsd	fa1,160(sp)
     d56:	ad32                	fsd	fa2,152(sp)
     d58:	a936                	fsd	fa3,144(sp)
     d5a:	a53a                	fsd	fa4,136(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
     d5c:	300004b7          	lui	s1,0x30000
{
     d60:	a13e                	fsd	fa5,128(sp)
  *claim_data = rv_plic_peri->CC0;
     d62:	20c4a903          	lw	s2,524(s1) # 3000020c <_sp+0x2ffc15cc>
{
     d66:	bcc2                	fsd	fa6,120(sp)
     d68:	b8c6                	fsd	fa7,112(sp)
     d6a:	b4ca                	fsd	fs2,104(sp)
     d6c:	b0ce                	fsd	fs3,96(sp)
     d6e:	acd2                	fsd	fs4,88(sp)
     d70:	a8d6                	fsd	fs5,80(sp)
     d72:	a4da                	fsd	fs6,72(sp)
     d74:	a0de                	fsd	fs7,64(sp)
     d76:	bc62                	fsd	fs8,56(sp)
     d78:	b866                	fsd	fs9,48(sp)
     d7a:	b46a                	fsd	fs10,40(sp)
     d7c:	b06e                	fsd	fs11,32(sp)
     d7e:	ac72                	fsd	ft8,24(sp)
     d80:	a876                	fsd	ft9,16(sp)
     d82:	a47a                	fsd	ft10,8(sp)
     d84:	a07e                	fsd	ft11,0(sp)
    handlers[int_id](int_id);
     d86:	4781                	li	a5,0
     d88:	854a                	mv	a0,s2
     d8a:	9782                	jalr	a5
}
     d8c:	15c12083          	lw	ra,348(sp)
     d90:	15412283          	lw	t0,340(sp)
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     d94:	2124a623          	sw	s2,524(s1)
}
     d98:	00329073          	fscsr	t0
     d9c:	15812283          	lw	t0,344(sp)
     da0:	15012303          	lw	t1,336(sp)
     da4:	14c12383          	lw	t2,332(sp)
     da8:	14812483          	lw	s1,328(sp)
     dac:	14412503          	lw	a0,324(sp)
     db0:	14012583          	lw	a1,320(sp)
     db4:	13c12603          	lw	a2,316(sp)
     db8:	13812683          	lw	a3,312(sp)
     dbc:	13412703          	lw	a4,308(sp)
     dc0:	13012783          	lw	a5,304(sp)
     dc4:	12c12803          	lw	a6,300(sp)
     dc8:	12812883          	lw	a7,296(sp)
     dcc:	12412903          	lw	s2,292(sp)
     dd0:	12012e03          	lw	t3,288(sp)
     dd4:	11c12e83          	lw	t4,284(sp)
     dd8:	11812f03          	lw	t5,280(sp)
     ddc:	11412f83          	lw	t6,276(sp)
     de0:	306e                	fld	ft0,248(sp)
     de2:	30ce                	fld	ft1,240(sp)
     de4:	312e                	fld	ft2,232(sp)
     de6:	318e                	fld	ft3,224(sp)
     de8:	226e                	fld	ft4,216(sp)
     dea:	22ce                	fld	ft5,208(sp)
     dec:	232e                	fld	ft6,200(sp)
     dee:	238e                	fld	ft7,192(sp)
     df0:	346a                	fld	fs0,184(sp)
     df2:	34ca                	fld	fs1,176(sp)
     df4:	352a                	fld	fa0,168(sp)
     df6:	358a                	fld	fa1,160(sp)
     df8:	266a                	fld	fa2,152(sp)
     dfa:	26ca                	fld	fa3,144(sp)
     dfc:	272a                	fld	fa4,136(sp)
     dfe:	278a                	fld	fa5,128(sp)
     e00:	3866                	fld	fa6,120(sp)
     e02:	38c6                	fld	fa7,112(sp)
     e04:	3926                	fld	fs2,104(sp)
     e06:	3986                	fld	fs3,96(sp)
     e08:	2a66                	fld	fs4,88(sp)
     e0a:	2ac6                	fld	fs5,80(sp)
     e0c:	2b26                	fld	fs6,72(sp)
     e0e:	2b86                	fld	fs7,64(sp)
     e10:	3c62                	fld	fs8,56(sp)
     e12:	3cc2                	fld	fs9,48(sp)
     e14:	3d22                	fld	fs10,40(sp)
     e16:	3d82                	fld	fs11,32(sp)
     e18:	2e62                	fld	ft8,24(sp)
     e1a:	2ec2                	fld	ft9,16(sp)
     e1c:	2f22                	fld	ft10,8(sp)
     e1e:	2f82                	fld	ft11,0(sp)
     e20:	6135                	addi	sp,sp,352
     e22:	30200073          	mret
	...

00000e28 <handler_irq_fast_timer_1>:
{
     e28:	714d                	addi	sp,sp,-336
     e2a:	14112623          	sw	ra,332(sp)
     e2e:	14512423          	sw	t0,328(sp)
     e32:	003022f3          	frcsr	t0
     e36:	14512223          	sw	t0,324(sp)
     e3a:	14612023          	sw	t1,320(sp)
     e3e:	12712e23          	sw	t2,316(sp)
     e42:	12a12c23          	sw	a0,312(sp)
     e46:	12b12a23          	sw	a1,308(sp)
     e4a:	12c12823          	sw	a2,304(sp)
     e4e:	12d12623          	sw	a3,300(sp)
     e52:	12e12423          	sw	a4,296(sp)
     e56:	12f12223          	sw	a5,292(sp)
     e5a:	13012023          	sw	a6,288(sp)
     e5e:	11112e23          	sw	a7,284(sp)
     e62:	11c12c23          	sw	t3,280(sp)
     e66:	11d12a23          	sw	t4,276(sp)
     e6a:	11e12823          	sw	t5,272(sp)
     e6e:	11f12623          	sw	t6,268(sp)
     e72:	bd82                	fsd	ft0,248(sp)
     e74:	b986                	fsd	ft1,240(sp)
     e76:	b58a                	fsd	ft2,232(sp)
     e78:	b18e                	fsd	ft3,224(sp)
     e7a:	ad92                	fsd	ft4,216(sp)
     e7c:	a996                	fsd	ft5,208(sp)
     e7e:	a59a                	fsd	ft6,200(sp)
     e80:	a19e                	fsd	ft7,192(sp)
     e82:	bd22                	fsd	fs0,184(sp)
     e84:	b926                	fsd	fs1,176(sp)
     e86:	b52a                	fsd	fa0,168(sp)
     e88:	b12e                	fsd	fa1,160(sp)
     e8a:	ad32                	fsd	fa2,152(sp)
     e8c:	a936                	fsd	fa3,144(sp)
     e8e:	a53a                	fsd	fa4,136(sp)
     e90:	a13e                	fsd	fa5,128(sp)
     e92:	bcc2                	fsd	fa6,120(sp)
     e94:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e96:	200607b7          	lui	a5,0x20060
{
     e9a:	b4ca                	fsd	fs2,104(sp)
     e9c:	b0ce                	fsd	fs3,96(sp)
     e9e:	acd2                	fsd	fs4,88(sp)
     ea0:	a8d6                	fsd	fs5,80(sp)
     ea2:	a4da                	fsd	fs6,72(sp)
     ea4:	a0de                	fsd	fs7,64(sp)
     ea6:	bc62                	fsd	fs8,56(sp)
     ea8:	b866                	fsd	fs9,48(sp)
     eaa:	b46a                	fsd	fs10,40(sp)
     eac:	b06e                	fsd	fs11,32(sp)
     eae:	ac72                	fsd	ft8,24(sp)
     eb0:	a876                	fsd	ft9,16(sp)
     eb2:	a47a                	fsd	ft10,8(sp)
     eb4:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     eb6:	4705                	li	a4,1
     eb8:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
     eba:	e70ff0ef          	jal	52a <fic_irq_timer_1>
}
     ebe:	14c12083          	lw	ra,332(sp)
     ec2:	14412283          	lw	t0,324(sp)
     ec6:	00329073          	fscsr	t0
     eca:	14812283          	lw	t0,328(sp)
     ece:	14012303          	lw	t1,320(sp)
     ed2:	13c12383          	lw	t2,316(sp)
     ed6:	13812503          	lw	a0,312(sp)
     eda:	13412583          	lw	a1,308(sp)
     ede:	13012603          	lw	a2,304(sp)
     ee2:	12c12683          	lw	a3,300(sp)
     ee6:	12812703          	lw	a4,296(sp)
     eea:	12412783          	lw	a5,292(sp)
     eee:	12012803          	lw	a6,288(sp)
     ef2:	11c12883          	lw	a7,284(sp)
     ef6:	11812e03          	lw	t3,280(sp)
     efa:	11412e83          	lw	t4,276(sp)
     efe:	11012f03          	lw	t5,272(sp)
     f02:	10c12f83          	lw	t6,268(sp)
     f06:	306e                	fld	ft0,248(sp)
     f08:	30ce                	fld	ft1,240(sp)
     f0a:	312e                	fld	ft2,232(sp)
     f0c:	318e                	fld	ft3,224(sp)
     f0e:	226e                	fld	ft4,216(sp)
     f10:	22ce                	fld	ft5,208(sp)
     f12:	232e                	fld	ft6,200(sp)
     f14:	238e                	fld	ft7,192(sp)
     f16:	346a                	fld	fs0,184(sp)
     f18:	34ca                	fld	fs1,176(sp)
     f1a:	352a                	fld	fa0,168(sp)
     f1c:	358a                	fld	fa1,160(sp)
     f1e:	266a                	fld	fa2,152(sp)
     f20:	26ca                	fld	fa3,144(sp)
     f22:	272a                	fld	fa4,136(sp)
     f24:	278a                	fld	fa5,128(sp)
     f26:	3866                	fld	fa6,120(sp)
     f28:	38c6                	fld	fa7,112(sp)
     f2a:	3926                	fld	fs2,104(sp)
     f2c:	3986                	fld	fs3,96(sp)
     f2e:	2a66                	fld	fs4,88(sp)
     f30:	2ac6                	fld	fs5,80(sp)
     f32:	2b26                	fld	fs6,72(sp)
     f34:	2b86                	fld	fs7,64(sp)
     f36:	3c62                	fld	fs8,56(sp)
     f38:	3cc2                	fld	fs9,48(sp)
     f3a:	3d22                	fld	fs10,40(sp)
     f3c:	3d82                	fld	fs11,32(sp)
     f3e:	2e62                	fld	ft8,24(sp)
     f40:	2ec2                	fld	ft9,16(sp)
     f42:	2f22                	fld	ft10,8(sp)
     f44:	2f82                	fld	ft11,0(sp)
     f46:	6171                	addi	sp,sp,336
     f48:	30200073          	mret
     f4c:	0000                	unimp
	...

00000f50 <handler_irq_fast_timer_2>:
{
     f50:	714d                	addi	sp,sp,-336
     f52:	14112623          	sw	ra,332(sp)
     f56:	14512423          	sw	t0,328(sp)
     f5a:	003022f3          	frcsr	t0
     f5e:	14512223          	sw	t0,324(sp)
     f62:	14612023          	sw	t1,320(sp)
     f66:	12712e23          	sw	t2,316(sp)
     f6a:	12a12c23          	sw	a0,312(sp)
     f6e:	12b12a23          	sw	a1,308(sp)
     f72:	12c12823          	sw	a2,304(sp)
     f76:	12d12623          	sw	a3,300(sp)
     f7a:	12e12423          	sw	a4,296(sp)
     f7e:	12f12223          	sw	a5,292(sp)
     f82:	13012023          	sw	a6,288(sp)
     f86:	11112e23          	sw	a7,284(sp)
     f8a:	11c12c23          	sw	t3,280(sp)
     f8e:	11d12a23          	sw	t4,276(sp)
     f92:	11e12823          	sw	t5,272(sp)
     f96:	11f12623          	sw	t6,268(sp)
     f9a:	bd82                	fsd	ft0,248(sp)
     f9c:	b986                	fsd	ft1,240(sp)
     f9e:	b58a                	fsd	ft2,232(sp)
     fa0:	b18e                	fsd	ft3,224(sp)
     fa2:	ad92                	fsd	ft4,216(sp)
     fa4:	a996                	fsd	ft5,208(sp)
     fa6:	a59a                	fsd	ft6,200(sp)
     fa8:	a19e                	fsd	ft7,192(sp)
     faa:	bd22                	fsd	fs0,184(sp)
     fac:	b926                	fsd	fs1,176(sp)
     fae:	b52a                	fsd	fa0,168(sp)
     fb0:	b12e                	fsd	fa1,160(sp)
     fb2:	ad32                	fsd	fa2,152(sp)
     fb4:	a936                	fsd	fa3,144(sp)
     fb6:	a53a                	fsd	fa4,136(sp)
     fb8:	a13e                	fsd	fa5,128(sp)
     fba:	bcc2                	fsd	fa6,120(sp)
     fbc:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fbe:	200607b7          	lui	a5,0x20060
{
     fc2:	b4ca                	fsd	fs2,104(sp)
     fc4:	b0ce                	fsd	fs3,96(sp)
     fc6:	acd2                	fsd	fs4,88(sp)
     fc8:	a8d6                	fsd	fs5,80(sp)
     fca:	a4da                	fsd	fs6,72(sp)
     fcc:	a0de                	fsd	fs7,64(sp)
     fce:	bc62                	fsd	fs8,56(sp)
     fd0:	b866                	fsd	fs9,48(sp)
     fd2:	b46a                	fsd	fs10,40(sp)
     fd4:	b06e                	fsd	fs11,32(sp)
     fd6:	ac72                	fsd	ft8,24(sp)
     fd8:	a876                	fsd	ft9,16(sp)
     fda:	a47a                	fsd	ft10,8(sp)
     fdc:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fde:	4709                	li	a4,2
     fe0:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
     fe2:	d48ff0ef          	jal	52a <fic_irq_timer_1>
}
     fe6:	14c12083          	lw	ra,332(sp)
     fea:	14412283          	lw	t0,324(sp)
     fee:	00329073          	fscsr	t0
     ff2:	14812283          	lw	t0,328(sp)
     ff6:	14012303          	lw	t1,320(sp)
     ffa:	13c12383          	lw	t2,316(sp)
     ffe:	13812503          	lw	a0,312(sp)
    1002:	13412583          	lw	a1,308(sp)
    1006:	13012603          	lw	a2,304(sp)
    100a:	12c12683          	lw	a3,300(sp)
    100e:	12812703          	lw	a4,296(sp)
    1012:	12412783          	lw	a5,292(sp)
    1016:	12012803          	lw	a6,288(sp)
    101a:	11c12883          	lw	a7,284(sp)
    101e:	11812e03          	lw	t3,280(sp)
    1022:	11412e83          	lw	t4,276(sp)
    1026:	11012f03          	lw	t5,272(sp)
    102a:	10c12f83          	lw	t6,268(sp)
    102e:	306e                	fld	ft0,248(sp)
    1030:	30ce                	fld	ft1,240(sp)
    1032:	312e                	fld	ft2,232(sp)
    1034:	318e                	fld	ft3,224(sp)
    1036:	226e                	fld	ft4,216(sp)
    1038:	22ce                	fld	ft5,208(sp)
    103a:	232e                	fld	ft6,200(sp)
    103c:	238e                	fld	ft7,192(sp)
    103e:	346a                	fld	fs0,184(sp)
    1040:	34ca                	fld	fs1,176(sp)
    1042:	352a                	fld	fa0,168(sp)
    1044:	358a                	fld	fa1,160(sp)
    1046:	266a                	fld	fa2,152(sp)
    1048:	26ca                	fld	fa3,144(sp)
    104a:	272a                	fld	fa4,136(sp)
    104c:	278a                	fld	fa5,128(sp)
    104e:	3866                	fld	fa6,120(sp)
    1050:	38c6                	fld	fa7,112(sp)
    1052:	3926                	fld	fs2,104(sp)
    1054:	3986                	fld	fs3,96(sp)
    1056:	2a66                	fld	fs4,88(sp)
    1058:	2ac6                	fld	fs5,80(sp)
    105a:	2b26                	fld	fs6,72(sp)
    105c:	2b86                	fld	fs7,64(sp)
    105e:	3c62                	fld	fs8,56(sp)
    1060:	3cc2                	fld	fs9,48(sp)
    1062:	3d22                	fld	fs10,40(sp)
    1064:	3d82                	fld	fs11,32(sp)
    1066:	2e62                	fld	ft8,24(sp)
    1068:	2ec2                	fld	ft9,16(sp)
    106a:	2f22                	fld	ft10,8(sp)
    106c:	2f82                	fld	ft11,0(sp)
    106e:	6171                	addi	sp,sp,336
    1070:	30200073          	mret
    1074:	0000                	unimp
	...

00001078 <handler_irq_fast_timer_3>:
{
    1078:	714d                	addi	sp,sp,-336
    107a:	14112623          	sw	ra,332(sp)
    107e:	14512423          	sw	t0,328(sp)
    1082:	003022f3          	frcsr	t0
    1086:	14512223          	sw	t0,324(sp)
    108a:	14612023          	sw	t1,320(sp)
    108e:	12712e23          	sw	t2,316(sp)
    1092:	12a12c23          	sw	a0,312(sp)
    1096:	12b12a23          	sw	a1,308(sp)
    109a:	12c12823          	sw	a2,304(sp)
    109e:	12d12623          	sw	a3,300(sp)
    10a2:	12e12423          	sw	a4,296(sp)
    10a6:	12f12223          	sw	a5,292(sp)
    10aa:	13012023          	sw	a6,288(sp)
    10ae:	11112e23          	sw	a7,284(sp)
    10b2:	11c12c23          	sw	t3,280(sp)
    10b6:	11d12a23          	sw	t4,276(sp)
    10ba:	11e12823          	sw	t5,272(sp)
    10be:	11f12623          	sw	t6,268(sp)
    10c2:	bd82                	fsd	ft0,248(sp)
    10c4:	b986                	fsd	ft1,240(sp)
    10c6:	b58a                	fsd	ft2,232(sp)
    10c8:	b18e                	fsd	ft3,224(sp)
    10ca:	ad92                	fsd	ft4,216(sp)
    10cc:	a996                	fsd	ft5,208(sp)
    10ce:	a59a                	fsd	ft6,200(sp)
    10d0:	a19e                	fsd	ft7,192(sp)
    10d2:	bd22                	fsd	fs0,184(sp)
    10d4:	b926                	fsd	fs1,176(sp)
    10d6:	b52a                	fsd	fa0,168(sp)
    10d8:	b12e                	fsd	fa1,160(sp)
    10da:	ad32                	fsd	fa2,152(sp)
    10dc:	a936                	fsd	fa3,144(sp)
    10de:	a53a                	fsd	fa4,136(sp)
    10e0:	a13e                	fsd	fa5,128(sp)
    10e2:	bcc2                	fsd	fa6,120(sp)
    10e4:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    10e6:	200607b7          	lui	a5,0x20060
{
    10ea:	b4ca                	fsd	fs2,104(sp)
    10ec:	b0ce                	fsd	fs3,96(sp)
    10ee:	acd2                	fsd	fs4,88(sp)
    10f0:	a8d6                	fsd	fs5,80(sp)
    10f2:	a4da                	fsd	fs6,72(sp)
    10f4:	a0de                	fsd	fs7,64(sp)
    10f6:	bc62                	fsd	fs8,56(sp)
    10f8:	b866                	fsd	fs9,48(sp)
    10fa:	b46a                	fsd	fs10,40(sp)
    10fc:	b06e                	fsd	fs11,32(sp)
    10fe:	ac72                	fsd	ft8,24(sp)
    1100:	a876                	fsd	ft9,16(sp)
    1102:	a47a                	fsd	ft10,8(sp)
    1104:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1106:	4711                	li	a4,4
    1108:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
    110a:	c20ff0ef          	jal	52a <fic_irq_timer_1>
}
    110e:	14c12083          	lw	ra,332(sp)
    1112:	14412283          	lw	t0,324(sp)
    1116:	00329073          	fscsr	t0
    111a:	14812283          	lw	t0,328(sp)
    111e:	14012303          	lw	t1,320(sp)
    1122:	13c12383          	lw	t2,316(sp)
    1126:	13812503          	lw	a0,312(sp)
    112a:	13412583          	lw	a1,308(sp)
    112e:	13012603          	lw	a2,304(sp)
    1132:	12c12683          	lw	a3,300(sp)
    1136:	12812703          	lw	a4,296(sp)
    113a:	12412783          	lw	a5,292(sp)
    113e:	12012803          	lw	a6,288(sp)
    1142:	11c12883          	lw	a7,284(sp)
    1146:	11812e03          	lw	t3,280(sp)
    114a:	11412e83          	lw	t4,276(sp)
    114e:	11012f03          	lw	t5,272(sp)
    1152:	10c12f83          	lw	t6,268(sp)
    1156:	306e                	fld	ft0,248(sp)
    1158:	30ce                	fld	ft1,240(sp)
    115a:	312e                	fld	ft2,232(sp)
    115c:	318e                	fld	ft3,224(sp)
    115e:	226e                	fld	ft4,216(sp)
    1160:	22ce                	fld	ft5,208(sp)
    1162:	232e                	fld	ft6,200(sp)
    1164:	238e                	fld	ft7,192(sp)
    1166:	346a                	fld	fs0,184(sp)
    1168:	34ca                	fld	fs1,176(sp)
    116a:	352a                	fld	fa0,168(sp)
    116c:	358a                	fld	fa1,160(sp)
    116e:	266a                	fld	fa2,152(sp)
    1170:	26ca                	fld	fa3,144(sp)
    1172:	272a                	fld	fa4,136(sp)
    1174:	278a                	fld	fa5,128(sp)
    1176:	3866                	fld	fa6,120(sp)
    1178:	38c6                	fld	fa7,112(sp)
    117a:	3926                	fld	fs2,104(sp)
    117c:	3986                	fld	fs3,96(sp)
    117e:	2a66                	fld	fs4,88(sp)
    1180:	2ac6                	fld	fs5,80(sp)
    1182:	2b26                	fld	fs6,72(sp)
    1184:	2b86                	fld	fs7,64(sp)
    1186:	3c62                	fld	fs8,56(sp)
    1188:	3cc2                	fld	fs9,48(sp)
    118a:	3d22                	fld	fs10,40(sp)
    118c:	3d82                	fld	fs11,32(sp)
    118e:	2e62                	fld	ft8,24(sp)
    1190:	2ec2                	fld	ft9,16(sp)
    1192:	2f22                	fld	ft10,8(sp)
    1194:	2f82                	fld	ft11,0(sp)
    1196:	6171                	addi	sp,sp,336
    1198:	30200073          	mret
    119c:	0000                	unimp
	...

000011a0 <handler_irq_fast_external_peripheral>:
{
    11a0:	714d                	addi	sp,sp,-336
    11a2:	14112623          	sw	ra,332(sp)
    11a6:	14512423          	sw	t0,328(sp)
    11aa:	003022f3          	frcsr	t0
    11ae:	14512223          	sw	t0,324(sp)
    11b2:	14612023          	sw	t1,320(sp)
    11b6:	12712e23          	sw	t2,316(sp)
    11ba:	12a12c23          	sw	a0,312(sp)
    11be:	12b12a23          	sw	a1,308(sp)
    11c2:	12c12823          	sw	a2,304(sp)
    11c6:	12d12623          	sw	a3,300(sp)
    11ca:	12e12423          	sw	a4,296(sp)
    11ce:	12f12223          	sw	a5,292(sp)
    11d2:	13012023          	sw	a6,288(sp)
    11d6:	11112e23          	sw	a7,284(sp)
    11da:	11c12c23          	sw	t3,280(sp)
    11de:	11d12a23          	sw	t4,276(sp)
    11e2:	11e12823          	sw	t5,272(sp)
    11e6:	11f12623          	sw	t6,268(sp)
    11ea:	bd82                	fsd	ft0,248(sp)
    11ec:	b986                	fsd	ft1,240(sp)
    11ee:	b58a                	fsd	ft2,232(sp)
    11f0:	b18e                	fsd	ft3,224(sp)
    11f2:	ad92                	fsd	ft4,216(sp)
    11f4:	a996                	fsd	ft5,208(sp)
    11f6:	a59a                	fsd	ft6,200(sp)
    11f8:	a19e                	fsd	ft7,192(sp)
    11fa:	bd22                	fsd	fs0,184(sp)
    11fc:	b926                	fsd	fs1,176(sp)
    11fe:	b52a                	fsd	fa0,168(sp)
    1200:	b12e                	fsd	fa1,160(sp)
    1202:	ad32                	fsd	fa2,152(sp)
    1204:	a936                	fsd	fa3,144(sp)
    1206:	a53a                	fsd	fa4,136(sp)
    1208:	a13e                	fsd	fa5,128(sp)
    120a:	bcc2                	fsd	fa6,120(sp)
    120c:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    120e:	200607b7          	lui	a5,0x20060
{
    1212:	b4ca                	fsd	fs2,104(sp)
    1214:	b0ce                	fsd	fs3,96(sp)
    1216:	acd2                	fsd	fs4,88(sp)
    1218:	a8d6                	fsd	fs5,80(sp)
    121a:	a4da                	fsd	fs6,72(sp)
    121c:	a0de                	fsd	fs7,64(sp)
    121e:	bc62                	fsd	fs8,56(sp)
    1220:	b866                	fsd	fs9,48(sp)
    1222:	b46a                	fsd	fs10,40(sp)
    1224:	b06e                	fsd	fs11,32(sp)
    1226:	ac72                	fsd	ft8,24(sp)
    1228:	a876                	fsd	ft9,16(sp)
    122a:	a47a                	fsd	ft10,8(sp)
    122c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    122e:	6721                	lui	a4,0x8
    1230:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
    1232:	af8ff0ef          	jal	52a <fic_irq_timer_1>
}
    1236:	14c12083          	lw	ra,332(sp)
    123a:	14412283          	lw	t0,324(sp)
    123e:	00329073          	fscsr	t0
    1242:	14812283          	lw	t0,328(sp)
    1246:	14012303          	lw	t1,320(sp)
    124a:	13c12383          	lw	t2,316(sp)
    124e:	13812503          	lw	a0,312(sp)
    1252:	13412583          	lw	a1,308(sp)
    1256:	13012603          	lw	a2,304(sp)
    125a:	12c12683          	lw	a3,300(sp)
    125e:	12812703          	lw	a4,296(sp)
    1262:	12412783          	lw	a5,292(sp)
    1266:	12012803          	lw	a6,288(sp)
    126a:	11c12883          	lw	a7,284(sp)
    126e:	11812e03          	lw	t3,280(sp)
    1272:	11412e83          	lw	t4,276(sp)
    1276:	11012f03          	lw	t5,272(sp)
    127a:	10c12f83          	lw	t6,268(sp)
    127e:	306e                	fld	ft0,248(sp)
    1280:	30ce                	fld	ft1,240(sp)
    1282:	312e                	fld	ft2,232(sp)
    1284:	318e                	fld	ft3,224(sp)
    1286:	226e                	fld	ft4,216(sp)
    1288:	22ce                	fld	ft5,208(sp)
    128a:	232e                	fld	ft6,200(sp)
    128c:	238e                	fld	ft7,192(sp)
    128e:	346a                	fld	fs0,184(sp)
    1290:	34ca                	fld	fs1,176(sp)
    1292:	352a                	fld	fa0,168(sp)
    1294:	358a                	fld	fa1,160(sp)
    1296:	266a                	fld	fa2,152(sp)
    1298:	26ca                	fld	fa3,144(sp)
    129a:	272a                	fld	fa4,136(sp)
    129c:	278a                	fld	fa5,128(sp)
    129e:	3866                	fld	fa6,120(sp)
    12a0:	38c6                	fld	fa7,112(sp)
    12a2:	3926                	fld	fs2,104(sp)
    12a4:	3986                	fld	fs3,96(sp)
    12a6:	2a66                	fld	fs4,88(sp)
    12a8:	2ac6                	fld	fs5,80(sp)
    12aa:	2b26                	fld	fs6,72(sp)
    12ac:	2b86                	fld	fs7,64(sp)
    12ae:	3c62                	fld	fs8,56(sp)
    12b0:	3cc2                	fld	fs9,48(sp)
    12b2:	3d22                	fld	fs10,40(sp)
    12b4:	3d82                	fld	fs11,32(sp)
    12b6:	2e62                	fld	ft8,24(sp)
    12b8:	2ec2                	fld	ft9,16(sp)
    12ba:	2f22                	fld	ft10,8(sp)
    12bc:	2f82                	fld	ft11,0(sp)
    12be:	6171                	addi	sp,sp,336
    12c0:	30200073          	mret
    12c4:	0000                	unimp
	...

000012c8 <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
    12c8:	714d                	addi	sp,sp,-336
    12ca:	14112623          	sw	ra,332(sp)
    12ce:	14512423          	sw	t0,328(sp)
    12d2:	003022f3          	frcsr	t0
    12d6:	14512223          	sw	t0,324(sp)
    12da:	14612023          	sw	t1,320(sp)
    12de:	12712e23          	sw	t2,316(sp)
    12e2:	12a12c23          	sw	a0,312(sp)
    12e6:	12b12a23          	sw	a1,308(sp)
    12ea:	12c12823          	sw	a2,304(sp)
    12ee:	12d12623          	sw	a3,300(sp)
    12f2:	12e12423          	sw	a4,296(sp)
    12f6:	12f12223          	sw	a5,292(sp)
    12fa:	13012023          	sw	a6,288(sp)
    12fe:	11112e23          	sw	a7,284(sp)
    1302:	11c12c23          	sw	t3,280(sp)
    1306:	11d12a23          	sw	t4,276(sp)
    130a:	11e12823          	sw	t5,272(sp)
    130e:	11f12623          	sw	t6,268(sp)
    1312:	bd82                	fsd	ft0,248(sp)
    1314:	b986                	fsd	ft1,240(sp)
    1316:	b58a                	fsd	ft2,232(sp)
    1318:	b18e                	fsd	ft3,224(sp)
    131a:	ad92                	fsd	ft4,216(sp)
    131c:	a996                	fsd	ft5,208(sp)
    131e:	a59a                	fsd	ft6,200(sp)
    1320:	a19e                	fsd	ft7,192(sp)
    1322:	bd22                	fsd	fs0,184(sp)
    1324:	b926                	fsd	fs1,176(sp)
    1326:	b52a                	fsd	fa0,168(sp)
    1328:	b12e                	fsd	fa1,160(sp)
    132a:	ad32                	fsd	fa2,152(sp)
    132c:	a936                	fsd	fa3,144(sp)
    132e:	a53a                	fsd	fa4,136(sp)
    1330:	a13e                	fsd	fa5,128(sp)
    1332:	bcc2                	fsd	fa6,120(sp)
    1334:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1336:	200607b7          	lui	a5,0x20060
{
    133a:	b4ca                	fsd	fs2,104(sp)
    133c:	b0ce                	fsd	fs3,96(sp)
    133e:	acd2                	fsd	fs4,88(sp)
    1340:	a8d6                	fsd	fs5,80(sp)
    1342:	a4da                	fsd	fs6,72(sp)
    1344:	a0de                	fsd	fs7,64(sp)
    1346:	bc62                	fsd	fs8,56(sp)
    1348:	b866                	fsd	fs9,48(sp)
    134a:	b46a                	fsd	fs10,40(sp)
    134c:	b06e                	fsd	fs11,32(sp)
    134e:	ac72                	fsd	ft8,24(sp)
    1350:	a876                	fsd	ft9,16(sp)
    1352:	a47a                	fsd	ft10,8(sp)
    1354:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1356:	04000713          	li	a4,64
    135a:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
    // call the weak fic handler
    fic_irq_gpio_0();
    135c:	9ceff0ef          	jal	52a <fic_irq_timer_1>
}
    1360:	14c12083          	lw	ra,332(sp)
    1364:	14412283          	lw	t0,324(sp)
    1368:	00329073          	fscsr	t0
    136c:	14812283          	lw	t0,328(sp)
    1370:	14012303          	lw	t1,320(sp)
    1374:	13c12383          	lw	t2,316(sp)
    1378:	13812503          	lw	a0,312(sp)
    137c:	13412583          	lw	a1,308(sp)
    1380:	13012603          	lw	a2,304(sp)
    1384:	12c12683          	lw	a3,300(sp)
    1388:	12812703          	lw	a4,296(sp)
    138c:	12412783          	lw	a5,292(sp)
    1390:	12012803          	lw	a6,288(sp)
    1394:	11c12883          	lw	a7,284(sp)
    1398:	11812e03          	lw	t3,280(sp)
    139c:	11412e83          	lw	t4,276(sp)
    13a0:	11012f03          	lw	t5,272(sp)
    13a4:	10c12f83          	lw	t6,268(sp)
    13a8:	306e                	fld	ft0,248(sp)
    13aa:	30ce                	fld	ft1,240(sp)
    13ac:	312e                	fld	ft2,232(sp)
    13ae:	318e                	fld	ft3,224(sp)
    13b0:	226e                	fld	ft4,216(sp)
    13b2:	22ce                	fld	ft5,208(sp)
    13b4:	232e                	fld	ft6,200(sp)
    13b6:	238e                	fld	ft7,192(sp)
    13b8:	346a                	fld	fs0,184(sp)
    13ba:	34ca                	fld	fs1,176(sp)
    13bc:	352a                	fld	fa0,168(sp)
    13be:	358a                	fld	fa1,160(sp)
    13c0:	266a                	fld	fa2,152(sp)
    13c2:	26ca                	fld	fa3,144(sp)
    13c4:	272a                	fld	fa4,136(sp)
    13c6:	278a                	fld	fa5,128(sp)
    13c8:	3866                	fld	fa6,120(sp)
    13ca:	38c6                	fld	fa7,112(sp)
    13cc:	3926                	fld	fs2,104(sp)
    13ce:	3986                	fld	fs3,96(sp)
    13d0:	2a66                	fld	fs4,88(sp)
    13d2:	2ac6                	fld	fs5,80(sp)
    13d4:	2b26                	fld	fs6,72(sp)
    13d6:	2b86                	fld	fs7,64(sp)
    13d8:	3c62                	fld	fs8,56(sp)
    13da:	3cc2                	fld	fs9,48(sp)
    13dc:	3d22                	fld	fs10,40(sp)
    13de:	3d82                	fld	fs11,32(sp)
    13e0:	2e62                	fld	ft8,24(sp)
    13e2:	2ec2                	fld	ft9,16(sp)
    13e4:	2f22                	fld	ft10,8(sp)
    13e6:	2f82                	fld	ft11,0(sp)
    13e8:	6171                	addi	sp,sp,336
    13ea:	30200073          	mret
	...

000013f0 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
    13f0:	714d                	addi	sp,sp,-336
    13f2:	14112623          	sw	ra,332(sp)
    13f6:	14512423          	sw	t0,328(sp)
    13fa:	003022f3          	frcsr	t0
    13fe:	14512223          	sw	t0,324(sp)
    1402:	14612023          	sw	t1,320(sp)
    1406:	12712e23          	sw	t2,316(sp)
    140a:	12a12c23          	sw	a0,312(sp)
    140e:	12b12a23          	sw	a1,308(sp)
    1412:	12c12823          	sw	a2,304(sp)
    1416:	12d12623          	sw	a3,300(sp)
    141a:	12e12423          	sw	a4,296(sp)
    141e:	12f12223          	sw	a5,292(sp)
    1422:	13012023          	sw	a6,288(sp)
    1426:	11112e23          	sw	a7,284(sp)
    142a:	11c12c23          	sw	t3,280(sp)
    142e:	11d12a23          	sw	t4,276(sp)
    1432:	11e12823          	sw	t5,272(sp)
    1436:	11f12623          	sw	t6,268(sp)
    143a:	bd82                	fsd	ft0,248(sp)
    143c:	b986                	fsd	ft1,240(sp)
    143e:	b58a                	fsd	ft2,232(sp)
    1440:	b18e                	fsd	ft3,224(sp)
    1442:	ad92                	fsd	ft4,216(sp)
    1444:	a996                	fsd	ft5,208(sp)
    1446:	a59a                	fsd	ft6,200(sp)
    1448:	a19e                	fsd	ft7,192(sp)
    144a:	bd22                	fsd	fs0,184(sp)
    144c:	b926                	fsd	fs1,176(sp)
    144e:	b52a                	fsd	fa0,168(sp)
    1450:	b12e                	fsd	fa1,160(sp)
    1452:	ad32                	fsd	fa2,152(sp)
    1454:	a936                	fsd	fa3,144(sp)
    1456:	a53a                	fsd	fa4,136(sp)
    1458:	a13e                	fsd	fa5,128(sp)
    145a:	bcc2                	fsd	fa6,120(sp)
    145c:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    145e:	200607b7          	lui	a5,0x20060
{
    1462:	b4ca                	fsd	fs2,104(sp)
    1464:	b0ce                	fsd	fs3,96(sp)
    1466:	acd2                	fsd	fs4,88(sp)
    1468:	a8d6                	fsd	fs5,80(sp)
    146a:	a4da                	fsd	fs6,72(sp)
    146c:	a0de                	fsd	fs7,64(sp)
    146e:	bc62                	fsd	fs8,56(sp)
    1470:	b866                	fsd	fs9,48(sp)
    1472:	b46a                	fsd	fs10,40(sp)
    1474:	b06e                	fsd	fs11,32(sp)
    1476:	ac72                	fsd	ft8,24(sp)
    1478:	a876                	fsd	ft9,16(sp)
    147a:	a47a                	fsd	ft10,8(sp)
    147c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    147e:	08000713          	li	a4,128
    1482:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
    // call the weak fic handler
    fic_irq_gpio_1();
    1484:	8a6ff0ef          	jal	52a <fic_irq_timer_1>
}
    1488:	14c12083          	lw	ra,332(sp)
    148c:	14412283          	lw	t0,324(sp)
    1490:	00329073          	fscsr	t0
    1494:	14812283          	lw	t0,328(sp)
    1498:	14012303          	lw	t1,320(sp)
    149c:	13c12383          	lw	t2,316(sp)
    14a0:	13812503          	lw	a0,312(sp)
    14a4:	13412583          	lw	a1,308(sp)
    14a8:	13012603          	lw	a2,304(sp)
    14ac:	12c12683          	lw	a3,300(sp)
    14b0:	12812703          	lw	a4,296(sp)
    14b4:	12412783          	lw	a5,292(sp)
    14b8:	12012803          	lw	a6,288(sp)
    14bc:	11c12883          	lw	a7,284(sp)
    14c0:	11812e03          	lw	t3,280(sp)
    14c4:	11412e83          	lw	t4,276(sp)
    14c8:	11012f03          	lw	t5,272(sp)
    14cc:	10c12f83          	lw	t6,268(sp)
    14d0:	306e                	fld	ft0,248(sp)
    14d2:	30ce                	fld	ft1,240(sp)
    14d4:	312e                	fld	ft2,232(sp)
    14d6:	318e                	fld	ft3,224(sp)
    14d8:	226e                	fld	ft4,216(sp)
    14da:	22ce                	fld	ft5,208(sp)
    14dc:	232e                	fld	ft6,200(sp)
    14de:	238e                	fld	ft7,192(sp)
    14e0:	346a                	fld	fs0,184(sp)
    14e2:	34ca                	fld	fs1,176(sp)
    14e4:	352a                	fld	fa0,168(sp)
    14e6:	358a                	fld	fa1,160(sp)
    14e8:	266a                	fld	fa2,152(sp)
    14ea:	26ca                	fld	fa3,144(sp)
    14ec:	272a                	fld	fa4,136(sp)
    14ee:	278a                	fld	fa5,128(sp)
    14f0:	3866                	fld	fa6,120(sp)
    14f2:	38c6                	fld	fa7,112(sp)
    14f4:	3926                	fld	fs2,104(sp)
    14f6:	3986                	fld	fs3,96(sp)
    14f8:	2a66                	fld	fs4,88(sp)
    14fa:	2ac6                	fld	fs5,80(sp)
    14fc:	2b26                	fld	fs6,72(sp)
    14fe:	2b86                	fld	fs7,64(sp)
    1500:	3c62                	fld	fs8,56(sp)
    1502:	3cc2                	fld	fs9,48(sp)
    1504:	3d22                	fld	fs10,40(sp)
    1506:	3d82                	fld	fs11,32(sp)
    1508:	2e62                	fld	ft8,24(sp)
    150a:	2ec2                	fld	ft9,16(sp)
    150c:	2f22                	fld	ft10,8(sp)
    150e:	2f82                	fld	ft11,0(sp)
    1510:	6171                	addi	sp,sp,336
    1512:	30200073          	mret
	...

00001518 <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
    1518:	714d                	addi	sp,sp,-336
    151a:	14112623          	sw	ra,332(sp)
    151e:	14512423          	sw	t0,328(sp)
    1522:	003022f3          	frcsr	t0
    1526:	14512223          	sw	t0,324(sp)
    152a:	14612023          	sw	t1,320(sp)
    152e:	12712e23          	sw	t2,316(sp)
    1532:	12a12c23          	sw	a0,312(sp)
    1536:	12b12a23          	sw	a1,308(sp)
    153a:	12c12823          	sw	a2,304(sp)
    153e:	12d12623          	sw	a3,300(sp)
    1542:	12e12423          	sw	a4,296(sp)
    1546:	12f12223          	sw	a5,292(sp)
    154a:	13012023          	sw	a6,288(sp)
    154e:	11112e23          	sw	a7,284(sp)
    1552:	11c12c23          	sw	t3,280(sp)
    1556:	11d12a23          	sw	t4,276(sp)
    155a:	11e12823          	sw	t5,272(sp)
    155e:	11f12623          	sw	t6,268(sp)
    1562:	bd82                	fsd	ft0,248(sp)
    1564:	b986                	fsd	ft1,240(sp)
    1566:	b58a                	fsd	ft2,232(sp)
    1568:	b18e                	fsd	ft3,224(sp)
    156a:	ad92                	fsd	ft4,216(sp)
    156c:	a996                	fsd	ft5,208(sp)
    156e:	a59a                	fsd	ft6,200(sp)
    1570:	a19e                	fsd	ft7,192(sp)
    1572:	bd22                	fsd	fs0,184(sp)
    1574:	b926                	fsd	fs1,176(sp)
    1576:	b52a                	fsd	fa0,168(sp)
    1578:	b12e                	fsd	fa1,160(sp)
    157a:	ad32                	fsd	fa2,152(sp)
    157c:	a936                	fsd	fa3,144(sp)
    157e:	a53a                	fsd	fa4,136(sp)
    1580:	a13e                	fsd	fa5,128(sp)
    1582:	bcc2                	fsd	fa6,120(sp)
    1584:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1586:	200607b7          	lui	a5,0x20060
{
    158a:	b4ca                	fsd	fs2,104(sp)
    158c:	b0ce                	fsd	fs3,96(sp)
    158e:	acd2                	fsd	fs4,88(sp)
    1590:	a8d6                	fsd	fs5,80(sp)
    1592:	a4da                	fsd	fs6,72(sp)
    1594:	a0de                	fsd	fs7,64(sp)
    1596:	bc62                	fsd	fs8,56(sp)
    1598:	b866                	fsd	fs9,48(sp)
    159a:	b46a                	fsd	fs10,40(sp)
    159c:	b06e                	fsd	fs11,32(sp)
    159e:	ac72                	fsd	ft8,24(sp)
    15a0:	a876                	fsd	ft9,16(sp)
    15a2:	a47a                	fsd	ft10,8(sp)
    15a4:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    15a6:	10000713          	li	a4,256
    15aa:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
    // call the weak fic handler
    fic_irq_gpio_2();
    15ac:	f7ffe0ef          	jal	52a <fic_irq_timer_1>
}
    15b0:	14c12083          	lw	ra,332(sp)
    15b4:	14412283          	lw	t0,324(sp)
    15b8:	00329073          	fscsr	t0
    15bc:	14812283          	lw	t0,328(sp)
    15c0:	14012303          	lw	t1,320(sp)
    15c4:	13c12383          	lw	t2,316(sp)
    15c8:	13812503          	lw	a0,312(sp)
    15cc:	13412583          	lw	a1,308(sp)
    15d0:	13012603          	lw	a2,304(sp)
    15d4:	12c12683          	lw	a3,300(sp)
    15d8:	12812703          	lw	a4,296(sp)
    15dc:	12412783          	lw	a5,292(sp)
    15e0:	12012803          	lw	a6,288(sp)
    15e4:	11c12883          	lw	a7,284(sp)
    15e8:	11812e03          	lw	t3,280(sp)
    15ec:	11412e83          	lw	t4,276(sp)
    15f0:	11012f03          	lw	t5,272(sp)
    15f4:	10c12f83          	lw	t6,268(sp)
    15f8:	306e                	fld	ft0,248(sp)
    15fa:	30ce                	fld	ft1,240(sp)
    15fc:	312e                	fld	ft2,232(sp)
    15fe:	318e                	fld	ft3,224(sp)
    1600:	226e                	fld	ft4,216(sp)
    1602:	22ce                	fld	ft5,208(sp)
    1604:	232e                	fld	ft6,200(sp)
    1606:	238e                	fld	ft7,192(sp)
    1608:	346a                	fld	fs0,184(sp)
    160a:	34ca                	fld	fs1,176(sp)
    160c:	352a                	fld	fa0,168(sp)
    160e:	358a                	fld	fa1,160(sp)
    1610:	266a                	fld	fa2,152(sp)
    1612:	26ca                	fld	fa3,144(sp)
    1614:	272a                	fld	fa4,136(sp)
    1616:	278a                	fld	fa5,128(sp)
    1618:	3866                	fld	fa6,120(sp)
    161a:	38c6                	fld	fa7,112(sp)
    161c:	3926                	fld	fs2,104(sp)
    161e:	3986                	fld	fs3,96(sp)
    1620:	2a66                	fld	fs4,88(sp)
    1622:	2ac6                	fld	fs5,80(sp)
    1624:	2b26                	fld	fs6,72(sp)
    1626:	2b86                	fld	fs7,64(sp)
    1628:	3c62                	fld	fs8,56(sp)
    162a:	3cc2                	fld	fs9,48(sp)
    162c:	3d22                	fld	fs10,40(sp)
    162e:	3d82                	fld	fs11,32(sp)
    1630:	2e62                	fld	ft8,24(sp)
    1632:	2ec2                	fld	ft9,16(sp)
    1634:	2f22                	fld	ft10,8(sp)
    1636:	2f82                	fld	ft11,0(sp)
    1638:	6171                	addi	sp,sp,336
    163a:	30200073          	mret
	...

00001640 <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
    1640:	714d                	addi	sp,sp,-336
    1642:	14112623          	sw	ra,332(sp)
    1646:	14512423          	sw	t0,328(sp)
    164a:	003022f3          	frcsr	t0
    164e:	14512223          	sw	t0,324(sp)
    1652:	14612023          	sw	t1,320(sp)
    1656:	12712e23          	sw	t2,316(sp)
    165a:	12a12c23          	sw	a0,312(sp)
    165e:	12b12a23          	sw	a1,308(sp)
    1662:	12c12823          	sw	a2,304(sp)
    1666:	12d12623          	sw	a3,300(sp)
    166a:	12e12423          	sw	a4,296(sp)
    166e:	12f12223          	sw	a5,292(sp)
    1672:	13012023          	sw	a6,288(sp)
    1676:	11112e23          	sw	a7,284(sp)
    167a:	11c12c23          	sw	t3,280(sp)
    167e:	11d12a23          	sw	t4,276(sp)
    1682:	11e12823          	sw	t5,272(sp)
    1686:	11f12623          	sw	t6,268(sp)
    168a:	bd82                	fsd	ft0,248(sp)
    168c:	b986                	fsd	ft1,240(sp)
    168e:	b58a                	fsd	ft2,232(sp)
    1690:	b18e                	fsd	ft3,224(sp)
    1692:	ad92                	fsd	ft4,216(sp)
    1694:	a996                	fsd	ft5,208(sp)
    1696:	a59a                	fsd	ft6,200(sp)
    1698:	a19e                	fsd	ft7,192(sp)
    169a:	bd22                	fsd	fs0,184(sp)
    169c:	b926                	fsd	fs1,176(sp)
    169e:	b52a                	fsd	fa0,168(sp)
    16a0:	b12e                	fsd	fa1,160(sp)
    16a2:	ad32                	fsd	fa2,152(sp)
    16a4:	a936                	fsd	fa3,144(sp)
    16a6:	a53a                	fsd	fa4,136(sp)
    16a8:	a13e                	fsd	fa5,128(sp)
    16aa:	bcc2                	fsd	fa6,120(sp)
    16ac:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    16ae:	200607b7          	lui	a5,0x20060
{
    16b2:	b4ca                	fsd	fs2,104(sp)
    16b4:	b0ce                	fsd	fs3,96(sp)
    16b6:	acd2                	fsd	fs4,88(sp)
    16b8:	a8d6                	fsd	fs5,80(sp)
    16ba:	a4da                	fsd	fs6,72(sp)
    16bc:	a0de                	fsd	fs7,64(sp)
    16be:	bc62                	fsd	fs8,56(sp)
    16c0:	b866                	fsd	fs9,48(sp)
    16c2:	b46a                	fsd	fs10,40(sp)
    16c4:	b06e                	fsd	fs11,32(sp)
    16c6:	ac72                	fsd	ft8,24(sp)
    16c8:	a876                	fsd	ft9,16(sp)
    16ca:	a47a                	fsd	ft10,8(sp)
    16cc:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    16ce:	20000713          	li	a4,512
    16d2:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
    // call the weak fic handler
    fic_irq_gpio_3();
    16d4:	e57fe0ef          	jal	52a <fic_irq_timer_1>
}
    16d8:	14c12083          	lw	ra,332(sp)
    16dc:	14412283          	lw	t0,324(sp)
    16e0:	00329073          	fscsr	t0
    16e4:	14812283          	lw	t0,328(sp)
    16e8:	14012303          	lw	t1,320(sp)
    16ec:	13c12383          	lw	t2,316(sp)
    16f0:	13812503          	lw	a0,312(sp)
    16f4:	13412583          	lw	a1,308(sp)
    16f8:	13012603          	lw	a2,304(sp)
    16fc:	12c12683          	lw	a3,300(sp)
    1700:	12812703          	lw	a4,296(sp)
    1704:	12412783          	lw	a5,292(sp)
    1708:	12012803          	lw	a6,288(sp)
    170c:	11c12883          	lw	a7,284(sp)
    1710:	11812e03          	lw	t3,280(sp)
    1714:	11412e83          	lw	t4,276(sp)
    1718:	11012f03          	lw	t5,272(sp)
    171c:	10c12f83          	lw	t6,268(sp)
    1720:	306e                	fld	ft0,248(sp)
    1722:	30ce                	fld	ft1,240(sp)
    1724:	312e                	fld	ft2,232(sp)
    1726:	318e                	fld	ft3,224(sp)
    1728:	226e                	fld	ft4,216(sp)
    172a:	22ce                	fld	ft5,208(sp)
    172c:	232e                	fld	ft6,200(sp)
    172e:	238e                	fld	ft7,192(sp)
    1730:	346a                	fld	fs0,184(sp)
    1732:	34ca                	fld	fs1,176(sp)
    1734:	352a                	fld	fa0,168(sp)
    1736:	358a                	fld	fa1,160(sp)
    1738:	266a                	fld	fa2,152(sp)
    173a:	26ca                	fld	fa3,144(sp)
    173c:	272a                	fld	fa4,136(sp)
    173e:	278a                	fld	fa5,128(sp)
    1740:	3866                	fld	fa6,120(sp)
    1742:	38c6                	fld	fa7,112(sp)
    1744:	3926                	fld	fs2,104(sp)
    1746:	3986                	fld	fs3,96(sp)
    1748:	2a66                	fld	fs4,88(sp)
    174a:	2ac6                	fld	fs5,80(sp)
    174c:	2b26                	fld	fs6,72(sp)
    174e:	2b86                	fld	fs7,64(sp)
    1750:	3c62                	fld	fs8,56(sp)
    1752:	3cc2                	fld	fs9,48(sp)
    1754:	3d22                	fld	fs10,40(sp)
    1756:	3d82                	fld	fs11,32(sp)
    1758:	2e62                	fld	ft8,24(sp)
    175a:	2ec2                	fld	ft9,16(sp)
    175c:	2f22                	fld	ft10,8(sp)
    175e:	2f82                	fld	ft11,0(sp)
    1760:	6171                	addi	sp,sp,336
    1762:	30200073          	mret
	...

00001768 <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
    1768:	714d                	addi	sp,sp,-336
    176a:	14112623          	sw	ra,332(sp)
    176e:	14512423          	sw	t0,328(sp)
    1772:	003022f3          	frcsr	t0
    1776:	14512223          	sw	t0,324(sp)
    177a:	14612023          	sw	t1,320(sp)
    177e:	12712e23          	sw	t2,316(sp)
    1782:	12a12c23          	sw	a0,312(sp)
    1786:	12b12a23          	sw	a1,308(sp)
    178a:	12c12823          	sw	a2,304(sp)
    178e:	12d12623          	sw	a3,300(sp)
    1792:	12e12423          	sw	a4,296(sp)
    1796:	12f12223          	sw	a5,292(sp)
    179a:	13012023          	sw	a6,288(sp)
    179e:	11112e23          	sw	a7,284(sp)
    17a2:	11c12c23          	sw	t3,280(sp)
    17a6:	11d12a23          	sw	t4,276(sp)
    17aa:	11e12823          	sw	t5,272(sp)
    17ae:	11f12623          	sw	t6,268(sp)
    17b2:	bd82                	fsd	ft0,248(sp)
    17b4:	b986                	fsd	ft1,240(sp)
    17b6:	b58a                	fsd	ft2,232(sp)
    17b8:	b18e                	fsd	ft3,224(sp)
    17ba:	ad92                	fsd	ft4,216(sp)
    17bc:	a996                	fsd	ft5,208(sp)
    17be:	a59a                	fsd	ft6,200(sp)
    17c0:	a19e                	fsd	ft7,192(sp)
    17c2:	bd22                	fsd	fs0,184(sp)
    17c4:	b926                	fsd	fs1,176(sp)
    17c6:	b52a                	fsd	fa0,168(sp)
    17c8:	b12e                	fsd	fa1,160(sp)
    17ca:	ad32                	fsd	fa2,152(sp)
    17cc:	a936                	fsd	fa3,144(sp)
    17ce:	a53a                	fsd	fa4,136(sp)
    17d0:	a13e                	fsd	fa5,128(sp)
    17d2:	bcc2                	fsd	fa6,120(sp)
    17d4:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    17d6:	200607b7          	lui	a5,0x20060
{
    17da:	b4ca                	fsd	fs2,104(sp)
    17dc:	b0ce                	fsd	fs3,96(sp)
    17de:	acd2                	fsd	fs4,88(sp)
    17e0:	a8d6                	fsd	fs5,80(sp)
    17e2:	a4da                	fsd	fs6,72(sp)
    17e4:	a0de                	fsd	fs7,64(sp)
    17e6:	bc62                	fsd	fs8,56(sp)
    17e8:	b866                	fsd	fs9,48(sp)
    17ea:	b46a                	fsd	fs10,40(sp)
    17ec:	b06e                	fsd	fs11,32(sp)
    17ee:	ac72                	fsd	ft8,24(sp)
    17f0:	a876                	fsd	ft9,16(sp)
    17f2:	a47a                	fsd	ft10,8(sp)
    17f4:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    17f6:	40000713          	li	a4,1024
    17fa:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
    // call the weak fic handler
    fic_irq_gpio_4();
    17fc:	d2ffe0ef          	jal	52a <fic_irq_timer_1>
}
    1800:	14c12083          	lw	ra,332(sp)
    1804:	14412283          	lw	t0,324(sp)
    1808:	00329073          	fscsr	t0
    180c:	14812283          	lw	t0,328(sp)
    1810:	14012303          	lw	t1,320(sp)
    1814:	13c12383          	lw	t2,316(sp)
    1818:	13812503          	lw	a0,312(sp)
    181c:	13412583          	lw	a1,308(sp)
    1820:	13012603          	lw	a2,304(sp)
    1824:	12c12683          	lw	a3,300(sp)
    1828:	12812703          	lw	a4,296(sp)
    182c:	12412783          	lw	a5,292(sp)
    1830:	12012803          	lw	a6,288(sp)
    1834:	11c12883          	lw	a7,284(sp)
    1838:	11812e03          	lw	t3,280(sp)
    183c:	11412e83          	lw	t4,276(sp)
    1840:	11012f03          	lw	t5,272(sp)
    1844:	10c12f83          	lw	t6,268(sp)
    1848:	306e                	fld	ft0,248(sp)
    184a:	30ce                	fld	ft1,240(sp)
    184c:	312e                	fld	ft2,232(sp)
    184e:	318e                	fld	ft3,224(sp)
    1850:	226e                	fld	ft4,216(sp)
    1852:	22ce                	fld	ft5,208(sp)
    1854:	232e                	fld	ft6,200(sp)
    1856:	238e                	fld	ft7,192(sp)
    1858:	346a                	fld	fs0,184(sp)
    185a:	34ca                	fld	fs1,176(sp)
    185c:	352a                	fld	fa0,168(sp)
    185e:	358a                	fld	fa1,160(sp)
    1860:	266a                	fld	fa2,152(sp)
    1862:	26ca                	fld	fa3,144(sp)
    1864:	272a                	fld	fa4,136(sp)
    1866:	278a                	fld	fa5,128(sp)
    1868:	3866                	fld	fa6,120(sp)
    186a:	38c6                	fld	fa7,112(sp)
    186c:	3926                	fld	fs2,104(sp)
    186e:	3986                	fld	fs3,96(sp)
    1870:	2a66                	fld	fs4,88(sp)
    1872:	2ac6                	fld	fs5,80(sp)
    1874:	2b26                	fld	fs6,72(sp)
    1876:	2b86                	fld	fs7,64(sp)
    1878:	3c62                	fld	fs8,56(sp)
    187a:	3cc2                	fld	fs9,48(sp)
    187c:	3d22                	fld	fs10,40(sp)
    187e:	3d82                	fld	fs11,32(sp)
    1880:	2e62                	fld	ft8,24(sp)
    1882:	2ec2                	fld	ft9,16(sp)
    1884:	2f22                	fld	ft10,8(sp)
    1886:	2f82                	fld	ft11,0(sp)
    1888:	6171                	addi	sp,sp,336
    188a:	30200073          	mret
	...

00001890 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
    1890:	714d                	addi	sp,sp,-336
    1892:	14112623          	sw	ra,332(sp)
    1896:	14512423          	sw	t0,328(sp)
    189a:	003022f3          	frcsr	t0
    189e:	14512223          	sw	t0,324(sp)
    18a2:	14612023          	sw	t1,320(sp)
    18a6:	12712e23          	sw	t2,316(sp)
    18aa:	12a12c23          	sw	a0,312(sp)
    18ae:	12b12a23          	sw	a1,308(sp)
    18b2:	12c12823          	sw	a2,304(sp)
    18b6:	12d12623          	sw	a3,300(sp)
    18ba:	12e12423          	sw	a4,296(sp)
    18be:	12f12223          	sw	a5,292(sp)
    18c2:	13012023          	sw	a6,288(sp)
    18c6:	11112e23          	sw	a7,284(sp)
    18ca:	11c12c23          	sw	t3,280(sp)
    18ce:	11d12a23          	sw	t4,276(sp)
    18d2:	11e12823          	sw	t5,272(sp)
    18d6:	11f12623          	sw	t6,268(sp)
    18da:	bd82                	fsd	ft0,248(sp)
    18dc:	b986                	fsd	ft1,240(sp)
    18de:	b58a                	fsd	ft2,232(sp)
    18e0:	b18e                	fsd	ft3,224(sp)
    18e2:	ad92                	fsd	ft4,216(sp)
    18e4:	a996                	fsd	ft5,208(sp)
    18e6:	a59a                	fsd	ft6,200(sp)
    18e8:	a19e                	fsd	ft7,192(sp)
    18ea:	bd22                	fsd	fs0,184(sp)
    18ec:	b926                	fsd	fs1,176(sp)
    18ee:	b52a                	fsd	fa0,168(sp)
    18f0:	b12e                	fsd	fa1,160(sp)
    18f2:	ad32                	fsd	fa2,152(sp)
    18f4:	a936                	fsd	fa3,144(sp)
    18f6:	a53a                	fsd	fa4,136(sp)
    18f8:	a13e                	fsd	fa5,128(sp)
    18fa:	bcc2                	fsd	fa6,120(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    18fc:	6785                	lui	a5,0x1
{
    18fe:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1900:	80078793          	addi	a5,a5,-2048 # 800 <spi_error_handler.isra.0+0xb4>
{
    1904:	b4ca                	fsd	fs2,104(sp)
    1906:	b0ce                	fsd	fs3,96(sp)
    1908:	acd2                	fsd	fs4,88(sp)
    190a:	a8d6                	fsd	fs5,80(sp)
    190c:	a4da                	fsd	fs6,72(sp)
    190e:	a0de                	fsd	fs7,64(sp)
    1910:	bc62                	fsd	fs8,56(sp)
    1912:	b866                	fsd	fs9,48(sp)
    1914:	b46a                	fsd	fs10,40(sp)
    1916:	b06e                	fsd	fs11,32(sp)
    1918:	ac72                	fsd	ft8,24(sp)
    191a:	a876                	fsd	ft9,16(sp)
    191c:	a47a                	fsd	ft10,8(sp)
    191e:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1920:	20060737          	lui	a4,0x20060
    1924:	c35c                	sw	a5,4(a4)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
    // call the weak fic handler
    fic_irq_gpio_5();
    1926:	c05fe0ef          	jal	52a <fic_irq_timer_1>
}
    192a:	14c12083          	lw	ra,332(sp)
    192e:	14412283          	lw	t0,324(sp)
    1932:	00329073          	fscsr	t0
    1936:	14812283          	lw	t0,328(sp)
    193a:	14012303          	lw	t1,320(sp)
    193e:	13c12383          	lw	t2,316(sp)
    1942:	13812503          	lw	a0,312(sp)
    1946:	13412583          	lw	a1,308(sp)
    194a:	13012603          	lw	a2,304(sp)
    194e:	12c12683          	lw	a3,300(sp)
    1952:	12812703          	lw	a4,296(sp)
    1956:	12412783          	lw	a5,292(sp)
    195a:	12012803          	lw	a6,288(sp)
    195e:	11c12883          	lw	a7,284(sp)
    1962:	11812e03          	lw	t3,280(sp)
    1966:	11412e83          	lw	t4,276(sp)
    196a:	11012f03          	lw	t5,272(sp)
    196e:	10c12f83          	lw	t6,268(sp)
    1972:	306e                	fld	ft0,248(sp)
    1974:	30ce                	fld	ft1,240(sp)
    1976:	312e                	fld	ft2,232(sp)
    1978:	318e                	fld	ft3,224(sp)
    197a:	226e                	fld	ft4,216(sp)
    197c:	22ce                	fld	ft5,208(sp)
    197e:	232e                	fld	ft6,200(sp)
    1980:	238e                	fld	ft7,192(sp)
    1982:	346a                	fld	fs0,184(sp)
    1984:	34ca                	fld	fs1,176(sp)
    1986:	352a                	fld	fa0,168(sp)
    1988:	358a                	fld	fa1,160(sp)
    198a:	266a                	fld	fa2,152(sp)
    198c:	26ca                	fld	fa3,144(sp)
    198e:	272a                	fld	fa4,136(sp)
    1990:	278a                	fld	fa5,128(sp)
    1992:	3866                	fld	fa6,120(sp)
    1994:	38c6                	fld	fa7,112(sp)
    1996:	3926                	fld	fs2,104(sp)
    1998:	3986                	fld	fs3,96(sp)
    199a:	2a66                	fld	fs4,88(sp)
    199c:	2ac6                	fld	fs5,80(sp)
    199e:	2b26                	fld	fs6,72(sp)
    19a0:	2b86                	fld	fs7,64(sp)
    19a2:	3c62                	fld	fs8,56(sp)
    19a4:	3cc2                	fld	fs9,48(sp)
    19a6:	3d22                	fld	fs10,40(sp)
    19a8:	3d82                	fld	fs11,32(sp)
    19aa:	2e62                	fld	ft8,24(sp)
    19ac:	2ec2                	fld	ft9,16(sp)
    19ae:	2f22                	fld	ft10,8(sp)
    19b0:	2f82                	fld	ft11,0(sp)
    19b2:	6171                	addi	sp,sp,336
    19b4:	30200073          	mret
    19b8:	0000                	unimp
	...

000019bc <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
    19bc:	714d                	addi	sp,sp,-336
    19be:	14112623          	sw	ra,332(sp)
    19c2:	14512423          	sw	t0,328(sp)
    19c6:	003022f3          	frcsr	t0
    19ca:	14512223          	sw	t0,324(sp)
    19ce:	14612023          	sw	t1,320(sp)
    19d2:	12712e23          	sw	t2,316(sp)
    19d6:	12a12c23          	sw	a0,312(sp)
    19da:	12b12a23          	sw	a1,308(sp)
    19de:	12c12823          	sw	a2,304(sp)
    19e2:	12d12623          	sw	a3,300(sp)
    19e6:	12e12423          	sw	a4,296(sp)
    19ea:	12f12223          	sw	a5,292(sp)
    19ee:	13012023          	sw	a6,288(sp)
    19f2:	11112e23          	sw	a7,284(sp)
    19f6:	11c12c23          	sw	t3,280(sp)
    19fa:	11d12a23          	sw	t4,276(sp)
    19fe:	11e12823          	sw	t5,272(sp)
    1a02:	11f12623          	sw	t6,268(sp)
    1a06:	bd82                	fsd	ft0,248(sp)
    1a08:	b986                	fsd	ft1,240(sp)
    1a0a:	b58a                	fsd	ft2,232(sp)
    1a0c:	b18e                	fsd	ft3,224(sp)
    1a0e:	ad92                	fsd	ft4,216(sp)
    1a10:	a996                	fsd	ft5,208(sp)
    1a12:	a59a                	fsd	ft6,200(sp)
    1a14:	a19e                	fsd	ft7,192(sp)
    1a16:	bd22                	fsd	fs0,184(sp)
    1a18:	b926                	fsd	fs1,176(sp)
    1a1a:	b52a                	fsd	fa0,168(sp)
    1a1c:	b12e                	fsd	fa1,160(sp)
    1a1e:	ad32                	fsd	fa2,152(sp)
    1a20:	a936                	fsd	fa3,144(sp)
    1a22:	a53a                	fsd	fa4,136(sp)
    1a24:	a13e                	fsd	fa5,128(sp)
    1a26:	bcc2                	fsd	fa6,120(sp)
    1a28:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1a2a:	200607b7          	lui	a5,0x20060
{
    1a2e:	b4ca                	fsd	fs2,104(sp)
    1a30:	b0ce                	fsd	fs3,96(sp)
    1a32:	acd2                	fsd	fs4,88(sp)
    1a34:	a8d6                	fsd	fs5,80(sp)
    1a36:	a4da                	fsd	fs6,72(sp)
    1a38:	a0de                	fsd	fs7,64(sp)
    1a3a:	bc62                	fsd	fs8,56(sp)
    1a3c:	b866                	fsd	fs9,48(sp)
    1a3e:	b46a                	fsd	fs10,40(sp)
    1a40:	b06e                	fsd	fs11,32(sp)
    1a42:	ac72                	fsd	ft8,24(sp)
    1a44:	a876                	fsd	ft9,16(sp)
    1a46:	a47a                	fsd	ft10,8(sp)
    1a48:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1a4a:	6705                	lui	a4,0x1
    1a4c:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
    // call the weak fic handler
    fic_irq_gpio_6();
    1a4e:	addfe0ef          	jal	52a <fic_irq_timer_1>
}
    1a52:	14c12083          	lw	ra,332(sp)
    1a56:	14412283          	lw	t0,324(sp)
    1a5a:	00329073          	fscsr	t0
    1a5e:	14812283          	lw	t0,328(sp)
    1a62:	14012303          	lw	t1,320(sp)
    1a66:	13c12383          	lw	t2,316(sp)
    1a6a:	13812503          	lw	a0,312(sp)
    1a6e:	13412583          	lw	a1,308(sp)
    1a72:	13012603          	lw	a2,304(sp)
    1a76:	12c12683          	lw	a3,300(sp)
    1a7a:	12812703          	lw	a4,296(sp)
    1a7e:	12412783          	lw	a5,292(sp)
    1a82:	12012803          	lw	a6,288(sp)
    1a86:	11c12883          	lw	a7,284(sp)
    1a8a:	11812e03          	lw	t3,280(sp)
    1a8e:	11412e83          	lw	t4,276(sp)
    1a92:	11012f03          	lw	t5,272(sp)
    1a96:	10c12f83          	lw	t6,268(sp)
    1a9a:	306e                	fld	ft0,248(sp)
    1a9c:	30ce                	fld	ft1,240(sp)
    1a9e:	312e                	fld	ft2,232(sp)
    1aa0:	318e                	fld	ft3,224(sp)
    1aa2:	226e                	fld	ft4,216(sp)
    1aa4:	22ce                	fld	ft5,208(sp)
    1aa6:	232e                	fld	ft6,200(sp)
    1aa8:	238e                	fld	ft7,192(sp)
    1aaa:	346a                	fld	fs0,184(sp)
    1aac:	34ca                	fld	fs1,176(sp)
    1aae:	352a                	fld	fa0,168(sp)
    1ab0:	358a                	fld	fa1,160(sp)
    1ab2:	266a                	fld	fa2,152(sp)
    1ab4:	26ca                	fld	fa3,144(sp)
    1ab6:	272a                	fld	fa4,136(sp)
    1ab8:	278a                	fld	fa5,128(sp)
    1aba:	3866                	fld	fa6,120(sp)
    1abc:	38c6                	fld	fa7,112(sp)
    1abe:	3926                	fld	fs2,104(sp)
    1ac0:	3986                	fld	fs3,96(sp)
    1ac2:	2a66                	fld	fs4,88(sp)
    1ac4:	2ac6                	fld	fs5,80(sp)
    1ac6:	2b26                	fld	fs6,72(sp)
    1ac8:	2b86                	fld	fs7,64(sp)
    1aca:	3c62                	fld	fs8,56(sp)
    1acc:	3cc2                	fld	fs9,48(sp)
    1ace:	3d22                	fld	fs10,40(sp)
    1ad0:	3d82                	fld	fs11,32(sp)
    1ad2:	2e62                	fld	ft8,24(sp)
    1ad4:	2ec2                	fld	ft9,16(sp)
    1ad6:	2f22                	fld	ft10,8(sp)
    1ad8:	2f82                	fld	ft11,0(sp)
    1ada:	6171                	addi	sp,sp,336
    1adc:	30200073          	mret
    1ae0:	0000                	unimp
	...

00001ae4 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
    1ae4:	714d                	addi	sp,sp,-336
    1ae6:	14112623          	sw	ra,332(sp)
    1aea:	14512423          	sw	t0,328(sp)
    1aee:	003022f3          	frcsr	t0
    1af2:	14512223          	sw	t0,324(sp)
    1af6:	14612023          	sw	t1,320(sp)
    1afa:	12712e23          	sw	t2,316(sp)
    1afe:	12a12c23          	sw	a0,312(sp)
    1b02:	12b12a23          	sw	a1,308(sp)
    1b06:	12c12823          	sw	a2,304(sp)
    1b0a:	12d12623          	sw	a3,300(sp)
    1b0e:	12e12423          	sw	a4,296(sp)
    1b12:	12f12223          	sw	a5,292(sp)
    1b16:	13012023          	sw	a6,288(sp)
    1b1a:	11112e23          	sw	a7,284(sp)
    1b1e:	11c12c23          	sw	t3,280(sp)
    1b22:	11d12a23          	sw	t4,276(sp)
    1b26:	11e12823          	sw	t5,272(sp)
    1b2a:	11f12623          	sw	t6,268(sp)
    1b2e:	bd82                	fsd	ft0,248(sp)
    1b30:	b986                	fsd	ft1,240(sp)
    1b32:	b58a                	fsd	ft2,232(sp)
    1b34:	b18e                	fsd	ft3,224(sp)
    1b36:	ad92                	fsd	ft4,216(sp)
    1b38:	a996                	fsd	ft5,208(sp)
    1b3a:	a59a                	fsd	ft6,200(sp)
    1b3c:	a19e                	fsd	ft7,192(sp)
    1b3e:	bd22                	fsd	fs0,184(sp)
    1b40:	b926                	fsd	fs1,176(sp)
    1b42:	b52a                	fsd	fa0,168(sp)
    1b44:	b12e                	fsd	fa1,160(sp)
    1b46:	ad32                	fsd	fa2,152(sp)
    1b48:	a936                	fsd	fa3,144(sp)
    1b4a:	a53a                	fsd	fa4,136(sp)
    1b4c:	a13e                	fsd	fa5,128(sp)
    1b4e:	bcc2                	fsd	fa6,120(sp)
    1b50:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1b52:	200607b7          	lui	a5,0x20060
{
    1b56:	b4ca                	fsd	fs2,104(sp)
    1b58:	b0ce                	fsd	fs3,96(sp)
    1b5a:	acd2                	fsd	fs4,88(sp)
    1b5c:	a8d6                	fsd	fs5,80(sp)
    1b5e:	a4da                	fsd	fs6,72(sp)
    1b60:	a0de                	fsd	fs7,64(sp)
    1b62:	bc62                	fsd	fs8,56(sp)
    1b64:	b866                	fsd	fs9,48(sp)
    1b66:	b46a                	fsd	fs10,40(sp)
    1b68:	b06e                	fsd	fs11,32(sp)
    1b6a:	ac72                	fsd	ft8,24(sp)
    1b6c:	a876                	fsd	ft9,16(sp)
    1b6e:	a47a                	fsd	ft10,8(sp)
    1b70:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1b72:	6709                	lui	a4,0x2
    1b74:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
    1b76:	9b5fe0ef          	jal	52a <fic_irq_timer_1>
}
    1b7a:	14c12083          	lw	ra,332(sp)
    1b7e:	14412283          	lw	t0,324(sp)
    1b82:	00329073          	fscsr	t0
    1b86:	14812283          	lw	t0,328(sp)
    1b8a:	14012303          	lw	t1,320(sp)
    1b8e:	13c12383          	lw	t2,316(sp)
    1b92:	13812503          	lw	a0,312(sp)
    1b96:	13412583          	lw	a1,308(sp)
    1b9a:	13012603          	lw	a2,304(sp)
    1b9e:	12c12683          	lw	a3,300(sp)
    1ba2:	12812703          	lw	a4,296(sp)
    1ba6:	12412783          	lw	a5,292(sp)
    1baa:	12012803          	lw	a6,288(sp)
    1bae:	11c12883          	lw	a7,284(sp)
    1bb2:	11812e03          	lw	t3,280(sp)
    1bb6:	11412e83          	lw	t4,276(sp)
    1bba:	11012f03          	lw	t5,272(sp)
    1bbe:	10c12f83          	lw	t6,268(sp)
    1bc2:	306e                	fld	ft0,248(sp)
    1bc4:	30ce                	fld	ft1,240(sp)
    1bc6:	312e                	fld	ft2,232(sp)
    1bc8:	318e                	fld	ft3,224(sp)
    1bca:	226e                	fld	ft4,216(sp)
    1bcc:	22ce                	fld	ft5,208(sp)
    1bce:	232e                	fld	ft6,200(sp)
    1bd0:	238e                	fld	ft7,192(sp)
    1bd2:	346a                	fld	fs0,184(sp)
    1bd4:	34ca                	fld	fs1,176(sp)
    1bd6:	352a                	fld	fa0,168(sp)
    1bd8:	358a                	fld	fa1,160(sp)
    1bda:	266a                	fld	fa2,152(sp)
    1bdc:	26ca                	fld	fa3,144(sp)
    1bde:	272a                	fld	fa4,136(sp)
    1be0:	278a                	fld	fa5,128(sp)
    1be2:	3866                	fld	fa6,120(sp)
    1be4:	38c6                	fld	fa7,112(sp)
    1be6:	3926                	fld	fs2,104(sp)
    1be8:	3986                	fld	fs3,96(sp)
    1bea:	2a66                	fld	fs4,88(sp)
    1bec:	2ac6                	fld	fs5,80(sp)
    1bee:	2b26                	fld	fs6,72(sp)
    1bf0:	2b86                	fld	fs7,64(sp)
    1bf2:	3c62                	fld	fs8,56(sp)
    1bf4:	3cc2                	fld	fs9,48(sp)
    1bf6:	3d22                	fld	fs10,40(sp)
    1bf8:	3d82                	fld	fs11,32(sp)
    1bfa:	2e62                	fld	ft8,24(sp)
    1bfc:	2ec2                	fld	ft9,16(sp)
    1bfe:	2f22                	fld	ft10,8(sp)
    1c00:	2f82                	fld	ft11,0(sp)
    1c02:	6171                	addi	sp,sp,336
    1c04:	30200073          	mret
    1c08:	0000                	unimp
	...

00001c0c <handler_irq_fast_dma_done>:
{
    1c0c:	714d                	addi	sp,sp,-336
    1c0e:	14112623          	sw	ra,332(sp)
    1c12:	14512423          	sw	t0,328(sp)
    1c16:	003022f3          	frcsr	t0
    1c1a:	14512223          	sw	t0,324(sp)
    1c1e:	14612023          	sw	t1,320(sp)
    1c22:	12712e23          	sw	t2,316(sp)
    1c26:	12a12c23          	sw	a0,312(sp)
    1c2a:	12b12a23          	sw	a1,308(sp)
    1c2e:	12c12823          	sw	a2,304(sp)
    1c32:	12d12623          	sw	a3,300(sp)
    1c36:	12e12423          	sw	a4,296(sp)
    1c3a:	12f12223          	sw	a5,292(sp)
    1c3e:	13012023          	sw	a6,288(sp)
    1c42:	11112e23          	sw	a7,284(sp)
    1c46:	11c12c23          	sw	t3,280(sp)
    1c4a:	11d12a23          	sw	t4,276(sp)
    1c4e:	11e12823          	sw	t5,272(sp)
    1c52:	11f12623          	sw	t6,268(sp)
    1c56:	bd82                	fsd	ft0,248(sp)
    1c58:	b986                	fsd	ft1,240(sp)
    1c5a:	b58a                	fsd	ft2,232(sp)
    1c5c:	b18e                	fsd	ft3,224(sp)
    1c5e:	ad92                	fsd	ft4,216(sp)
    1c60:	a996                	fsd	ft5,208(sp)
    1c62:	a59a                	fsd	ft6,200(sp)
    1c64:	a19e                	fsd	ft7,192(sp)
    1c66:	bd22                	fsd	fs0,184(sp)
    1c68:	b926                	fsd	fs1,176(sp)
    1c6a:	b52a                	fsd	fa0,168(sp)
    1c6c:	b12e                	fsd	fa1,160(sp)
    1c6e:	ad32                	fsd	fa2,152(sp)
    1c70:	a936                	fsd	fa3,144(sp)
    1c72:	a53a                	fsd	fa4,136(sp)
    1c74:	a13e                	fsd	fa5,128(sp)
    1c76:	bcc2                	fsd	fa6,120(sp)
    1c78:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1c7a:	200607b7          	lui	a5,0x20060
{
    1c7e:	b4ca                	fsd	fs2,104(sp)
    1c80:	b0ce                	fsd	fs3,96(sp)
    1c82:	acd2                	fsd	fs4,88(sp)
    1c84:	a8d6                	fsd	fs5,80(sp)
    1c86:	a4da                	fsd	fs6,72(sp)
    1c88:	a0de                	fsd	fs7,64(sp)
    1c8a:	bc62                	fsd	fs8,56(sp)
    1c8c:	b866                	fsd	fs9,48(sp)
    1c8e:	b46a                	fsd	fs10,40(sp)
    1c90:	b06e                	fsd	fs11,32(sp)
    1c92:	ac72                	fsd	ft8,24(sp)
    1c94:	a876                	fsd	ft9,16(sp)
    1c96:	a47a                	fsd	ft10,8(sp)
    1c98:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1c9a:	4721                	li	a4,8
    1c9c:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
    1c9e:	809fe0ef          	jal	4a6 <fic_irq_dma_done>
}
    1ca2:	14c12083          	lw	ra,332(sp)
    1ca6:	14412283          	lw	t0,324(sp)
    1caa:	00329073          	fscsr	t0
    1cae:	14812283          	lw	t0,328(sp)
    1cb2:	14012303          	lw	t1,320(sp)
    1cb6:	13c12383          	lw	t2,316(sp)
    1cba:	13812503          	lw	a0,312(sp)
    1cbe:	13412583          	lw	a1,308(sp)
    1cc2:	13012603          	lw	a2,304(sp)
    1cc6:	12c12683          	lw	a3,300(sp)
    1cca:	12812703          	lw	a4,296(sp)
    1cce:	12412783          	lw	a5,292(sp)
    1cd2:	12012803          	lw	a6,288(sp)
    1cd6:	11c12883          	lw	a7,284(sp)
    1cda:	11812e03          	lw	t3,280(sp)
    1cde:	11412e83          	lw	t4,276(sp)
    1ce2:	11012f03          	lw	t5,272(sp)
    1ce6:	10c12f83          	lw	t6,268(sp)
    1cea:	306e                	fld	ft0,248(sp)
    1cec:	30ce                	fld	ft1,240(sp)
    1cee:	312e                	fld	ft2,232(sp)
    1cf0:	318e                	fld	ft3,224(sp)
    1cf2:	226e                	fld	ft4,216(sp)
    1cf4:	22ce                	fld	ft5,208(sp)
    1cf6:	232e                	fld	ft6,200(sp)
    1cf8:	238e                	fld	ft7,192(sp)
    1cfa:	346a                	fld	fs0,184(sp)
    1cfc:	34ca                	fld	fs1,176(sp)
    1cfe:	352a                	fld	fa0,168(sp)
    1d00:	358a                	fld	fa1,160(sp)
    1d02:	266a                	fld	fa2,152(sp)
    1d04:	26ca                	fld	fa3,144(sp)
    1d06:	272a                	fld	fa4,136(sp)
    1d08:	278a                	fld	fa5,128(sp)
    1d0a:	3866                	fld	fa6,120(sp)
    1d0c:	38c6                	fld	fa7,112(sp)
    1d0e:	3926                	fld	fs2,104(sp)
    1d10:	3986                	fld	fs3,96(sp)
    1d12:	2a66                	fld	fs4,88(sp)
    1d14:	2ac6                	fld	fs5,80(sp)
    1d16:	2b26                	fld	fs6,72(sp)
    1d18:	2b86                	fld	fs7,64(sp)
    1d1a:	3c62                	fld	fs8,56(sp)
    1d1c:	3cc2                	fld	fs9,48(sp)
    1d1e:	3d22                	fld	fs10,40(sp)
    1d20:	3d82                	fld	fs11,32(sp)
    1d22:	2e62                	fld	ft8,24(sp)
    1d24:	2ec2                	fld	ft9,16(sp)
    1d26:	2f22                	fld	ft10,8(sp)
    1d28:	2f82                	fld	ft11,0(sp)
    1d2a:	6171                	addi	sp,sp,336
    1d2c:	30200073          	mret
    1d30:	0000                	unimp
	...

00001d34 <handler_irq_fast_dma_window>:
{
    1d34:	714d                	addi	sp,sp,-336
    1d36:	14112623          	sw	ra,332(sp)
    1d3a:	14512423          	sw	t0,328(sp)
    1d3e:	003022f3          	frcsr	t0
    1d42:	14512223          	sw	t0,324(sp)
    1d46:	14612023          	sw	t1,320(sp)
    1d4a:	12712e23          	sw	t2,316(sp)
    1d4e:	12a12c23          	sw	a0,312(sp)
    1d52:	12b12a23          	sw	a1,308(sp)
    1d56:	12c12823          	sw	a2,304(sp)
    1d5a:	12d12623          	sw	a3,300(sp)
    1d5e:	12e12423          	sw	a4,296(sp)
    1d62:	12f12223          	sw	a5,292(sp)
    1d66:	13012023          	sw	a6,288(sp)
    1d6a:	11112e23          	sw	a7,284(sp)
    1d6e:	11c12c23          	sw	t3,280(sp)
    1d72:	11d12a23          	sw	t4,276(sp)
    1d76:	11e12823          	sw	t5,272(sp)
    1d7a:	11f12623          	sw	t6,268(sp)
    1d7e:	bd82                	fsd	ft0,248(sp)
    1d80:	b986                	fsd	ft1,240(sp)
    1d82:	b58a                	fsd	ft2,232(sp)
    1d84:	b18e                	fsd	ft3,224(sp)
    1d86:	ad92                	fsd	ft4,216(sp)
    1d88:	a996                	fsd	ft5,208(sp)
    1d8a:	a59a                	fsd	ft6,200(sp)
    1d8c:	a19e                	fsd	ft7,192(sp)
    1d8e:	bd22                	fsd	fs0,184(sp)
    1d90:	b926                	fsd	fs1,176(sp)
    1d92:	b52a                	fsd	fa0,168(sp)
    1d94:	b12e                	fsd	fa1,160(sp)
    1d96:	ad32                	fsd	fa2,152(sp)
    1d98:	a936                	fsd	fa3,144(sp)
    1d9a:	a53a                	fsd	fa4,136(sp)
    1d9c:	a13e                	fsd	fa5,128(sp)
    1d9e:	bcc2                	fsd	fa6,120(sp)
    1da0:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1da2:	200607b7          	lui	a5,0x20060
{
    1da6:	b4ca                	fsd	fs2,104(sp)
    1da8:	b0ce                	fsd	fs3,96(sp)
    1daa:	acd2                	fsd	fs4,88(sp)
    1dac:	a8d6                	fsd	fs5,80(sp)
    1dae:	a4da                	fsd	fs6,72(sp)
    1db0:	a0de                	fsd	fs7,64(sp)
    1db2:	bc62                	fsd	fs8,56(sp)
    1db4:	b866                	fsd	fs9,48(sp)
    1db6:	b46a                	fsd	fs10,40(sp)
    1db8:	b06e                	fsd	fs11,32(sp)
    1dba:	ac72                	fsd	ft8,24(sp)
    1dbc:	a876                	fsd	ft9,16(sp)
    1dbe:	a47a                	fsd	ft10,8(sp)
    1dc0:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1dc2:	6711                	lui	a4,0x4
    1dc4:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
    1dc6:	e8cfe0ef          	jal	452 <fic_irq_dma_window>
}
    1dca:	14c12083          	lw	ra,332(sp)
    1dce:	14412283          	lw	t0,324(sp)
    1dd2:	00329073          	fscsr	t0
    1dd6:	14812283          	lw	t0,328(sp)
    1dda:	14012303          	lw	t1,320(sp)
    1dde:	13c12383          	lw	t2,316(sp)
    1de2:	13812503          	lw	a0,312(sp)
    1de6:	13412583          	lw	a1,308(sp)
    1dea:	13012603          	lw	a2,304(sp)
    1dee:	12c12683          	lw	a3,300(sp)
    1df2:	12812703          	lw	a4,296(sp)
    1df6:	12412783          	lw	a5,292(sp)
    1dfa:	12012803          	lw	a6,288(sp)
    1dfe:	11c12883          	lw	a7,284(sp)
    1e02:	11812e03          	lw	t3,280(sp)
    1e06:	11412e83          	lw	t4,276(sp)
    1e0a:	11012f03          	lw	t5,272(sp)
    1e0e:	10c12f83          	lw	t6,268(sp)
    1e12:	306e                	fld	ft0,248(sp)
    1e14:	30ce                	fld	ft1,240(sp)
    1e16:	312e                	fld	ft2,232(sp)
    1e18:	318e                	fld	ft3,224(sp)
    1e1a:	226e                	fld	ft4,216(sp)
    1e1c:	22ce                	fld	ft5,208(sp)
    1e1e:	232e                	fld	ft6,200(sp)
    1e20:	238e                	fld	ft7,192(sp)
    1e22:	346a                	fld	fs0,184(sp)
    1e24:	34ca                	fld	fs1,176(sp)
    1e26:	352a                	fld	fa0,168(sp)
    1e28:	358a                	fld	fa1,160(sp)
    1e2a:	266a                	fld	fa2,152(sp)
    1e2c:	26ca                	fld	fa3,144(sp)
    1e2e:	272a                	fld	fa4,136(sp)
    1e30:	278a                	fld	fa5,128(sp)
    1e32:	3866                	fld	fa6,120(sp)
    1e34:	38c6                	fld	fa7,112(sp)
    1e36:	3926                	fld	fs2,104(sp)
    1e38:	3986                	fld	fs3,96(sp)
    1e3a:	2a66                	fld	fs4,88(sp)
    1e3c:	2ac6                	fld	fs5,80(sp)
    1e3e:	2b26                	fld	fs6,72(sp)
    1e40:	2b86                	fld	fs7,64(sp)
    1e42:	3c62                	fld	fs8,56(sp)
    1e44:	3cc2                	fld	fs9,48(sp)
    1e46:	3d22                	fld	fs10,40(sp)
    1e48:	3d82                	fld	fs11,32(sp)
    1e4a:	2e62                	fld	ft8,24(sp)
    1e4c:	2ec2                	fld	ft9,16(sp)
    1e4e:	2f22                	fld	ft10,8(sp)
    1e50:	2f82                	fld	ft11,0(sp)
    1e52:	6171                	addi	sp,sp,336
    1e54:	30200073          	mret
    1e58:	0000                	unimp
	...

00001e5c <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    1e5c:	714d                	addi	sp,sp,-336
    1e5e:	14112623          	sw	ra,332(sp)
    1e62:	14512423          	sw	t0,328(sp)
    1e66:	003022f3          	frcsr	t0
    1e6a:	14512223          	sw	t0,324(sp)
    1e6e:	14612023          	sw	t1,320(sp)
    1e72:	12712e23          	sw	t2,316(sp)
    1e76:	12a12c23          	sw	a0,312(sp)
    1e7a:	12b12a23          	sw	a1,308(sp)
    1e7e:	12c12823          	sw	a2,304(sp)
    1e82:	12d12623          	sw	a3,300(sp)
    1e86:	12e12423          	sw	a4,296(sp)
    1e8a:	12f12223          	sw	a5,292(sp)
    1e8e:	13012023          	sw	a6,288(sp)
    1e92:	11112e23          	sw	a7,284(sp)
    1e96:	11c12c23          	sw	t3,280(sp)
    1e9a:	11d12a23          	sw	t4,276(sp)
    1e9e:	11e12823          	sw	t5,272(sp)
    1ea2:	11f12623          	sw	t6,268(sp)
    1ea6:	bd82                	fsd	ft0,248(sp)
    1ea8:	b986                	fsd	ft1,240(sp)
    1eaa:	b58a                	fsd	ft2,232(sp)
    1eac:	b18e                	fsd	ft3,224(sp)
    1eae:	ad92                	fsd	ft4,216(sp)
    1eb0:	a996                	fsd	ft5,208(sp)
    1eb2:	a59a                	fsd	ft6,200(sp)
    1eb4:	a19e                	fsd	ft7,192(sp)
    1eb6:	bd22                	fsd	fs0,184(sp)
    1eb8:	b926                	fsd	fs1,176(sp)
    1eba:	b52a                	fsd	fa0,168(sp)
    1ebc:	b12e                	fsd	fa1,160(sp)
    1ebe:	ad32                	fsd	fa2,152(sp)
    1ec0:	a936                	fsd	fa3,144(sp)
    1ec2:	a53a                	fsd	fa4,136(sp)
    1ec4:	a13e                	fsd	fa5,128(sp)
    1ec6:	bcc2                	fsd	fa6,120(sp)
    1ec8:	b8c6                	fsd	fa7,112(sp)
    1eca:	b4ca                	fsd	fs2,104(sp)
    1ecc:	b0ce                	fsd	fs3,96(sp)
    1ece:	acd2                	fsd	fs4,88(sp)
    1ed0:	a8d6                	fsd	fs5,80(sp)
    1ed2:	a4da                	fsd	fs6,72(sp)
    1ed4:	a0de                	fsd	fs7,64(sp)
    1ed6:	bc62                	fsd	fs8,56(sp)
    1ed8:	b866                	fsd	fs9,48(sp)
    1eda:	b46a                	fsd	fs10,40(sp)
    1edc:	b06e                	fsd	fs11,32(sp)
    1ede:	ac72                	fsd	ft8,24(sp)
    1ee0:	a876                	fsd	ft9,16(sp)
    1ee2:	a47a                	fsd	ft10,8(sp)
    1ee4:	a07e                	fsd	ft11,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    1ee6:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    1eea:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
    1eec:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
    1eee:	00f76963          	bltu	a4,a5,1f00 <handler_exception+0xa4>
    1ef2:	6711                	lui	a4,0x4
    1ef4:	078a                	slli	a5,a5,0x2
    1ef6:	19c70713          	addi	a4,a4,412 # 419c <zetas_DSA+0x400>
    1efa:	97ba                	add	a5,a5,a4
    1efc:	439c                	lw	a5,0(a5)
    1efe:	8782                	jr	a5
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
    1f00:	a001                	j	1f00 <handler_exception+0xa4>
__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    1f02:	6515                	lui	a0,0x5
    1f04:	84c50513          	addi	a0,a0,-1972 # 484c <zetas_DSA+0x680>
    1f08:	9adfe0ef          	jal	8b4 <print_exc_msg>
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    1f0c:	6511                	lui	a0,0x4
    1f0e:	79c50513          	addi	a0,a0,1948 # 479c <zetas_DSA+0x5d0>
    1f12:	9a3fe0ef          	jal	8b4 <print_exc_msg>
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    1f16:	6511                	lui	a0,0x4
    1f18:	7d450513          	addi	a0,a0,2004 # 47d4 <zetas_DSA+0x608>
    1f1c:	999fe0ef          	jal	8b4 <print_exc_msg>
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    1f20:	6515                	lui	a0,0x5
    1f22:	81050513          	addi	a0,a0,-2032 # 4810 <zetas_DSA+0x644>
    1f26:	98ffe0ef          	jal	8b4 <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
    1f2a:	6515                	lui	a0,0x5
    1f2c:	88050513          	addi	a0,a0,-1920 # 4880 <zetas_DSA+0x6b4>
    1f30:	969fe0ef          	jal	898 <_writestr>
  while (1) {
    1f34:	a001                	j	1f34 <handler_exception+0xd8>
	...

00001f38 <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
    1f38:	714d                	addi	sp,sp,-336
    1f3a:	14112623          	sw	ra,332(sp)
    1f3e:	14512423          	sw	t0,328(sp)
    1f42:	003022f3          	frcsr	t0
    1f46:	12a12c23          	sw	a0,312(sp)
  _writestr("Software IRQ triggered!\n"); 
    1f4a:	6515                	lui	a0,0x5
__attribute__((weak)) void handler_irq_software(void) {
    1f4c:	14512223          	sw	t0,324(sp)
    1f50:	14612023          	sw	t1,320(sp)
    1f54:	12712e23          	sw	t2,316(sp)
    1f58:	12b12a23          	sw	a1,308(sp)
    1f5c:	12c12823          	sw	a2,304(sp)
    1f60:	12d12623          	sw	a3,300(sp)
    1f64:	12e12423          	sw	a4,296(sp)
    1f68:	12f12223          	sw	a5,292(sp)
    1f6c:	13012023          	sw	a6,288(sp)
    1f70:	11112e23          	sw	a7,284(sp)
    1f74:	11c12c23          	sw	t3,280(sp)
    1f78:	11d12a23          	sw	t4,276(sp)
    1f7c:	11e12823          	sw	t5,272(sp)
    1f80:	11f12623          	sw	t6,268(sp)
    1f84:	bd82                	fsd	ft0,248(sp)
    1f86:	b986                	fsd	ft1,240(sp)
    1f88:	b58a                	fsd	ft2,232(sp)
    1f8a:	b18e                	fsd	ft3,224(sp)
    1f8c:	ad92                	fsd	ft4,216(sp)
    1f8e:	a996                	fsd	ft5,208(sp)
    1f90:	a59a                	fsd	ft6,200(sp)
    1f92:	a19e                	fsd	ft7,192(sp)
    1f94:	bd22                	fsd	fs0,184(sp)
    1f96:	b926                	fsd	fs1,176(sp)
    1f98:	b52a                	fsd	fa0,168(sp)
    1f9a:	b12e                	fsd	fa1,160(sp)
    1f9c:	ad32                	fsd	fa2,152(sp)
    1f9e:	a936                	fsd	fa3,144(sp)
    1fa0:	a53a                	fsd	fa4,136(sp)
    1fa2:	a13e                	fsd	fa5,128(sp)
    1fa4:	bcc2                	fsd	fa6,120(sp)
  _writestr("Software IRQ triggered!\n"); 
    1fa6:	8a050513          	addi	a0,a0,-1888 # 48a0 <zetas_DSA+0x6d4>
__attribute__((weak)) void handler_irq_software(void) {
    1faa:	b8c6                	fsd	fa7,112(sp)
    1fac:	b4ca                	fsd	fs2,104(sp)
    1fae:	b0ce                	fsd	fs3,96(sp)
    1fb0:	acd2                	fsd	fs4,88(sp)
    1fb2:	a8d6                	fsd	fs5,80(sp)
    1fb4:	a4da                	fsd	fs6,72(sp)
    1fb6:	a0de                	fsd	fs7,64(sp)
    1fb8:	bc62                	fsd	fs8,56(sp)
    1fba:	b866                	fsd	fs9,48(sp)
    1fbc:	b46a                	fsd	fs10,40(sp)
    1fbe:	b06e                	fsd	fs11,32(sp)
    1fc0:	ac72                	fsd	ft8,24(sp)
    1fc2:	a876                	fsd	ft9,16(sp)
    1fc4:	a47a                	fsd	ft10,8(sp)
    1fc6:	a07e                	fsd	ft11,0(sp)
  _writestr("Software IRQ triggered!\n"); 
    1fc8:	8d1fe0ef          	jal	898 <_writestr>
  while (1) {
    1fcc:	a001                	j	1fcc <handler_irq_software+0x94>
	...

00001fd0 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
    1fd0:	714d                	addi	sp,sp,-336
    1fd2:	14112623          	sw	ra,332(sp)
    1fd6:	14512423          	sw	t0,328(sp)
    1fda:	003022f3          	frcsr	t0
    1fde:	12a12c23          	sw	a0,312(sp)
  _writestr("Timer IRQ triggered!\n"); 
    1fe2:	6515                	lui	a0,0x5
__attribute__((weak)) void handler_irq_timer(void) {
    1fe4:	14512223          	sw	t0,324(sp)
    1fe8:	14612023          	sw	t1,320(sp)
    1fec:	12712e23          	sw	t2,316(sp)
    1ff0:	12b12a23          	sw	a1,308(sp)
    1ff4:	12c12823          	sw	a2,304(sp)
    1ff8:	12d12623          	sw	a3,300(sp)
    1ffc:	12e12423          	sw	a4,296(sp)
    2000:	12f12223          	sw	a5,292(sp)
    2004:	13012023          	sw	a6,288(sp)
    2008:	11112e23          	sw	a7,284(sp)
    200c:	11c12c23          	sw	t3,280(sp)
    2010:	11d12a23          	sw	t4,276(sp)
    2014:	11e12823          	sw	t5,272(sp)
    2018:	11f12623          	sw	t6,268(sp)
    201c:	bd82                	fsd	ft0,248(sp)
    201e:	b986                	fsd	ft1,240(sp)
    2020:	b58a                	fsd	ft2,232(sp)
    2022:	b18e                	fsd	ft3,224(sp)
    2024:	ad92                	fsd	ft4,216(sp)
    2026:	a996                	fsd	ft5,208(sp)
    2028:	a59a                	fsd	ft6,200(sp)
    202a:	a19e                	fsd	ft7,192(sp)
    202c:	bd22                	fsd	fs0,184(sp)
    202e:	b926                	fsd	fs1,176(sp)
    2030:	b52a                	fsd	fa0,168(sp)
    2032:	b12e                	fsd	fa1,160(sp)
    2034:	ad32                	fsd	fa2,152(sp)
    2036:	a936                	fsd	fa3,144(sp)
    2038:	a53a                	fsd	fa4,136(sp)
    203a:	a13e                	fsd	fa5,128(sp)
    203c:	bcc2                	fsd	fa6,120(sp)
  _writestr("Timer IRQ triggered!\n"); 
    203e:	8bc50513          	addi	a0,a0,-1860 # 48bc <zetas_DSA+0x6f0>
__attribute__((weak)) void handler_irq_timer(void) {
    2042:	b8c6                	fsd	fa7,112(sp)
    2044:	b4ca                	fsd	fs2,104(sp)
    2046:	b0ce                	fsd	fs3,96(sp)
    2048:	acd2                	fsd	fs4,88(sp)
    204a:	a8d6                	fsd	fs5,80(sp)
    204c:	a4da                	fsd	fs6,72(sp)
    204e:	a0de                	fsd	fs7,64(sp)
    2050:	bc62                	fsd	fs8,56(sp)
    2052:	b866                	fsd	fs9,48(sp)
    2054:	b46a                	fsd	fs10,40(sp)
    2056:	b06e                	fsd	fs11,32(sp)
    2058:	ac72                	fsd	ft8,24(sp)
    205a:	a876                	fsd	ft9,16(sp)
    205c:	a47a                	fsd	ft10,8(sp)
    205e:	a07e                	fsd	ft11,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
    2060:	839fe0ef          	jal	898 <_writestr>
  while (1) {
    2064:	a001                	j	2064 <handler_irq_timer+0x94>
	...

00002068 <init>:
#endif

int init()
{
    return 0;
}
    2068:	4501                	li	a0,0
    206a:	8082                	ret

0000206c <_close>:
}
    206c:	557d                	li	a0,-1
    206e:	8082                	ret

00002070 <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    2070:	200007b7          	lui	a5,0x20000
    2074:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    2076:	4705                	li	a4,1
    2078:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1ffc13c0>
    asm volatile("wfi");
    207c:	10500073          	wfi

00002080 <_fstat>:
    st->st_mode = S_IFCHR;
    2080:	6789                	lui	a5,0x2
    2082:	c1dc                	sw	a5,4(a1)
}
    2084:	4501                	li	a0,0
    2086:	8082                	ret

00002088 <_isatty>:
    return (file == STDOUT_FILENO);
    2088:	157d                	addi	a0,a0,-1
}
    208a:	00153513          	seqz	a0,a0
    208e:	8082                	ret

00002090 <_lseek>:
}
    2090:	4501                	li	a0,0
    2092:	8082                	ret

00002094 <_read>:
}
    2094:	4501                	li	a0,0
    2096:	8082                	ret

00002098 <_write_r>:
    return _write(fd,buf,cnt);
    2098:	852e                	mv	a0,a1
    209a:	85b2                	mv	a1,a2
    209c:	8636                	mv	a2,a3
    209e:	c9efe06f          	j	53c <_write>

000020a2 <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
    20a2:	00027737          	lui	a4,0x27
    20a6:	c4018693          	addi	a3,gp,-960 # ec40 <__BSS_END__>
    20aa:	c4070713          	addi	a4,a4,-960 # 26c40 <__heap_end>
{
    20ae:	87aa                	mv	a5,a0
    char *old_brk = brk;
    20b0:	9301a503          	lw	a0,-1744(gp) # e930 <brk>
    if (__heap_start == __heap_end) {
    20b4:	00e68c63          	beq	a3,a4,20cc <_sbrk+0x2a>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    20b8:	97aa                	add	a5,a5,a0
    20ba:	00e7f763          	bgeu	a5,a4,20c8 <_sbrk+0x26>
    20be:	00d7e563          	bltu	a5,a3,20c8 <_sbrk+0x26>
        brk += incr;
    20c2:	92f1a823          	sw	a5,-1744(gp) # e930 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    20c6:	8082                	ret
        return (void *)-1; 
    20c8:	557d                	li	a0,-1
}
    20ca:	8082                	ret
        return NULL; 
    20cc:	4501                	li	a0,0
    20ce:	8082                	ret

000020d0 <atexit>:
    20d0:	85aa                	mv	a1,a0
    20d2:	4681                	li	a3,0
    20d4:	4601                	li	a2,0
    20d6:	4501                	li	a0,0
    20d8:	a6b1                	j	2424 <__register_exitproc>

000020da <exit>:
    20da:	1141                	addi	sp,sp,-16
    20dc:	c422                	sw	s0,8(sp)
    20de:	c606                	sw	ra,12(sp)
    20e0:	00000797          	auipc	a5,0x0
    20e4:	3b878793          	addi	a5,a5,952 # 2498 <__call_exitprocs>
    20e8:	842a                	mv	s0,a0
    20ea:	c399                	beqz	a5,20f0 <exit+0x16>
    20ec:	4581                	li	a1,0
    20ee:	266d                	jal	2498 <__call_exitprocs>
    20f0:	c2c1a783          	lw	a5,-980(gp) # ec2c <__stdio_exit_handler>
    20f4:	c391                	beqz	a5,20f8 <exit+0x1e>
    20f6:	9782                	jalr	a5
    20f8:	8522                	mv	a0,s0
    20fa:	3f9d                	jal	2070 <_exit>

000020fc <std>:
    20fc:	1141                	addi	sp,sp,-16
    20fe:	c422                	sw	s0,8(sp)
    2100:	c606                	sw	ra,12(sp)
    2102:	842a                	mv	s0,a0
    2104:	00b51623          	sh	a1,12(a0)
    2108:	00c51723          	sh	a2,14(a0)
    210c:	00052023          	sw	zero,0(a0)
    2110:	00052223          	sw	zero,4(a0)
    2114:	00052423          	sw	zero,8(a0)
    2118:	06052223          	sw	zero,100(a0)
    211c:	00052823          	sw	zero,16(a0)
    2120:	00052a23          	sw	zero,20(a0)
    2124:	00052c23          	sw	zero,24(a0)
    2128:	4621                	li	a2,8
    212a:	4581                	li	a1,0
    212c:	05c50513          	addi	a0,a0,92
    2130:	af8fe0ef          	jal	428 <memset>
    2134:	00000797          	auipc	a5,0x0
    2138:	14078793          	addi	a5,a5,320 # 2274 <__sread>
    213c:	d05c                	sw	a5,36(s0)
    213e:	00000797          	auipc	a5,0x0
    2142:	16678793          	addi	a5,a5,358 # 22a4 <__swrite>
    2146:	d41c                	sw	a5,40(s0)
    2148:	00000797          	auipc	a5,0x0
    214c:	1aa78793          	addi	a5,a5,426 # 22f2 <__sseek>
    2150:	d45c                	sw	a5,44(s0)
    2152:	00000797          	auipc	a5,0x0
    2156:	1d678793          	addi	a5,a5,470 # 2328 <__sclose>
    215a:	40b2                	lw	ra,12(sp)
    215c:	d000                	sw	s0,32(s0)
    215e:	d81c                	sw	a5,48(s0)
    2160:	4422                	lw	s0,8(sp)
    2162:	0141                	addi	sp,sp,16
    2164:	8082                	ret

00002166 <stdio_exit_handler>:
    2166:	0000c617          	auipc	a2,0xc
    216a:	77260613          	addi	a2,a2,1906 # e8d8 <__sglue>
    216e:	00000597          	auipc	a1,0x0
    2172:	72c58593          	addi	a1,a1,1836 # 289a <_fflush_r>
    2176:	0000c517          	auipc	a0,0xc
    217a:	76e50513          	addi	a0,a0,1902 # e8e4 <_impure_data>
    217e:	a079                	j	220c <_fwalk_sglue>

00002180 <cleanup_stdio>:
    2180:	414c                	lw	a1,4(a0)
    2182:	1141                	addi	sp,sp,-16
    2184:	c422                	sw	s0,8(sp)
    2186:	c606                	sw	ra,12(sp)
    2188:	a6818793          	addi	a5,gp,-1432 # ea68 <__sf>
    218c:	842a                	mv	s0,a0
    218e:	00f58463          	beq	a1,a5,2196 <cleanup_stdio+0x16>
    2192:	708000ef          	jal	289a <_fflush_r>
    2196:	440c                	lw	a1,8(s0)
    2198:	ad018793          	addi	a5,gp,-1328 # ead0 <__sf+0x68>
    219c:	00f58563          	beq	a1,a5,21a6 <cleanup_stdio+0x26>
    21a0:	8522                	mv	a0,s0
    21a2:	6f8000ef          	jal	289a <_fflush_r>
    21a6:	444c                	lw	a1,12(s0)
    21a8:	b3818793          	addi	a5,gp,-1224 # eb38 <__sf+0xd0>
    21ac:	00f58763          	beq	a1,a5,21ba <cleanup_stdio+0x3a>
    21b0:	8522                	mv	a0,s0
    21b2:	4422                	lw	s0,8(sp)
    21b4:	40b2                	lw	ra,12(sp)
    21b6:	0141                	addi	sp,sp,16
    21b8:	a5cd                	j	289a <_fflush_r>
    21ba:	40b2                	lw	ra,12(sp)
    21bc:	4422                	lw	s0,8(sp)
    21be:	0141                	addi	sp,sp,16
    21c0:	8082                	ret

000021c2 <global_stdio_init.part.0>:
    21c2:	1141                	addi	sp,sp,-16
    21c4:	00000797          	auipc	a5,0x0
    21c8:	fa278793          	addi	a5,a5,-94 # 2166 <stdio_exit_handler>
    21cc:	4601                	li	a2,0
    21ce:	4591                	li	a1,4
    21d0:	a6818513          	addi	a0,gp,-1432 # ea68 <__sf>
    21d4:	c606                	sw	ra,12(sp)
    21d6:	c2f1a623          	sw	a5,-980(gp) # ec2c <__stdio_exit_handler>
    21da:	370d                	jal	20fc <std>
    21dc:	4605                	li	a2,1
    21de:	45a5                	li	a1,9
    21e0:	ad018513          	addi	a0,gp,-1328 # ead0 <__sf+0x68>
    21e4:	3f21                	jal	20fc <std>
    21e6:	40b2                	lw	ra,12(sp)
    21e8:	4609                	li	a2,2
    21ea:	45c9                	li	a1,18
    21ec:	b3818513          	addi	a0,gp,-1224 # eb38 <__sf+0xd0>
    21f0:	0141                	addi	sp,sp,16
    21f2:	b729                	j	20fc <std>

000021f4 <__sinit>:
    21f4:	511c                	lw	a5,32(a0)
    21f6:	eb91                	bnez	a5,220a <__sinit+0x16>
    21f8:	00000797          	auipc	a5,0x0
    21fc:	f8878793          	addi	a5,a5,-120 # 2180 <cleanup_stdio>
    2200:	d11c                	sw	a5,32(a0)
    2202:	c2c1a783          	lw	a5,-980(gp) # ec2c <__stdio_exit_handler>
    2206:	e391                	bnez	a5,220a <__sinit+0x16>
    2208:	bf6d                	j	21c2 <global_stdio_init.part.0>
    220a:	8082                	ret

0000220c <_fwalk_sglue>:
    220c:	7179                	addi	sp,sp,-48
    220e:	d422                	sw	s0,40(sp)
    2210:	d04a                	sw	s2,32(sp)
    2212:	ce4e                	sw	s3,28(sp)
    2214:	cc52                	sw	s4,24(sp)
    2216:	c85a                	sw	s6,16(sp)
    2218:	c65e                	sw	s7,12(sp)
    221a:	d606                	sw	ra,44(sp)
    221c:	d226                	sw	s1,36(sp)
    221e:	ca56                	sw	s5,20(sp)
    2220:	89aa                	mv	s3,a0
    2222:	8a2e                	mv	s4,a1
    2224:	8432                	mv	s0,a2
    2226:	4901                	li	s2,0
    2228:	4b05                	li	s6,1
    222a:	5bfd                	li	s7,-1
    222c:	4404                	lw	s1,8(s0)
    222e:	00442a83          	lw	s5,4(s0)
    2232:	1afd                	addi	s5,s5,-1
    2234:	020ad063          	bgez	s5,2254 <_fwalk_sglue+0x48>
    2238:	4000                	lw	s0,0(s0)
    223a:	f86d                	bnez	s0,222c <_fwalk_sglue+0x20>
    223c:	50b2                	lw	ra,44(sp)
    223e:	5422                	lw	s0,40(sp)
    2240:	5492                	lw	s1,36(sp)
    2242:	49f2                	lw	s3,28(sp)
    2244:	4a62                	lw	s4,24(sp)
    2246:	4ad2                	lw	s5,20(sp)
    2248:	4b42                	lw	s6,16(sp)
    224a:	4bb2                	lw	s7,12(sp)
    224c:	854a                	mv	a0,s2
    224e:	5902                	lw	s2,32(sp)
    2250:	6145                	addi	sp,sp,48
    2252:	8082                	ret
    2254:	00c4d783          	lhu	a5,12(s1)
    2258:	00fb7b63          	bgeu	s6,a5,226e <_fwalk_sglue+0x62>
    225c:	00e49783          	lh	a5,14(s1)
    2260:	01778763          	beq	a5,s7,226e <_fwalk_sglue+0x62>
    2264:	85a6                	mv	a1,s1
    2266:	854e                	mv	a0,s3
    2268:	9a02                	jalr	s4
    226a:	00a96933          	or	s2,s2,a0
    226e:	06848493          	addi	s1,s1,104
    2272:	b7c1                	j	2232 <_fwalk_sglue+0x26>

00002274 <__sread>:
    2274:	1141                	addi	sp,sp,-16
    2276:	c422                	sw	s0,8(sp)
    2278:	842e                	mv	s0,a1
    227a:	00e59583          	lh	a1,14(a1)
    227e:	c606                	sw	ra,12(sp)
    2280:	28fd                	jal	237e <_read_r>
    2282:	00054963          	bltz	a0,2294 <__sread+0x20>
    2286:	487c                	lw	a5,84(s0)
    2288:	97aa                	add	a5,a5,a0
    228a:	c87c                	sw	a5,84(s0)
    228c:	40b2                	lw	ra,12(sp)
    228e:	4422                	lw	s0,8(sp)
    2290:	0141                	addi	sp,sp,16
    2292:	8082                	ret
    2294:	00c45783          	lhu	a5,12(s0)
    2298:	777d                	lui	a4,0xfffff
    229a:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03bf>
    229c:	8ff9                	and	a5,a5,a4
    229e:	00f41623          	sh	a5,12(s0)
    22a2:	b7ed                	j	228c <__sread+0x18>

000022a4 <__swrite>:
    22a4:	00c5d783          	lhu	a5,12(a1)
    22a8:	1101                	addi	sp,sp,-32
    22aa:	cc22                	sw	s0,24(sp)
    22ac:	ca26                	sw	s1,20(sp)
    22ae:	c84a                	sw	s2,16(sp)
    22b0:	c64e                	sw	s3,12(sp)
    22b2:	ce06                	sw	ra,28(sp)
    22b4:	1007f793          	andi	a5,a5,256
    22b8:	84aa                	mv	s1,a0
    22ba:	842e                	mv	s0,a1
    22bc:	8932                	mv	s2,a2
    22be:	89b6                	mv	s3,a3
    22c0:	c791                	beqz	a5,22cc <__swrite+0x28>
    22c2:	00e59583          	lh	a1,14(a1)
    22c6:	4689                	li	a3,2
    22c8:	4601                	li	a2,0
    22ca:	2069                	jal	2354 <_lseek_r>
    22cc:	00c45783          	lhu	a5,12(s0)
    22d0:	777d                	lui	a4,0xfffff
    22d2:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03bf>
    22d4:	8ff9                	and	a5,a5,a4
    22d6:	00e41583          	lh	a1,14(s0)
    22da:	00f41623          	sh	a5,12(s0)
    22de:	4462                	lw	s0,24(sp)
    22e0:	40f2                	lw	ra,28(sp)
    22e2:	86ce                	mv	a3,s3
    22e4:	864a                	mv	a2,s2
    22e6:	49b2                	lw	s3,12(sp)
    22e8:	4942                	lw	s2,16(sp)
    22ea:	8526                	mv	a0,s1
    22ec:	44d2                	lw	s1,20(sp)
    22ee:	6105                	addi	sp,sp,32
    22f0:	b365                	j	2098 <_write_r>

000022f2 <__sseek>:
    22f2:	1141                	addi	sp,sp,-16
    22f4:	c422                	sw	s0,8(sp)
    22f6:	842e                	mv	s0,a1
    22f8:	00e59583          	lh	a1,14(a1)
    22fc:	c606                	sw	ra,12(sp)
    22fe:	2899                	jal	2354 <_lseek_r>
    2300:	577d                	li	a4,-1
    2302:	00c41783          	lh	a5,12(s0)
    2306:	00e51b63          	bne	a0,a4,231c <__sseek+0x2a>
    230a:	777d                	lui	a4,0xfffff
    230c:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03bf>
    230e:	8ff9                	and	a5,a5,a4
    2310:	00f41623          	sh	a5,12(s0)
    2314:	40b2                	lw	ra,12(sp)
    2316:	4422                	lw	s0,8(sp)
    2318:	0141                	addi	sp,sp,16
    231a:	8082                	ret
    231c:	6705                	lui	a4,0x1
    231e:	8fd9                	or	a5,a5,a4
    2320:	00f41623          	sh	a5,12(s0)
    2324:	c868                	sw	a0,84(s0)
    2326:	b7fd                	j	2314 <__sseek+0x22>

00002328 <__sclose>:
    2328:	00e59583          	lh	a1,14(a1)
    232c:	a009                	j	232e <_close_r>

0000232e <_close_r>:
    232e:	1141                	addi	sp,sp,-16
    2330:	c422                	sw	s0,8(sp)
    2332:	842a                	mv	s0,a0
    2334:	852e                	mv	a0,a1
    2336:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    233a:	c606                	sw	ra,12(sp)
    233c:	3b05                	jal	206c <_close>
    233e:	57fd                	li	a5,-1
    2340:	00f51663          	bne	a0,a5,234c <_close_r+0x1e>
    2344:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    2348:	c391                	beqz	a5,234c <_close_r+0x1e>
    234a:	c01c                	sw	a5,0(s0)
    234c:	40b2                	lw	ra,12(sp)
    234e:	4422                	lw	s0,8(sp)
    2350:	0141                	addi	sp,sp,16
    2352:	8082                	ret

00002354 <_lseek_r>:
    2354:	1141                	addi	sp,sp,-16
    2356:	c422                	sw	s0,8(sp)
    2358:	842a                	mv	s0,a0
    235a:	852e                	mv	a0,a1
    235c:	85b2                	mv	a1,a2
    235e:	8636                	mv	a2,a3
    2360:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    2364:	c606                	sw	ra,12(sp)
    2366:	332d                	jal	2090 <_lseek>
    2368:	57fd                	li	a5,-1
    236a:	00f51663          	bne	a0,a5,2376 <_lseek_r+0x22>
    236e:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    2372:	c391                	beqz	a5,2376 <_lseek_r+0x22>
    2374:	c01c                	sw	a5,0(s0)
    2376:	40b2                	lw	ra,12(sp)
    2378:	4422                	lw	s0,8(sp)
    237a:	0141                	addi	sp,sp,16
    237c:	8082                	ret

0000237e <_read_r>:
    237e:	1141                	addi	sp,sp,-16
    2380:	c422                	sw	s0,8(sp)
    2382:	842a                	mv	s0,a0
    2384:	852e                	mv	a0,a1
    2386:	85b2                	mv	a1,a2
    2388:	8636                	mv	a2,a3
    238a:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    238e:	c606                	sw	ra,12(sp)
    2390:	3311                	jal	2094 <_read>
    2392:	57fd                	li	a5,-1
    2394:	00f51663          	bne	a0,a5,23a0 <_read_r+0x22>
    2398:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    239c:	c391                	beqz	a5,23a0 <_read_r+0x22>
    239e:	c01c                	sw	a5,0(s0)
    23a0:	40b2                	lw	ra,12(sp)
    23a2:	4422                	lw	s0,8(sp)
    23a4:	0141                	addi	sp,sp,16
    23a6:	8082                	ret

000023a8 <__libc_init_array>:
    23a8:	1141                	addi	sp,sp,-16
    23aa:	c422                	sw	s0,8(sp)
    23ac:	c226                	sw	s1,4(sp)
    23ae:	00000413          	li	s0,0
    23b2:	00000493          	li	s1,0
    23b6:	8c81                	sub	s1,s1,s0
    23b8:	c04a                	sw	s2,0(sp)
    23ba:	c606                	sw	ra,12(sp)
    23bc:	8489                	srai	s1,s1,0x2
    23be:	4901                	li	s2,0
    23c0:	02991163          	bne	s2,s1,23e2 <__libc_init_array+0x3a>
    23c4:	00000413          	li	s0,0
    23c8:	00000493          	li	s1,0
    23cc:	8c81                	sub	s1,s1,s0
    23ce:	8489                	srai	s1,s1,0x2
    23d0:	4901                	li	s2,0
    23d2:	00991d63          	bne	s2,s1,23ec <__libc_init_array+0x44>
    23d6:	40b2                	lw	ra,12(sp)
    23d8:	4422                	lw	s0,8(sp)
    23da:	4492                	lw	s1,4(sp)
    23dc:	4902                	lw	s2,0(sp)
    23de:	0141                	addi	sp,sp,16
    23e0:	8082                	ret
    23e2:	401c                	lw	a5,0(s0)
    23e4:	0905                	addi	s2,s2,1
    23e6:	0411                	addi	s0,s0,4
    23e8:	9782                	jalr	a5
    23ea:	bfd9                	j	23c0 <__libc_init_array+0x18>
    23ec:	401c                	lw	a5,0(s0)
    23ee:	0905                	addi	s2,s2,1
    23f0:	0411                	addi	s0,s0,4
    23f2:	9782                	jalr	a5
    23f4:	bff9                	j	23d2 <__libc_init_array+0x2a>

000023f6 <__libc_fini_array>:
    23f6:	1141                	addi	sp,sp,-16
    23f8:	c422                	sw	s0,8(sp)
    23fa:	c226                	sw	s1,4(sp)
    23fc:	00000413          	li	s0,0
    2400:	00000493          	li	s1,0
    2404:	8c05                	sub	s0,s0,s1
    2406:	c606                	sw	ra,12(sp)
    2408:	8409                	srai	s0,s0,0x2
    240a:	e411                	bnez	s0,2416 <__libc_fini_array+0x20>
    240c:	40b2                	lw	ra,12(sp)
    240e:	4422                	lw	s0,8(sp)
    2410:	4492                	lw	s1,4(sp)
    2412:	0141                	addi	sp,sp,16
    2414:	8082                	ret
    2416:	147d                	addi	s0,s0,-1
    2418:	00241793          	slli	a5,s0,0x2
    241c:	97a6                	add	a5,a5,s1
    241e:	439c                	lw	a5,0(a5)
    2420:	9782                	jalr	a5
    2422:	b7e5                	j	240a <__libc_fini_array+0x14>

00002424 <__register_exitproc>:
    2424:	c3418713          	addi	a4,gp,-972 # ec34 <__atexit>
    2428:	431c                	lw	a5,0(a4)
    242a:	88aa                	mv	a7,a0
    242c:	ef81                	bnez	a5,2444 <__register_exitproc+0x20>
    242e:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    2432:	c31c                	sw	a5,0(a4)
    2434:	00000713          	li	a4,0
    2438:	c701                	beqz	a4,2440 <__register_exitproc+0x1c>
    243a:	4318                	lw	a4,0(a4)
    243c:	08e7a423          	sw	a4,136(a5)
    2440:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    2444:	43d8                	lw	a4,4(a5)
    2446:	487d                	li	a6,31
    2448:	557d                	li	a0,-1
    244a:	04e84663          	blt	a6,a4,2496 <__register_exitproc+0x72>
    244e:	02088d63          	beqz	a7,2488 <__register_exitproc+0x64>
    2452:	0887a803          	lw	a6,136(a5)
    2456:	04080063          	beqz	a6,2496 <__register_exitproc+0x72>
    245a:	00271513          	slli	a0,a4,0x2
    245e:	9542                	add	a0,a0,a6
    2460:	c110                	sw	a2,0(a0)
    2462:	10082303          	lw	t1,256(a6)
    2466:	4605                	li	a2,1
    2468:	00e61633          	sll	a2,a2,a4
    246c:	00c36333          	or	t1,t1,a2
    2470:	10682023          	sw	t1,256(a6)
    2474:	08d52023          	sw	a3,128(a0)
    2478:	4689                	li	a3,2
    247a:	00d89763          	bne	a7,a3,2488 <__register_exitproc+0x64>
    247e:	10482683          	lw	a3,260(a6)
    2482:	8ed1                	or	a3,a3,a2
    2484:	10d82223          	sw	a3,260(a6)
    2488:	00170693          	addi	a3,a4,1 # 1001 <handler_irq_fast_timer_2+0xb1>
    248c:	070a                	slli	a4,a4,0x2
    248e:	c3d4                	sw	a3,4(a5)
    2490:	97ba                	add	a5,a5,a4
    2492:	c78c                	sw	a1,8(a5)
    2494:	4501                	li	a0,0
    2496:	8082                	ret

00002498 <__call_exitprocs>:
    2498:	7179                	addi	sp,sp,-48
    249a:	ca56                	sw	s5,20(sp)
    249c:	c85a                	sw	s6,16(sp)
    249e:	c65e                	sw	s7,12(sp)
    24a0:	c462                	sw	s8,8(sp)
    24a2:	d606                	sw	ra,44(sp)
    24a4:	d422                	sw	s0,40(sp)
    24a6:	d226                	sw	s1,36(sp)
    24a8:	d04a                	sw	s2,32(sp)
    24aa:	ce4e                	sw	s3,28(sp)
    24ac:	cc52                	sw	s4,24(sp)
    24ae:	c266                	sw	s9,4(sp)
    24b0:	8b2a                	mv	s6,a0
    24b2:	8aae                	mv	s5,a1
    24b4:	c3418b93          	addi	s7,gp,-972 # ec34 <__atexit>
    24b8:	4c05                	li	s8,1
    24ba:	000ba483          	lw	s1,0(s7)
    24be:	cc81                	beqz	s1,24d6 <__call_exitprocs+0x3e>
    24c0:	40c0                	lw	s0,4(s1)
    24c2:	0884a983          	lw	s3,136(s1)
    24c6:	fff40913          	addi	s2,s0,-1
    24ca:	040a                	slli	s0,s0,0x2
    24cc:	00898a33          	add	s4,s3,s0
    24d0:	9426                	add	s0,s0,s1
    24d2:	00095f63          	bgez	s2,24f0 <__call_exitprocs+0x58>
    24d6:	50b2                	lw	ra,44(sp)
    24d8:	5422                	lw	s0,40(sp)
    24da:	5492                	lw	s1,36(sp)
    24dc:	5902                	lw	s2,32(sp)
    24de:	49f2                	lw	s3,28(sp)
    24e0:	4a62                	lw	s4,24(sp)
    24e2:	4ad2                	lw	s5,20(sp)
    24e4:	4b42                	lw	s6,16(sp)
    24e6:	4bb2                	lw	s7,12(sp)
    24e8:	4c22                	lw	s8,8(sp)
    24ea:	4c92                	lw	s9,4(sp)
    24ec:	6145                	addi	sp,sp,48
    24ee:	8082                	ret
    24f0:	000a8c63          	beqz	s5,2508 <__call_exitprocs+0x70>
    24f4:	00099663          	bnez	s3,2500 <__call_exitprocs+0x68>
    24f8:	197d                	addi	s2,s2,-1
    24fa:	1a71                	addi	s4,s4,-4
    24fc:	1471                	addi	s0,s0,-4
    24fe:	bfd1                	j	24d2 <__call_exitprocs+0x3a>
    2500:	07ca2783          	lw	a5,124(s4)
    2504:	ff579ae3          	bne	a5,s5,24f8 <__call_exitprocs+0x60>
    2508:	40d8                	lw	a4,4(s1)
    250a:	405c                	lw	a5,4(s0)
    250c:	177d                	addi	a4,a4,-1
    250e:	03271863          	bne	a4,s2,253e <__call_exitprocs+0xa6>
    2512:	0124a223          	sw	s2,4(s1)
    2516:	d3ed                	beqz	a5,24f8 <__call_exitprocs+0x60>
    2518:	0044ac83          	lw	s9,4(s1)
    251c:	00098863          	beqz	s3,252c <__call_exitprocs+0x94>
    2520:	1009a683          	lw	a3,256(s3)
    2524:	012c1733          	sll	a4,s8,s2
    2528:	8ef9                	and	a3,a3,a4
    252a:	ee89                	bnez	a3,2544 <__call_exitprocs+0xac>
    252c:	9782                	jalr	a5
    252e:	40d8                	lw	a4,4(s1)
    2530:	000ba783          	lw	a5,0(s7)
    2534:	f99713e3          	bne	a4,s9,24ba <__call_exitprocs+0x22>
    2538:	fcf480e3          	beq	s1,a5,24f8 <__call_exitprocs+0x60>
    253c:	bfbd                	j	24ba <__call_exitprocs+0x22>
    253e:	00042223          	sw	zero,4(s0)
    2542:	bfd1                	j	2516 <__call_exitprocs+0x7e>
    2544:	1049a683          	lw	a3,260(s3)
    2548:	ffca2583          	lw	a1,-4(s4)
    254c:	8f75                	and	a4,a4,a3
    254e:	e701                	bnez	a4,2556 <__call_exitprocs+0xbe>
    2550:	855a                	mv	a0,s6
    2552:	9782                	jalr	a5
    2554:	bfe9                	j	252e <__call_exitprocs+0x96>
    2556:	852e                	mv	a0,a1
    2558:	9782                	jalr	a5
    255a:	bfd1                	j	252e <__call_exitprocs+0x96>

0000255c <_free_r>:
    255c:	cdd1                	beqz	a1,25f8 <_free_r+0x9c>
    255e:	ffc5a783          	lw	a5,-4(a1)
    2562:	1101                	addi	sp,sp,-32
    2564:	cc22                	sw	s0,24(sp)
    2566:	ce06                	sw	ra,28(sp)
    2568:	ffc58413          	addi	s0,a1,-4
    256c:	0007d363          	bgez	a5,2572 <_free_r+0x16>
    2570:	943e                	add	s0,s0,a5
    2572:	c62a                	sw	a0,12(sp)
    2574:	2acd                	jal	2766 <__malloc_lock>
    2576:	c3c18713          	addi	a4,gp,-964 # ec3c <__malloc_free_list>
    257a:	431c                	lw	a5,0(a4)
    257c:	4532                	lw	a0,12(sp)
    257e:	eb81                	bnez	a5,258e <_free_r+0x32>
    2580:	00042223          	sw	zero,4(s0)
    2584:	c300                	sw	s0,0(a4)
    2586:	4462                	lw	s0,24(sp)
    2588:	40f2                	lw	ra,28(sp)
    258a:	6105                	addi	sp,sp,32
    258c:	aaf1                	j	2768 <__malloc_unlock>
    258e:	00f47d63          	bgeu	s0,a5,25a8 <_free_r+0x4c>
    2592:	4010                	lw	a2,0(s0)
    2594:	00c406b3          	add	a3,s0,a2
    2598:	00d79663          	bne	a5,a3,25a4 <_free_r+0x48>
    259c:	4394                	lw	a3,0(a5)
    259e:	43dc                	lw	a5,4(a5)
    25a0:	96b2                	add	a3,a3,a2
    25a2:	c014                	sw	a3,0(s0)
    25a4:	c05c                	sw	a5,4(s0)
    25a6:	bff9                	j	2584 <_free_r+0x28>
    25a8:	873e                	mv	a4,a5
    25aa:	43dc                	lw	a5,4(a5)
    25ac:	c399                	beqz	a5,25b2 <_free_r+0x56>
    25ae:	fef47de3          	bgeu	s0,a5,25a8 <_free_r+0x4c>
    25b2:	4314                	lw	a3,0(a4)
    25b4:	00d70633          	add	a2,a4,a3
    25b8:	00861f63          	bne	a2,s0,25d6 <_free_r+0x7a>
    25bc:	4010                	lw	a2,0(s0)
    25be:	96b2                	add	a3,a3,a2
    25c0:	c314                	sw	a3,0(a4)
    25c2:	00d70633          	add	a2,a4,a3
    25c6:	fcc790e3          	bne	a5,a2,2586 <_free_r+0x2a>
    25ca:	4390                	lw	a2,0(a5)
    25cc:	43dc                	lw	a5,4(a5)
    25ce:	96b2                	add	a3,a3,a2
    25d0:	c314                	sw	a3,0(a4)
    25d2:	c35c                	sw	a5,4(a4)
    25d4:	bf4d                	j	2586 <_free_r+0x2a>
    25d6:	00c47563          	bgeu	s0,a2,25e0 <_free_r+0x84>
    25da:	47b1                	li	a5,12
    25dc:	c11c                	sw	a5,0(a0)
    25de:	b765                	j	2586 <_free_r+0x2a>
    25e0:	4010                	lw	a2,0(s0)
    25e2:	00c406b3          	add	a3,s0,a2
    25e6:	00d79663          	bne	a5,a3,25f2 <_free_r+0x96>
    25ea:	4394                	lw	a3,0(a5)
    25ec:	43dc                	lw	a5,4(a5)
    25ee:	96b2                	add	a3,a3,a2
    25f0:	c014                	sw	a3,0(s0)
    25f2:	c05c                	sw	a5,4(s0)
    25f4:	c340                	sw	s0,4(a4)
    25f6:	bf41                	j	2586 <_free_r+0x2a>
    25f8:	8082                	ret

000025fa <sbrk_aligned>:
    25fa:	1141                	addi	sp,sp,-16
    25fc:	c04a                	sw	s2,0(sp)
    25fe:	c3818913          	addi	s2,gp,-968 # ec38 <__malloc_sbrk_start>
    2602:	00092783          	lw	a5,0(s2)
    2606:	c422                	sw	s0,8(sp)
    2608:	c226                	sw	s1,4(sp)
    260a:	c606                	sw	ra,12(sp)
    260c:	84aa                	mv	s1,a0
    260e:	842e                	mv	s0,a1
    2610:	e789                	bnez	a5,261a <sbrk_aligned+0x20>
    2612:	4581                	li	a1,0
    2614:	2c7d                	jal	28d2 <_sbrk_r>
    2616:	00a92023          	sw	a0,0(s2)
    261a:	85a2                	mv	a1,s0
    261c:	8526                	mv	a0,s1
    261e:	2c55                	jal	28d2 <_sbrk_r>
    2620:	597d                	li	s2,-1
    2622:	01251a63          	bne	a0,s2,2636 <sbrk_aligned+0x3c>
    2626:	547d                	li	s0,-1
    2628:	40b2                	lw	ra,12(sp)
    262a:	8522                	mv	a0,s0
    262c:	4422                	lw	s0,8(sp)
    262e:	4492                	lw	s1,4(sp)
    2630:	4902                	lw	s2,0(sp)
    2632:	0141                	addi	sp,sp,16
    2634:	8082                	ret
    2636:	00350413          	addi	s0,a0,3
    263a:	9871                	andi	s0,s0,-4
    263c:	fe8506e3          	beq	a0,s0,2628 <sbrk_aligned+0x2e>
    2640:	40a405b3          	sub	a1,s0,a0
    2644:	8526                	mv	a0,s1
    2646:	2471                	jal	28d2 <_sbrk_r>
    2648:	ff2510e3          	bne	a0,s2,2628 <sbrk_aligned+0x2e>
    264c:	bfe9                	j	2626 <sbrk_aligned+0x2c>

0000264e <_malloc_r>:
    264e:	1101                	addi	sp,sp,-32
    2650:	ca26                	sw	s1,20(sp)
    2652:	00358493          	addi	s1,a1,3
    2656:	98f1                	andi	s1,s1,-4
    2658:	c84a                	sw	s2,16(sp)
    265a:	ce06                	sw	ra,28(sp)
    265c:	cc22                	sw	s0,24(sp)
    265e:	c64e                	sw	s3,12(sp)
    2660:	c452                	sw	s4,8(sp)
    2662:	04a1                	addi	s1,s1,8
    2664:	47b1                	li	a5,12
    2666:	892a                	mv	s2,a0
    2668:	06f4f363          	bgeu	s1,a5,26ce <_malloc_r+0x80>
    266c:	84be                	mv	s1,a5
    266e:	06b4e263          	bltu	s1,a1,26d2 <_malloc_r+0x84>
    2672:	854a                	mv	a0,s2
    2674:	28cd                	jal	2766 <__malloc_lock>
    2676:	c3c18993          	addi	s3,gp,-964 # ec3c <__malloc_free_list>
    267a:	0009a783          	lw	a5,0(s3)
    267e:	843e                	mv	s0,a5
    2680:	e425                	bnez	s0,26e8 <_malloc_r+0x9a>
    2682:	85a6                	mv	a1,s1
    2684:	854a                	mv	a0,s2
    2686:	3f95                	jal	25fa <sbrk_aligned>
    2688:	57fd                	li	a5,-1
    268a:	842a                	mv	s0,a0
    268c:	0cf51b63          	bne	a0,a5,2762 <_malloc_r+0x114>
    2690:	0009a403          	lw	s0,0(s3)
    2694:	87a2                	mv	a5,s0
    2696:	e7d5                	bnez	a5,2742 <_malloc_r+0xf4>
    2698:	cc5d                	beqz	s0,2756 <_malloc_r+0x108>
    269a:	00042a03          	lw	s4,0(s0)
    269e:	4581                	li	a1,0
    26a0:	854a                	mv	a0,s2
    26a2:	9a22                	add	s4,s4,s0
    26a4:	243d                	jal	28d2 <_sbrk_r>
    26a6:	0aaa1863          	bne	s4,a0,2756 <_malloc_r+0x108>
    26aa:	401c                	lw	a5,0(s0)
    26ac:	854a                	mv	a0,s2
    26ae:	8c9d                	sub	s1,s1,a5
    26b0:	85a6                	mv	a1,s1
    26b2:	37a1                	jal	25fa <sbrk_aligned>
    26b4:	57fd                	li	a5,-1
    26b6:	0af50063          	beq	a0,a5,2756 <_malloc_r+0x108>
    26ba:	401c                	lw	a5,0(s0)
    26bc:	97a6                	add	a5,a5,s1
    26be:	c01c                	sw	a5,0(s0)
    26c0:	0009a783          	lw	a5,0(s3)
    26c4:	43d8                	lw	a4,4(a5)
    26c6:	e349                	bnez	a4,2748 <_malloc_r+0xfa>
    26c8:	c201ae23          	sw	zero,-964(gp) # ec3c <__malloc_free_list>
    26cc:	a83d                	j	270a <_malloc_r+0xbc>
    26ce:	fa04d0e3          	bgez	s1,266e <_malloc_r+0x20>
    26d2:	00f92023          	sw	a5,0(s2)
    26d6:	4501                	li	a0,0
    26d8:	40f2                	lw	ra,28(sp)
    26da:	4462                	lw	s0,24(sp)
    26dc:	44d2                	lw	s1,20(sp)
    26de:	4942                	lw	s2,16(sp)
    26e0:	49b2                	lw	s3,12(sp)
    26e2:	4a22                	lw	s4,8(sp)
    26e4:	6105                	addi	sp,sp,32
    26e6:	8082                	ret
    26e8:	4014                	lw	a3,0(s0)
    26ea:	8e85                	sub	a3,a3,s1
    26ec:	0406c863          	bltz	a3,273c <_malloc_r+0xee>
    26f0:	472d                	li	a4,11
    26f2:	02d77d63          	bgeu	a4,a3,272c <_malloc_r+0xde>
    26f6:	c004                	sw	s1,0(s0)
    26f8:	00940733          	add	a4,s0,s1
    26fc:	02879663          	bne	a5,s0,2728 <_malloc_r+0xda>
    2700:	00e9a023          	sw	a4,0(s3)
    2704:	405c                	lw	a5,4(s0)
    2706:	c314                	sw	a3,0(a4)
    2708:	c35c                	sw	a5,4(a4)
    270a:	854a                	mv	a0,s2
    270c:	28b1                	jal	2768 <__malloc_unlock>
    270e:	00b40513          	addi	a0,s0,11
    2712:	00440793          	addi	a5,s0,4
    2716:	9961                	andi	a0,a0,-8
    2718:	40f50733          	sub	a4,a0,a5
    271c:	faf50ee3          	beq	a0,a5,26d8 <_malloc_r+0x8a>
    2720:	943a                	add	s0,s0,a4
    2722:	8f89                	sub	a5,a5,a0
    2724:	c01c                	sw	a5,0(s0)
    2726:	bf4d                	j	26d8 <_malloc_r+0x8a>
    2728:	c3d8                	sw	a4,4(a5)
    272a:	bfe9                	j	2704 <_malloc_r+0xb6>
    272c:	4058                	lw	a4,4(s0)
    272e:	00879563          	bne	a5,s0,2738 <_malloc_r+0xea>
    2732:	00e9a023          	sw	a4,0(s3)
    2736:	bfd1                	j	270a <_malloc_r+0xbc>
    2738:	c3d8                	sw	a4,4(a5)
    273a:	bfc1                	j	270a <_malloc_r+0xbc>
    273c:	87a2                	mv	a5,s0
    273e:	4040                	lw	s0,4(s0)
    2740:	b781                	j	2680 <_malloc_r+0x32>
    2742:	843e                	mv	s0,a5
    2744:	43dc                	lw	a5,4(a5)
    2746:	bf81                	j	2696 <_malloc_r+0x48>
    2748:	873e                	mv	a4,a5
    274a:	43dc                	lw	a5,4(a5)
    274c:	fe879ee3          	bne	a5,s0,2748 <_malloc_r+0xfa>
    2750:	00072223          	sw	zero,4(a4)
    2754:	bf5d                	j	270a <_malloc_r+0xbc>
    2756:	47b1                	li	a5,12
    2758:	00f92023          	sw	a5,0(s2)
    275c:	854a                	mv	a0,s2
    275e:	2029                	jal	2768 <__malloc_unlock>
    2760:	bf9d                	j	26d6 <_malloc_r+0x88>
    2762:	c104                	sw	s1,0(a0)
    2764:	b75d                	j	270a <_malloc_r+0xbc>

00002766 <__malloc_lock>:
    2766:	8082                	ret

00002768 <__malloc_unlock>:
    2768:	8082                	ret

0000276a <__sflush_r>:
    276a:	00c59783          	lh	a5,12(a1)
    276e:	1101                	addi	sp,sp,-32
    2770:	cc22                	sw	s0,24(sp)
    2772:	ca26                	sw	s1,20(sp)
    2774:	ce06                	sw	ra,28(sp)
    2776:	c84a                	sw	s2,16(sp)
    2778:	c64e                	sw	s3,12(sp)
    277a:	0087f713          	andi	a4,a5,8
    277e:	84aa                	mv	s1,a0
    2780:	842e                	mv	s0,a1
    2782:	e369                	bnez	a4,2844 <dilithium.c.2d24888c+0x3c>
    2784:	41d8                	lw	a4,4(a1)
    2786:	00e04563          	bgtz	a4,2790 <__sflush_r+0x26>
    278a:	41b8                	lw	a4,64(a1)
    278c:	0ae05a63          	blez	a4,2840 <dilithium.c.2d24888c+0x38>
    2790:	5458                	lw	a4,44(s0)
    2792:	c75d                	beqz	a4,2840 <dilithium.c.2d24888c+0x38>
    2794:	0004a903          	lw	s2,0(s1)
    2798:	01379693          	slli	a3,a5,0x13
    279c:	0004a023          	sw	zero,0(s1)
    27a0:	0606dd63          	bgez	a3,281a <dilithium.c.2d24888c+0x12>
    27a4:	4870                	lw	a2,84(s0)
    27a6:	00c45783          	lhu	a5,12(s0)
    27aa:	8b91                	andi	a5,a5,4
    27ac:	c799                	beqz	a5,27ba <__sflush_r+0x50>
    27ae:	405c                	lw	a5,4(s0)
    27b0:	8e1d                	sub	a2,a2,a5
    27b2:	585c                	lw	a5,52(s0)
    27b4:	c399                	beqz	a5,27ba <__sflush_r+0x50>
    27b6:	403c                	lw	a5,64(s0)
    27b8:	8e1d                	sub	a2,a2,a5
    27ba:	545c                	lw	a5,44(s0)
    27bc:	500c                	lw	a1,32(s0)
    27be:	4681                	li	a3,0
    27c0:	8526                	mv	a0,s1
    27c2:	9782                	jalr	a5
    27c4:	577d                	li	a4,-1
    27c6:	00c41783          	lh	a5,12(s0)
    27ca:	00e51d63          	bne	a0,a4,27e4 <__sflush_r+0x7a>
    27ce:	4094                	lw	a3,0(s1)
    27d0:	4775                	li	a4,29
    27d2:	0ad76463          	bltu	a4,a3,287a <dilithium.c.2d24888c+0x72>
    27d6:	20400737          	lui	a4,0x20400
    27da:	0705                	addi	a4,a4,1 # 20400001 <_sp+0x203c13c1>
    27dc:	00d75733          	srl	a4,a4,a3
    27e0:	8b05                	andi	a4,a4,1
    27e2:	cf41                	beqz	a4,287a <dilithium.c.2d24888c+0x72>
    27e4:	4818                	lw	a4,16(s0)
    27e6:	00042223          	sw	zero,4(s0)
    27ea:	c018                	sw	a4,0(s0)
    27ec:	01379713          	slli	a4,a5,0x13
    27f0:	00075863          	bgez	a4,2800 <__sflush_r+0x96>
    27f4:	57fd                	li	a5,-1
    27f6:	00f51463          	bne	a0,a5,27fe <__sflush_r+0x94>
    27fa:	409c                	lw	a5,0(s1)
    27fc:	e391                	bnez	a5,2800 <__sflush_r+0x96>
    27fe:	c868                	sw	a0,84(s0)
    2800:	584c                	lw	a1,52(s0)
    2802:	0124a023          	sw	s2,0(s1)
    2806:	cd8d                	beqz	a1,2840 <dilithium.c.2d24888c+0x38>
    2808:	04440793          	addi	a5,s0,68
    280c:	00f58463          	beq	a1,a5,2814 <dilithium.c.2d24888c+0xc>
    2810:	8526                	mv	a0,s1
    2812:	33a9                	jal	255c <_free_r>
    2814:	02042a23          	sw	zero,52(s0)
    2818:	a025                	j	2840 <dilithium.c.2d24888c+0x38>
    281a:	500c                	lw	a1,32(s0)
    281c:	4601                	li	a2,0
    281e:	4685                	li	a3,1
    2820:	8526                	mv	a0,s1
    2822:	9702                	jalr	a4
    2824:	57fd                	li	a5,-1
    2826:	862a                	mv	a2,a0
    2828:	f6f51fe3          	bne	a0,a5,27a6 <__sflush_r+0x3c>
    282c:	409c                	lw	a5,0(s1)
    282e:	dfa5                	beqz	a5,27a6 <__sflush_r+0x3c>
    2830:	4775                	li	a4,29
    2832:	00e78563          	beq	a5,a4,283c <dilithium.c.2d24888c+0x34>
    2836:	4759                	li	a4,22
    2838:	02e79f63          	bne	a5,a4,2876 <dilithium.c.2d24888c+0x6e>
    283c:	0124a023          	sw	s2,0(s1)
    2840:	4501                	li	a0,0
    2842:	a089                	j	2884 <dilithium.c.2d24888c+0x7c>
    2844:	0105a983          	lw	s3,16(a1)
    2848:	fe098ce3          	beqz	s3,2840 <dilithium.c.2d24888c+0x38>
    284c:	0005a903          	lw	s2,0(a1)
    2850:	8b8d                	andi	a5,a5,3
    2852:	0135a023          	sw	s3,0(a1)
    2856:	41390933          	sub	s2,s2,s3
    285a:	4701                	li	a4,0
    285c:	e391                	bnez	a5,2860 <dilithium.c.2d24888c+0x58>
    285e:	49d8                	lw	a4,20(a1)
    2860:	c418                	sw	a4,8(s0)
    2862:	fd205fe3          	blez	s2,2840 <dilithium.c.2d24888c+0x38>
    2866:	541c                	lw	a5,40(s0)
    2868:	500c                	lw	a1,32(s0)
    286a:	86ca                	mv	a3,s2
    286c:	864e                	mv	a2,s3
    286e:	8526                	mv	a0,s1
    2870:	9782                	jalr	a5
    2872:	02a04063          	bgtz	a0,2892 <dilithium.c.2d24888c+0x8a>
    2876:	00c41783          	lh	a5,12(s0)
    287a:	0407e793          	ori	a5,a5,64
    287e:	00f41623          	sh	a5,12(s0)
    2882:	557d                	li	a0,-1
    2884:	40f2                	lw	ra,28(sp)
    2886:	4462                	lw	s0,24(sp)
    2888:	44d2                	lw	s1,20(sp)
    288a:	4942                	lw	s2,16(sp)
    288c:	49b2                	lw	s3,12(sp)
    288e:	6105                	addi	sp,sp,32
    2890:	8082                	ret
    2892:	99aa                	add	s3,s3,a0
    2894:	40a90933          	sub	s2,s2,a0
    2898:	b7e9                	j	2862 <dilithium.c.2d24888c+0x5a>

0000289a <_fflush_r>:
    289a:	499c                	lw	a5,16(a1)
    289c:	cb8d                	beqz	a5,28ce <_fflush_r+0x34>
    289e:	1101                	addi	sp,sp,-32
    28a0:	cc22                	sw	s0,24(sp)
    28a2:	ce06                	sw	ra,28(sp)
    28a4:	842a                	mv	s0,a0
    28a6:	c519                	beqz	a0,28b4 <_fflush_r+0x1a>
    28a8:	511c                	lw	a5,32(a0)
    28aa:	e789                	bnez	a5,28b4 <_fflush_r+0x1a>
    28ac:	c62e                	sw	a1,12(sp)
    28ae:	947ff0ef          	jal	21f4 <__sinit>
    28b2:	45b2                	lw	a1,12(sp)
    28b4:	00c59783          	lh	a5,12(a1)
    28b8:	c791                	beqz	a5,28c4 <_fflush_r+0x2a>
    28ba:	8522                	mv	a0,s0
    28bc:	4462                	lw	s0,24(sp)
    28be:	40f2                	lw	ra,28(sp)
    28c0:	6105                	addi	sp,sp,32
    28c2:	b565                	j	276a <__sflush_r>
    28c4:	40f2                	lw	ra,28(sp)
    28c6:	4462                	lw	s0,24(sp)
    28c8:	4501                	li	a0,0
    28ca:	6105                	addi	sp,sp,32
    28cc:	8082                	ret
    28ce:	4501                	li	a0,0
    28d0:	8082                	ret

000028d2 <_sbrk_r>:
    28d2:	1141                	addi	sp,sp,-16
    28d4:	c422                	sw	s0,8(sp)
    28d6:	842a                	mv	s0,a0
    28d8:	852e                	mv	a0,a1
    28da:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    28de:	c606                	sw	ra,12(sp)
    28e0:	fc2ff0ef          	jal	20a2 <_sbrk>
    28e4:	57fd                	li	a5,-1
    28e6:	00f51663          	bne	a0,a5,28f2 <_sbrk_r+0x20>
    28ea:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    28ee:	c391                	beqz	a5,28f2 <_sbrk_r+0x20>
    28f0:	c01c                	sw	a5,0(s0)
    28f2:	40b2                	lw	ra,12(sp)
    28f4:	4422                	lw	s0,8(sp)
    28f6:	0141                	addi	sp,sp,16
    28f8:	8082                	ret

000028fa <iprintf>:
    28fa:	7139                	addi	sp,sp,-64
    28fc:	da3e                	sw	a5,52(sp)
    28fe:	9341a783          	lw	a5,-1740(gp) # e934 <_impure_ptr>
    2902:	d432                	sw	a2,40(sp)
    2904:	d636                	sw	a3,44(sp)
    2906:	d22e                	sw	a1,36(sp)
    2908:	d83a                	sw	a4,48(sp)
    290a:	dc42                	sw	a6,56(sp)
    290c:	de46                	sw	a7,60(sp)
    290e:	478c                	lw	a1,8(a5)
    2910:	1054                	addi	a3,sp,36
    2912:	862a                	mv	a2,a0
    2914:	853e                	mv	a0,a5
    2916:	ce06                	sw	ra,28(sp)
    2918:	c636                	sw	a3,12(sp)
    291a:	2451                	jal	2b9e <_vfiprintf_r>
    291c:	40f2                	lw	ra,28(sp)
    291e:	6121                	addi	sp,sp,64
    2920:	8082                	ret

00002922 <_puts_r>:
    2922:	511c                	lw	a5,32(a0)
    2924:	1101                	addi	sp,sp,-32
    2926:	cc22                	sw	s0,24(sp)
    2928:	ca26                	sw	s1,20(sp)
    292a:	c84a                	sw	s2,16(sp)
    292c:	ce06                	sw	ra,28(sp)
    292e:	c64e                	sw	s3,12(sp)
    2930:	c452                	sw	s4,8(sp)
    2932:	4500                	lw	s0,8(a0)
    2934:	84aa                	mv	s1,a0
    2936:	892e                	mv	s2,a1
    2938:	e399                	bnez	a5,293e <_puts_r+0x1c>
    293a:	8bbff0ef          	jal	21f4 <__sinit>
    293e:	00c45783          	lhu	a5,12(s0)
    2942:	8ba1                	andi	a5,a5,8
    2944:	c399                	beqz	a5,294a <_puts_r+0x28>
    2946:	481c                	lw	a5,16(s0)
    2948:	e7a5                	bnez	a5,29b0 <_puts_r+0x8e>
    294a:	85a2                	mv	a1,s0
    294c:	8526                	mv	a0,s1
    294e:	2a21                	jal	2a66 <__swsetup_r>
    2950:	c125                	beqz	a0,29b0 <_puts_r+0x8e>
    2952:	557d                	li	a0,-1
    2954:	40f2                	lw	ra,28(sp)
    2956:	4462                	lw	s0,24(sp)
    2958:	44d2                	lw	s1,20(sp)
    295a:	4942                	lw	s2,16(sp)
    295c:	49b2                	lw	s3,12(sp)
    295e:	4a22                	lw	s4,8(sp)
    2960:	6105                	addi	sp,sp,32
    2962:	8082                	ret
    2964:	c41c                	sw	a5,8(s0)
    2966:	0905                	addi	s2,s2,1
    2968:	0007d763          	bgez	a5,2976 <_puts_r+0x54>
    296c:	4c18                	lw	a4,24(s0)
    296e:	02e7cb63          	blt	a5,a4,29a4 <_puts_r+0x82>
    2972:	03458963          	beq	a1,s4,29a4 <_puts_r+0x82>
    2976:	401c                	lw	a5,0(s0)
    2978:	00178713          	addi	a4,a5,1
    297c:	c018                	sw	a4,0(s0)
    297e:	00b78023          	sb	a1,0(a5)
    2982:	441c                	lw	a5,8(s0)
    2984:	00094583          	lbu	a1,0(s2)
    2988:	17fd                	addi	a5,a5,-1
    298a:	fde9                	bnez	a1,2964 <_puts_r+0x42>
    298c:	c41c                	sw	a5,8(s0)
    298e:	0207d463          	bgez	a5,29b6 <_puts_r+0x94>
    2992:	8622                	mv	a2,s0
    2994:	45a9                	li	a1,10
    2996:	8526                	mv	a0,s1
    2998:	281d                	jal	29ce <__swbuf_r>
    299a:	57fd                	li	a5,-1
    299c:	faf50be3          	beq	a0,a5,2952 <_puts_r+0x30>
    29a0:	4529                	li	a0,10
    29a2:	bf4d                	j	2954 <_puts_r+0x32>
    29a4:	8622                	mv	a2,s0
    29a6:	8526                	mv	a0,s1
    29a8:	201d                	jal	29ce <__swbuf_r>
    29aa:	fd351ce3          	bne	a0,s3,2982 <_puts_r+0x60>
    29ae:	b755                	j	2952 <_puts_r+0x30>
    29b0:	59fd                	li	s3,-1
    29b2:	4a29                	li	s4,10
    29b4:	b7f9                	j	2982 <_puts_r+0x60>
    29b6:	401c                	lw	a5,0(s0)
    29b8:	00178713          	addi	a4,a5,1
    29bc:	c018                	sw	a4,0(s0)
    29be:	4729                	li	a4,10
    29c0:	00e78023          	sb	a4,0(a5)
    29c4:	bff1                	j	29a0 <_puts_r+0x7e>

000029c6 <puts>:
    29c6:	85aa                	mv	a1,a0
    29c8:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    29cc:	bf99                	j	2922 <_puts_r>

000029ce <__swbuf_r>:
    29ce:	1101                	addi	sp,sp,-32
    29d0:	cc22                	sw	s0,24(sp)
    29d2:	ca26                	sw	s1,20(sp)
    29d4:	c84a                	sw	s2,16(sp)
    29d6:	ce06                	sw	ra,28(sp)
    29d8:	c64e                	sw	s3,12(sp)
    29da:	892a                	mv	s2,a0
    29dc:	84ae                	mv	s1,a1
    29de:	8432                	mv	s0,a2
    29e0:	c509                	beqz	a0,29ea <__swbuf_r+0x1c>
    29e2:	511c                	lw	a5,32(a0)
    29e4:	e399                	bnez	a5,29ea <__swbuf_r+0x1c>
    29e6:	80fff0ef          	jal	21f4 <__sinit>
    29ea:	4c1c                	lw	a5,24(s0)
    29ec:	c41c                	sw	a5,8(s0)
    29ee:	00c45783          	lhu	a5,12(s0)
    29f2:	8ba1                	andi	a5,a5,8
    29f4:	c399                	beqz	a5,29fa <__swbuf_r+0x2c>
    29f6:	481c                	lw	a5,16(s0)
    29f8:	ef91                	bnez	a5,2a14 <__swbuf_r+0x46>
    29fa:	85a2                	mv	a1,s0
    29fc:	854a                	mv	a0,s2
    29fe:	20a5                	jal	2a66 <__swsetup_r>
    2a00:	c911                	beqz	a0,2a14 <__swbuf_r+0x46>
    2a02:	54fd                	li	s1,-1
    2a04:	40f2                	lw	ra,28(sp)
    2a06:	4462                	lw	s0,24(sp)
    2a08:	4942                	lw	s2,16(sp)
    2a0a:	49b2                	lw	s3,12(sp)
    2a0c:	8526                	mv	a0,s1
    2a0e:	44d2                	lw	s1,20(sp)
    2a10:	6105                	addi	sp,sp,32
    2a12:	8082                	ret
    2a14:	401c                	lw	a5,0(s0)
    2a16:	4818                	lw	a4,16(s0)
    2a18:	0ff4f993          	zext.b	s3,s1
    2a1c:	0ff4f493          	zext.b	s1,s1
    2a20:	40e78533          	sub	a0,a5,a4
    2a24:	485c                	lw	a5,20(s0)
    2a26:	00f54663          	blt	a0,a5,2a32 <__swbuf_r+0x64>
    2a2a:	85a2                	mv	a1,s0
    2a2c:	854a                	mv	a0,s2
    2a2e:	35b5                	jal	289a <_fflush_r>
    2a30:	f969                	bnez	a0,2a02 <__swbuf_r+0x34>
    2a32:	441c                	lw	a5,8(s0)
    2a34:	17fd                	addi	a5,a5,-1
    2a36:	c41c                	sw	a5,8(s0)
    2a38:	401c                	lw	a5,0(s0)
    2a3a:	00178713          	addi	a4,a5,1
    2a3e:	c018                	sw	a4,0(s0)
    2a40:	01378023          	sb	s3,0(a5)
    2a44:	4858                	lw	a4,20(s0)
    2a46:	00150793          	addi	a5,a0,1
    2a4a:	00f70963          	beq	a4,a5,2a5c <__swbuf_r+0x8e>
    2a4e:	00c45783          	lhu	a5,12(s0)
    2a52:	8b85                	andi	a5,a5,1
    2a54:	dbc5                	beqz	a5,2a04 <__swbuf_r+0x36>
    2a56:	47a9                	li	a5,10
    2a58:	faf496e3          	bne	s1,a5,2a04 <__swbuf_r+0x36>
    2a5c:	85a2                	mv	a1,s0
    2a5e:	854a                	mv	a0,s2
    2a60:	3d2d                	jal	289a <_fflush_r>
    2a62:	d14d                	beqz	a0,2a04 <__swbuf_r+0x36>
    2a64:	bf79                	j	2a02 <__swbuf_r+0x34>

00002a66 <__swsetup_r>:
    2a66:	1141                	addi	sp,sp,-16
    2a68:	c226                	sw	s1,4(sp)
    2a6a:	84aa                	mv	s1,a0
    2a6c:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2a70:	c422                	sw	s0,8(sp)
    2a72:	c606                	sw	ra,12(sp)
    2a74:	842e                	mv	s0,a1
    2a76:	c509                	beqz	a0,2a80 <__swsetup_r+0x1a>
    2a78:	511c                	lw	a5,32(a0)
    2a7a:	e399                	bnez	a5,2a80 <__swsetup_r+0x1a>
    2a7c:	f78ff0ef          	jal	21f4 <__sinit>
    2a80:	00c41783          	lh	a5,12(s0)
    2a84:	0087f713          	andi	a4,a5,8
    2a88:	e729                	bnez	a4,2ad2 <__swsetup_r+0x6c>
    2a8a:	0107f713          	andi	a4,a5,16
    2a8e:	eb09                	bnez	a4,2aa0 <__swsetup_r+0x3a>
    2a90:	4725                	li	a4,9
    2a92:	c098                	sw	a4,0(s1)
    2a94:	0407e793          	ori	a5,a5,64
    2a98:	00f41623          	sh	a5,12(s0)
    2a9c:	557d                	li	a0,-1
    2a9e:	a0b5                	j	2b0a <__swsetup_r+0xa4>
    2aa0:	0047f713          	andi	a4,a5,4
    2aa4:	c31d                	beqz	a4,2aca <__swsetup_r+0x64>
    2aa6:	584c                	lw	a1,52(s0)
    2aa8:	c989                	beqz	a1,2aba <__swsetup_r+0x54>
    2aaa:	04440793          	addi	a5,s0,68
    2aae:	00f58463          	beq	a1,a5,2ab6 <__swsetup_r+0x50>
    2ab2:	8526                	mv	a0,s1
    2ab4:	3465                	jal	255c <_free_r>
    2ab6:	02042a23          	sw	zero,52(s0)
    2aba:	00c41783          	lh	a5,12(s0)
    2abe:	4818                	lw	a4,16(s0)
    2ac0:	00042223          	sw	zero,4(s0)
    2ac4:	fdb7f793          	andi	a5,a5,-37
    2ac8:	c018                	sw	a4,0(s0)
    2aca:	0087e793          	ori	a5,a5,8
    2ace:	00f41623          	sh	a5,12(s0)
    2ad2:	4818                	lw	a4,16(s0)
    2ad4:	eb11                	bnez	a4,2ae8 <__swsetup_r+0x82>
    2ad6:	2807f793          	andi	a5,a5,640
    2ada:	20000713          	li	a4,512
    2ade:	00e78563          	beq	a5,a4,2ae8 <__swsetup_r+0x82>
    2ae2:	85a2                	mv	a1,s0
    2ae4:	8526                	mv	a0,s1
    2ae6:	25dd                	jal	31cc <__smakebuf_r>
    2ae8:	00c41783          	lh	a5,12(s0)
    2aec:	0017f713          	andi	a4,a5,1
    2af0:	c315                	beqz	a4,2b14 <__swsetup_r+0xae>
    2af2:	4858                	lw	a4,20(s0)
    2af4:	00042423          	sw	zero,8(s0)
    2af8:	40e00733          	neg	a4,a4
    2afc:	cc18                	sw	a4,24(s0)
    2afe:	4818                	lw	a4,16(s0)
    2b00:	4501                	li	a0,0
    2b02:	e701                	bnez	a4,2b0a <__swsetup_r+0xa4>
    2b04:	0807f713          	andi	a4,a5,128
    2b08:	f751                	bnez	a4,2a94 <__swsetup_r+0x2e>
    2b0a:	40b2                	lw	ra,12(sp)
    2b0c:	4422                	lw	s0,8(sp)
    2b0e:	4492                	lw	s1,4(sp)
    2b10:	0141                	addi	sp,sp,16
    2b12:	8082                	ret
    2b14:	0027f713          	andi	a4,a5,2
    2b18:	4681                	li	a3,0
    2b1a:	e311                	bnez	a4,2b1e <__swsetup_r+0xb8>
    2b1c:	4854                	lw	a3,20(s0)
    2b1e:	c414                	sw	a3,8(s0)
    2b20:	bff9                	j	2afe <__swsetup_r+0x98>

00002b22 <strlen>:
    2b22:	87aa                	mv	a5,a0
    2b24:	0007c703          	lbu	a4,0(a5)
    2b28:	0785                	addi	a5,a5,1
    2b2a:	ff6d                	bnez	a4,2b24 <strlen+0x2>
    2b2c:	40a78533          	sub	a0,a5,a0
    2b30:	157d                	addi	a0,a0,-1
    2b32:	8082                	ret

00002b34 <__sfputc_r>:
    2b34:	461c                	lw	a5,8(a2)
    2b36:	17fd                	addi	a5,a5,-1
    2b38:	c61c                	sw	a5,8(a2)
    2b3a:	0007d963          	bgez	a5,2b4c <__sfputc_r+0x18>
    2b3e:	4e18                	lw	a4,24(a2)
    2b40:	00e7c563          	blt	a5,a4,2b4a <__sfputc_r+0x16>
    2b44:	47a9                	li	a5,10
    2b46:	00f59363          	bne	a1,a5,2b4c <__sfputc_r+0x18>
    2b4a:	b551                	j	29ce <__swbuf_r>
    2b4c:	421c                	lw	a5,0(a2)
    2b4e:	852e                	mv	a0,a1
    2b50:	00178713          	addi	a4,a5,1
    2b54:	c218                	sw	a4,0(a2)
    2b56:	00b78023          	sb	a1,0(a5)
    2b5a:	8082                	ret

00002b5c <__sfputs_r>:
    2b5c:	1101                	addi	sp,sp,-32
    2b5e:	cc22                	sw	s0,24(sp)
    2b60:	ca26                	sw	s1,20(sp)
    2b62:	c84a                	sw	s2,16(sp)
    2b64:	c64e                	sw	s3,12(sp)
    2b66:	c452                	sw	s4,8(sp)
    2b68:	ce06                	sw	ra,28(sp)
    2b6a:	892a                	mv	s2,a0
    2b6c:	89ae                	mv	s3,a1
    2b6e:	8432                	mv	s0,a2
    2b70:	00d604b3          	add	s1,a2,a3
    2b74:	5a7d                	li	s4,-1
    2b76:	00941463          	bne	s0,s1,2b7e <__sfputs_r+0x22>
    2b7a:	4501                	li	a0,0
    2b7c:	a809                	j	2b8e <__sfputs_r+0x32>
    2b7e:	00044583          	lbu	a1,0(s0)
    2b82:	864e                	mv	a2,s3
    2b84:	854a                	mv	a0,s2
    2b86:	377d                	jal	2b34 <__sfputc_r>
    2b88:	0405                	addi	s0,s0,1
    2b8a:	ff4516e3          	bne	a0,s4,2b76 <__sfputs_r+0x1a>
    2b8e:	40f2                	lw	ra,28(sp)
    2b90:	4462                	lw	s0,24(sp)
    2b92:	44d2                	lw	s1,20(sp)
    2b94:	4942                	lw	s2,16(sp)
    2b96:	49b2                	lw	s3,12(sp)
    2b98:	4a22                	lw	s4,8(sp)
    2b9a:	6105                	addi	sp,sp,32
    2b9c:	8082                	ret

00002b9e <_vfiprintf_r>:
    2b9e:	7135                	addi	sp,sp,-160
    2ba0:	cd22                	sw	s0,152(sp)
    2ba2:	cb26                	sw	s1,148(sp)
    2ba4:	c94a                	sw	s2,144(sp)
    2ba6:	c74e                	sw	s3,140(sp)
    2ba8:	cf06                	sw	ra,156(sp)
    2baa:	c552                	sw	s4,136(sp)
    2bac:	c356                	sw	s5,132(sp)
    2bae:	c15a                	sw	s6,128(sp)
    2bb0:	dede                	sw	s7,124(sp)
    2bb2:	dce2                	sw	s8,120(sp)
    2bb4:	dae6                	sw	s9,116(sp)
    2bb6:	89aa                	mv	s3,a0
    2bb8:	892e                	mv	s2,a1
    2bba:	84b2                	mv	s1,a2
    2bbc:	8436                	mv	s0,a3
    2bbe:	c509                	beqz	a0,2bc8 <_vfiprintf_r+0x2a>
    2bc0:	511c                	lw	a5,32(a0)
    2bc2:	e399                	bnez	a5,2bc8 <_vfiprintf_r+0x2a>
    2bc4:	e30ff0ef          	jal	21f4 <__sinit>
    2bc8:	00c95783          	lhu	a5,12(s2)
    2bcc:	8ba1                	andi	a5,a5,8
    2bce:	c7f9                	beqz	a5,2c9c <_vfiprintf_r+0xfe>
    2bd0:	01092783          	lw	a5,16(s2)
    2bd4:	c7e1                	beqz	a5,2c9c <_vfiprintf_r+0xfe>
    2bd6:	02000793          	li	a5,32
    2bda:	02f104a3          	sb	a5,41(sp)
    2bde:	03000793          	li	a5,48
    2be2:	d202                	sw	zero,36(sp)
    2be4:	02f10523          	sb	a5,42(sp)
    2be8:	c622                	sw	s0,12(sp)
    2bea:	02500b93          	li	s7,37
    2bee:	5afd                	li	s5,-1
    2bf0:	4c05                	li	s8,1
    2bf2:	4b29                	li	s6,10
    2bf4:	8426                	mv	s0,s1
    2bf6:	00044783          	lbu	a5,0(s0)
    2bfa:	c399                	beqz	a5,2c00 <_vfiprintf_r+0x62>
    2bfc:	0d779263          	bne	a5,s7,2cc0 <_vfiprintf_r+0x122>
    2c00:	40940cb3          	sub	s9,s0,s1
    2c04:	00940c63          	beq	s0,s1,2c1c <_vfiprintf_r+0x7e>
    2c08:	86e6                	mv	a3,s9
    2c0a:	8626                	mv	a2,s1
    2c0c:	85ca                	mv	a1,s2
    2c0e:	854e                	mv	a0,s3
    2c10:	37b1                	jal	2b5c <__sfputs_r>
    2c12:	1d550563          	beq	a0,s5,2ddc <_vfiprintf_r+0x23e>
    2c16:	5792                	lw	a5,36(sp)
    2c18:	97e6                	add	a5,a5,s9
    2c1a:	d23e                	sw	a5,36(sp)
    2c1c:	00044783          	lbu	a5,0(s0)
    2c20:	1a078e63          	beqz	a5,2ddc <_vfiprintf_r+0x23e>
    2c24:	00140493          	addi	s1,s0,1
    2c28:	c802                	sw	zero,16(sp)
    2c2a:	ce02                	sw	zero,28(sp)
    2c2c:	ca56                	sw	s5,20(sp)
    2c2e:	cc02                	sw	zero,24(sp)
    2c30:	040109a3          	sb	zero,83(sp)
    2c34:	d482                	sw	zero,104(sp)
    2c36:	00002c97          	auipc	s9,0x2
    2c3a:	c9ec8c93          	addi	s9,s9,-866 # 48d4 <zetas_DSA+0x708>
    2c3e:	0004c583          	lbu	a1,0(s1)
    2c42:	4615                	li	a2,5
    2c44:	00002517          	auipc	a0,0x2
    2c48:	c9050513          	addi	a0,a0,-880 # 48d4 <zetas_DSA+0x708>
    2c4c:	2511                	jal	3250 <memchr>
    2c4e:	4742                	lw	a4,16(sp)
    2c50:	87aa                	mv	a5,a0
    2c52:	00148413          	addi	s0,s1,1
    2c56:	e53d                	bnez	a0,2cc4 <_vfiprintf_r+0x126>
    2c58:	01077793          	andi	a5,a4,16
    2c5c:	c789                	beqz	a5,2c66 <_vfiprintf_r+0xc8>
    2c5e:	02000793          	li	a5,32
    2c62:	04f109a3          	sb	a5,83(sp)
    2c66:	00877793          	andi	a5,a4,8
    2c6a:	c789                	beqz	a5,2c74 <_vfiprintf_r+0xd6>
    2c6c:	02b00793          	li	a5,43
    2c70:	04f109a3          	sb	a5,83(sp)
    2c74:	0004c683          	lbu	a3,0(s1)
    2c78:	02a00793          	li	a5,42
    2c7c:	04f68c63          	beq	a3,a5,2cd4 <_vfiprintf_r+0x136>
    2c80:	47f2                	lw	a5,28(sp)
    2c82:	8426                	mv	s0,s1
    2c84:	4681                	li	a3,0
    2c86:	4625                	li	a2,9
    2c88:	00044703          	lbu	a4,0(s0)
    2c8c:	00140593          	addi	a1,s0,1
    2c90:	fd070713          	addi	a4,a4,-48
    2c94:	08e67663          	bgeu	a2,a4,2d20 <_vfiprintf_r+0x182>
    2c98:	e6a9                	bnez	a3,2ce2 <_vfiprintf_r+0x144>
    2c9a:	a8a1                	j	2cf2 <_vfiprintf_r+0x154>
    2c9c:	85ca                	mv	a1,s2
    2c9e:	854e                	mv	a0,s3
    2ca0:	33d9                	jal	2a66 <__swsetup_r>
    2ca2:	d915                	beqz	a0,2bd6 <_vfiprintf_r+0x38>
    2ca4:	557d                	li	a0,-1
    2ca6:	40fa                	lw	ra,156(sp)
    2ca8:	446a                	lw	s0,152(sp)
    2caa:	44da                	lw	s1,148(sp)
    2cac:	494a                	lw	s2,144(sp)
    2cae:	49ba                	lw	s3,140(sp)
    2cb0:	4a2a                	lw	s4,136(sp)
    2cb2:	4a9a                	lw	s5,132(sp)
    2cb4:	4b0a                	lw	s6,128(sp)
    2cb6:	5bf6                	lw	s7,124(sp)
    2cb8:	5c66                	lw	s8,120(sp)
    2cba:	5cd6                	lw	s9,116(sp)
    2cbc:	610d                	addi	sp,sp,160
    2cbe:	8082                	ret
    2cc0:	0405                	addi	s0,s0,1
    2cc2:	bf15                	j	2bf6 <_vfiprintf_r+0x58>
    2cc4:	419787b3          	sub	a5,a5,s9
    2cc8:	00fc17b3          	sll	a5,s8,a5
    2ccc:	8fd9                	or	a5,a5,a4
    2cce:	c83e                	sw	a5,16(sp)
    2cd0:	84a2                	mv	s1,s0
    2cd2:	b7b5                	j	2c3e <_vfiprintf_r+0xa0>
    2cd4:	47b2                	lw	a5,12(sp)
    2cd6:	00478693          	addi	a3,a5,4
    2cda:	439c                	lw	a5,0(a5)
    2cdc:	c636                	sw	a3,12(sp)
    2cde:	0007c463          	bltz	a5,2ce6 <_vfiprintf_r+0x148>
    2ce2:	ce3e                	sw	a5,28(sp)
    2ce4:	a039                	j	2cf2 <_vfiprintf_r+0x154>
    2ce6:	40f007b3          	neg	a5,a5
    2cea:	00276713          	ori	a4,a4,2
    2cee:	ce3e                	sw	a5,28(sp)
    2cf0:	c83a                	sw	a4,16(sp)
    2cf2:	00044703          	lbu	a4,0(s0)
    2cf6:	02e00793          	li	a5,46
    2cfa:	04f71763          	bne	a4,a5,2d48 <_vfiprintf_r+0x1aa>
    2cfe:	00144703          	lbu	a4,1(s0)
    2d02:	02a00793          	li	a5,42
    2d06:	02f71363          	bne	a4,a5,2d2c <_vfiprintf_r+0x18e>
    2d0a:	47b2                	lw	a5,12(sp)
    2d0c:	0409                	addi	s0,s0,2
    2d0e:	00478713          	addi	a4,a5,4
    2d12:	439c                	lw	a5,0(a5)
    2d14:	c63a                	sw	a4,12(sp)
    2d16:	0007d363          	bgez	a5,2d1c <_vfiprintf_r+0x17e>
    2d1a:	57fd                	li	a5,-1
    2d1c:	ca3e                	sw	a5,20(sp)
    2d1e:	a02d                	j	2d48 <_vfiprintf_r+0x1aa>
    2d20:	036787b3          	mul	a5,a5,s6
    2d24:	842e                	mv	s0,a1
    2d26:	4685                	li	a3,1
    2d28:	97ba                	add	a5,a5,a4
    2d2a:	bfb9                	j	2c88 <_vfiprintf_r+0xea>
    2d2c:	0405                	addi	s0,s0,1
    2d2e:	ca02                	sw	zero,20(sp)
    2d30:	4681                	li	a3,0
    2d32:	4781                	li	a5,0
    2d34:	4625                	li	a2,9
    2d36:	00044703          	lbu	a4,0(s0)
    2d3a:	00140593          	addi	a1,s0,1
    2d3e:	fd070713          	addi	a4,a4,-48
    2d42:	06e67463          	bgeu	a2,a4,2daa <_vfiprintf_r+0x20c>
    2d46:	faf9                	bnez	a3,2d1c <_vfiprintf_r+0x17e>
    2d48:	00044583          	lbu	a1,0(s0)
    2d4c:	460d                	li	a2,3
    2d4e:	00002517          	auipc	a0,0x2
    2d52:	b8e50513          	addi	a0,a0,-1138 # 48dc <zetas_DSA+0x710>
    2d56:	29ed                	jal	3250 <memchr>
    2d58:	cd11                	beqz	a0,2d74 <_vfiprintf_r+0x1d6>
    2d5a:	00002797          	auipc	a5,0x2
    2d5e:	b8278793          	addi	a5,a5,-1150 # 48dc <zetas_DSA+0x710>
    2d62:	8d1d                	sub	a0,a0,a5
    2d64:	47c2                	lw	a5,16(sp)
    2d66:	04000713          	li	a4,64
    2d6a:	00a71733          	sll	a4,a4,a0
    2d6e:	8fd9                	or	a5,a5,a4
    2d70:	0405                	addi	s0,s0,1
    2d72:	c83e                	sw	a5,16(sp)
    2d74:	00044583          	lbu	a1,0(s0)
    2d78:	4619                	li	a2,6
    2d7a:	00002517          	auipc	a0,0x2
    2d7e:	b6650513          	addi	a0,a0,-1178 # 48e0 <zetas_DSA+0x714>
    2d82:	00140493          	addi	s1,s0,1
    2d86:	02b10423          	sb	a1,40(sp)
    2d8a:	21d9                	jal	3250 <memchr>
    2d8c:	c125                	beqz	a0,2dec <_vfiprintf_r+0x24e>
    2d8e:	00000793          	li	a5,0
    2d92:	e795                	bnez	a5,2dbe <_vfiprintf_r+0x220>
    2d94:	4742                	lw	a4,16(sp)
    2d96:	47b2                	lw	a5,12(sp)
    2d98:	10077713          	andi	a4,a4,256
    2d9c:	cf09                	beqz	a4,2db6 <_vfiprintf_r+0x218>
    2d9e:	0791                	addi	a5,a5,4
    2da0:	c63e                	sw	a5,12(sp)
    2da2:	5792                	lw	a5,36(sp)
    2da4:	97d2                	add	a5,a5,s4
    2da6:	d23e                	sw	a5,36(sp)
    2da8:	b5b1                	j	2bf4 <_vfiprintf_r+0x56>
    2daa:	036787b3          	mul	a5,a5,s6
    2dae:	842e                	mv	s0,a1
    2db0:	4685                	li	a3,1
    2db2:	97ba                	add	a5,a5,a4
    2db4:	b749                	j	2d36 <_vfiprintf_r+0x198>
    2db6:	079d                	addi	a5,a5,7
    2db8:	9be1                	andi	a5,a5,-8
    2dba:	07a1                	addi	a5,a5,8
    2dbc:	b7d5                	j	2da0 <_vfiprintf_r+0x202>
    2dbe:	0078                	addi	a4,sp,12
    2dc0:	00000697          	auipc	a3,0x0
    2dc4:	d9c68693          	addi	a3,a3,-612 # 2b5c <__sfputs_r>
    2dc8:	864a                	mv	a2,s2
    2dca:	080c                	addi	a1,sp,16
    2dcc:	854e                	mv	a0,s3
    2dce:	00000097          	auipc	ra,0x0
    2dd2:	000000e7          	jalr	zero # 0 <__vector_start>
    2dd6:	8a2a                	mv	s4,a0
    2dd8:	fd5515e3          	bne	a0,s5,2da2 <_vfiprintf_r+0x204>
    2ddc:	00c95783          	lhu	a5,12(s2)
    2de0:	0407f793          	andi	a5,a5,64
    2de4:	ec0790e3          	bnez	a5,2ca4 <_vfiprintf_r+0x106>
    2de8:	5512                	lw	a0,36(sp)
    2dea:	bd75                	j	2ca6 <_vfiprintf_r+0x108>
    2dec:	0078                	addi	a4,sp,12
    2dee:	00000697          	auipc	a3,0x0
    2df2:	d6e68693          	addi	a3,a3,-658 # 2b5c <__sfputs_r>
    2df6:	864a                	mv	a2,s2
    2df8:	080c                	addi	a1,sp,16
    2dfa:	854e                	mv	a0,s3
    2dfc:	2a19                	jal	2f12 <_printf_i>
    2dfe:	bfe1                	j	2dd6 <_vfiprintf_r+0x238>

00002e00 <_printf_common>:
    2e00:	7179                	addi	sp,sp,-48
    2e02:	ca56                	sw	s5,20(sp)
    2e04:	499c                	lw	a5,16(a1)
    2e06:	8aba                	mv	s5,a4
    2e08:	4598                	lw	a4,8(a1)
    2e0a:	d422                	sw	s0,40(sp)
    2e0c:	d04a                	sw	s2,32(sp)
    2e0e:	ce4e                	sw	s3,28(sp)
    2e10:	cc52                	sw	s4,24(sp)
    2e12:	d606                	sw	ra,44(sp)
    2e14:	d226                	sw	s1,36(sp)
    2e16:	c85a                	sw	s6,16(sp)
    2e18:	c65e                	sw	s7,12(sp)
    2e1a:	89aa                	mv	s3,a0
    2e1c:	842e                	mv	s0,a1
    2e1e:	8932                	mv	s2,a2
    2e20:	8a36                	mv	s4,a3
    2e22:	00e7d363          	bge	a5,a4,2e28 <_printf_common+0x28>
    2e26:	87ba                	mv	a5,a4
    2e28:	00f92023          	sw	a5,0(s2)
    2e2c:	04344703          	lbu	a4,67(s0)
    2e30:	c701                	beqz	a4,2e38 <_printf_common+0x38>
    2e32:	0785                	addi	a5,a5,1
    2e34:	00f92023          	sw	a5,0(s2)
    2e38:	401c                	lw	a5,0(s0)
    2e3a:	0207f793          	andi	a5,a5,32
    2e3e:	c791                	beqz	a5,2e4a <_printf_common+0x4a>
    2e40:	00092783          	lw	a5,0(s2)
    2e44:	0789                	addi	a5,a5,2
    2e46:	00f92023          	sw	a5,0(s2)
    2e4a:	4004                	lw	s1,0(s0)
    2e4c:	8899                	andi	s1,s1,6
    2e4e:	e891                	bnez	s1,2e62 <_printf_common+0x62>
    2e50:	01940b13          	addi	s6,s0,25
    2e54:	5bfd                	li	s7,-1
    2e56:	445c                	lw	a5,12(s0)
    2e58:	00092703          	lw	a4,0(s2)
    2e5c:	8f99                	sub	a5,a5,a4
    2e5e:	04f4cd63          	blt	s1,a5,2eb8 <_printf_common+0xb8>
    2e62:	04344783          	lbu	a5,67(s0)
    2e66:	00f036b3          	snez	a3,a5
    2e6a:	401c                	lw	a5,0(s0)
    2e6c:	0207f793          	andi	a5,a5,32
    2e70:	ebad                	bnez	a5,2ee2 <_printf_common+0xe2>
    2e72:	04340613          	addi	a2,s0,67
    2e76:	85d2                	mv	a1,s4
    2e78:	854e                	mv	a0,s3
    2e7a:	9a82                	jalr	s5
    2e7c:	57fd                	li	a5,-1
    2e7e:	04f50463          	beq	a0,a5,2ec6 <_printf_common+0xc6>
    2e82:	401c                	lw	a5,0(s0)
    2e84:	4711                	li	a4,4
    2e86:	4481                	li	s1,0
    2e88:	8b99                	andi	a5,a5,6
    2e8a:	00e79a63          	bne	a5,a4,2e9e <_printf_common+0x9e>
    2e8e:	00092783          	lw	a5,0(s2)
    2e92:	4444                	lw	s1,12(s0)
    2e94:	8c9d                	sub	s1,s1,a5
    2e96:	fff4c793          	not	a5,s1
    2e9a:	87fd                	srai	a5,a5,0x1f
    2e9c:	8cfd                	and	s1,s1,a5
    2e9e:	441c                	lw	a5,8(s0)
    2ea0:	4818                	lw	a4,16(s0)
    2ea2:	00f75463          	bge	a4,a5,2eaa <_printf_common+0xaa>
    2ea6:	8f99                	sub	a5,a5,a4
    2ea8:	94be                	add	s1,s1,a5
    2eaa:	4901                	li	s2,0
    2eac:	0469                	addi	s0,s0,26
    2eae:	5b7d                	li	s6,-1
    2eb0:	05249863          	bne	s1,s2,2f00 <_printf_common+0x100>
    2eb4:	4501                	li	a0,0
    2eb6:	a809                	j	2ec8 <_printf_common+0xc8>
    2eb8:	4685                	li	a3,1
    2eba:	865a                	mv	a2,s6
    2ebc:	85d2                	mv	a1,s4
    2ebe:	854e                	mv	a0,s3
    2ec0:	9a82                	jalr	s5
    2ec2:	01751e63          	bne	a0,s7,2ede <_printf_common+0xde>
    2ec6:	557d                	li	a0,-1
    2ec8:	50b2                	lw	ra,44(sp)
    2eca:	5422                	lw	s0,40(sp)
    2ecc:	5492                	lw	s1,36(sp)
    2ece:	5902                	lw	s2,32(sp)
    2ed0:	49f2                	lw	s3,28(sp)
    2ed2:	4a62                	lw	s4,24(sp)
    2ed4:	4ad2                	lw	s5,20(sp)
    2ed6:	4b42                	lw	s6,16(sp)
    2ed8:	4bb2                	lw	s7,12(sp)
    2eda:	6145                	addi	sp,sp,48
    2edc:	8082                	ret
    2ede:	0485                	addi	s1,s1,1
    2ee0:	bf9d                	j	2e56 <_printf_common+0x56>
    2ee2:	00d40733          	add	a4,s0,a3
    2ee6:	03000613          	li	a2,48
    2eea:	04c701a3          	sb	a2,67(a4)
    2eee:	04544703          	lbu	a4,69(s0)
    2ef2:	00168793          	addi	a5,a3,1
    2ef6:	97a2                	add	a5,a5,s0
    2ef8:	0689                	addi	a3,a3,2
    2efa:	04e781a3          	sb	a4,67(a5)
    2efe:	bf95                	j	2e72 <_printf_common+0x72>
    2f00:	4685                	li	a3,1
    2f02:	8622                	mv	a2,s0
    2f04:	85d2                	mv	a1,s4
    2f06:	854e                	mv	a0,s3
    2f08:	9a82                	jalr	s5
    2f0a:	fb650ee3          	beq	a0,s6,2ec6 <_printf_common+0xc6>
    2f0e:	0905                	addi	s2,s2,1
    2f10:	b745                	j	2eb0 <_printf_common+0xb0>

00002f12 <_printf_i>:
    2f12:	7179                	addi	sp,sp,-48
    2f14:	d422                	sw	s0,40(sp)
    2f16:	d226                	sw	s1,36(sp)
    2f18:	d04a                	sw	s2,32(sp)
    2f1a:	ce4e                	sw	s3,28(sp)
    2f1c:	d606                	sw	ra,44(sp)
    2f1e:	cc52                	sw	s4,24(sp)
    2f20:	ca56                	sw	s5,20(sp)
    2f22:	c85a                	sw	s6,16(sp)
    2f24:	0185c803          	lbu	a6,24(a1)
    2f28:	07800793          	li	a5,120
    2f2c:	84aa                	mv	s1,a0
    2f2e:	842e                	mv	s0,a1
    2f30:	8932                	mv	s2,a2
    2f32:	89b6                	mv	s3,a3
    2f34:	0307e263          	bltu	a5,a6,2f58 <_printf_i+0x46>
    2f38:	06200793          	li	a5,98
    2f3c:	04358693          	addi	a3,a1,67
    2f40:	0307e163          	bltu	a5,a6,2f62 <_printf_i+0x50>
    2f44:	1a080e63          	beqz	a6,3100 <_printf_i+0x1ee>
    2f48:	05800793          	li	a5,88
    2f4c:	00002617          	auipc	a2,0x2
    2f50:	99c60613          	addi	a2,a2,-1636 # 48e8 <zetas_DSA+0x71c>
    2f54:	14f80163          	beq	a6,a5,3096 <_printf_i+0x184>
    2f58:	04240a93          	addi	s5,s0,66
    2f5c:	05040123          	sb	a6,66(s0)
    2f60:	a815                	j	2f94 <_printf_i+0x82>
    2f62:	f9d80793          	addi	a5,a6,-99
    2f66:	0ff7f793          	zext.b	a5,a5
    2f6a:	4655                	li	a2,21
    2f6c:	fef666e3          	bltu	a2,a5,2f58 <_printf_i+0x46>
    2f70:	00001617          	auipc	a2,0x1
    2f74:	65c60613          	addi	a2,a2,1628 # 45cc <zetas_DSA+0x400>
    2f78:	078a                	slli	a5,a5,0x2
    2f7a:	97b2                	add	a5,a5,a2
    2f7c:	439c                	lw	a5,0(a5)
    2f7e:	97b2                	add	a5,a5,a2
    2f80:	8782                	jr	a5
    2f82:	431c                	lw	a5,0(a4)
    2f84:	04258a93          	addi	s5,a1,66
    2f88:	00478693          	addi	a3,a5,4
    2f8c:	439c                	lw	a5,0(a5)
    2f8e:	c314                	sw	a3,0(a4)
    2f90:	04f58123          	sb	a5,66(a1)
    2f94:	4785                	li	a5,1
    2f96:	aa41                	j	3126 <_printf_i+0x214>
    2f98:	419c                	lw	a5,0(a1)
    2f9a:	4308                	lw	a0,0(a4)
    2f9c:	0807f613          	andi	a2,a5,128
    2fa0:	00450593          	addi	a1,a0,4
    2fa4:	c20d                	beqz	a2,2fc6 <_printf_i+0xb4>
    2fa6:	411c                	lw	a5,0(a0)
    2fa8:	c30c                	sw	a1,0(a4)
    2faa:	0007d863          	bgez	a5,2fba <_printf_i+0xa8>
    2fae:	02d00713          	li	a4,45
    2fb2:	40f007b3          	neg	a5,a5
    2fb6:	04e401a3          	sb	a4,67(s0)
    2fba:	00002617          	auipc	a2,0x2
    2fbe:	92e60613          	addi	a2,a2,-1746 # 48e8 <zetas_DSA+0x71c>
    2fc2:	4829                	li	a6,10
    2fc4:	a089                	j	3006 <_printf_i+0xf4>
    2fc6:	0407f613          	andi	a2,a5,64
    2fca:	411c                	lw	a5,0(a0)
    2fcc:	c30c                	sw	a1,0(a4)
    2fce:	de71                	beqz	a2,2faa <_printf_i+0x98>
    2fd0:	07c2                	slli	a5,a5,0x10
    2fd2:	87c1                	srai	a5,a5,0x10
    2fd4:	bfd9                	j	2faa <_printf_i+0x98>
    2fd6:	418c                	lw	a1,0(a1)
    2fd8:	4310                	lw	a2,0(a4)
    2fda:	0805f513          	andi	a0,a1,128
    2fde:	421c                	lw	a5,0(a2)
    2fe0:	0611                	addi	a2,a2,4
    2fe2:	e511                	bnez	a0,2fee <_printf_i+0xdc>
    2fe4:	0405f593          	andi	a1,a1,64
    2fe8:	c199                	beqz	a1,2fee <_printf_i+0xdc>
    2fea:	07c2                	slli	a5,a5,0x10
    2fec:	83c1                	srli	a5,a5,0x10
    2fee:	c310                	sw	a2,0(a4)
    2ff0:	06f00713          	li	a4,111
    2ff4:	00002617          	auipc	a2,0x2
    2ff8:	8f460613          	addi	a2,a2,-1804 # 48e8 <zetas_DSA+0x71c>
    2ffc:	0ce81c63          	bne	a6,a4,30d4 <_printf_i+0x1c2>
    3000:	4821                	li	a6,8
    3002:	040401a3          	sb	zero,67(s0)
    3006:	4058                	lw	a4,4(s0)
    3008:	c418                	sw	a4,8(s0)
    300a:	00074863          	bltz	a4,301a <_printf_i+0x108>
    300e:	400c                	lw	a1,0(s0)
    3010:	8f5d                	or	a4,a4,a5
    3012:	8ab6                	mv	s5,a3
    3014:	99ed                	andi	a1,a1,-5
    3016:	c00c                	sw	a1,0(s0)
    3018:	cf19                	beqz	a4,3036 <_printf_i+0x124>
    301a:	8ab6                	mv	s5,a3
    301c:	0307f733          	remu	a4,a5,a6
    3020:	1afd                	addi	s5,s5,-1
    3022:	9732                	add	a4,a4,a2
    3024:	00074703          	lbu	a4,0(a4)
    3028:	00ea8023          	sb	a4,0(s5)
    302c:	873e                	mv	a4,a5
    302e:	0307d7b3          	divu	a5,a5,a6
    3032:	ff0775e3          	bgeu	a4,a6,301c <_printf_i+0x10a>
    3036:	47a1                	li	a5,8
    3038:	00f81e63          	bne	a6,a5,3054 <_printf_i+0x142>
    303c:	401c                	lw	a5,0(s0)
    303e:	8b85                	andi	a5,a5,1
    3040:	cb91                	beqz	a5,3054 <_printf_i+0x142>
    3042:	4058                	lw	a4,4(s0)
    3044:	481c                	lw	a5,16(s0)
    3046:	00e7c763          	blt	a5,a4,3054 <_printf_i+0x142>
    304a:	03000793          	li	a5,48
    304e:	fefa8fa3          	sb	a5,-1(s5)
    3052:	1afd                	addi	s5,s5,-1
    3054:	415686b3          	sub	a3,a3,s5
    3058:	c814                	sw	a3,16(s0)
    305a:	874e                	mv	a4,s3
    305c:	86ca                	mv	a3,s2
    305e:	0070                	addi	a2,sp,12
    3060:	85a2                	mv	a1,s0
    3062:	8526                	mv	a0,s1
    3064:	3b71                	jal	2e00 <_printf_common>
    3066:	5a7d                	li	s4,-1
    3068:	0d451363          	bne	a0,s4,312e <_printf_i+0x21c>
    306c:	557d                	li	a0,-1
    306e:	50b2                	lw	ra,44(sp)
    3070:	5422                	lw	s0,40(sp)
    3072:	5492                	lw	s1,36(sp)
    3074:	5902                	lw	s2,32(sp)
    3076:	49f2                	lw	s3,28(sp)
    3078:	4a62                	lw	s4,24(sp)
    307a:	4ad2                	lw	s5,20(sp)
    307c:	4b42                	lw	s6,16(sp)
    307e:	6145                	addi	sp,sp,48
    3080:	8082                	ret
    3082:	419c                	lw	a5,0(a1)
    3084:	0207e793          	ori	a5,a5,32
    3088:	c19c                	sw	a5,0(a1)
    308a:	07800813          	li	a6,120
    308e:	00002617          	auipc	a2,0x2
    3092:	86e60613          	addi	a2,a2,-1938 # 48fc <zetas_DSA+0x730>
    3096:	050402a3          	sb	a6,69(s0)
    309a:	400c                	lw	a1,0(s0)
    309c:	4308                	lw	a0,0(a4)
    309e:	0805f813          	andi	a6,a1,128
    30a2:	411c                	lw	a5,0(a0)
    30a4:	0511                	addi	a0,a0,4
    30a6:	00081863          	bnez	a6,30b6 <_printf_i+0x1a4>
    30aa:	0405f813          	andi	a6,a1,64
    30ae:	00080463          	beqz	a6,30b6 <_printf_i+0x1a4>
    30b2:	07c2                	slli	a5,a5,0x10
    30b4:	83c1                	srli	a5,a5,0x10
    30b6:	c308                	sw	a0,0(a4)
    30b8:	0015f713          	andi	a4,a1,1
    30bc:	c701                	beqz	a4,30c4 <_printf_i+0x1b2>
    30be:	0205e593          	ori	a1,a1,32
    30c2:	c00c                	sw	a1,0(s0)
    30c4:	c399                	beqz	a5,30ca <_printf_i+0x1b8>
    30c6:	4841                	li	a6,16
    30c8:	bf2d                	j	3002 <_printf_i+0xf0>
    30ca:	4018                	lw	a4,0(s0)
    30cc:	fdf77713          	andi	a4,a4,-33
    30d0:	c018                	sw	a4,0(s0)
    30d2:	bfd5                	j	30c6 <_printf_i+0x1b4>
    30d4:	4829                	li	a6,10
    30d6:	b735                	j	3002 <_printf_i+0xf0>
    30d8:	4190                	lw	a2,0(a1)
    30da:	431c                	lw	a5,0(a4)
    30dc:	49cc                	lw	a1,20(a1)
    30de:	08067813          	andi	a6,a2,128
    30e2:	00478513          	addi	a0,a5,4
    30e6:	00080663          	beqz	a6,30f2 <_printf_i+0x1e0>
    30ea:	c308                	sw	a0,0(a4)
    30ec:	439c                	lw	a5,0(a5)
    30ee:	c38c                	sw	a1,0(a5)
    30f0:	a801                	j	3100 <_printf_i+0x1ee>
    30f2:	c308                	sw	a0,0(a4)
    30f4:	04067613          	andi	a2,a2,64
    30f8:	439c                	lw	a5,0(a5)
    30fa:	da75                	beqz	a2,30ee <_printf_i+0x1dc>
    30fc:	00b79023          	sh	a1,0(a5)
    3100:	00042823          	sw	zero,16(s0)
    3104:	8ab6                	mv	s5,a3
    3106:	bf91                	j	305a <_printf_i+0x148>
    3108:	431c                	lw	a5,0(a4)
    310a:	41d0                	lw	a2,4(a1)
    310c:	4581                	li	a1,0
    310e:	00478693          	addi	a3,a5,4
    3112:	c314                	sw	a3,0(a4)
    3114:	0007aa83          	lw	s5,0(a5)
    3118:	8556                	mv	a0,s5
    311a:	2a1d                	jal	3250 <memchr>
    311c:	c501                	beqz	a0,3124 <_printf_i+0x212>
    311e:	41550533          	sub	a0,a0,s5
    3122:	c048                	sw	a0,4(s0)
    3124:	405c                	lw	a5,4(s0)
    3126:	c81c                	sw	a5,16(s0)
    3128:	040401a3          	sb	zero,67(s0)
    312c:	b73d                	j	305a <_printf_i+0x148>
    312e:	4814                	lw	a3,16(s0)
    3130:	8656                	mv	a2,s5
    3132:	85ca                	mv	a1,s2
    3134:	8526                	mv	a0,s1
    3136:	9982                	jalr	s3
    3138:	f3450ae3          	beq	a0,s4,306c <_printf_i+0x15a>
    313c:	401c                	lw	a5,0(s0)
    313e:	8b89                	andi	a5,a5,2
    3140:	e78d                	bnez	a5,316a <_printf_i+0x258>
    3142:	47b2                	lw	a5,12(sp)
    3144:	4448                	lw	a0,12(s0)
    3146:	f2f554e3          	bge	a0,a5,306e <_printf_i+0x15c>
    314a:	853e                	mv	a0,a5
    314c:	b70d                	j	306e <_printf_i+0x15c>
    314e:	4685                	li	a3,1
    3150:	865a                	mv	a2,s6
    3152:	85ca                	mv	a1,s2
    3154:	8526                	mv	a0,s1
    3156:	9982                	jalr	s3
    3158:	f1450ae3          	beq	a0,s4,306c <_printf_i+0x15a>
    315c:	0a85                	addi	s5,s5,1
    315e:	445c                	lw	a5,12(s0)
    3160:	4732                	lw	a4,12(sp)
    3162:	8f99                	sub	a5,a5,a4
    3164:	fefac5e3          	blt	s5,a5,314e <_printf_i+0x23c>
    3168:	bfe9                	j	3142 <_printf_i+0x230>
    316a:	4a81                	li	s5,0
    316c:	01940b13          	addi	s6,s0,25
    3170:	b7fd                	j	315e <_printf_i+0x24c>

00003172 <__swhatbuf_r>:
    3172:	7159                	addi	sp,sp,-112
    3174:	d4a2                	sw	s0,104(sp)
    3176:	842e                	mv	s0,a1
    3178:	00e59583          	lh	a1,14(a1)
    317c:	d2a6                	sw	s1,100(sp)
    317e:	d0ca                	sw	s2,96(sp)
    3180:	d686                	sw	ra,108(sp)
    3182:	84b2                	mv	s1,a2
    3184:	8936                	mv	s2,a3
    3186:	0205d363          	bgez	a1,31ac <__swhatbuf_r+0x3a>
    318a:	00c45783          	lhu	a5,12(s0)
    318e:	0807f793          	andi	a5,a5,128
    3192:	eb8d                	bnez	a5,31c4 <__swhatbuf_r+0x52>
    3194:	40000713          	li	a4,1024
    3198:	50b6                	lw	ra,108(sp)
    319a:	5426                	lw	s0,104(sp)
    319c:	00f92023          	sw	a5,0(s2)
    31a0:	c098                	sw	a4,0(s1)
    31a2:	5906                	lw	s2,96(sp)
    31a4:	5496                	lw	s1,100(sp)
    31a6:	4501                	li	a0,0
    31a8:	6165                	addi	sp,sp,112
    31aa:	8082                	ret
    31ac:	0030                	addi	a2,sp,8
    31ae:	2875                	jal	326a <_fstat_r>
    31b0:	fc054de3          	bltz	a0,318a <__swhatbuf_r+0x18>
    31b4:	47b2                	lw	a5,12(sp)
    31b6:	673d                	lui	a4,0xf
    31b8:	8ff9                	and	a5,a5,a4
    31ba:	7779                	lui	a4,0xffffe
    31bc:	97ba                	add	a5,a5,a4
    31be:	0017b793          	seqz	a5,a5
    31c2:	bfc9                	j	3194 <__swhatbuf_r+0x22>
    31c4:	4781                	li	a5,0
    31c6:	04000713          	li	a4,64
    31ca:	b7f9                	j	3198 <__swhatbuf_r+0x26>

000031cc <__smakebuf_r>:
    31cc:	00c5d783          	lhu	a5,12(a1)
    31d0:	1101                	addi	sp,sp,-32
    31d2:	cc22                	sw	s0,24(sp)
    31d4:	ce06                	sw	ra,28(sp)
    31d6:	ca26                	sw	s1,20(sp)
    31d8:	c84a                	sw	s2,16(sp)
    31da:	8b89                	andi	a5,a5,2
    31dc:	842e                	mv	s0,a1
    31de:	cf89                	beqz	a5,31f8 <__smakebuf_r+0x2c>
    31e0:	04740793          	addi	a5,s0,71
    31e4:	c01c                	sw	a5,0(s0)
    31e6:	c81c                	sw	a5,16(s0)
    31e8:	4785                	li	a5,1
    31ea:	c85c                	sw	a5,20(s0)
    31ec:	40f2                	lw	ra,28(sp)
    31ee:	4462                	lw	s0,24(sp)
    31f0:	44d2                	lw	s1,20(sp)
    31f2:	4942                	lw	s2,16(sp)
    31f4:	6105                	addi	sp,sp,32
    31f6:	8082                	ret
    31f8:	0074                	addi	a3,sp,12
    31fa:	0030                	addi	a2,sp,8
    31fc:	84aa                	mv	s1,a0
    31fe:	3f95                	jal	3172 <__swhatbuf_r>
    3200:	4922                	lw	s2,8(sp)
    3202:	8526                	mv	a0,s1
    3204:	85ca                	mv	a1,s2
    3206:	c48ff0ef          	jal	264e <_malloc_r>
    320a:	00c41783          	lh	a5,12(s0)
    320e:	e911                	bnez	a0,3222 <__smakebuf_r+0x56>
    3210:	2007f713          	andi	a4,a5,512
    3214:	ff61                	bnez	a4,31ec <__smakebuf_r+0x20>
    3216:	9bf1                	andi	a5,a5,-4
    3218:	0027e793          	ori	a5,a5,2
    321c:	00f41623          	sh	a5,12(s0)
    3220:	b7c1                	j	31e0 <__smakebuf_r+0x14>
    3222:	0807e793          	ori	a5,a5,128
    3226:	00f41623          	sh	a5,12(s0)
    322a:	47b2                	lw	a5,12(sp)
    322c:	c008                	sw	a0,0(s0)
    322e:	c808                	sw	a0,16(s0)
    3230:	01242a23          	sw	s2,20(s0)
    3234:	dfc5                	beqz	a5,31ec <__smakebuf_r+0x20>
    3236:	00e41583          	lh	a1,14(s0)
    323a:	8526                	mv	a0,s1
    323c:	28a1                	jal	3294 <_isatty_r>
    323e:	d55d                	beqz	a0,31ec <__smakebuf_r+0x20>
    3240:	00c45783          	lhu	a5,12(s0)
    3244:	9bf1                	andi	a5,a5,-4
    3246:	0017e793          	ori	a5,a5,1
    324a:	00f41623          	sh	a5,12(s0)
    324e:	bf79                	j	31ec <__smakebuf_r+0x20>

00003250 <memchr>:
    3250:	0ff5f593          	zext.b	a1,a1
    3254:	962a                	add	a2,a2,a0
    3256:	00c51463          	bne	a0,a2,325e <memchr+0xe>
    325a:	4501                	li	a0,0
    325c:	8082                	ret
    325e:	00054783          	lbu	a5,0(a0)
    3262:	feb78de3          	beq	a5,a1,325c <memchr+0xc>
    3266:	0505                	addi	a0,a0,1
    3268:	b7fd                	j	3256 <memchr+0x6>

0000326a <_fstat_r>:
    326a:	1141                	addi	sp,sp,-16
    326c:	c422                	sw	s0,8(sp)
    326e:	842a                	mv	s0,a0
    3270:	852e                	mv	a0,a1
    3272:	85b2                	mv	a1,a2
    3274:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    3278:	c606                	sw	ra,12(sp)
    327a:	e07fe0ef          	jal	2080 <_fstat>
    327e:	57fd                	li	a5,-1
    3280:	00f51663          	bne	a0,a5,328c <_fstat_r+0x22>
    3284:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    3288:	c391                	beqz	a5,328c <_fstat_r+0x22>
    328a:	c01c                	sw	a5,0(s0)
    328c:	40b2                	lw	ra,12(sp)
    328e:	4422                	lw	s0,8(sp)
    3290:	0141                	addi	sp,sp,16
    3292:	8082                	ret

00003294 <_isatty_r>:
    3294:	1141                	addi	sp,sp,-16
    3296:	c422                	sw	s0,8(sp)
    3298:	842a                	mv	s0,a0
    329a:	852e                	mv	a0,a1
    329c:	c201a823          	sw	zero,-976(gp) # ec30 <errno>
    32a0:	c606                	sw	ra,12(sp)
    32a2:	de7fe0ef          	jal	2088 <_isatty>
    32a6:	57fd                	li	a5,-1
    32a8:	00f51663          	bne	a0,a5,32b4 <_isatty_r+0x20>
    32ac:	c301a783          	lw	a5,-976(gp) # ec30 <errno>
    32b0:	c391                	beqz	a5,32b4 <_isatty_r+0x20>
    32b2:	c01c                	sw	a5,0(s0)
    32b4:	40b2                	lw	ra,12(sp)
    32b6:	4422                	lw	s0,8(sp)
    32b8:	0141                	addi	sp,sp,16
    32ba:	8082                	ret

000032bc <main>:
    }
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
    return ok;
}

int main(void) {
    32bc:	711d                	addi	sp,sp,-96
    32be:	ce86                	sw	ra,92(sp)
    32c0:	cca2                	sw	s0,88(sp)
    32c2:	caa6                	sw	s1,84(sp)
    32c4:	c8ca                	sw	s2,80(sp)
    32c6:	c6ce                	sw	s3,76(sp)
    32c8:	c4d2                	sw	s4,72(sp)
    32ca:	c2d6                	sw	s5,68(sp)
    32cc:	c0da                	sw	s6,64(sp)
    32ce:	de5e                	sw	s7,60(sp)
    32d0:	dc62                	sw	s8,56(sp)
    32d2:	da66                	sw	s9,52(sp)
    32d4:	d86a                	sw	s10,48(sp)
    32d6:	d66e                	sw	s11,44(sp)
    unsigned int cycles_sw = 0;
    unsigned int cycles_hw = 0;
    dsa_poly a_sw, a_hw;

    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
    32d8:	4785                	li	a5,1
int main(void) {
    32da:	81010113          	addi	sp,sp,-2032
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
    32de:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    32e2:	4781                	li	a5,0
    32e4:	b0079073          	csrw	mcycle,a5

    printf("    DILITHIUM NTT TEST               \n");
    32e8:	6511                	lui	a0,0x4
    32ea:	62450513          	addi	a0,a0,1572 # 4624 <zetas_DSA+0x458>
    32ee:	ed8ff0ef          	jal	29c6 <puts>

#if SW_TEST_ENABLED
    a_sw = dsa_tv_ntt_in;
    32f2:	678d                	lui	a5,0x3
    32f4:	59c78b13          	addi	s6,a5,1436 # 359c <dsa_tv_ntt_in>
    32f8:	0818                	addi	a4,sp,16
    32fa:	59c78793          	addi	a5,a5,1436
    32fe:	400b0b93          	addi	s7,s6,1024
    3302:	4388                	lw	a0,0(a5)
    3304:	43cc                	lw	a1,4(a5)
    3306:	4790                	lw	a2,8(a5)
    3308:	47d4                	lw	a3,12(a5)
    330a:	c308                	sw	a0,0(a4)
    330c:	c34c                	sw	a1,4(a4)
    330e:	c710                	sw	a2,8(a4)
    3310:	c754                	sw	a3,12(a4)
    3312:	07c1                	addi	a5,a5,16
    3314:	0741                	addi	a4,a4,16 # ffffe010 <_lma_data_end+0xbffef3d0>
    3316:	ff7796e3          	bne	a5,s7,3302 <main+0x46>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    331a:	4781                	li	a5,0
    331c:	b0079073          	csrw	mcycle,a5
    dilithium_ntt(a->coeffs);
    3320:	0808                	addi	a0,sp,16
    3322:	dd2fd0ef          	jal	8f4 <dilithium_ntt>
    dilithium_ntt_sw_compute(&a_sw);
    CSR_READ(CSR_REG_MCYCLE, &cycles_sw);
    3326:	b00029f3          	csrr	s3,mcycle
    int ok = 1;
    332a:	4905                	li	s2,1
    332c:	01010a93          	addi	s5,sp,16
    3330:	84de                	mv	s1,s7
    CSR_READ(CSR_REG_MCYCLE, &cycles_sw);
    3332:	8c5e                	mv	s8,s7
    for (int i = 0; i < DSA_N; i++) {
    3334:	4401                	li	s0,0
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    3336:	6d91                	lui	s11,0x4
    3338:	6d11                	lui	s10,0x4
    for (int i = 0; i < DSA_N; i++) {
    333a:	10000c93          	li	s9,256
        ok &= compare_coeffs("D-NTT-SW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
    333e:	000aa683          	lw	a3,0(s5)
    3342:	000c2703          	lw	a4,0(s8)
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    3346:	8622                	mv	a2,s0
    3348:	64cd8593          	addi	a1,s11,1612 # 464c <zetas_DSA+0x480>
    int match = (got == exp);
    334c:	40e68a33          	sub	s4,a3,a4
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    3350:	658d0513          	addi	a0,s10,1624 # 4658 <zetas_DSA+0x48c>
    int match = (got == exp);
    3354:	001a3a13          	seqz	s4,s4
    if (!match && !DEBUG) {
    3358:	00e68463          	beq	a3,a4,3360 <main+0xa4>
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    335c:	d9eff0ef          	jal	28fa <iprintf>
    for (int i = 0; i < DSA_N; i++) {
    3360:	0405                	addi	s0,s0,1
        ok &= compare_coeffs("D-NTT-SW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
    3362:	01497933          	and	s2,s2,s4
    for (int i = 0; i < DSA_N; i++) {
    3366:	0a91                	addi	s5,s5,4
    3368:	0c11                	addi	s8,s8,4
    336a:	fd941ae3          	bne	s0,s9,333e <main+0x82>
    if (ok) printf("PASSED: Dilithium NTT (Software)\n");
    336e:	1c091363          	bnez	s2,3534 <main+0x278>
    all_passed &= dilithium_ntt_sw_verify(&a_sw);
    printf("Software Cycles: %u\n\n", cycles_sw);
    3372:	6511                	lui	a0,0x4
    3374:	6b450513          	addi	a0,a0,1716 # 46b4 <zetas_DSA+0x4e8>
    3378:	85ce                	mv	a1,s3
    337a:	d80ff0ef          	jal	28fa <iprintf>
#else
    printf("--- SOFTWARE TEST SKIPPED ---\n\n");
#endif

    a_hw = dsa_tv_ntt_in;
    337e:	41010793          	addi	a5,sp,1040
    3382:	000b2583          	lw	a1,0(s6)
    3386:	004b2603          	lw	a2,4(s6)
    338a:	008b2683          	lw	a3,8(s6)
    338e:	00cb2703          	lw	a4,12(s6)
    3392:	c38c                	sw	a1,0(a5)
    3394:	c3d0                	sw	a2,4(a5)
    3396:	c794                	sw	a3,8(a5)
    3398:	c7d8                	sw	a4,12(a5)
    339a:	0b41                	addi	s6,s6,16
    339c:	07c1                	addi	a5,a5,16
    339e:	ff7b12e3          	bne	s6,s7,3382 <main+0xc6>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    33a2:	4781                	li	a5,0
    33a4:	b0079073          	csrw	mcycle,a5
    for (int len = 128; len > 0; len >>= 1) {
    33a8:	6d11                	lui	s10,0x4
    33aa:	d9cd0793          	addi	a5,s10,-612 # 3d9c <zetas_DSA>
    33ae:	c63e                	sw	a5,12(sp)
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    33b0:	4ea1                	li	t4,8
    int k = 0;
    33b2:	4f81                	li	t6,0
    for (int len = 128; len > 0; len >>= 1) {
    33b4:	08000e13          	li	t3,128
        for (int start = 0; start < 256; start = start + 2 * len) {
    33b8:	47b2                	lw	a5,12(sp)
    33ba:	001f8893          	addi	a7,t6,1
    33be:	00289593          	slli	a1,a7,0x2
    33c2:	95be                	add	a1,a1,a5
    33c4:	41010413          	addi	s0,sp,1040
    33c8:	8c46                	mv	s8,a7
    33ca:	fffe0513          	addi	a0,t3,-1
    33ce:	4781                	li	a5,0
            int32_t zeta = zetas_DSA[++k];
    33d0:	4190                	lw	a2,0(a1)
        for (int start = 0; start < 256; start = start + 2 * len) {
    33d2:	001e1813          	slli	a6,t3,0x1
    33d6:	8772                	mv	a4,t3
    33d8:	003e1b93          	slli	s7,t3,0x3
    33dc:	002e1313          	slli	t1,t3,0x2
    33e0:	86a2                	mv	a3,s0
            int32_t zeta = zetas_DSA[++k];
    33e2:	8fe2                	mv	t6,s8
            for (j = start; j < start + len - 1; j += 2) {
    33e4:	0aa7db63          	bge	a5,a0,349a <main+0x1de>
    33e8:	006683b3          	add	t2,a3,t1
    33ec:	8f36                	mv	t5,a3
    33ee:	c43e                	sw	a5,8(sp)
    33f0:	c23e                	sw	a5,4(sp)
                asm volatile ( 
    33f2:	000f2a83          	lw	s5,0(t5)
    33f6:	0003aa03          	lw	s4,0(t2)
    33fa:	004f2b03          	lw	s6,4(t5)
    33fe:	0043a783          	lw	a5,4(t2)
    3402:	82d2                	mv	t0,s4
    3404:	645afd6b          	.insn	4, 0x645afd6b
    3408:	2e007dbb          	.insn	4, 0x2e007dbb
    340c:	82be                	mv	t0,a5
    340e:	645b7ceb          	.insn	4, 0x645b7ceb
    3412:	2e0078bb          	.insn	4, 0x2e0078bb
            for (j = start; j < start + len - 1; j += 2) {
    3416:	47a2                	lw	a5,8(sp)
                a->coeffs[j]       = (int32_t)out0.rd_lo;
    3418:	01af2023          	sw	s10,0(t5)
                a->coeffs[j+len]   = (int32_t)out0.rd_hi;
    341c:	01b3a023          	sw	s11,0(t2)
                a->coeffs[j+1]     = (int32_t)out1.rd_lo;
    3420:	019f2223          	sw	s9,4(t5)
            for (j = start; j < start + len - 1; j += 2) {
    3424:	0789                	addi	a5,a5,2
                a->coeffs[j+1+len] = (int32_t)out1.rd_hi;
    3426:	0113a223          	sw	a7,4(t2)
            for (j = start; j < start + len - 1; j += 2) {
    342a:	c43e                	sw	a5,8(sp)
    342c:	0f21                	addi	t5,t5,8
    342e:	03a1                	addi	t2,t2,8
    3430:	fca7c1e3          	blt	a5,a0,33f2 <main+0x136>
    3434:	4792                	lw	a5,4(sp)
    3436:	ffe70293          	addi	t0,a4,-2
    343a:	40f282b3          	sub	t0,t0,a5
    343e:	ffe2f293          	andi	t0,t0,-2
    3442:	00278893          	addi	a7,a5,2
    3446:	011283b3          	add	t2,t0,a7
            for (; j < start + len; ++j) {
    344a:	02e3da63          	bge	t2,a4,347e <main+0x1c2>
    344e:	00239893          	slli	a7,t2,0x2
    3452:	41010f13          	addi	t5,sp,1040
    3456:	98fa                	add	a7,a7,t5
            asm volatile (
    3458:	00688f33          	add	t5,a7,t1
    345c:	000f2b03          	lw	s6,0(t5)
    3460:	0008ad03          	lw	s10,0(a7)
    3464:	82da                	mv	t0,s6
    3466:	645d7deb          	.insn	4, 0x645d7deb
    346a:	2e007cbb          	.insn	4, 0x2e007cbb
            a->coeffs[j]     = (int32_t)out0.rd_lo;
    346e:	01b8a023          	sw	s11,0(a7)
            a->coeffs[j+len] = (int32_t)out0.rd_hi;
    3472:	019f2023          	sw	s9,0(t5)
            for (; j < start + len; ++j) {
    3476:	0385                	addi	t2,t2,1
    3478:	0891                	addi	a7,a7,4
    347a:	fce39fe3          	bne	t2,a4,3458 <main+0x19c>
        for (int start = 0; start < 256; start = start + 2 * len) {
    347e:	97c2                	add	a5,a5,a6
    3480:	0ff00613          	li	a2,255
    3484:	0591                	addi	a1,a1,4
    3486:	9542                	add	a0,a0,a6
    3488:	9742                	add	a4,a4,a6
    348a:	96de                	add	a3,a3,s7
    348c:	00f64963          	blt	a2,a5,349e <main+0x1e2>
    3490:	0c05                	addi	s8,s8,1
            int32_t zeta = zetas_DSA[++k];
    3492:	4190                	lw	a2,0(a1)
    3494:	8fe2                	mv	t6,s8
            for (j = start; j < start + len - 1; j += 2) {
    3496:	f4a7c9e3          	blt	a5,a0,33e8 <main+0x12c>
    349a:	83be                	mv	t2,a5
    349c:	b77d                	j	344a <main+0x18e>
    for (int len = 128; len > 0; len >>= 1) {
    349e:	1efd                	addi	t4,t4,-1
    34a0:	401e5e13          	srai	t3,t3,0x1
    34a4:	f00e9ae3          	bnez	t4,33b8 <main+0xfc>
    dilithium_ntt_hw_compute(&a_hw);
    CSR_READ(CSR_REG_MCYCLE, &cycles_hw);
    34a8:	b0002af3          	csrr	s5,mcycle
    int ok = 1;
    34ac:	4b05                	li	s6,1
    for (int i = 0; i < 256; i++) {
    34ae:	4a01                	li	s4,0
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    34b0:	6c91                	lui	s9,0x4
    34b2:	6c11                	lui	s8,0x4
    for (int i = 0; i < 256; i++) {
    34b4:	10000b93          	li	s7,256
        ok &= compare_coeffs("D-NTT-HW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
    34b8:	4014                	lw	a3,0(s0)
    34ba:	4098                	lw	a4,0(s1)
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    34bc:	8652                	mv	a2,s4
    34be:	6ccc8593          	addi	a1,s9,1740 # 46cc <zetas_DSA+0x500>
    int match = (got == exp);
    34c2:	40e68d33          	sub	s10,a3,a4
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    34c6:	658c0513          	addi	a0,s8,1624 # 4658 <zetas_DSA+0x48c>
    int match = (got == exp);
    34ca:	001d3d13          	seqz	s10,s10
    if (!match && !DEBUG) {
    34ce:	00e68463          	beq	a3,a4,34d6 <main+0x21a>
        printf("[%s ERROR] Mismatch @ idx %3d: Got %8d, Expected %8d\n", 
    34d2:	c28ff0ef          	jal	28fa <iprintf>
    for (int i = 0; i < 256; i++) {
    34d6:	0a05                	addi	s4,s4,1
        ok &= compare_coeffs("D-NTT-HW", i, a->coeffs[i], dsa_tv_ntt_out.coeffs[i]);
    34d8:	01ab7b33          	and	s6,s6,s10
    for (int i = 0; i < 256; i++) {
    34dc:	0411                	addi	s0,s0,4
    34de:	0491                	addi	s1,s1,4
    34e0:	fd7a1ce3          	bne	s4,s7,34b8 <main+0x1fc>
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
    34e4:	040b1e63          	bnez	s6,3540 <main+0x284>
    all_passed &= dilithium_ntt_hw_verify(&a_hw);
    printf("Hardware Cycles: %u\n", cycles_hw);
    34e8:	6511                	lui	a0,0x4
    34ea:	85d6                	mv	a1,s5
    34ec:	6fc50513          	addi	a0,a0,1788 # 46fc <zetas_DSA+0x530>
    34f0:	c0aff0ef          	jal	28fa <iprintf>

#if SW_TEST_ENABLED
    printf("SW Cycles: %u | HW Cycles: %u\n", cycles_sw, cycles_hw);
    34f4:	6511                	lui	a0,0x4
    34f6:	8656                	mv	a2,s5
    34f8:	85ce                	mv	a1,s3
    34fa:	71450513          	addi	a0,a0,1812 # 4714 <zetas_DSA+0x548>
    34fe:	bfcff0ef          	jal	28fa <iprintf>
    if (cycles_sw > 0) {
    3502:	06099363          	bnez	s3,3568 <main+0x2ac>
#endif

    if (all_passed) {
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
    3506:	6511                	lui	a0,0x4
    3508:	76850513          	addi	a0,a0,1896 # 4768 <zetas_DSA+0x59c>
    350c:	cbaff0ef          	jal	29c6 <puts>
    }

    return EXIT_SUCCESS;
}
    3510:	7f010113          	addi	sp,sp,2032
    3514:	40f6                	lw	ra,92(sp)
    3516:	4466                	lw	s0,88(sp)
    3518:	44d6                	lw	s1,84(sp)
    351a:	4946                	lw	s2,80(sp)
    351c:	49b6                	lw	s3,76(sp)
    351e:	4a26                	lw	s4,72(sp)
    3520:	4a96                	lw	s5,68(sp)
    3522:	4b06                	lw	s6,64(sp)
    3524:	5bf2                	lw	s7,60(sp)
    3526:	5c62                	lw	s8,56(sp)
    3528:	5cd2                	lw	s9,52(sp)
    352a:	5d42                	lw	s10,48(sp)
    352c:	5db2                	lw	s11,44(sp)
    352e:	4501                	li	a0,0
    3530:	6125                	addi	sp,sp,96
    3532:	8082                	ret
    if (ok) printf("PASSED: Dilithium NTT (Software)\n");
    3534:	6511                	lui	a0,0x4
    3536:	69050513          	addi	a0,a0,1680 # 4690 <zetas_DSA+0x4c4>
    353a:	c8cff0ef          	jal	29c6 <puts>
    353e:	bd15                	j	3372 <main+0xb6>
    if (ok) printf("PASSED: Dilithium NTT (Hardware)\n");
    3540:	6511                	lui	a0,0x4
    3542:	6d850513          	addi	a0,a0,1752 # 46d8 <zetas_DSA+0x50c>
    3546:	c80ff0ef          	jal	29c6 <puts>
    printf("Hardware Cycles: %u\n", cycles_hw);
    354a:	6511                	lui	a0,0x4
    354c:	85d6                	mv	a1,s5
    354e:	6fc50513          	addi	a0,a0,1788 # 46fc <zetas_DSA+0x530>
    3552:	ba8ff0ef          	jal	28fa <iprintf>
    printf("SW Cycles: %u | HW Cycles: %u\n", cycles_sw, cycles_hw);
    3556:	6511                	lui	a0,0x4
    3558:	8656                	mv	a2,s5
    355a:	85ce                	mv	a1,s3
    355c:	71450513          	addi	a0,a0,1812 # 4714 <zetas_DSA+0x548>
    3560:	b9aff0ef          	jal	28fa <iprintf>
    if (cycles_sw > 0) {
    3564:	02098163          	beqz	s3,3586 <main+0x2ca>
        printf("Speedup: %u.%02ux\n", cycles_sw / cycles_hw, ((cycles_sw * 100) / cycles_hw) % 100);
    3568:	06400613          	li	a2,100
    356c:	02c987b3          	mul	a5,s3,a2
    3570:	6511                	lui	a0,0x4
    3572:	73450513          	addi	a0,a0,1844 # 4734 <zetas_DSA+0x568>
    3576:	0357d7b3          	divu	a5,a5,s5
    357a:	0359d5b3          	divu	a1,s3,s5
    357e:	02c7f633          	remu	a2,a5,a2
    3582:	b78ff0ef          	jal	28fa <iprintf>
    all_passed &= dilithium_ntt_hw_verify(&a_hw);
    3586:	012b7b33          	and	s6,s6,s2
    if (all_passed) {
    358a:	f60b0ee3          	beqz	s6,3506 <main+0x24a>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    358e:	6511                	lui	a0,0x4
    3590:	74850513          	addi	a0,a0,1864 # 4748 <zetas_DSA+0x57c>
    3594:	c32ff0ef          	jal	29c6 <puts>
    3598:	bfa5                	j	3510 <main+0x254>
	...

0000359c <dsa_tv_ntt_in>:
    359c:	e000 0058 a000 0032 c000 0073 e000 001c     ..X...2...s.....
    35ac:	4000 007f 8000 0001 0000 005d 6000 001a     .@........]..`..
    35bc:	2000 0046 4000 0024 2000 006a 0000 0015     . F..@$.. j.....
    35cc:	0000 005f 6000 0053 e000 003c 4000 0068     .._..`S...<..@h.
    35dc:	e000 000a 4000 0012 4000 0003 c000 0004     .....@...@......
    35ec:	8000 0027 e000 003d e000 0079 e000 0020     ..'...=...y... .
    35fc:	e000 0032 e000 0051 8000 0024 a000 0076     ..2...Q...$...v.
    360c:	c000 0039 4000 005b 2000 006a 6000 0071     ..9..@[.. j..`q.
    361c:	6000 0051 2000 0047 6000 0058 8000 0020     .`Q.. G..`X... .
    362c:	2000 004a 4000 0059 c000 0039 6000 0070     . J..@Y...9..`p.
    363c:	6000 003b e000 0035 8000 0078 e000 0047     .`;...5...x...G.
    364c:	c000 007f a000 0007 0000 0036 2000 0046     ..........6.. F.
    365c:	e000 0052 c000 0052 e000 0010 8000 0069     ..R...R.......i.
    366c:	6000 0011 c000 007c e000 005f c000 0015     .`....|..._.....
    367c:	0000 003a 6000 0044 6000 006e e000 0014     ..:..`D..`n.....
    368c:	2000 0044 8000 0065 8000 0005 a000 0020     . D...e....... .
    369c:	a000 0055 6000 0049 c000 0056 0000 000a     ..U..`I...V.....
    36ac:	2000 005c 2000 004a e000 000e 0000 006d     . \.. J.......m.
    36bc:	4000 0028 4000 007c c000 001b 4000 004b     .@(..@|......@K.
    36cc:	2000 0047 4000 007b 2000 005e 4000 0028     . G..@{.. ^..@(.
    36dc:	e000 0070 0000 0038 4000 004f e000 0031     ..p...8..@O...1.
    36ec:	e000 0009 4000 0028 6000 0031 2000 0029     .....@(..`1.. ).
    36fc:	6000 0076 a000 0054 a000 001e a000 0068     .`v...T.......h.
    370c:	c000 000c 2000 000c 0000 0076 a000 0010     ..... ....v.....
    371c:	8000 003d c000 005f 2000 007f c000 0076     ..=..._.. ....v.
    372c:	6000 0075 8000 001f 8000 0073 e000 0053     .`u.......s...S.
    373c:	e000 0021 2000 0060 2000 003e 2000 0070     ..!.. `.. >.. p.
    374c:	0000 0009 2000 0058 c000 0015 e000 005e     ..... X.......^.
    375c:	8000 005b e000 0034 2000 006d e000 0063     ..[...4.. m...c.
    376c:	2000 0008 2000 000f 4000 002e 2000 0013     . ... ...@... ..
    377c:	c000 006e e000 0013 c000 0007 8000 004f     ..n...........O.
    378c:	e000 0068 8000 0067 e000 0035 6000 0040     ..h...g...5..`@.
    379c:	2000 004d 2000 0076 4000 0009 0000 0007     . M.. v..@......
    37ac:	a000 007b 2000 002e 8000 0002 2000 0053     ..{.. ....... S.
    37bc:	0000 0007 c000 006a a000 0006 a000 000c     ......j.........
    37cc:	6000 0028 c000 003e 0000 0057 4000 0076     .`(...>...W..@v.
    37dc:	2000 0059 8000 001d 8000 0028 4000 0017     . Y.......(..@..
    37ec:	8000 0030 6000 0036 e000 0000 6000 0002     ..0..`6......`..
    37fc:	6000 007f 8000 005b c000 0079 2000 001f     .`....[...y.. ..
    380c:	0000 0065 6000 0074 e000 0061 2000 006f     ..e..`t...a.. o.
    381c:	0000 0029 4000 001f 8000 0067 4000 007c     ..)..@....g..@|.
    382c:	6000 0067 6000 0053 e000 003b 0000 0058     .`g..`S...;...X.
    383c:	a000 007d 6000 0016 c000 0059 0000 0059     ..}..`....Y...Y.
    384c:	a000 0047 e000 0066 e000 0039 2000 0009     ..G...f...9.. ..
    385c:	0000 0007 0000 0040 e000 0073 6000 005b     ......@...s..`[.
    386c:	6000 0007 8000 004a e000 0044 c000 0000     .`....J...D.....
    387c:	6000 0074 4000 0061 8000 0016 4000 0048     .`t..@a......@H.
    388c:	a000 0060 a000 007f 2000 0023 4000 000d     ..`...... #..@..
    389c:	8000 0052 a000 007b c000 002a 2000 0070     ..R...{...*.. p.
    38ac:	e000 004e 2000 004c e000 000c 6000 005f     ..N.. L......`_.
    38bc:	e000 0014 0000 0007 c000 0055 c000 001f     ..........U.....
    38cc:	c000 0042 c000 002b 0000 0010 2000 0066     ..B...+...... f.
    38dc:	8000 001e 6000 0014 8000 0028 c000 003e     .....`....(...>.
    38ec:	4000 000d 6000 0044 2000 000c 6000 001d     .@...`D.. ...`..
    38fc:	6000 004b a000 0077 e000 0023 c000 0002     .`K...w...#.....
    390c:	0000 0071 2000 0049 a000 000a 4000 002b     ..q.. I......@+.
    391c:	0000 004e 8000 0034 4000 0049 0000 0007     ..N...4..@I.....
    392c:	6000 0079 c000 0028 0000 0018 c000 0040     .`y...(.......@.
    393c:	c000 004b 2000 0054 c000 007c 4000 005b     ..K.. T...|..@[.
    394c:	e000 0059 6000 0021 6000 0056 4000 0053     ..Y..`!..`V..@S.
    395c:	8000 007c 4000 007d 4000 0067 6000 002d     ..|..@}..@g..`-.
    396c:	2000 003e 2000 007f 2000 0059 4000 0009     . >.. ... Y..@..
    397c:	e000 006a 4000 0025 2000 0038 e000 0035     ..j..@%.. 8...5.
    398c:	8000 004d 4000 0068 c000 000a 6000 003c     ..M..@h......`<.

0000399c <dsa_tv_ntt_out>:
    399c:	8001 010d c8e5 0170 1995 012f 5415 00d8     ......p.../..T..
    39ac:	76fe 010a a740 009b ea52 00c4 6b60 005b     .v..@...R...`k[.
    39bc:	0709 0078 bb1b 0035 7592 00a8 5bc6 00b8     ..x...5..u...[..
    39cc:	d8aa 0014 1c44 006e f320 009e c8c6 006a     ....D.n. .....j.
    39dc:	ca0b 0105 efa7 00a3 bf47 015b a6a3 0126     ........G.[...&.
    39ec:	e55e 007f 48d4 00e6 da10 00f2 8ff2 0134     ^....H........4.
    39fc:	2978 00c5 a84a 010e 8cd2 00f6 de9c 00a9     x)..J...........
    3a0c:	420b 01a1 623f 0144 acb8 00f9 a1ce 0179     .B..?bD.......y.
    3a1c:	f1cc 00b1 361c 00bb 59c9 0051 3d33 0076     .....6...YQ.3=v.
    3a2c:	43ad 0031 bf27 000c 24ca 009b af7e 0064     .C1.'....$..~.d.
    3a3c:	4a49 00d1 de75 005f 16df 00ad 0ecf 0098     IJ..u._.........
    3a4c:	e3c2 00b1 bc36 00b4 4cf6 00be f236 004a     ....6....L..6.J.
    3a5c:	9de8 0071 f70a 002b 532c 008b e15e 0073     ..q...+.,S..^.s.
    3a6c:	be40 00de 704c 00b4 eb12 00d6 bf76 00b6     @...Lp......v...
    3a7c:	6571 0145 fcb9 00f1 6c27 010d 4cf7 0125     qeE.....'l...L%.
    3a8c:	78ca 0123 321a 00eb 579a 00f7 e73a 0122     .x#..2...W..:.".
    3a9c:	f6c4 007a 2738 007d e1aa 004c 73a2 00ba     ..z.8'}...L..s..
    3aac:	20d8 0024 5b6a 0054 e9a6 0068 8f40 0043     . $.j[T...h.@.C.
    3abc:	6f48 003c 4fa4 0020 9b78 0014 ffdc 002a     Ho<..O .x.....*.
    3acc:	e441 004e 06f3 00a9 d98e 00a2 c2de 00fe     A.N.............
    3adc:	bbd5 004a 8d5f 00c3 0e37 ffe1 32d9 0056     ..J._...7....2V.
    3aec:	800d 0038 f1df 006e f14d 00fb fea3 00a3     ..8...n.M.......
    3afc:	c70b 0035 3f9b 007b fe66 001b 067c ffd1     ..5..?{.f...|...
    3b0c:	bd6a ffa8 1168 ffd7 8fbc 0054 6fda ffe6     j...h.....T..o..
    3b1c:	8deb 0031 6b0b 0029 5285 00c1 d51d 0081     ..1..k)..R......
    3b2c:	8555 002a 26c5 0022 17df ffc9 bab7 ffea     U.*..&".........
    3b3c:	aea7 00dc 00b5 00ab 7ff0 0072 13b8 007d     ..........r...}.
    3b4c:	9a2c 008c 4aec 0018 31f3 001c 4fb9 000c     ,....J...1...O..
    3b5c:	b3ca 007f 7aac 0004 6571 0029 af85 004a     .....z..qe)...J.
    3b6c:	a2bf 00b0 3b17 008d a5bf 0083 ed9f 0016     .....;..........
    3b7c:	bba4 ffc6 a050 002b c9e0 0044 95d0 0036     ....P.+...D...6.
    3b8c:	3e11 000d 53db ffc6 a43a ffdc 4466 ff86     .>...S..:...fD..
    3b9c:	1afc 0074 44be 0026 e58f 0037 bedf 0066     ..t..D&...7...f.
    3bac:	384d ffdf 44dd 0048 be92 007b 6594 0053     M8...DH...{..eS.
    3bbc:	9a74 0089 c71e 003d 93d4 0052 9792 0077     t.....=...R...w.
    3bcc:	d74d 0076 e8c9 001f 755f fff1 865b ffd5     M.v....._u..[...
    3bdc:	fc02 001f c94c 0084 3315 008c 2051 0026     ....L....3..Q &.
    3bec:	f3ca 001a 15f4 006e 5d83 fff1 6a03 0006     ......n..]...j..
    3bfc:	eb60 0026 4296 000d 6af3 0022 eb6b fff6     `.&..B...j".k...
    3c0c:	879a 0044 47ac 001b ce28 008c 3d86 000e     ..D..G..(....=..
    3c1c:	0733 0018 b59d ffe5 0911 008d 458b 0043     3............EC.
    3c2c:	b9f6 006d c7b8 00c3 63a0 00ce 185e 00ab     ..m......c..^...
    3c3c:	3826 007c fba6 006c 0219 0058 5c1b 0017     &8|...l...X..\..
    3c4c:	dc71 0066 d54d 007a 93a6 0084 d144 004e     q.f.M.z.....D.N.
    3c5c:	36f3 0090 f88f 00a5 3754 0056 94f2 00bc     .6......T7V.....
    3c6c:	f9df 00a2 6935 0062 52d5 0078 eecf 00c9     ....5ib..Rx.....
    3c7c:	a19b 00c3 57e7 010e d390 0101 ff5e 0133     .....W......^.3.
    3c8c:	b0e9 00d3 fb4f 011b fd67 0066 d4f1 0092     ....O...g.f.....
    3c9c:	779c ffd5 82cc ffc3 974f ffd5 429d ff83     .w......O....B..
    3cac:	f017 0011 668f 006b f728 0037 f196 ffff     .....fk.(.7.....
    3cbc:	176a 0082 e674 003a bfd3 0009 ec1f 0008     j...t.:.........
    3ccc:	ea63 0068 6915 002b 47b8 00c1 3848 0042     c.h..i+..G..H8B.
    3cdc:	663c ffbd 7774 002d ad58 ff6d 04d8 ffea     <f..tw-.X.m.....
    3cec:	e0fe ffb8 99ba ff6a 7249 ffbe d67f ff99     ......j.Ir......
    3cfc:	2bba ffe5 d3d8 0041 492b ff9c 614f fff8     .+....A.+I..Oa..
    3d0c:	6452 003a fc4c 0071 daed 001e 3ce9 001e     Rd:.L.q......<..
    3d1c:	fd36 002b 4fd8 005e 74b5 ffb5 01cd 0024     6.+..O^..t....$.
    3d2c:	253f ffa4 4a31 ff50 11b4 0004 4be4 ffe0     ?%..1JP......K..
    3d3c:	e6d7 feea c681 ff5b 9939 ff48 4cef ffb3     ......[.9.H..L..
    3d4c:	5e64 ffab 489a ff9a 2db9 ff94 4e01 ffc9     d^...H...-...N..
    3d5c:	cd4d ffe1 5f9f 0061 bb3e ffe7 263a ffe8     M...._a.>...:&..
    3d6c:	cc85 ff7e 1a2b ffda 56f7 ffbf e5dd ffe2     ..~.+....V......
    3d7c:	6e65 00a4 bc41 00ba 28cd ffff 2c5d 0071     en..A....(..],q.
    3d8c:	9c93 0031 845b ffff 8d56 0001 7794 0043     ..1.[...V....wC.

00003d9c <zetas_DSA>:
    3d9c:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
    3dac:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
    3dbc:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
    3dcc:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
    3ddc:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
    3dec:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
    3dfc:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
    3e0c:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
    3e1c:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
    3e2c:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
    3e3c:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
    3e4c:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
    3e5c:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
    3e6c:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
    3e7c:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
    3e8c:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
    3e9c:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
    3eac:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
    3ebc:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
    3ecc:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
    3edc:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
    3eec:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
    3efc:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
    3f0c:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
    3f1c:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
    3f2c:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
    3f3c:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
    3f4c:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
    3f5c:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
    3f6c:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
    3f7c:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
    3f8c:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
    3f9c:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
    3fac:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
    3fbc:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
    3fcc:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
    3fdc:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
    3fec:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
    3ffc:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
    400c:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
    401c:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
    402c:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
    403c:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
    404c:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
    405c:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
    406c:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
    407c:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
    408c:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
    409c:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
    40ac:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
    40bc:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
    40cc:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
    40dc:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
    40ec:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
    40fc:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
    410c:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
    411c:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
    412c:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
    413c:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
    414c:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
    415c:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
    416c:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
    417c:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
    418c:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..
    419c:	1f0c 0000 1f0c 0000 1f16 0000 1f20 0000     ............ ...
    41ac:	1f00 0000 1f02 0000 1f00 0000 1f02 0000     ................
    41bc:	1f00 0000 1f00 0000 1f00 0000 1f2a 0000     ............*...

000041cc <zetas_DSA>:
    41cc:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
    41dc:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
    41ec:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
    41fc:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
    420c:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
    421c:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
    422c:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
    423c:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
    424c:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
    425c:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
    426c:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
    427c:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
    428c:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
    429c:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
    42ac:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
    42bc:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
    42cc:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
    42dc:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
    42ec:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
    42fc:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
    430c:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
    431c:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
    432c:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
    433c:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
    434c:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
    435c:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
    436c:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
    437c:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
    438c:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
    439c:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
    43ac:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
    43bc:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
    43cc:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
    43dc:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
    43ec:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
    43fc:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
    440c:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
    441c:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
    442c:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
    443c:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
    444c:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
    445c:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
    446c:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
    447c:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
    448c:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
    449c:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
    44ac:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
    44bc:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
    44cc:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
    44dc:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
    44ec:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
    44fc:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
    450c:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
    451c:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
    452c:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
    453c:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
    454c:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
    455c:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
    456c:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
    457c:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
    458c:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
    459c:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
    45ac:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
    45bc:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..
    45cc:	e9b6 ffff e9cc ffff e98c ffff e98c ffff     ................
    45dc:	e98c ffff e98c ffff e9cc ffff e98c ffff     ................
    45ec:	e98c ffff e98c ffff e98c ffff eb0c ffff     ................
    45fc:	ea0a ffff eab6 ffff e98c ffff e98c ffff     ................
    460c:	eb3c ffff e98c ffff ea0a ffff e98c ffff     <...............
    461c:	e98c ffff eabe ffff 2020 2020 4944 494c     ........    DILI
    462c:	4854 5549 204d 544e 2054 4554 5453 2020     THIUM NTT TEST  
    463c:	2020 2020 2020 2020 2020 2020 0020 0000                  ...
    464c:	2d44 544e 2d54 5753 0000 0000 255b 2073     D-NTT-SW....[%s 
    465c:	5245 4f52 5d52 4d20 7369 616d 6374 2068     ERROR] Mismatch 
    466c:	2040 6469 2078 3325 3a64 4720 746f 2520     @ idx %3d: Got %
    467c:	6438 202c 7845 6570 7463 6465 2520 6438     8d, Expected %8d
    468c:	000a 0000 4150 5353 4445 203a 6944 696c     ....PASSED: Dili
    469c:	6874 7569 206d 544e 2054 5328 666f 7774     thium NTT (Softw
    46ac:	7261 2965 0000 0000 6f53 7466 6177 6572     are)....Software
    46bc:	4320 6379 656c 3a73 2520 0a75 000a 0000      Cycles: %u.....
    46cc:	2d44 544e 2d54 5748 0000 0000 4150 5353     D-NTT-HW....PASS
    46dc:	4445 203a 6944 696c 6874 7569 206d 544e     ED: Dilithium NT
    46ec:	2054 4828 7261 7764 7261 2965 0000 0000     T (Hardware)....
    46fc:	6148 6472 6177 6572 4320 6379 656c 3a73     Hardware Cycles:
    470c:	2520 0a75 0000 0000 5753 4320 6379 656c      %u.....SW Cycle
    471c:	3a73 2520 2075 207c 5748 4320 6379 656c     s: %u | HW Cycle
    472c:	3a73 2520 0a75 0000 7053 6565 7564 3a70     s: %u...Speedup:
    473c:	2520 2e75 3025 7532 0a78 0000 4946 414e      %u.%02ux...FINA
    474c:	204c 5453 5441 5355 203a 4c41 204c 4554     L STATUS: ALL TE
    475c:	5453 2053 4150 5353 4445 0000 4946 414e     STS PASSED..FINA
    476c:	204c 5453 5441 5355 203a 4554 5453 4620     L STATUS: TEST F
    477c:	4941 554c 4552 4420 5445 4345 4554 0044     AILURE DETECTED.
    478c:	544d 4156 204c 6176 756c 2065 7369 0020     MTVAL value is .
    479c:	6e49 7473 7572 7463 6f69 206e 6361 6563     Instruction acce
    47ac:	7373 6620 7561 746c 202c 746d 6176 206c     ss fault, mtval 
    47bc:	6873 776f 2073 6166 6c75 2074 6461 7264     shows fault addr
    47cc:	7365 0a73 0000 0000 6c49 656c 6167 206c     ess.....Illegal 
    47dc:	6e49 7473 7572 7463 6f69 206e 6166 6c75     Instruction faul
    47ec:	2c74 6d20 7674 6c61 7320 6f68 7377 6920     t, mtval shows i
    47fc:	736e 7274 6375 6974 6e6f 6320 6e6f 6574     nstruction conte
    480c:	746e 000a 7242 6165 706b 696f 746e 7420     nt..Breakpoint t
    481c:	6972 6767 7265 2c64 6d20 7674 6c61 7320     riggerd, mtval s
    482c:	6f68 7377 7420 6568 6220 6572 6b61 6f70     hows the breakpo
    483c:	6e69 2074 6461 7264 7365 0a73 0000 0000     int address.....
    484c:	6f4c 6461 532f 6f74 6572 6620 7561 746c     Load/Store fault
    485c:	202c 746d 6176 206c 6873 776f 2073 6874     , mtval shows th
    486c:	2065 6166 6c75 2074 6461 7264 7365 0a73     e fault address.
    487c:	0000 0000 6e45 6976 6f72 6d6e 6e65 2074     ....Environment 
    488c:	6163 6c6c 6520 636e 756f 746e 7265 6465     call encountered
    489c:	000a 0000 6f53 7466 6177 6572 4920 5152     ....Software IRQ
    48ac:	7420 6972 6767 7265 6465 0a21 0000 0000      triggered!.....
    48bc:	6954 656d 2072 5249 2051 7274 6769 6567     Timer IRQ trigge
    48cc:	6572 2164 000a 0000 2d23 2b30 0020 0000     red!....#-0+ ...
    48dc:	6c68 004c 6665 4567 4746 0000 3130 3332     hlL.efgEFG..0123
    48ec:	3534 3736 3938 4241 4443 4645 0000 0000     456789ABCDEF....
    48fc:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
    490c:	0000 0000                                   ....
