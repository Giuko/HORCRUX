
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	7fd0106f          	j	1ffc <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	5c40006f          	j	5c8 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	5c00006f          	j	5c8 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	0cc0206f          	j	20d8 <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
  10:	5b80006f          	j	5c8 <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
  14:	5b40006f          	j	5c8 <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
  18:	5b00006f          	j	5c8 <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
  1c:	1540206f          	j	2170 <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
  20:	5a80006f          	j	5c8 <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
  24:	5a40006f          	j	5c8 <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
  28:	5a00006f          	j	5c8 <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
  2c:	6610006f          	j	e8c <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
  30:	5980006f          	j	5c8 <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
  34:	5940006f          	j	5c8 <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
  38:	5900006f          	j	5c8 <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
  3c:	58c0006f          	j	5c8 <__no_irq_handler>
	// 16 : fast interrupt - timer_1
	j handler_irq_fast_timer_1
  40:	7890006f          	j	fc8 <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	0ac0106f          	j	10f0 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	1d00106f          	j	1218 <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	5610106f          	j	1dac <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	3690006f          	j	bb8 <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	4d10006f          	j	d24 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	4100106f          	j	1468 <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	5340106f          	j	1590 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	6580106f          	j	16b8 <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	77c0106f          	j	17e0 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	0a10106f          	j	1908 <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	1c50106f          	j	1a30 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	2ed0106f          	j	1b5c <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	4110106f          	j	1c84 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	65d0106f          	j	1ed4 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	2c40106f          	j	1340 <handler_irq_fast_external_peripheral>

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
 18c:	ac810113          	addi	sp,sp,-1336 # 3ec50 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <_sp+0x5f1f4b0>
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
 1a2:	80048493          	addi	s1,s1,-2048 # 800 <spi_event_handler+0x9e>
    li     s2, FLASH_MEM_START_ADDRESS
 1a6:	40000937          	lui	s2,0x40000

    // copy the remaining (if any) text and data sections //
    // Setup the in/out pointers and copy size knowing 1KiB as already been copied
    mv     a0, s2 // src ptr (flash)
 1aa:	854a                	mv	a0,s2
    add   a0, a0, s1
 1ac:	9526                	add	a0,a0,s1

    la     a1, _etext
 1ae:	00003597          	auipc	a1,0x3
 1b2:	7fa58593          	addi	a1,a1,2042 # 39a8 <_etext>
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
 1da:	a7260613          	addi	a2,a2,-1422 # 4000ec48 <_lma_data_end>
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
 1ee:	c4818613          	addi	a2,gp,-952 # ec48 <__BSS_END__>
    sub    a2, a2, a0
 1f2:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1f4:	4581                	li	a1,0
    call   memset
 1f6:	2675                	jal	5a2 <memset>
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
 20c:	38e50513          	addi	a0,a0,910 # 2596 <__libc_fini_array>
    call atexit
 210:	060020ef          	jal	2270 <atexit>
    call __libc_init_array
 214:	334020ef          	jal	2548 <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 218:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 21a:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 21c:	4601                	li	a2,0
    call main
 21e:	2ca030ef          	jal	34e8 <main>
    tail exit
 222:	0580206f          	j	227a <exit>

00000226 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 226:	7e3010ef          	jal	2208 <init>

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
 288:	078d                	addi	a5,a5,3 # 11000003 <_sp+0x10fc13b3>
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
 298:	fff90793          	addi	a5,s2,-1 # 3fffffff <_sp+0x3ffc13af>
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
 304:	0705                	addi	a4,a4,1 # 8000001 <_sp+0x7fc13b1>
 306:	0691                	addi	a3,a3,4 # 1000004 <_sp+0xfc13b4>
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
 398:	2c29                	jal	5b2 <memcpy>
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

00000430 <__text_start>:
# --- THE FUNCTION ---
keccak_coproc_S:
    # a0: pointer to uint32_t state[50]

    # 1. PROLOGUE: Save Callee-saved registers (s0-s4) and Return Address
    addi    sp, sp, -24
     430:	1121                	addi	sp,sp,-24
    sw      ra, 20(sp)
     432:	ca06                	sw	ra,20(sp)
    sw      s0, 16(sp)
     434:	c822                	sw	s0,16(sp)
    sw      s1, 12(sp)
     436:	c626                	sw	s1,12(sp)
    sw      s2, 8(sp)
     438:	c44a                	sw	s2,8(sp)
    sw      s3, 4(sp)
     43a:	c24e                	sw	s3,4(sp)
    sw      s4, 0(sp)
     43c:	c052                	sw	s4,0(sp)

    # 2. LOAD PHASE: Transfer memory state to Coprocessor
    # We process 10 words (5 lanes) per loop to satisfy the 5-register requirement
    # while providing word-pairs to the HW_LOAD instruction.
    
    li      t0, 0               # Lane index (0, 2, 4 ... 48)
     43e:	4281                	li	t0,0
    mv      t1, a0              # Moving pointer for state
     440:	832a                	mv	t1,a0

00000442 <load_10_words_loop>:

load_10_words_loop:
    # Load first 5 words into s0-s4 as requested
    lw      s0, 0(t1)           # state[i]
     442:	00032403          	lw	s0,0(t1)
    lw      s1, 4(t1)           # state[i+1]
     446:	00432483          	lw	s1,4(t1)
    lw      s2, 8(t1)           # state[i+2]
     44a:	00832903          	lw	s2,8(t1)
    lw      s3, 12(t1)          # state[i+3]
     44e:	00c32983          	lw	s3,12(t1)
    lw      s4, 16(t1)          # state[i+4]
     452:	01032a03          	lw	s4,16(t1)
    
    # Load next 5 words into temporary registers t2-t6
    lw      t2, 20(t1)          # state[i+5]
     456:	01432383          	lw	t2,20(t1)
    lw      t3, 24(t1)          # state[i+6]
     45a:	01832e03          	lw	t3,24(t1)
    lw      t4, 28(t1)          # state[i+7]
     45e:	01c32e83          	lw	t4,28(t1)
    lw      t5, 32(t1)          # state[i+8]
     462:	02032f03          	lw	t5,32(t1)
    lw      t6, 36(t1)          # state[i+9]
     466:	02432f83          	lw	t6,36(t1)

    # Now that the register file is definitely populated, fire the loads
    # HW_LOAD rs_low, rs_high, index
    KECCAK_HW_LOAD s0, s1, t0   # Lane index t0
     46a:	2e94106b          	.insn	4, 0x2e94106b
    addi    t0, t0, 2
     46e:	0289                	addi	t0,t0,2
    
    KECCAK_HW_LOAD s2, s3, t0   # Lane index t0+2
     470:	2f39106b          	.insn	4, 0x2f39106b
    addi    t0, t0, 2
     474:	0289                	addi	t0,t0,2
    
    KECCAK_HW_LOAD s4, t2, t0   # Lane index t0+4 (Uses s4 and t2)
     476:	2e7a106b          	.insn	4, 0x2e7a106b
    addi    t0, t0, 2
     47a:	0289                	addi	t0,t0,2
    
    KECCAK_HW_LOAD t3, t4, t0   # Lane index t0+6
     47c:	2fde106b          	.insn	4, 0x2fde106b
    addi    t0, t0, 2
     480:	0289                	addi	t0,t0,2
    
    KECCAK_HW_LOAD t5, t6, t0   # Lane index t0+8
     482:	2fff106b          	.insn	4, 0x2fff106b
    addi    t0, t0, 2
     486:	0289                	addi	t0,t0,2

    # Increment memory pointer by 10 words (40 bytes)
    addi    t1, t1, 40
     488:	02830313          	addi	t1,t1,40
    li      t2, 50
     48c:	03200393          	li	t2,50
    blt     t0, t2, load_10_words_loop
     490:	fa72c9e3          	blt	t0,t2,442 <load_10_words_loop>

    # 3. START PHASE: Trigger Hardware
    li      t0, 1
     494:	4285                	li	t0,1
    KECCAK_HW_START t0
     496:	0002906b          	.insn	4, 0x0002906b

    # 4. LATENCY PHASE: 24 NOPs
    nop
     49a:	0001                	nop
    nop
     49c:	0001                	nop
    nop
     49e:	0001                	nop
    nop
     4a0:	0001                	nop
    nop
     4a2:	0001                	nop
    nop
     4a4:	0001                	nop
    nop
     4a6:	0001                	nop
    nop
     4a8:	0001                	nop
    nop
     4aa:	0001                	nop
    nop
     4ac:	0001                	nop
    nop
     4ae:	0001                	nop
    nop
     4b0:	0001                	nop
    nop
     4b2:	0001                	nop
    nop
     4b4:	0001                	nop
    nop
     4b6:	0001                	nop
    nop
     4b8:	0001                	nop
    nop
     4ba:	0001                	nop
    nop
     4bc:	0001                	nop
    nop
     4be:	0001                	nop
    nop
     4c0:	0001                	nop
    nop
     4c2:	0001                	nop
    nop
     4c4:	0001                	nop
    nop
     4c6:	0001                	nop
    nop
     4c8:	0001                	nop

    # 5. STORE PHASE: Retrieve resulting state[50]
    li      t0, 0               # Reset Word index
     4ca:	4281                	li	t0,0
    mv      t1, a0              # FIX: Reset moving pointer to start of state
     4cc:	832a                	mv	t1,a0

000004ce <store_10_words_loop>:

store_10_words_loop:
    # --- Step A: Retrieve 10 words from Coprocessor into registers ---
    # Using multiple registers avoids "Write-After-Write" stalls
    KECCAK_HW_STORE t2, t0
     4ce:	1e02f3bb          	.insn	4, 0x1e02f3bb
    addi    t0, t0, 1
     4d2:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE t3, t0
     4d4:	1e02fe3b          	.insn	4, 0x1e02fe3b
    addi    t0, t0, 1
     4d8:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE t4, t0
     4da:	1e02febb          	.insn	4, 0x1e02febb
    addi    t0, t0, 1
     4de:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE t5, t0
     4e0:	1e02ff3b          	.insn	4, 0x1e02ff3b
    addi    t0, t0, 1
     4e4:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE t6, t0
     4e6:	1e02ffbb          	.insn	4, 0x1e02ffbb
    addi    t0, t0, 1
     4ea:	0285                	addi	t0,t0,1
    
    KECCAK_HW_STORE s0, t0
     4ec:	1e02f43b          	.insn	4, 0x1e02f43b
    addi    t0, t0, 1
     4f0:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE s1, t0
     4f2:	1e02f4bb          	.insn	4, 0x1e02f4bb
    addi    t0, t0, 1
     4f6:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE s2, t0
     4f8:	1e02f93b          	.insn	4, 0x1e02f93b
    addi    t0, t0, 1
     4fc:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE s3, t0
     4fe:	1e02f9bb          	.insn	4, 0x1e02f9bb
    addi    t0, t0, 1
     502:	0285                	addi	t0,t0,1
    KECCAK_HW_STORE s4, t0
     504:	1e02fa3b          	.insn	4, 0x1e02fa3b
    addi    t0, t0, 1
     508:	0285                	addi	t0,t0,1

    # --- Step B: Store the 10 registers to memory ---
    # Using fixed offsets is much faster than recalculating addresses
    sw      t2, 0(t1)
     50a:	00732023          	sw	t2,0(t1)
    sw      t3, 4(t1)
     50e:	01c32223          	sw	t3,4(t1)
    sw      t4, 8(t1)
     512:	01d32423          	sw	t4,8(t1)
    sw      t5, 12(t1)
     516:	01e32623          	sw	t5,12(t1)
    sw      t6, 16(t1)
     51a:	01f32823          	sw	t6,16(t1)
    sw      s0, 20(t1)
     51e:	00832a23          	sw	s0,20(t1)
    sw      s1, 24(t1)
     522:	00932c23          	sw	s1,24(t1)
    sw      s2, 28(t1)
     526:	01232e23          	sw	s2,28(t1)
    sw      s3, 32(t1)
     52a:	03332023          	sw	s3,32(t1)
    sw      s4, 36(t1)
     52e:	03432223          	sw	s4,36(t1)

    # Increment memory pointer by 40 bytes
    addi    t1, t1, 40
     532:	02830313          	addi	t1,t1,40
    
    # Check loop condition (5 iterations total for 50 words)
    li      t2, 50
     536:	03200393          	li	t2,50
    blt     t0, t2, store_10_words_loop
     53a:	f872cae3          	blt	t0,t2,4ce <store_10_words_loop>

    
    # 6. EPILOGUE: Restore registers
    lw      s4, 0(sp)
     53e:	4a02                	lw	s4,0(sp)
    lw      s3, 4(sp)
     540:	4992                	lw	s3,4(sp)
    lw      s2, 8(sp)
     542:	4922                	lw	s2,8(sp)
    lw      s1, 12(sp)
     544:	44b2                	lw	s1,12(sp)
    lw      s0, 16(sp)
     546:	4442                	lw	s0,16(sp)
    lw      ra, 20(sp)
     548:	40d2                	lw	ra,20(sp)
    addi    sp, sp, 24
     54a:	0161                	addi	sp,sp,24
    ret
     54c:	8082                	ret

0000054e <keccak_hw_init>:
# ============================================================================

# --- keccak_hw_init: Zero the HW register file ---
# void keccak_hw_init(void);
keccak_hw_init:
    KECCAK_HW_INIT_STATE
     54e:	1c00703b          	.insn	4, 0x1c00703b
    ret
     552:	8082                	ret

00000554 <keccak_hw_absorb_xor>:

# --- keccak_hw_absorb_xor: XOR a word pair into HW register file ---
# void keccak_hw_absorb_xor(uint32_t lo, uint32_t hi, uint32_t index);
# a0 = low word, a1 = high word, a2 = register index
keccak_hw_absorb_xor:
    KECCAK_HW_XOR a0, a1, a2
     554:	62b5106b          	.insn	4, 0x62b5106b
    ret
     558:	8082                	ret

0000055a <keccak_hw_permute>:

# --- keccak_hw_permute: In-place permutation (result stays in register file) ---
# void keccak_hw_permute(void);
keccak_hw_permute:
    li      t0, 1
     55a:	4285                	li	t0,1
    KECCAK_HW_PERMUTE t0
     55c:	0402906b          	.insn	4, 0x0402906b
    nop
     560:	0001                	nop
    nop
     562:	0001                	nop
    nop
     564:	0001                	nop
    nop
     566:	0001                	nop
    nop
     568:	0001                	nop
    nop
     56a:	0001                	nop
    nop
     56c:	0001                	nop
    nop
     56e:	0001                	nop
    nop
     570:	0001                	nop
    nop
     572:	0001                	nop
    nop
     574:	0001                	nop
    nop
     576:	0001                	nop
    nop
     578:	0001                	nop
    nop
     57a:	0001                	nop
    nop
     57c:	0001                	nop
    nop
     57e:	0001                	nop
    nop
     580:	0001                	nop
    nop
     582:	0001                	nop
    nop
     584:	0001                	nop
    nop
     586:	0001                	nop
    nop
     588:	0001                	nop
    nop
     58a:	0001                	nop
    nop
     58c:	0001                	nop
    nop
     58e:	0001                	nop
    ret
     590:	8082                	ret

00000592 <keccak_hw_store_word>:

# --- keccak_hw_store_word: Read one word from keccak result ---
# uint32_t keccak_hw_store_word(uint32_t index);
# a0 = index, returns result in a0
keccak_hw_store_word:
    KECCAK_HW_STORE a0, a0
     592:	1e05753b          	.insn	4, 0x1e05753b
     596:	8082                	ret
	...

000005a2 <memset>:
     5a2:	832a                	mv	t1,a0
     5a4:	c611                	beqz	a2,5b0 <memset+0xe>
     5a6:	00b30023          	sb	a1,0(t1)
     5aa:	167d                	addi	a2,a2,-1
     5ac:	0305                	addi	t1,t1,1
     5ae:	fe65                	bnez	a2,5a6 <memset+0x4>
     5b0:	8082                	ret

000005b2 <memcpy>:
     5b2:	832a                	mv	t1,a0
     5b4:	ca09                	beqz	a2,5c6 <memcpy+0x14>
     5b6:	00058383          	lb	t2,0(a1)
     5ba:	00730023          	sb	t2,0(t1)
     5be:	167d                	addi	a2,a2,-1
     5c0:	0305                	addi	t1,t1,1
     5c2:	0585                	addi	a1,a1,1
     5c4:	fa6d                	bnez	a2,5b6 <memcpy+0x4>
     5c6:	8082                	ret

000005c8 <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     5c8:	0000006f          	j	5c8 <__no_irq_handler>

000005cc <fic_irq_dma_window>:
     5cc:	1101                	addi	sp,sp,-32
     5ce:	ce06                	sw	ra,28(sp)
     5d0:	cc22                	sw	s0,24(sp)
     5d2:	1000                	addi	s0,sp,32
     5d4:	fe042623          	sw	zero,-20(s0)
     5d8:	a815                	j	60c <fic_irq_dma_window+0x40>
     5da:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     5de:	fec42703          	lw	a4,-20(s0)
     5e2:	87ba                	mv	a5,a4
     5e4:	0786                	slli	a5,a5,0x1
     5e6:	97ba                	add	a5,a5,a4
     5e8:	078a                	slli	a5,a5,0x2
     5ea:	97b6                	add	a5,a5,a3
     5ec:	479c                	lw	a5,8(a5)
     5ee:	57b8                	lw	a4,104(a5)
     5f0:	4785                	li	a5,1
     5f2:	00f71863          	bne	a4,a5,602 <fic_irq_dma_window+0x36>
     5f6:	fec42783          	lw	a5,-20(s0)
     5fa:	0ff7f793          	zext.b	a5,a5
     5fe:	853e                	mv	a0,a5
     600:	2071                	jal	68c <dma_intr_handler_trans_done>
     602:	fec42783          	lw	a5,-20(s0)
     606:	0785                	addi	a5,a5,1
     608:	fef42623          	sw	a5,-20(s0)
     60c:	fec42703          	lw	a4,-20(s0)
     610:	478d                	li	a5,3
     612:	fce7d4e3          	bge	a5,a4,5da <fic_irq_dma_window+0xe>
     616:	0001                	nop
     618:	40f2                	lw	ra,28(sp)
     61a:	4462                	lw	s0,24(sp)
     61c:	6105                	addi	sp,sp,32
     61e:	8082                	ret

00000620 <fic_irq_dma_done>:
     620:	1101                	addi	sp,sp,-32
     622:	ce06                	sw	ra,28(sp)
     624:	cc22                	sw	s0,24(sp)
     626:	1000                	addi	s0,sp,32
     628:	fe042623          	sw	zero,-20(s0)
     62c:	a0b1                	j	678 <fic_irq_dma_done+0x58>
     62e:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     632:	fec42703          	lw	a4,-20(s0)
     636:	87ba                	mv	a5,a4
     638:	0786                	slli	a5,a5,0x1
     63a:	97ba                	add	a5,a5,a4
     63c:	078a                	slli	a5,a5,0x2
     63e:	97b6                	add	a5,a5,a3
     640:	479c                	lw	a5,8(a5)
     642:	53f8                	lw	a4,100(a5)
     644:	4785                	li	a5,1
     646:	02f71463          	bne	a4,a5,66e <fic_irq_dma_done+0x4e>
     64a:	a3818693          	addi	a3,gp,-1480 # ea38 <dma_subsys_per>
     64e:	fec42703          	lw	a4,-20(s0)
     652:	87ba                	mv	a5,a4
     654:	0786                	slli	a5,a5,0x1
     656:	97ba                	add	a5,a5,a4
     658:	078a                	slli	a5,a5,0x2
     65a:	97b6                	add	a5,a5,a3
     65c:	4705                	li	a4,1
     65e:	00e78223          	sb	a4,4(a5)
     662:	fec42783          	lw	a5,-20(s0)
     666:	0ff7f793          	zext.b	a5,a5
     66a:	853e                	mv	a0,a5
     66c:	2005                	jal	68c <dma_intr_handler_trans_done>
     66e:	fec42783          	lw	a5,-20(s0)
     672:	0785                	addi	a5,a5,1
     674:	fef42623          	sw	a5,-20(s0)
     678:	fec42703          	lw	a4,-20(s0)
     67c:	478d                	li	a5,3
     67e:	fae7d8e3          	bge	a5,a4,62e <fic_irq_dma_done+0xe>
     682:	0001                	nop
     684:	40f2                	lw	ra,28(sp)
     686:	4462                	lw	s0,24(sp)
     688:	6105                	addi	sp,sp,32
     68a:	8082                	ret

0000068c <dma_intr_handler_trans_done>:
     68c:	1101                	addi	sp,sp,-32
     68e:	ce06                	sw	ra,28(sp)
     690:	cc22                	sw	s0,24(sp)
     692:	1000                	addi	s0,sp,32
     694:	87aa                	mv	a5,a0
     696:	fef407a3          	sb	a5,-17(s0)
     69a:	0001                	nop
     69c:	40f2                	lw	ra,28(sp)
     69e:	4462                	lw	s0,24(sp)
     6a0:	6105                	addi	sp,sp,32
     6a2:	8082                	ret

000006a4 <fic_irq_timer_1>:
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    return kFastIntrCtrlOk_e;
}

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     6a4:	1141                	addi	sp,sp,-16
     6a6:	c606                	sw	ra,12(sp)
     6a8:	c422                	sw	s0,8(sp)
     6aa:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     6ac:	0001                	nop
     6ae:	40b2                	lw	ra,12(sp)
     6b0:	4422                	lw	s0,8(sp)
     6b2:	0141                	addi	sp,sp,16
     6b4:	8082                	ret

000006b6 <_write>:
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    if (file != STDOUT_FILENO) {
     6b6:	4785                	li	a5,1
     6b8:	04f51c63          	bne	a0,a5,710 <_write+0x5a>
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     6bc:	200007b7          	lui	a5,0x20000
     6c0:	4fdc                	lw	a5,28(a5)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
     6c2:	c7b9                	beqz	a5,710 <_write+0x5a>
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     6c4:	200a0737          	lui	a4,0x200a0
     6c8:	00072623          	sw	zero,12(a4) # 200a000c <_sp+0x200613bc>
     6cc:	478d                	li	a5,3
     6ce:	cf5c                	sw	a5,28(a4)
     6d0:	02072223          	sw	zero,36(a4)
     6d4:	02072623          	sw	zero,44(a4)
     6d8:	00072223          	sw	zero,4(a4)
     6dc:	56fd                	li	a3,-1
     6de:	0a7c07b7          	lui	a5,0xa7c0
     6e2:	c314                	sw	a3,0(a4)
     6e4:	078d                	addi	a5,a5,3 # a7c0003 <_sp+0xa7813b3>
     6e6:	c75c                	sw	a5,12(a4)
     6e8:	00072223          	sw	zero,4(a4)
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
     6ec:	c205                	beqz	a2,70c <_write+0x56>
     6ee:	00c58833          	add	a6,a1,a2
    uart_putchar(uart, *data);
     6f2:	0005c683          	lbu	a3,0(a1)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     6f6:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
     6f8:	8b85                	andi	a5,a5,1
     6fa:	fff5                	bnez	a5,6f6 <_write+0x40>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     6fc:	cf14                	sw	a3,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     6fe:	4b1c                	lw	a5,16(a4)
  return (bitfield >> field.index) & field.mask;
     700:	838d                	srli	a5,a5,0x3
  while (!uart_tx_idle(uart)) {
     702:	8b85                	andi	a5,a5,1
     704:	dfed                	beqz	a5,6fe <_write+0x48>
    data++;
     706:	0585                	addi	a1,a1,1
  while (len) {
     708:	feb815e3          	bne	a6,a1,6f2 <_write+0x3c>
    if (uart_init(&uart) != kErrorOk) {
        errno = ENOSYS;
        return -1;
    }
    return uart_write(&uart,(uint8_t *)ptr,len);
}
     70c:	8532                	mv	a0,a2
     70e:	8082                	ret
        errno = ENOSYS;
     710:	05800713          	li	a4,88
        return -1;
     714:	567d                	li	a2,-1
        errno = ENOSYS;
     716:	c2e1ac23          	sw	a4,-968(gp) # ec38 <errno>
}
     71a:	8532                	mv	a0,a2
     71c:	8082                	ret

0000071e <spi_empty_rx>:
}

bool spi_empty_rx(spi_peripheral_t* peri) 
{
    // If we have a RX buffer and didn't exceed the count then read from RX FIFO
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     71e:	514c                	lw	a1,36(a0)
{
     720:	872a                	mv	a4,a0
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     722:	cd95                	beqz	a1,75e <spi_empty_rx+0x40>
     724:	5954                	lw	a3,52(a0)
     726:	551c                	lw	a5,40(a0)
            peri->rxcnt < peri->txn.rxlen 
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
        ) peri->rxcnt++; // Keep track of counter
        return true;
    }
    return false;
     728:	4501                	li	a0,0
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     72a:	00f6e363          	bltu	a3,a5,730 <spi_empty_rx+0x12>
}
     72e:	8082                	ret
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     730:	4310                	lw	a2,0(a4)
     732:	c605                	beqz	a2,75a <spi_empty_rx+0x3c>
     734:	068a                	slli	a3,a3,0x2
     736:	96ae                	add	a3,a3,a1
     738:	a821                	j	750 <spi_empty_rx+0x32>
    *dst = SPI_HW(spi)->RXDATA;
     73a:	561c                	lw	a5,40(a2)
     73c:	c29c                	sw	a5,0(a3)
        ) peri->rxcnt++; // Keep track of counter
     73e:	5b5c                	lw	a5,52(a4)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     740:	5708                	lw	a0,40(a4)
        ) peri->rxcnt++; // Keep track of counter
     742:	0785                	addi	a5,a5,1
     744:	db5c                	sw	a5,52(a4)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     746:	00279693          	slli	a3,a5,0x2
     74a:	00a7f863          	bgeu	a5,a0,75a <spi_empty_rx+0x3c>
     74e:	96ae                	add	a3,a3,a1
     750:	4a5c                	lw	a5,20(a2)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     752:	83a1                	srli	a5,a5,0x8
     754:	0ff7f793          	zext.b	a5,a5
     758:	f3ed                	bnez	a5,73a <spi_empty_rx+0x1c>
    return false;
     75a:	4505                	li	a0,1
     75c:	8082                	ret
     75e:	4501                	li	a0,0
}
     760:	8082                	ret

00000762 <spi_event_handler>:
    peri->txn       = (spi_transaction_t) {0};
    peri->callbacks = NULL_CALLBACKS;
}

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
     762:	1141                	addi	sp,sp,-16
     764:	c426                	sw	s1,8(sp)
     766:	c24a                	sw	s2,4(sp)
     768:	c606                	sw	ra,12(sp)
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
     76a:	0105f793          	andi	a5,a1,16
{
     76e:	892e                	mv	s2,a1
     770:	84aa                	mv	s1,a0
    if (events & SPI_EVENT_READY) 
     772:	cb99                	beqz	a5,788 <spi_event_handler+0x26>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
     774:	4958                	lw	a4,20(a0)
     776:	c711                	beqz	a4,782 <spi_event_handler+0x20>
     778:	5554                	lw	a3,44(a0)
     77a:	01854783          	lbu	a5,24(a0)
     77e:	0ef6e063          	bltu	a3,a5,85e <spi_event_handler+0xfc>
        {
            spi_issue_next_seg(peri);
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
     782:	02097793          	andi	a5,s2,32
     786:	efad                	bnez	a5,800 <spi_event_handler+0x9e>
            // Reset all transaction related variables
            spi_reset_transaction(peri);
            return;
        }
    }
    if (events & SPI_EVENT_TXWM)
     788:	00897793          	andi	a5,s2,8
     78c:	e79d                	bnez	a5,7ba <spi_event_handler+0x58>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
     78e:	00497593          	andi	a1,s2,4
     792:	e591                	bnez	a1,79e <spi_event_handler+0x3c>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
     794:	40b2                	lw	ra,12(sp)
     796:	44a2                	lw	s1,8(sp)
     798:	4912                	lw	s2,4(sp)
     79a:	0141                	addi	sp,sp,16
     79c:	8082                	ret
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
     79e:	8526                	mv	a0,s1
     7a0:	3fbd                	jal	71e <spi_empty_rx>
     7a2:	d96d                	beqz	a0,794 <spi_event_handler+0x32>
     7a4:	40bc                	lw	a5,64(s1)
     7a6:	d7fd                	beqz	a5,794 <spi_event_handler+0x32>
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     7a8:	58d4                	lw	a3,52(s1)
     7aa:	50d0                	lw	a2,36(s1)
     7ac:	588c                	lw	a1,48(s1)
     7ae:	4cc8                	lw	a0,28(s1)
}
     7b0:	40b2                	lw	ra,12(sp)
     7b2:	44a2                	lw	s1,8(sp)
     7b4:	4912                	lw	s2,4(sp)
     7b6:	0141                	addi	sp,sp,16
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     7b8:	8782                	jr	a5
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
     7ba:	4cc8                	lw	a0,28(s1)
     7bc:	d969                	beqz	a0,78e <spi_event_handler+0x2c>
     7be:	589c                	lw	a5,48(s1)
     7c0:	0204a803          	lw	a6,32(s1)
     7c4:	fd07f5e3          	bgeu	a5,a6,78e <spi_event_handler+0x2c>
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     7c8:	4090                	lw	a2,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     7ca:	c605                	beqz	a2,7f2 <spi_event_handler+0x90>
     7cc:	00279693          	slli	a3,a5,0x2
     7d0:	96aa                	add	a3,a3,a0
     7d2:	428c                	lw	a1,0(a3)
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     7d4:	04700893          	li	a7,71
     7d8:	a031                	j	7e4 <spi_event_handler+0x82>
    SPI_HW(spi)->TXDATA = wdata;
     7da:	d64c                	sw	a1,44(a2)
        ) peri->txcnt++; // Keep track of counter
     7dc:	d89c                	sw	a5,48(s1)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     7de:	00f80a63          	beq	a6,a5,7f2 <spi_event_handler+0x90>
     7e2:	428c                	lw	a1,0(a3)
     7e4:	4a58                	lw	a4,20(a2)
        ) peri->txcnt++; // Keep track of counter
     7e6:	0785                	addi	a5,a5,1
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     7e8:	0691                	addi	a3,a3,4 # ff0004 <_sp+0xfb13b4>
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     7ea:	0ff77713          	zext.b	a4,a4
     7ee:	fee8f6e3          	bgeu	a7,a4,7da <spi_event_handler+0x78>
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
     7f2:	5cdc                	lw	a5,60(s1)
     7f4:	dfc9                	beqz	a5,78e <spi_event_handler+0x2c>
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
     7f6:	58d4                	lw	a3,52(s1)
     7f8:	50d0                	lw	a2,36(s1)
     7fa:	588c                	lw	a1,48(s1)
     7fc:	9782                	jalr	a5
     7fe:	bf41                	j	78e <spi_event_handler+0x2c>
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     800:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     802:	cb81                	beqz	a5,812 <spi_event_handler+0xb0>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     804:	5f98                	lw	a4,56(a5)
     806:	fc077713          	andi	a4,a4,-64
     80a:	df98                	sw	a4,56(a5)
}

spi_return_flags_e spi_enable_evt_intr(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     80c:	43d8                	lw	a4,4(a5)
  bitfield &= ~(mask << index);
     80e:	9b75                	andi	a4,a4,-3
     810:	c3d8                	sw	a4,4(a5)
            spi_empty_rx(peri);
     812:	8526                	mv	a0,s1
     814:	3729                	jal	71e <spi_empty_rx>
            if (peri->callbacks.done_cb != NULL) 
     816:	5c9c                	lw	a5,56(s1)
            peri->state = SPI_STATE_DONE;
     818:	4711                	li	a4,4
     81a:	c898                	sw	a4,16(s1)
            if (peri->callbacks.done_cb != NULL) 
     81c:	c791                	beqz	a5,828 <spi_event_handler+0xc6>
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
     81e:	58d4                	lw	a3,52(s1)
     820:	50d0                	lw	a2,36(s1)
     822:	588c                	lw	a1,48(s1)
     824:	4cc8                	lw	a0,28(s1)
     826:	9782                	jalr	a5
    peri->scnt      = 0;
     828:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     82c:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     830:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     834:	0004aa23          	sw	zero,20(s1)
     838:	0004ac23          	sw	zero,24(s1)
     83c:	0004ae23          	sw	zero,28(s1)
     840:	0204a023          	sw	zero,32(s1)
     844:	0204a223          	sw	zero,36(s1)
     848:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     84c:	0204ac23          	sw	zero,56(s1)
     850:	0204ae23          	sw	zero,60(s1)
     854:	0404a023          	sw	zero,64(s1)
     858:	0404a223          	sw	zero,68(s1)
            return;
     85c:	bf25                	j	794 <spi_event_handler+0x32>
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     85e:	00269613          	slli	a2,a3,0x2
     862:	9732                	add	a4,a4,a2
     864:	4310                	lw	a2,0(a4)
    peri->scnt++;
     866:	0685                	addi	a3,a3,1
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     868:	01000537          	lui	a0,0x1000
     86c:	01865593          	srli	a1,a2,0x18
     870:	89bd                	andi	a1,a1,15
  return (bitfield >> index) & mask;
     872:	0025d713          	srli	a4,a1,0x2
     876:	157d                	addi	a0,a0,-1 # ffffff <_sp+0xfc13af>
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
     878:	8f95                	sub	a5,a5,a3
                             SPI_HOST_COMMAND_LEN_OFFSET, command.len);
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
                             SPI_HOST_COMMAND_CSAAT_BIT, command.csaat);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
                             SPI_HOST_COMMAND_SPEED_OFFSET, command.speed);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
     87a:	898d                	andi	a1,a1,3
     87c:	00f037b3          	snez	a5,a5
  bitfield |= (value & mask) << index;
     880:	0766                	slli	a4,a4,0x19
     882:	05ee                	slli	a1,a1,0x1b
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     884:	8e69                	and	a2,a2,a0
    spi_set_command(peri->instance, cmd_reg);
     886:	0004a803          	lw	a6,0(s1)
     88a:	07e2                	slli	a5,a5,0x18
     88c:	8f4d                	or	a4,a4,a1
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
     88e:	167d                	addi	a2,a2,-1
     890:	8fd9                	or	a5,a5,a4
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
     892:	8e69                	and	a2,a2,a0
    peri->scnt++;
     894:	d4d4                	sw	a3,44(s1)
     896:	8fd1                	or	a5,a5,a2
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     898:	ee0808e3          	beqz	a6,788 <spi_event_handler+0x26>
  return (bitfield >> index) & mask;
     89c:	0197d713          	srli	a4,a5,0x19
     8a0:	8b0d                	andi	a4,a4,3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     8a2:	468d                	li	a3,3
     8a4:	00d70e63          	beq	a4,a3,8c0 <spi_event_handler+0x15e>
     8a8:	01b7d613          	srli	a2,a5,0x1b
     8ac:	00d60963          	beq	a2,a3,8be <spi_event_handler+0x15c>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     8b0:	01482703          	lw	a4,20(a6)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
     8b4:	ec075ae3          	bgez	a4,788 <spi_event_handler+0x26>
    SPI_HW(spi)->COMMAND = cmd_reg;
     8b8:	02f82223          	sw	a5,36(a6)
    return SPI_FLAG_OK;
     8bc:	b5f1                	j	788 <spi_event_handler+0x26>
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
     8be:	db6d                	beqz	a4,8b0 <spi_event_handler+0x14e>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     8c0:	01482783          	lw	a5,20(a6)
     8c4:	b5d1                	j	788 <spi_event_handler+0x26>

000008c6 <spi_error_handler.isra.0>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     8c6:	4114                	lw	a3,0(a0)
void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
     8c8:	1101                	addi	sp,sp,-32
     8ca:	cc26                	sw	s1,24(sp)
     8cc:	ce06                	sw	ra,28(sp)
     8ce:	84aa                	mv	s1,a0
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     8d0:	ca81                	beqz	a3,8e0 <spi_error_handler.isra.0+0x1a>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     8d2:	5e9c                	lw	a5,56(a3)
     8d4:	fc07f793          	andi	a5,a5,-64
     8d8:	de9c                	sw	a5,56(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     8da:	42dc                	lw	a5,4(a3)
  bitfield &= ~(mask << index);
     8dc:	9bf5                	andi	a5,a5,-3
     8de:	c2dc                	sw	a5,4(a3)
    spi_enable_evt_intr   (peri->instance, false);
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
     8e0:	40fc                	lw	a5,68(s1)
     8e2:	c799                	beqz	a5,8f0 <spi_error_handler.isra.0+0x2a>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
     8e4:	58d4                	lw	a3,52(s1)
     8e6:	50d0                	lw	a2,36(s1)
     8e8:	588c                	lw	a1,48(s1)
     8ea:	4cc8                	lw	a0,28(s1)
     8ec:	9782                	jalr	a5
    spi_sw_reset(peri->instance);
     8ee:	4094                	lw	a3,0(s1)
    peri->scnt      = 0;
     8f0:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     8f4:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     8f8:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     8fc:	0004aa23          	sw	zero,20(s1)
     900:	0004ac23          	sw	zero,24(s1)
     904:	0004ae23          	sw	zero,28(s1)
     908:	0204a023          	sw	zero,32(s1)
     90c:	0204a223          	sw	zero,36(s1)
     910:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     914:	0204ac23          	sw	zero,56(s1)
     918:	0204ae23          	sw	zero,60(s1)
     91c:	0404a023          	sw	zero,64(s1)
     920:	0404a223          	sw	zero,68(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     924:	c6c1                	beqz	a3,9ac <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     926:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     928:	40000737          	lui	a4,0x40000
     92c:	8fd9                	or	a5,a5,a4
     92e:	ca9c                	sw	a5,16(a3)
     930:	4adc                	lw	a5,20(a3)
     932:	c63e                	sw	a5,12(sp)
    while (status.active || status.txqd || status.rxqd);
     934:	47b2                	lw	a5,12(sp)
     936:	00179713          	slli	a4,a5,0x1
     93a:	fe074de3          	bltz	a4,934 <spi_error_handler.isra.0+0x6e>
     93e:	00c14783          	lbu	a5,12(sp)
     942:	fbed                	bnez	a5,934 <spi_error_handler.isra.0+0x6e>
     944:	00d14783          	lbu	a5,13(sp)
     948:	f7f5                	bnez	a5,934 <spi_error_handler.isra.0+0x6e>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     94a:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     94c:	c0000737          	lui	a4,0xc0000
     950:	177d                	addi	a4,a4,-1 # bfffffff <_lma_data_end+0x7fff13b7>
     952:	8ff9                	and	a5,a5,a4
     954:	ca9c                	sw	a5,16(a3)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     956:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     958:	80000637          	lui	a2,0x80000
     95c:	20000737          	lui	a4,0x20000
     960:	8fd1                	or	a5,a5,a2
     962:	ca9c                	sw	a5,16(a3)
}

spi_return_flags_e spi_output_enable(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     964:	4a9c                	lw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     966:	04800613          	li	a2,72
     96a:	8fd9                	or	a5,a5,a4
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     96c:	ca9c                	sw	a5,16(a3)
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
     96e:	5a9c                	lw	a5,48(a3)
     970:	01f7e793          	ori	a5,a5,31
     974:	da9c                	sw	a5,48(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     976:	42dc                	lw	a5,4(a3)
     978:	0017e793          	ori	a5,a5,1
     97c:	c2dc                	sw	a5,4(a3)
    spi_set_tx_watermark(peri->instance, peri->txwm);
     97e:	0044c783          	lbu	a5,4(s1)
    spi_set_rx_watermark(peri->instance, peri->rxwm);
     982:	0054c703          	lbu	a4,5(s1)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     986:	00f66a63          	bltu	a2,a5,99a <spi_error_handler.isra.0+0xd4>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     98a:	4a90                	lw	a2,16(a3)
  bitfield &= ~(mask << index);
     98c:	75c1                	lui	a1,0xffff0
     98e:	0ff58593          	addi	a1,a1,255 # ffff00ff <_lma_data_end+0xbffe14b7>
  bitfield |= (value & mask) << index;
     992:	07a2                	slli	a5,a5,0x8
  bitfield &= ~(mask << index);
     994:	8e6d                	and	a2,a2,a1
  bitfield |= (value & mask) << index;
     996:	8fd1                	or	a5,a5,a2
     998:	ca9c                	sw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     99a:	04000793          	li	a5,64
     99e:	00e7e763          	bltu	a5,a4,9ac <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     9a2:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     9a4:	f007f793          	andi	a5,a5,-256
  bitfield |= (value & mask) << index;
     9a8:	8f5d                	or	a4,a4,a5
     9aa:	ca98                	sw	a4,16(a3)
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
}
     9ac:	40f2                	lw	ra,28(sp)
    peri->state = SPI_STATE_ERROR;
     9ae:	47a1                	li	a5,8
    peri->last_id = 0;
     9b0:	0004a423          	sw	zero,8(s1)
    peri->state = SPI_STATE_ERROR;
     9b4:	c89c                	sw	a5,16(s1)
}
     9b6:	44e2                	lw	s1,24(sp)
     9b8:	6105                	addi	sp,sp,32
     9ba:	8082                	ret

000009bc <spi_get_events.isra.0>:
     9bc:	495c                	lw	a5,20(a0)
/**                                                                        **/
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

spi_return_flags_e spi_get_events(spi_host_t* spi, spi_event_e* events) {
     9be:	1141                	addi	sp,sp,-16
  bitfield &= ~(mask << index);
     9c0:	0005a803          	lw	a6,0(a1)
     9c4:	c63e                	sw	a5,12(sp)
    volatile spi_status_t status = spi_get_status(spi);
    // Also, we do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     9c6:	47b2                	lw	a5,12(sp)
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     9c8:	46b2                	lw	a3,12(sp)
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     9ca:	4532                	lw	a0,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     9cc:	83e5                	srli	a5,a5,0x19
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     9ce:	4732                	lw	a4,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     9d0:	8b85                	andi	a5,a5,1
  bitfield |= (value & mask) << index;
     9d2:	ffc87813          	andi	a6,a6,-4
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     9d6:	82ed                	srli	a3,a3,0x1b
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     9d8:	4632                	lw	a2,12(sp)
  bitfield &= ~(mask << index);
     9da:	00f86833          	or	a6,a6,a5
  bitfield |= (value & mask) << index;
     9de:	8a89                	andi	a3,a3,2
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     9e0:	47b2                	lw	a5,12(sp)
     9e2:	0106e6b3          	or	a3,a3,a6
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     9e6:	8149                	srli	a0,a0,0x12
     9e8:	9acd                	andi	a3,a3,-13
     9ea:	8911                	andi	a0,a0,4
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     9ec:	835d                	srli	a4,a4,0x17
  bitfield &= ~(mask << index);
     9ee:	8ec9                	or	a3,a3,a0
  bitfield |= (value & mask) << index;
     9f0:	8b21                	andi	a4,a4,8
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     9f2:	83f9                	srli	a5,a5,0x1e
     9f4:	8f55                	or	a4,a4,a3
     9f6:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     9f8:	01f65693          	srli	a3,a2,0x1f
     9fc:	fcf77713          	andi	a4,a4,-49
     a00:	0692                	slli	a3,a3,0x4
     a02:	0017c793          	xori	a5,a5,1
  bitfield &= ~(mask << index);
     a06:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     a08:	0796                	slli	a5,a5,0x5
     a0a:	8fd9                	or	a5,a5,a4
    *events = bitfield_write(*events, BIT_MASK_1, 
     a0c:	c19c                	sw	a5,0(a1)
    return SPI_FLAG_OK;
}
     a0e:	0141                	addi	sp,sp,16
     a10:	8082                	ret

00000a12 <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     a12:	1141                	addi	sp,sp,-16
     a14:	c426                	sw	s1,8(sp)
     a16:	c606                	sw	ra,12(sp)
     a18:	84aa                	mv	s1,a0
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     a1a:	2dc020ef          	jal	2cf6 <strlen>
}
     a1e:	40b2                	lw	ra,12(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     a20:	85a6                	mv	a1,s1
}
     a22:	44a2                	lw	s1,8(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     a24:	00150613          	addi	a2,a0,1
     a28:	4505                	li	a0,1
}
     a2a:	0141                	addi	sp,sp,16
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     a2c:	b169                	j	6b6 <_write>

00000a2e <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     a2e:	1101                	addi	sp,sp,-32
     a30:	ce06                	sw	ra,28(sp)
     a32:	cc26                	sw	s1,24(sp)
  _writestr(msg );
     a34:	3ff9                	jal	a12 <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     a36:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     a3a:	6511                	lui	a0,0x4
     a3c:	82450513          	addi	a0,a0,-2012 # 3824 <main+0x33c>
     a40:	3fc9                	jal	a12 <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     a42:	01049793          	slli	a5,s1,0x10
     a46:	83c1                	srli	a5,a5,0x10
     a48:	00849713          	slli	a4,s1,0x8
     a4c:	83a1                	srli	a5,a5,0x8
     a4e:	0184d693          	srli	a3,s1,0x18
     a52:	8fd9                	or	a5,a5,a4
     a54:	80c1                	srli	s1,s1,0x10
     a56:	4729                	li	a4,10
  _writestr(p);
     a58:	0028                	addi	a0,sp,8
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     a5a:	00d10423          	sb	a3,8(sp)
     a5e:	009104a3          	sb	s1,9(sp)
     a62:	00f11523          	sh	a5,10(sp)
     a66:	00e11623          	sh	a4,12(sp)
  _writestr(p);
     a6a:	3765                	jal	a12 <_writestr>
  while (1) {
     a6c:	a001                	j	a6c <print_exc_msg+0x3e>

00000a6e <pqcrystals_kyber_fips202_ref_sha3_256>:
* Arguments:   - uint8_t *h: pointer to output (32 bytes)
*              - const uint8_t *in: pointer to input
*              - size_t inlen: length of input in bytes
**************************************************/
void sha3_256(uint8_t h[32], const uint8_t *in, size_t inlen)
{
     a6e:	7155                	addi	sp,sp,-208
     a70:	df52                	sw	s4,188(sp)
     a72:	db5a                	sw	s6,180(sp)
     a74:	8a32                	mv	s4,a2
  while(inlen >= r) {
     a76:	08700b13          	li	s6,135
{
     a7a:	c1ce                	sw	s3,192(sp)
     a7c:	dd56                	sw	s5,184(sp)
     a7e:	c786                	sw	ra,204(sp)
     a80:	c5a6                	sw	s1,200(sp)
     a82:	c3ca                	sw	s2,196(sp)
     a84:	89aa                	mv	s3,a0
     a86:	8aae                	mv	s5,a1
  keccak_hw_init();
     a88:	34d9                	jal	54e <keccak_hw_init>
  while(inlen >= r) {
     a8a:	074b7363          	bgeu	s6,s4,af0 <pqcrystals_kyber_fips202_ref_sha3_256+0x82>
     a8e:	d95e                	sw	s7,176(sp)
     a90:	02200913          	li	s2,34
     a94:	84d6                	mv	s1,s5
    for(i = 0; i < rate_words; i += 2)
     a96:	4b81                	li	s7,0
         ((uint32_t)x[2] << 16) | ((uint32_t)x[3] << 24);
     a98:	0054c803          	lbu	a6,5(s1)
     a9c:	0014c683          	lbu	a3,1(s1)
     aa0:	0004c603          	lbu	a2,0(s1)
     aa4:	0044c883          	lbu	a7,4(s1)
     aa8:	0064c703          	lbu	a4,6(s1)
     aac:	0024c783          	lbu	a5,2(s1)
     ab0:	0074c583          	lbu	a1,7(s1)
     ab4:	0034c503          	lbu	a0,3(s1)
     ab8:	0822                	slli	a6,a6,0x8
     aba:	06a2                	slli	a3,a3,0x8
     abc:	8ed1                	or	a3,a3,a2
     abe:	01186833          	or	a6,a6,a7
     ac2:	0742                	slli	a4,a4,0x10
     ac4:	07c2                	slli	a5,a5,0x10
     ac6:	01076733          	or	a4,a4,a6
     aca:	8fd5                	or	a5,a5,a3
     acc:	05e2                	slli	a1,a1,0x18
     ace:	0562                	slli	a0,a0,0x18
      keccak_hw_absorb_xor(load32(in + 4*i), load32(in + 4*(i+1)), i);
     ad0:	865e                	mv	a2,s7
     ad2:	8dd9                	or	a1,a1,a4
     ad4:	8d5d                	or	a0,a0,a5
    for(i = 0; i < rate_words; i += 2)
     ad6:	0b89                	addi	s7,s7,2
      keccak_hw_absorb_xor(load32(in + 4*i), load32(in + 4*(i+1)), i);
     ad8:	3cb5                	jal	554 <keccak_hw_absorb_xor>
    for(i = 0; i < rate_words; i += 2)
     ada:	04a1                	addi	s1,s1,8
     adc:	fb2b9ee3          	bne	s7,s2,a98 <pqcrystals_kyber_fips202_ref_sha3_256+0x2a>
    inlen -= r;
     ae0:	f78a0a13          	addi	s4,s4,-136
    in += r;
     ae4:	088a8a93          	addi	s5,s5,136
    keccak_hw_permute();
     ae8:	3c8d                	jal	55a <keccak_hw_permute>
  while(inlen >= r) {
     aea:	fb4b65e3          	bltu	s6,s4,a94 <pqcrystals_kyber_fips202_ref_sha3_256+0x26>
     aee:	5bca                	lw	s7,176(sp)
    uint32_t xor_buf[42] = {0}; /* max rate_words = 168/4 = 42 (SHAKE128) */
     af0:	0024                	addi	s1,sp,8
     af2:	8526                	mv	a0,s1
     af4:	0a800613          	li	a2,168
     af8:	4581                	li	a1,0
     afa:	3465                	jal	5a2 <memset>
    for(i = 0; i < inlen; i++)
     afc:	020a0a63          	beqz	s4,b30 <pqcrystals_kyber_fips202_ref_sha3_256+0xc2>
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     b00:	000ac703          	lbu	a4,0(s5)
    for(i = 0; i < inlen; i++)
     b04:	4785                	li	a5,1
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     b06:	c43a                	sw	a4,8(sp)
    for(i = 0; i < inlen; i++)
     b08:	02fa0463          	beq	s4,a5,b30 <pqcrystals_kyber_fips202_ref_sha3_256+0xc2>
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     b0c:	ffc7f693          	andi	a3,a5,-4
     b10:	00fa8733          	add	a4,s5,a5
     b14:	96a6                	add	a3,a3,s1
     b16:	00074703          	lbu	a4,0(a4) # 20000000 <_sp+0x1ffc13b0>
     b1a:	428c                	lw	a1,0(a3)
     b1c:	0037f613          	andi	a2,a5,3
     b20:	060e                	slli	a2,a2,0x3
     b22:	00c71733          	sll	a4,a4,a2
     b26:	8f4d                	or	a4,a4,a1
     b28:	c298                	sw	a4,0(a3)
    for(i = 0; i < inlen; i++)
     b2a:	0785                	addi	a5,a5,1
     b2c:	fefa10e3          	bne	s4,a5,b0c <pqcrystals_kyber_fips202_ref_sha3_256+0x9e>
    xor_buf[inlen/4] |= (uint32_t)p << (8*(inlen%4));
     b30:	ffca7693          	andi	a3,s4,-4
     b34:	96a6                	add	a3,a3,s1
     b36:	4290                	lw	a2,0(a3)
     b38:	003a7793          	andi	a5,s4,3
     b3c:	4719                	li	a4,6
     b3e:	078e                	slli	a5,a5,0x3
     b40:	00f717b3          	sll	a5,a4,a5
     b44:	8fd1                	or	a5,a5,a2
     b46:	c29c                	sw	a5,0(a3)
    xor_buf[rate_words - 1] |= 0x80000000u;
     b48:	47ba                	lw	a5,140(sp)
     b4a:	80000737          	lui	a4,0x80000
    for(i = 0; i < rate_words; i += 2) {
     b4e:	4901                	li	s2,0
    xor_buf[rate_words - 1] |= 0x80000000u;
     b50:	8fd9                	or	a5,a5,a4
     b52:	c73e                	sw	a5,140(sp)
    for(i = 0; i < rate_words; i += 2) {
     b54:	02200a13          	li	s4,34
     b58:	a029                	j	b62 <pqcrystals_kyber_fips202_ref_sha3_256+0xf4>
     b5a:	0909                	addi	s2,s2,2
     b5c:	04a1                	addi	s1,s1,8
     b5e:	01490d63          	beq	s2,s4,b78 <pqcrystals_kyber_fips202_ref_sha3_256+0x10a>
      if(xor_buf[i] | xor_buf[i+1])
     b62:	4088                	lw	a0,0(s1)
     b64:	40cc                	lw	a1,4(s1)
     b66:	00b567b3          	or	a5,a0,a1
     b6a:	dbe5                	beqz	a5,b5a <pqcrystals_kyber_fips202_ref_sha3_256+0xec>
        keccak_hw_absorb_xor(xor_buf[i], xor_buf[i+1], i);
     b6c:	864a                	mv	a2,s2
    for(i = 0; i < rate_words; i += 2) {
     b6e:	0909                	addi	s2,s2,2
        keccak_hw_absorb_xor(xor_buf[i], xor_buf[i+1], i);
     b70:	32d5                	jal	554 <keccak_hw_absorb_xor>
    for(i = 0; i < rate_words; i += 2) {
     b72:	04a1                	addi	s1,s1,8
     b74:	ff4917e3          	bne	s2,s4,b62 <pqcrystals_kyber_fips202_ref_sha3_256+0xf4>
  keccak_absorb_once_hw(SHA3_256_RATE, in, inlen, 0x06);
  keccak_hw_permute();
     b78:	32cd                	jal	55a <keccak_hw_permute>
  for(i = 0; i < len/4; i++) {
     b7a:	4481                	li	s1,0
     b7c:	4921                	li	s2,8
    w = keccak_hw_store_word(i);
     b7e:	8526                	mv	a0,s1
     b80:	3c09                	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     b82:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     b86:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     b8a:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     b8e:	00a98023          	sb	a0,0(s3)
    out[4*i+1] = (uint8_t)(w >> 8);
     b92:	00d980a3          	sb	a3,1(s3)
    out[4*i+2] = (uint8_t)(w >> 16);
     b96:	00e98123          	sb	a4,2(s3)
    out[4*i+3] = (uint8_t)(w >> 24);
     b9a:	00f981a3          	sb	a5,3(s3)
  for(i = 0; i < len/4; i++) {
     b9e:	0485                	addi	s1,s1,1
     ba0:	0991                	addi	s3,s3,4
     ba2:	fd249ee3          	bne	s1,s2,b7e <pqcrystals_kyber_fips202_ref_sha3_256+0x110>
  keccak_hw_store_bytes(h, 32);
}
     ba6:	40be                	lw	ra,204(sp)
     ba8:	44ae                	lw	s1,200(sp)
     baa:	491e                	lw	s2,196(sp)
     bac:	498e                	lw	s3,192(sp)
     bae:	5a7a                	lw	s4,188(sp)
     bb0:	5aea                	lw	s5,184(sp)
     bb2:	5b5a                	lw	s6,180(sp)
     bb4:	6169                	addi	sp,sp,208
     bb6:	8082                	ret

00000bb8 <handler_irq_fast_spi>:
    // call the weak fic handler
    fic_irq_ext_peripheral();
}

void handler_irq_fast_spi(void)
{
     bb8:	710d                	addi	sp,sp,-352
     bba:	14112e23          	sw	ra,348(sp)
     bbe:	14512c23          	sw	t0,344(sp)
     bc2:	003022f3          	frcsr	t0
     bc6:	14a12423          	sw	a0,328(sp)
     bca:	12e12c23          	sw	a4,312(sp)
     bce:	12f12a23          	sw	a5,308(sp)
     bd2:	14512a23          	sw	t0,340(sp)
     bd6:	14612823          	sw	t1,336(sp)
     bda:	14712623          	sw	t2,332(sp)
     bde:	14b12223          	sw	a1,324(sp)
     be2:	14c12023          	sw	a2,320(sp)
     be6:	12d12e23          	sw	a3,316(sp)
     bea:	13012823          	sw	a6,304(sp)
     bee:	13112623          	sw	a7,300(sp)
     bf2:	13c12423          	sw	t3,296(sp)
     bf6:	13d12223          	sw	t4,292(sp)
     bfa:	13e12023          	sw	t5,288(sp)
     bfe:	11f12e23          	sw	t6,284(sp)
     c02:	a602                	fsd	ft0,264(sp)
     c04:	a206                	fsd	ft1,256(sp)
     c06:	bd8a                	fsd	ft2,248(sp)
     c08:	b98e                	fsd	ft3,240(sp)
     c0a:	b592                	fsd	ft4,232(sp)
     c0c:	b196                	fsd	ft5,224(sp)
     c0e:	ad9a                	fsd	ft6,216(sp)
     c10:	a99e                	fsd	ft7,208(sp)
     c12:	a5a2                	fsd	fs0,200(sp)
     c14:	a1a6                	fsd	fs1,192(sp)
     c16:	bd2a                	fsd	fa0,184(sp)
     c18:	b92e                	fsd	fa1,176(sp)
     c1a:	b532                	fsd	fa2,168(sp)
     c1c:	b136                	fsd	fa3,160(sp)
     c1e:	ad3a                	fsd	fa4,152(sp)
     c20:	a93e                	fsd	fa5,144(sp)
     c22:	a542                	fsd	fa6,136(sp)
     c24:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     c26:	200607b7          	lui	a5,0x20060
{
     c2a:	bcca                	fsd	fs2,120(sp)
     c2c:	b8ce                	fsd	fs3,112(sp)
     c2e:	b4d2                	fsd	fs4,104(sp)
     c30:	b0d6                	fsd	fs5,96(sp)
     c32:	acda                	fsd	fs6,88(sp)
     c34:	a8de                	fsd	fs7,80(sp)
     c36:	a4e2                	fsd	fs8,72(sp)
     c38:	a0e6                	fsd	fs9,64(sp)
     c3a:	bc6a                	fsd	fs10,56(sp)
     c3c:	b86e                	fsd	fs11,48(sp)
     c3e:	b472                	fsd	ft8,40(sp)
     c40:	b076                	fsd	ft9,32(sp)
     c42:	ac7a                	fsd	ft10,24(sp)
     c44:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     c46:	4741                	li	a4,16
     c48:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     c4a:	30010537          	lui	a0,0x30010
     c4e:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     c50:	03f7f793          	andi	a5,a5,63
    if (errors) {
     c54:	cfd9                	beqz	a5,cf2 <handler_irq_fast_spi+0x13a>
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     c56:	67bd                	lui	a5,0xf
     c58:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     c5c:	4fb8                	lw	a4,88(a5)
     c5e:	4789                	li	a5,2
     c60:	0af70c63          	beq	a4,a5,d18 <handler_irq_fast_spi+0x160>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
    // call the weak fic handler
    fic_irq_spi();
}
     c64:	15c12083          	lw	ra,348(sp)
     c68:	15412283          	lw	t0,340(sp)
     c6c:	00329073          	fscsr	t0
     c70:	15812283          	lw	t0,344(sp)
     c74:	15012303          	lw	t1,336(sp)
     c78:	14c12383          	lw	t2,332(sp)
     c7c:	14812503          	lw	a0,328(sp)
     c80:	14412583          	lw	a1,324(sp)
     c84:	14012603          	lw	a2,320(sp)
     c88:	13c12683          	lw	a3,316(sp)
     c8c:	13812703          	lw	a4,312(sp)
     c90:	13412783          	lw	a5,308(sp)
     c94:	13012803          	lw	a6,304(sp)
     c98:	12c12883          	lw	a7,300(sp)
     c9c:	12812e03          	lw	t3,296(sp)
     ca0:	12412e83          	lw	t4,292(sp)
     ca4:	12012f03          	lw	t5,288(sp)
     ca8:	11c12f83          	lw	t6,284(sp)
     cac:	2032                	fld	ft0,264(sp)
     cae:	2092                	fld	ft1,256(sp)
     cb0:	316e                	fld	ft2,248(sp)
     cb2:	31ce                	fld	ft3,240(sp)
     cb4:	322e                	fld	ft4,232(sp)
     cb6:	328e                	fld	ft5,224(sp)
     cb8:	236e                	fld	ft6,216(sp)
     cba:	23ce                	fld	ft7,208(sp)
     cbc:	242e                	fld	fs0,200(sp)
     cbe:	248e                	fld	fs1,192(sp)
     cc0:	356a                	fld	fa0,184(sp)
     cc2:	35ca                	fld	fa1,176(sp)
     cc4:	362a                	fld	fa2,168(sp)
     cc6:	368a                	fld	fa3,160(sp)
     cc8:	276a                	fld	fa4,152(sp)
     cca:	27ca                	fld	fa5,144(sp)
     ccc:	282a                	fld	fa6,136(sp)
     cce:	288a                	fld	fa7,128(sp)
     cd0:	3966                	fld	fs2,120(sp)
     cd2:	39c6                	fld	fs3,112(sp)
     cd4:	3a26                	fld	fs4,104(sp)
     cd6:	3a86                	fld	fs5,96(sp)
     cd8:	2b66                	fld	fs6,88(sp)
     cda:	2bc6                	fld	fs7,80(sp)
     cdc:	2c26                	fld	fs8,72(sp)
     cde:	2c86                	fld	fs9,64(sp)
     ce0:	3d62                	fld	fs10,56(sp)
     ce2:	3dc2                	fld	fs11,48(sp)
     ce4:	3e22                	fld	ft8,40(sp)
     ce6:	3e82                	fld	ft9,32(sp)
     ce8:	2f62                	fld	ft10,24(sp)
     cea:	2fc2                	fld	ft11,16(sp)
     cec:	6135                	addi	sp,sp,352
     cee:	30200073          	mret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     cf2:	411c                	lw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     cf4:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
     cf6:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     cfa:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     cfc:	31c1                	jal	9bc <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     cfe:	67bd                	lui	a5,0xf
     d00:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     d04:	4fb8                	lw	a4,88(a5)
     d06:	4789                	li	a5,2
     d08:	f4f71ee3          	bne	a4,a5,c64 <handler_irq_fast_spi+0xac>
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     d0c:	45b2                	lw	a1,12(sp)
     d0e:	653d                	lui	a0,0xf
     d10:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     d14:	34b9                	jal	762 <spi_event_handler>
     d16:	b7b9                	j	c64 <handler_irq_fast_spi+0xac>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     d18:	653d                	lui	a0,0xf
     d1a:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     d1e:	3665                	jal	8c6 <spi_error_handler.isra.0>
     d20:	b791                	j	c64 <handler_irq_fast_spi+0xac>
	...

00000d24 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     d24:	710d                	addi	sp,sp,-352
     d26:	14112e23          	sw	ra,348(sp)
     d2a:	14512c23          	sw	t0,344(sp)
     d2e:	003022f3          	frcsr	t0
     d32:	14a12423          	sw	a0,328(sp)
     d36:	12e12c23          	sw	a4,312(sp)
     d3a:	12f12a23          	sw	a5,308(sp)
     d3e:	14512a23          	sw	t0,340(sp)
     d42:	14612823          	sw	t1,336(sp)
     d46:	14712623          	sw	t2,332(sp)
     d4a:	14b12223          	sw	a1,324(sp)
     d4e:	14c12023          	sw	a2,320(sp)
     d52:	12d12e23          	sw	a3,316(sp)
     d56:	13012823          	sw	a6,304(sp)
     d5a:	13112623          	sw	a7,300(sp)
     d5e:	13c12423          	sw	t3,296(sp)
     d62:	13d12223          	sw	t4,292(sp)
     d66:	13e12023          	sw	t5,288(sp)
     d6a:	11f12e23          	sw	t6,284(sp)
     d6e:	a602                	fsd	ft0,264(sp)
     d70:	a206                	fsd	ft1,256(sp)
     d72:	bd8a                	fsd	ft2,248(sp)
     d74:	b98e                	fsd	ft3,240(sp)
     d76:	b592                	fsd	ft4,232(sp)
     d78:	b196                	fsd	ft5,224(sp)
     d7a:	ad9a                	fsd	ft6,216(sp)
     d7c:	a99e                	fsd	ft7,208(sp)
     d7e:	a5a2                	fsd	fs0,200(sp)
     d80:	a1a6                	fsd	fs1,192(sp)
     d82:	bd2a                	fsd	fa0,184(sp)
     d84:	b92e                	fsd	fa1,176(sp)
     d86:	b532                	fsd	fa2,168(sp)
     d88:	b136                	fsd	fa3,160(sp)
     d8a:	ad3a                	fsd	fa4,152(sp)
     d8c:	a93e                	fsd	fa5,144(sp)
     d8e:	a542                	fsd	fa6,136(sp)
     d90:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d92:	200607b7          	lui	a5,0x20060
{
     d96:	bcca                	fsd	fs2,120(sp)
     d98:	b8ce                	fsd	fs3,112(sp)
     d9a:	b4d2                	fsd	fs4,104(sp)
     d9c:	b0d6                	fsd	fs5,96(sp)
     d9e:	acda                	fsd	fs6,88(sp)
     da0:	a8de                	fsd	fs7,80(sp)
     da2:	a4e2                	fsd	fs8,72(sp)
     da4:	a0e6                	fsd	fs9,64(sp)
     da6:	bc6a                	fsd	fs10,56(sp)
     da8:	b86e                	fsd	fs11,48(sp)
     daa:	b472                	fsd	ft8,40(sp)
     dac:	b076                	fsd	ft9,32(sp)
     dae:	ac7a                	fsd	ft10,24(sp)
     db0:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     db2:	02000713          	li	a4,32
     db6:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     db8:	20020537          	lui	a0,0x20020
     dbc:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     dbe:	03f7f793          	andi	a5,a5,63
    if (errors) {
     dc2:	cfd9                	beqz	a5,e60 <handler_irq_fast_spi_flash+0x13c>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     dc4:	653d                	lui	a0,0xf
     dc6:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
     dca:	4b98                	lw	a4,16(a5)
     dcc:	4789                	li	a5,2
     dce:	0af70b63          	beq	a4,a5,e84 <handler_irq_fast_spi_flash+0x160>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
    // call the weak fic handler
    fic_irq_spi_flash();
}
     dd2:	15c12083          	lw	ra,348(sp)
     dd6:	15412283          	lw	t0,340(sp)
     dda:	00329073          	fscsr	t0
     dde:	15812283          	lw	t0,344(sp)
     de2:	15012303          	lw	t1,336(sp)
     de6:	14c12383          	lw	t2,332(sp)
     dea:	14812503          	lw	a0,328(sp)
     dee:	14412583          	lw	a1,324(sp)
     df2:	14012603          	lw	a2,320(sp)
     df6:	13c12683          	lw	a3,316(sp)
     dfa:	13812703          	lw	a4,312(sp)
     dfe:	13412783          	lw	a5,308(sp)
     e02:	13012803          	lw	a6,304(sp)
     e06:	12c12883          	lw	a7,300(sp)
     e0a:	12812e03          	lw	t3,296(sp)
     e0e:	12412e83          	lw	t4,292(sp)
     e12:	12012f03          	lw	t5,288(sp)
     e16:	11c12f83          	lw	t6,284(sp)
     e1a:	2032                	fld	ft0,264(sp)
     e1c:	2092                	fld	ft1,256(sp)
     e1e:	316e                	fld	ft2,248(sp)
     e20:	31ce                	fld	ft3,240(sp)
     e22:	322e                	fld	ft4,232(sp)
     e24:	328e                	fld	ft5,224(sp)
     e26:	236e                	fld	ft6,216(sp)
     e28:	23ce                	fld	ft7,208(sp)
     e2a:	242e                	fld	fs0,200(sp)
     e2c:	248e                	fld	fs1,192(sp)
     e2e:	356a                	fld	fa0,184(sp)
     e30:	35ca                	fld	fa1,176(sp)
     e32:	362a                	fld	fa2,168(sp)
     e34:	368a                	fld	fa3,160(sp)
     e36:	276a                	fld	fa4,152(sp)
     e38:	27ca                	fld	fa5,144(sp)
     e3a:	282a                	fld	fa6,136(sp)
     e3c:	288a                	fld	fa7,128(sp)
     e3e:	3966                	fld	fs2,120(sp)
     e40:	39c6                	fld	fs3,112(sp)
     e42:	3a26                	fld	fs4,104(sp)
     e44:	3a86                	fld	fs5,96(sp)
     e46:	2b66                	fld	fs6,88(sp)
     e48:	2bc6                	fld	fs7,80(sp)
     e4a:	2c26                	fld	fs8,72(sp)
     e4c:	2c86                	fld	fs9,64(sp)
     e4e:	3d62                	fld	fs10,56(sp)
     e50:	3dc2                	fld	fs11,48(sp)
     e52:	3e22                	fld	ft8,40(sp)
     e54:	3e82                	fld	ft9,32(sp)
     e56:	2f62                	fld	ft10,24(sp)
     e58:	2fc2                	fld	ft11,16(sp)
     e5a:	6135                	addi	sp,sp,352
     e5c:	30200073          	mret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     e60:	411c                	lw	a5,0(a0)
        spi_get_events(spi_flash, &events);
     e62:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
     e64:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     e68:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_flash, &events);
     e6a:	3e89                	jal	9bc <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     e6c:	653d                	lui	a0,0xf
     e6e:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
     e72:	4b98                	lw	a4,16(a5)
     e74:	4789                	li	a5,2
     e76:	f4f71ee3          	bne	a4,a5,dd2 <handler_irq_fast_spi_flash+0xae>
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
     e7a:	45b2                	lw	a1,12(sp)
     e7c:	80050513          	addi	a0,a0,-2048
     e80:	30cd                	jal	762 <spi_event_handler>
     e82:	bf81                	j	dd2 <handler_irq_fast_spi_flash+0xae>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
     e84:	80050513          	addi	a0,a0,-2048
     e88:	3c3d                	jal	8c6 <spi_error_handler.isra.0>
     e8a:	b7a1                	j	dd2 <handler_irq_fast_spi_flash+0xae>

00000e8c <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     e8c:	710d                	addi	sp,sp,-352
     e8e:	14112e23          	sw	ra,348(sp)
     e92:	14512c23          	sw	t0,344(sp)
     e96:	003022f3          	frcsr	t0
     e9a:	14512a23          	sw	t0,340(sp)
     e9e:	14612823          	sw	t1,336(sp)
     ea2:	14712623          	sw	t2,332(sp)
     ea6:	14912423          	sw	s1,328(sp)
     eaa:	14a12223          	sw	a0,324(sp)
     eae:	14b12023          	sw	a1,320(sp)
     eb2:	12c12e23          	sw	a2,316(sp)
     eb6:	12d12c23          	sw	a3,312(sp)
     eba:	12e12a23          	sw	a4,308(sp)
     ebe:	12f12823          	sw	a5,304(sp)
     ec2:	13012623          	sw	a6,300(sp)
     ec6:	13112423          	sw	a7,296(sp)
     eca:	13212223          	sw	s2,292(sp)
     ece:	13c12023          	sw	t3,288(sp)
     ed2:	11d12e23          	sw	t4,284(sp)
     ed6:	11e12c23          	sw	t5,280(sp)
     eda:	11f12a23          	sw	t6,276(sp)
     ede:	bd82                	fsd	ft0,248(sp)
     ee0:	b986                	fsd	ft1,240(sp)
     ee2:	b58a                	fsd	ft2,232(sp)
     ee4:	b18e                	fsd	ft3,224(sp)
     ee6:	ad92                	fsd	ft4,216(sp)
     ee8:	a996                	fsd	ft5,208(sp)
     eea:	a59a                	fsd	ft6,200(sp)
     eec:	a19e                	fsd	ft7,192(sp)
     eee:	bd22                	fsd	fs0,184(sp)
     ef0:	b926                	fsd	fs1,176(sp)
     ef2:	b52a                	fsd	fa0,168(sp)
     ef4:	b12e                	fsd	fa1,160(sp)
     ef6:	ad32                	fsd	fa2,152(sp)
     ef8:	a936                	fsd	fa3,144(sp)
     efa:	a53a                	fsd	fa4,136(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
     efc:	300004b7          	lui	s1,0x30000
{
     f00:	a13e                	fsd	fa5,128(sp)
  *claim_data = rv_plic_peri->CC0;
     f02:	20c4a903          	lw	s2,524(s1) # 3000020c <_sp+0x2ffc15bc>
{
     f06:	bcc2                	fsd	fa6,120(sp)
     f08:	b8c6                	fsd	fa7,112(sp)
     f0a:	b4ca                	fsd	fs2,104(sp)
     f0c:	b0ce                	fsd	fs3,96(sp)
     f0e:	acd2                	fsd	fs4,88(sp)
     f10:	a8d6                	fsd	fs5,80(sp)
     f12:	a4da                	fsd	fs6,72(sp)
     f14:	a0de                	fsd	fs7,64(sp)
     f16:	bc62                	fsd	fs8,56(sp)
     f18:	b866                	fsd	fs9,48(sp)
     f1a:	b46a                	fsd	fs10,40(sp)
     f1c:	b06e                	fsd	fs11,32(sp)
     f1e:	ac72                	fsd	ft8,24(sp)
     f20:	a876                	fsd	ft9,16(sp)
     f22:	a47a                	fsd	ft10,8(sp)
     f24:	a07e                	fsd	ft11,0(sp)
    handlers[int_id](int_id);
     f26:	4781                	li	a5,0
     f28:	854a                	mv	a0,s2
     f2a:	9782                	jalr	a5
}
     f2c:	15c12083          	lw	ra,348(sp)
     f30:	15412283          	lw	t0,340(sp)
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     f34:	2124a623          	sw	s2,524(s1)
}
     f38:	00329073          	fscsr	t0
     f3c:	15812283          	lw	t0,344(sp)
     f40:	15012303          	lw	t1,336(sp)
     f44:	14c12383          	lw	t2,332(sp)
     f48:	14812483          	lw	s1,328(sp)
     f4c:	14412503          	lw	a0,324(sp)
     f50:	14012583          	lw	a1,320(sp)
     f54:	13c12603          	lw	a2,316(sp)
     f58:	13812683          	lw	a3,312(sp)
     f5c:	13412703          	lw	a4,308(sp)
     f60:	13012783          	lw	a5,304(sp)
     f64:	12c12803          	lw	a6,300(sp)
     f68:	12812883          	lw	a7,296(sp)
     f6c:	12412903          	lw	s2,292(sp)
     f70:	12012e03          	lw	t3,288(sp)
     f74:	11c12e83          	lw	t4,284(sp)
     f78:	11812f03          	lw	t5,280(sp)
     f7c:	11412f83          	lw	t6,276(sp)
     f80:	306e                	fld	ft0,248(sp)
     f82:	30ce                	fld	ft1,240(sp)
     f84:	312e                	fld	ft2,232(sp)
     f86:	318e                	fld	ft3,224(sp)
     f88:	226e                	fld	ft4,216(sp)
     f8a:	22ce                	fld	ft5,208(sp)
     f8c:	232e                	fld	ft6,200(sp)
     f8e:	238e                	fld	ft7,192(sp)
     f90:	346a                	fld	fs0,184(sp)
     f92:	34ca                	fld	fs1,176(sp)
     f94:	352a                	fld	fa0,168(sp)
     f96:	358a                	fld	fa1,160(sp)
     f98:	266a                	fld	fa2,152(sp)
     f9a:	26ca                	fld	fa3,144(sp)
     f9c:	272a                	fld	fa4,136(sp)
     f9e:	278a                	fld	fa5,128(sp)
     fa0:	3866                	fld	fa6,120(sp)
     fa2:	38c6                	fld	fa7,112(sp)
     fa4:	3926                	fld	fs2,104(sp)
     fa6:	3986                	fld	fs3,96(sp)
     fa8:	2a66                	fld	fs4,88(sp)
     faa:	2ac6                	fld	fs5,80(sp)
     fac:	2b26                	fld	fs6,72(sp)
     fae:	2b86                	fld	fs7,64(sp)
     fb0:	3c62                	fld	fs8,56(sp)
     fb2:	3cc2                	fld	fs9,48(sp)
     fb4:	3d22                	fld	fs10,40(sp)
     fb6:	3d82                	fld	fs11,32(sp)
     fb8:	2e62                	fld	ft8,24(sp)
     fba:	2ec2                	fld	ft9,16(sp)
     fbc:	2f22                	fld	ft10,8(sp)
     fbe:	2f82                	fld	ft11,0(sp)
     fc0:	6135                	addi	sp,sp,352
     fc2:	30200073          	mret
	...

00000fc8 <handler_irq_fast_timer_1>:
{
     fc8:	714d                	addi	sp,sp,-336
     fca:	14112623          	sw	ra,332(sp)
     fce:	14512423          	sw	t0,328(sp)
     fd2:	003022f3          	frcsr	t0
     fd6:	14512223          	sw	t0,324(sp)
     fda:	14612023          	sw	t1,320(sp)
     fde:	12712e23          	sw	t2,316(sp)
     fe2:	12a12c23          	sw	a0,312(sp)
     fe6:	12b12a23          	sw	a1,308(sp)
     fea:	12c12823          	sw	a2,304(sp)
     fee:	12d12623          	sw	a3,300(sp)
     ff2:	12e12423          	sw	a4,296(sp)
     ff6:	12f12223          	sw	a5,292(sp)
     ffa:	13012023          	sw	a6,288(sp)
     ffe:	11112e23          	sw	a7,284(sp)
    1002:	11c12c23          	sw	t3,280(sp)
    1006:	11d12a23          	sw	t4,276(sp)
    100a:	11e12823          	sw	t5,272(sp)
    100e:	11f12623          	sw	t6,268(sp)
    1012:	bd82                	fsd	ft0,248(sp)
    1014:	b986                	fsd	ft1,240(sp)
    1016:	b58a                	fsd	ft2,232(sp)
    1018:	b18e                	fsd	ft3,224(sp)
    101a:	ad92                	fsd	ft4,216(sp)
    101c:	a996                	fsd	ft5,208(sp)
    101e:	a59a                	fsd	ft6,200(sp)
    1020:	a19e                	fsd	ft7,192(sp)
    1022:	bd22                	fsd	fs0,184(sp)
    1024:	b926                	fsd	fs1,176(sp)
    1026:	b52a                	fsd	fa0,168(sp)
    1028:	b12e                	fsd	fa1,160(sp)
    102a:	ad32                	fsd	fa2,152(sp)
    102c:	a936                	fsd	fa3,144(sp)
    102e:	a53a                	fsd	fa4,136(sp)
    1030:	a13e                	fsd	fa5,128(sp)
    1032:	bcc2                	fsd	fa6,120(sp)
    1034:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1036:	200607b7          	lui	a5,0x20060
{
    103a:	b4ca                	fsd	fs2,104(sp)
    103c:	b0ce                	fsd	fs3,96(sp)
    103e:	acd2                	fsd	fs4,88(sp)
    1040:	a8d6                	fsd	fs5,80(sp)
    1042:	a4da                	fsd	fs6,72(sp)
    1044:	a0de                	fsd	fs7,64(sp)
    1046:	bc62                	fsd	fs8,56(sp)
    1048:	b866                	fsd	fs9,48(sp)
    104a:	b46a                	fsd	fs10,40(sp)
    104c:	b06e                	fsd	fs11,32(sp)
    104e:	ac72                	fsd	ft8,24(sp)
    1050:	a876                	fsd	ft9,16(sp)
    1052:	a47a                	fsd	ft10,8(sp)
    1054:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1056:	4705                	li	a4,1
    1058:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
    105a:	e4aff0ef          	jal	6a4 <fic_irq_timer_1>
}
    105e:	14c12083          	lw	ra,332(sp)
    1062:	14412283          	lw	t0,324(sp)
    1066:	00329073          	fscsr	t0
    106a:	14812283          	lw	t0,328(sp)
    106e:	14012303          	lw	t1,320(sp)
    1072:	13c12383          	lw	t2,316(sp)
    1076:	13812503          	lw	a0,312(sp)
    107a:	13412583          	lw	a1,308(sp)
    107e:	13012603          	lw	a2,304(sp)
    1082:	12c12683          	lw	a3,300(sp)
    1086:	12812703          	lw	a4,296(sp)
    108a:	12412783          	lw	a5,292(sp)
    108e:	12012803          	lw	a6,288(sp)
    1092:	11c12883          	lw	a7,284(sp)
    1096:	11812e03          	lw	t3,280(sp)
    109a:	11412e83          	lw	t4,276(sp)
    109e:	11012f03          	lw	t5,272(sp)
    10a2:	10c12f83          	lw	t6,268(sp)
    10a6:	306e                	fld	ft0,248(sp)
    10a8:	30ce                	fld	ft1,240(sp)
    10aa:	312e                	fld	ft2,232(sp)
    10ac:	318e                	fld	ft3,224(sp)
    10ae:	226e                	fld	ft4,216(sp)
    10b0:	22ce                	fld	ft5,208(sp)
    10b2:	232e                	fld	ft6,200(sp)
    10b4:	238e                	fld	ft7,192(sp)
    10b6:	346a                	fld	fs0,184(sp)
    10b8:	34ca                	fld	fs1,176(sp)
    10ba:	352a                	fld	fa0,168(sp)
    10bc:	358a                	fld	fa1,160(sp)
    10be:	266a                	fld	fa2,152(sp)
    10c0:	26ca                	fld	fa3,144(sp)
    10c2:	272a                	fld	fa4,136(sp)
    10c4:	278a                	fld	fa5,128(sp)
    10c6:	3866                	fld	fa6,120(sp)
    10c8:	38c6                	fld	fa7,112(sp)
    10ca:	3926                	fld	fs2,104(sp)
    10cc:	3986                	fld	fs3,96(sp)
    10ce:	2a66                	fld	fs4,88(sp)
    10d0:	2ac6                	fld	fs5,80(sp)
    10d2:	2b26                	fld	fs6,72(sp)
    10d4:	2b86                	fld	fs7,64(sp)
    10d6:	3c62                	fld	fs8,56(sp)
    10d8:	3cc2                	fld	fs9,48(sp)
    10da:	3d22                	fld	fs10,40(sp)
    10dc:	3d82                	fld	fs11,32(sp)
    10de:	2e62                	fld	ft8,24(sp)
    10e0:	2ec2                	fld	ft9,16(sp)
    10e2:	2f22                	fld	ft10,8(sp)
    10e4:	2f82                	fld	ft11,0(sp)
    10e6:	6171                	addi	sp,sp,336
    10e8:	30200073          	mret
    10ec:	0000                	unimp
	...

000010f0 <handler_irq_fast_timer_2>:
{
    10f0:	714d                	addi	sp,sp,-336
    10f2:	14112623          	sw	ra,332(sp)
    10f6:	14512423          	sw	t0,328(sp)
    10fa:	003022f3          	frcsr	t0
    10fe:	14512223          	sw	t0,324(sp)
    1102:	14612023          	sw	t1,320(sp)
    1106:	12712e23          	sw	t2,316(sp)
    110a:	12a12c23          	sw	a0,312(sp)
    110e:	12b12a23          	sw	a1,308(sp)
    1112:	12c12823          	sw	a2,304(sp)
    1116:	12d12623          	sw	a3,300(sp)
    111a:	12e12423          	sw	a4,296(sp)
    111e:	12f12223          	sw	a5,292(sp)
    1122:	13012023          	sw	a6,288(sp)
    1126:	11112e23          	sw	a7,284(sp)
    112a:	11c12c23          	sw	t3,280(sp)
    112e:	11d12a23          	sw	t4,276(sp)
    1132:	11e12823          	sw	t5,272(sp)
    1136:	11f12623          	sw	t6,268(sp)
    113a:	bd82                	fsd	ft0,248(sp)
    113c:	b986                	fsd	ft1,240(sp)
    113e:	b58a                	fsd	ft2,232(sp)
    1140:	b18e                	fsd	ft3,224(sp)
    1142:	ad92                	fsd	ft4,216(sp)
    1144:	a996                	fsd	ft5,208(sp)
    1146:	a59a                	fsd	ft6,200(sp)
    1148:	a19e                	fsd	ft7,192(sp)
    114a:	bd22                	fsd	fs0,184(sp)
    114c:	b926                	fsd	fs1,176(sp)
    114e:	b52a                	fsd	fa0,168(sp)
    1150:	b12e                	fsd	fa1,160(sp)
    1152:	ad32                	fsd	fa2,152(sp)
    1154:	a936                	fsd	fa3,144(sp)
    1156:	a53a                	fsd	fa4,136(sp)
    1158:	a13e                	fsd	fa5,128(sp)
    115a:	bcc2                	fsd	fa6,120(sp)
    115c:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    115e:	200607b7          	lui	a5,0x20060
{
    1162:	b4ca                	fsd	fs2,104(sp)
    1164:	b0ce                	fsd	fs3,96(sp)
    1166:	acd2                	fsd	fs4,88(sp)
    1168:	a8d6                	fsd	fs5,80(sp)
    116a:	a4da                	fsd	fs6,72(sp)
    116c:	a0de                	fsd	fs7,64(sp)
    116e:	bc62                	fsd	fs8,56(sp)
    1170:	b866                	fsd	fs9,48(sp)
    1172:	b46a                	fsd	fs10,40(sp)
    1174:	b06e                	fsd	fs11,32(sp)
    1176:	ac72                	fsd	ft8,24(sp)
    1178:	a876                	fsd	ft9,16(sp)
    117a:	a47a                	fsd	ft10,8(sp)
    117c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    117e:	4709                	li	a4,2
    1180:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
    1182:	d22ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    1186:	14c12083          	lw	ra,332(sp)
    118a:	14412283          	lw	t0,324(sp)
    118e:	00329073          	fscsr	t0
    1192:	14812283          	lw	t0,328(sp)
    1196:	14012303          	lw	t1,320(sp)
    119a:	13c12383          	lw	t2,316(sp)
    119e:	13812503          	lw	a0,312(sp)
    11a2:	13412583          	lw	a1,308(sp)
    11a6:	13012603          	lw	a2,304(sp)
    11aa:	12c12683          	lw	a3,300(sp)
    11ae:	12812703          	lw	a4,296(sp)
    11b2:	12412783          	lw	a5,292(sp)
    11b6:	12012803          	lw	a6,288(sp)
    11ba:	11c12883          	lw	a7,284(sp)
    11be:	11812e03          	lw	t3,280(sp)
    11c2:	11412e83          	lw	t4,276(sp)
    11c6:	11012f03          	lw	t5,272(sp)
    11ca:	10c12f83          	lw	t6,268(sp)
    11ce:	306e                	fld	ft0,248(sp)
    11d0:	30ce                	fld	ft1,240(sp)
    11d2:	312e                	fld	ft2,232(sp)
    11d4:	318e                	fld	ft3,224(sp)
    11d6:	226e                	fld	ft4,216(sp)
    11d8:	22ce                	fld	ft5,208(sp)
    11da:	232e                	fld	ft6,200(sp)
    11dc:	238e                	fld	ft7,192(sp)
    11de:	346a                	fld	fs0,184(sp)
    11e0:	34ca                	fld	fs1,176(sp)
    11e2:	352a                	fld	fa0,168(sp)
    11e4:	358a                	fld	fa1,160(sp)
    11e6:	266a                	fld	fa2,152(sp)
    11e8:	26ca                	fld	fa3,144(sp)
    11ea:	272a                	fld	fa4,136(sp)
    11ec:	278a                	fld	fa5,128(sp)
    11ee:	3866                	fld	fa6,120(sp)
    11f0:	38c6                	fld	fa7,112(sp)
    11f2:	3926                	fld	fs2,104(sp)
    11f4:	3986                	fld	fs3,96(sp)
    11f6:	2a66                	fld	fs4,88(sp)
    11f8:	2ac6                	fld	fs5,80(sp)
    11fa:	2b26                	fld	fs6,72(sp)
    11fc:	2b86                	fld	fs7,64(sp)
    11fe:	3c62                	fld	fs8,56(sp)
    1200:	3cc2                	fld	fs9,48(sp)
    1202:	3d22                	fld	fs10,40(sp)
    1204:	3d82                	fld	fs11,32(sp)
    1206:	2e62                	fld	ft8,24(sp)
    1208:	2ec2                	fld	ft9,16(sp)
    120a:	2f22                	fld	ft10,8(sp)
    120c:	2f82                	fld	ft11,0(sp)
    120e:	6171                	addi	sp,sp,336
    1210:	30200073          	mret
    1214:	0000                	unimp
	...

00001218 <handler_irq_fast_timer_3>:
{
    1218:	714d                	addi	sp,sp,-336
    121a:	14112623          	sw	ra,332(sp)
    121e:	14512423          	sw	t0,328(sp)
    1222:	003022f3          	frcsr	t0
    1226:	14512223          	sw	t0,324(sp)
    122a:	14612023          	sw	t1,320(sp)
    122e:	12712e23          	sw	t2,316(sp)
    1232:	12a12c23          	sw	a0,312(sp)
    1236:	12b12a23          	sw	a1,308(sp)
    123a:	12c12823          	sw	a2,304(sp)
    123e:	12d12623          	sw	a3,300(sp)
    1242:	12e12423          	sw	a4,296(sp)
    1246:	12f12223          	sw	a5,292(sp)
    124a:	13012023          	sw	a6,288(sp)
    124e:	11112e23          	sw	a7,284(sp)
    1252:	11c12c23          	sw	t3,280(sp)
    1256:	11d12a23          	sw	t4,276(sp)
    125a:	11e12823          	sw	t5,272(sp)
    125e:	11f12623          	sw	t6,268(sp)
    1262:	bd82                	fsd	ft0,248(sp)
    1264:	b986                	fsd	ft1,240(sp)
    1266:	b58a                	fsd	ft2,232(sp)
    1268:	b18e                	fsd	ft3,224(sp)
    126a:	ad92                	fsd	ft4,216(sp)
    126c:	a996                	fsd	ft5,208(sp)
    126e:	a59a                	fsd	ft6,200(sp)
    1270:	a19e                	fsd	ft7,192(sp)
    1272:	bd22                	fsd	fs0,184(sp)
    1274:	b926                	fsd	fs1,176(sp)
    1276:	b52a                	fsd	fa0,168(sp)
    1278:	b12e                	fsd	fa1,160(sp)
    127a:	ad32                	fsd	fa2,152(sp)
    127c:	a936                	fsd	fa3,144(sp)
    127e:	a53a                	fsd	fa4,136(sp)
    1280:	a13e                	fsd	fa5,128(sp)
    1282:	bcc2                	fsd	fa6,120(sp)
    1284:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1286:	200607b7          	lui	a5,0x20060
{
    128a:	b4ca                	fsd	fs2,104(sp)
    128c:	b0ce                	fsd	fs3,96(sp)
    128e:	acd2                	fsd	fs4,88(sp)
    1290:	a8d6                	fsd	fs5,80(sp)
    1292:	a4da                	fsd	fs6,72(sp)
    1294:	a0de                	fsd	fs7,64(sp)
    1296:	bc62                	fsd	fs8,56(sp)
    1298:	b866                	fsd	fs9,48(sp)
    129a:	b46a                	fsd	fs10,40(sp)
    129c:	b06e                	fsd	fs11,32(sp)
    129e:	ac72                	fsd	ft8,24(sp)
    12a0:	a876                	fsd	ft9,16(sp)
    12a2:	a47a                	fsd	ft10,8(sp)
    12a4:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    12a6:	4711                	li	a4,4
    12a8:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
    12aa:	bfaff0ef          	jal	6a4 <fic_irq_timer_1>
}
    12ae:	14c12083          	lw	ra,332(sp)
    12b2:	14412283          	lw	t0,324(sp)
    12b6:	00329073          	fscsr	t0
    12ba:	14812283          	lw	t0,328(sp)
    12be:	14012303          	lw	t1,320(sp)
    12c2:	13c12383          	lw	t2,316(sp)
    12c6:	13812503          	lw	a0,312(sp)
    12ca:	13412583          	lw	a1,308(sp)
    12ce:	13012603          	lw	a2,304(sp)
    12d2:	12c12683          	lw	a3,300(sp)
    12d6:	12812703          	lw	a4,296(sp)
    12da:	12412783          	lw	a5,292(sp)
    12de:	12012803          	lw	a6,288(sp)
    12e2:	11c12883          	lw	a7,284(sp)
    12e6:	11812e03          	lw	t3,280(sp)
    12ea:	11412e83          	lw	t4,276(sp)
    12ee:	11012f03          	lw	t5,272(sp)
    12f2:	10c12f83          	lw	t6,268(sp)
    12f6:	306e                	fld	ft0,248(sp)
    12f8:	30ce                	fld	ft1,240(sp)
    12fa:	312e                	fld	ft2,232(sp)
    12fc:	318e                	fld	ft3,224(sp)
    12fe:	226e                	fld	ft4,216(sp)
    1300:	22ce                	fld	ft5,208(sp)
    1302:	232e                	fld	ft6,200(sp)
    1304:	238e                	fld	ft7,192(sp)
    1306:	346a                	fld	fs0,184(sp)
    1308:	34ca                	fld	fs1,176(sp)
    130a:	352a                	fld	fa0,168(sp)
    130c:	358a                	fld	fa1,160(sp)
    130e:	266a                	fld	fa2,152(sp)
    1310:	26ca                	fld	fa3,144(sp)
    1312:	272a                	fld	fa4,136(sp)
    1314:	278a                	fld	fa5,128(sp)
    1316:	3866                	fld	fa6,120(sp)
    1318:	38c6                	fld	fa7,112(sp)
    131a:	3926                	fld	fs2,104(sp)
    131c:	3986                	fld	fs3,96(sp)
    131e:	2a66                	fld	fs4,88(sp)
    1320:	2ac6                	fld	fs5,80(sp)
    1322:	2b26                	fld	fs6,72(sp)
    1324:	2b86                	fld	fs7,64(sp)
    1326:	3c62                	fld	fs8,56(sp)
    1328:	3cc2                	fld	fs9,48(sp)
    132a:	3d22                	fld	fs10,40(sp)
    132c:	3d82                	fld	fs11,32(sp)
    132e:	2e62                	fld	ft8,24(sp)
    1330:	2ec2                	fld	ft9,16(sp)
    1332:	2f22                	fld	ft10,8(sp)
    1334:	2f82                	fld	ft11,0(sp)
    1336:	6171                	addi	sp,sp,336
    1338:	30200073          	mret
    133c:	0000                	unimp
	...

00001340 <handler_irq_fast_external_peripheral>:
{
    1340:	714d                	addi	sp,sp,-336
    1342:	14112623          	sw	ra,332(sp)
    1346:	14512423          	sw	t0,328(sp)
    134a:	003022f3          	frcsr	t0
    134e:	14512223          	sw	t0,324(sp)
    1352:	14612023          	sw	t1,320(sp)
    1356:	12712e23          	sw	t2,316(sp)
    135a:	12a12c23          	sw	a0,312(sp)
    135e:	12b12a23          	sw	a1,308(sp)
    1362:	12c12823          	sw	a2,304(sp)
    1366:	12d12623          	sw	a3,300(sp)
    136a:	12e12423          	sw	a4,296(sp)
    136e:	12f12223          	sw	a5,292(sp)
    1372:	13012023          	sw	a6,288(sp)
    1376:	11112e23          	sw	a7,284(sp)
    137a:	11c12c23          	sw	t3,280(sp)
    137e:	11d12a23          	sw	t4,276(sp)
    1382:	11e12823          	sw	t5,272(sp)
    1386:	11f12623          	sw	t6,268(sp)
    138a:	bd82                	fsd	ft0,248(sp)
    138c:	b986                	fsd	ft1,240(sp)
    138e:	b58a                	fsd	ft2,232(sp)
    1390:	b18e                	fsd	ft3,224(sp)
    1392:	ad92                	fsd	ft4,216(sp)
    1394:	a996                	fsd	ft5,208(sp)
    1396:	a59a                	fsd	ft6,200(sp)
    1398:	a19e                	fsd	ft7,192(sp)
    139a:	bd22                	fsd	fs0,184(sp)
    139c:	b926                	fsd	fs1,176(sp)
    139e:	b52a                	fsd	fa0,168(sp)
    13a0:	b12e                	fsd	fa1,160(sp)
    13a2:	ad32                	fsd	fa2,152(sp)
    13a4:	a936                	fsd	fa3,144(sp)
    13a6:	a53a                	fsd	fa4,136(sp)
    13a8:	a13e                	fsd	fa5,128(sp)
    13aa:	bcc2                	fsd	fa6,120(sp)
    13ac:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    13ae:	200607b7          	lui	a5,0x20060
{
    13b2:	b4ca                	fsd	fs2,104(sp)
    13b4:	b0ce                	fsd	fs3,96(sp)
    13b6:	acd2                	fsd	fs4,88(sp)
    13b8:	a8d6                	fsd	fs5,80(sp)
    13ba:	a4da                	fsd	fs6,72(sp)
    13bc:	a0de                	fsd	fs7,64(sp)
    13be:	bc62                	fsd	fs8,56(sp)
    13c0:	b866                	fsd	fs9,48(sp)
    13c2:	b46a                	fsd	fs10,40(sp)
    13c4:	b06e                	fsd	fs11,32(sp)
    13c6:	ac72                	fsd	ft8,24(sp)
    13c8:	a876                	fsd	ft9,16(sp)
    13ca:	a47a                	fsd	ft10,8(sp)
    13cc:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    13ce:	6721                	lui	a4,0x8
    13d0:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
    13d2:	ad2ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    13d6:	14c12083          	lw	ra,332(sp)
    13da:	14412283          	lw	t0,324(sp)
    13de:	00329073          	fscsr	t0
    13e2:	14812283          	lw	t0,328(sp)
    13e6:	14012303          	lw	t1,320(sp)
    13ea:	13c12383          	lw	t2,316(sp)
    13ee:	13812503          	lw	a0,312(sp)
    13f2:	13412583          	lw	a1,308(sp)
    13f6:	13012603          	lw	a2,304(sp)
    13fa:	12c12683          	lw	a3,300(sp)
    13fe:	12812703          	lw	a4,296(sp)
    1402:	12412783          	lw	a5,292(sp)
    1406:	12012803          	lw	a6,288(sp)
    140a:	11c12883          	lw	a7,284(sp)
    140e:	11812e03          	lw	t3,280(sp)
    1412:	11412e83          	lw	t4,276(sp)
    1416:	11012f03          	lw	t5,272(sp)
    141a:	10c12f83          	lw	t6,268(sp)
    141e:	306e                	fld	ft0,248(sp)
    1420:	30ce                	fld	ft1,240(sp)
    1422:	312e                	fld	ft2,232(sp)
    1424:	318e                	fld	ft3,224(sp)
    1426:	226e                	fld	ft4,216(sp)
    1428:	22ce                	fld	ft5,208(sp)
    142a:	232e                	fld	ft6,200(sp)
    142c:	238e                	fld	ft7,192(sp)
    142e:	346a                	fld	fs0,184(sp)
    1430:	34ca                	fld	fs1,176(sp)
    1432:	352a                	fld	fa0,168(sp)
    1434:	358a                	fld	fa1,160(sp)
    1436:	266a                	fld	fa2,152(sp)
    1438:	26ca                	fld	fa3,144(sp)
    143a:	272a                	fld	fa4,136(sp)
    143c:	278a                	fld	fa5,128(sp)
    143e:	3866                	fld	fa6,120(sp)
    1440:	38c6                	fld	fa7,112(sp)
    1442:	3926                	fld	fs2,104(sp)
    1444:	3986                	fld	fs3,96(sp)
    1446:	2a66                	fld	fs4,88(sp)
    1448:	2ac6                	fld	fs5,80(sp)
    144a:	2b26                	fld	fs6,72(sp)
    144c:	2b86                	fld	fs7,64(sp)
    144e:	3c62                	fld	fs8,56(sp)
    1450:	3cc2                	fld	fs9,48(sp)
    1452:	3d22                	fld	fs10,40(sp)
    1454:	3d82                	fld	fs11,32(sp)
    1456:	2e62                	fld	ft8,24(sp)
    1458:	2ec2                	fld	ft9,16(sp)
    145a:	2f22                	fld	ft10,8(sp)
    145c:	2f82                	fld	ft11,0(sp)
    145e:	6171                	addi	sp,sp,336
    1460:	30200073          	mret
    1464:	0000                	unimp
	...

00001468 <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
    1468:	714d                	addi	sp,sp,-336
    146a:	14112623          	sw	ra,332(sp)
    146e:	14512423          	sw	t0,328(sp)
    1472:	003022f3          	frcsr	t0
    1476:	14512223          	sw	t0,324(sp)
    147a:	14612023          	sw	t1,320(sp)
    147e:	12712e23          	sw	t2,316(sp)
    1482:	12a12c23          	sw	a0,312(sp)
    1486:	12b12a23          	sw	a1,308(sp)
    148a:	12c12823          	sw	a2,304(sp)
    148e:	12d12623          	sw	a3,300(sp)
    1492:	12e12423          	sw	a4,296(sp)
    1496:	12f12223          	sw	a5,292(sp)
    149a:	13012023          	sw	a6,288(sp)
    149e:	11112e23          	sw	a7,284(sp)
    14a2:	11c12c23          	sw	t3,280(sp)
    14a6:	11d12a23          	sw	t4,276(sp)
    14aa:	11e12823          	sw	t5,272(sp)
    14ae:	11f12623          	sw	t6,268(sp)
    14b2:	bd82                	fsd	ft0,248(sp)
    14b4:	b986                	fsd	ft1,240(sp)
    14b6:	b58a                	fsd	ft2,232(sp)
    14b8:	b18e                	fsd	ft3,224(sp)
    14ba:	ad92                	fsd	ft4,216(sp)
    14bc:	a996                	fsd	ft5,208(sp)
    14be:	a59a                	fsd	ft6,200(sp)
    14c0:	a19e                	fsd	ft7,192(sp)
    14c2:	bd22                	fsd	fs0,184(sp)
    14c4:	b926                	fsd	fs1,176(sp)
    14c6:	b52a                	fsd	fa0,168(sp)
    14c8:	b12e                	fsd	fa1,160(sp)
    14ca:	ad32                	fsd	fa2,152(sp)
    14cc:	a936                	fsd	fa3,144(sp)
    14ce:	a53a                	fsd	fa4,136(sp)
    14d0:	a13e                	fsd	fa5,128(sp)
    14d2:	bcc2                	fsd	fa6,120(sp)
    14d4:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    14d6:	200607b7          	lui	a5,0x20060
{
    14da:	b4ca                	fsd	fs2,104(sp)
    14dc:	b0ce                	fsd	fs3,96(sp)
    14de:	acd2                	fsd	fs4,88(sp)
    14e0:	a8d6                	fsd	fs5,80(sp)
    14e2:	a4da                	fsd	fs6,72(sp)
    14e4:	a0de                	fsd	fs7,64(sp)
    14e6:	bc62                	fsd	fs8,56(sp)
    14e8:	b866                	fsd	fs9,48(sp)
    14ea:	b46a                	fsd	fs10,40(sp)
    14ec:	b06e                	fsd	fs11,32(sp)
    14ee:	ac72                	fsd	ft8,24(sp)
    14f0:	a876                	fsd	ft9,16(sp)
    14f2:	a47a                	fsd	ft10,8(sp)
    14f4:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    14f6:	04000713          	li	a4,64
    14fa:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
    // call the weak fic handler
    fic_irq_gpio_0();
    14fc:	9a8ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    1500:	14c12083          	lw	ra,332(sp)
    1504:	14412283          	lw	t0,324(sp)
    1508:	00329073          	fscsr	t0
    150c:	14812283          	lw	t0,328(sp)
    1510:	14012303          	lw	t1,320(sp)
    1514:	13c12383          	lw	t2,316(sp)
    1518:	13812503          	lw	a0,312(sp)
    151c:	13412583          	lw	a1,308(sp)
    1520:	13012603          	lw	a2,304(sp)
    1524:	12c12683          	lw	a3,300(sp)
    1528:	12812703          	lw	a4,296(sp)
    152c:	12412783          	lw	a5,292(sp)
    1530:	12012803          	lw	a6,288(sp)
    1534:	11c12883          	lw	a7,284(sp)
    1538:	11812e03          	lw	t3,280(sp)
    153c:	11412e83          	lw	t4,276(sp)
    1540:	11012f03          	lw	t5,272(sp)
    1544:	10c12f83          	lw	t6,268(sp)
    1548:	306e                	fld	ft0,248(sp)
    154a:	30ce                	fld	ft1,240(sp)
    154c:	312e                	fld	ft2,232(sp)
    154e:	318e                	fld	ft3,224(sp)
    1550:	226e                	fld	ft4,216(sp)
    1552:	22ce                	fld	ft5,208(sp)
    1554:	232e                	fld	ft6,200(sp)
    1556:	238e                	fld	ft7,192(sp)
    1558:	346a                	fld	fs0,184(sp)
    155a:	34ca                	fld	fs1,176(sp)
    155c:	352a                	fld	fa0,168(sp)
    155e:	358a                	fld	fa1,160(sp)
    1560:	266a                	fld	fa2,152(sp)
    1562:	26ca                	fld	fa3,144(sp)
    1564:	272a                	fld	fa4,136(sp)
    1566:	278a                	fld	fa5,128(sp)
    1568:	3866                	fld	fa6,120(sp)
    156a:	38c6                	fld	fa7,112(sp)
    156c:	3926                	fld	fs2,104(sp)
    156e:	3986                	fld	fs3,96(sp)
    1570:	2a66                	fld	fs4,88(sp)
    1572:	2ac6                	fld	fs5,80(sp)
    1574:	2b26                	fld	fs6,72(sp)
    1576:	2b86                	fld	fs7,64(sp)
    1578:	3c62                	fld	fs8,56(sp)
    157a:	3cc2                	fld	fs9,48(sp)
    157c:	3d22                	fld	fs10,40(sp)
    157e:	3d82                	fld	fs11,32(sp)
    1580:	2e62                	fld	ft8,24(sp)
    1582:	2ec2                	fld	ft9,16(sp)
    1584:	2f22                	fld	ft10,8(sp)
    1586:	2f82                	fld	ft11,0(sp)
    1588:	6171                	addi	sp,sp,336
    158a:	30200073          	mret
	...

00001590 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
    1590:	714d                	addi	sp,sp,-336
    1592:	14112623          	sw	ra,332(sp)
    1596:	14512423          	sw	t0,328(sp)
    159a:	003022f3          	frcsr	t0
    159e:	14512223          	sw	t0,324(sp)
    15a2:	14612023          	sw	t1,320(sp)
    15a6:	12712e23          	sw	t2,316(sp)
    15aa:	12a12c23          	sw	a0,312(sp)
    15ae:	12b12a23          	sw	a1,308(sp)
    15b2:	12c12823          	sw	a2,304(sp)
    15b6:	12d12623          	sw	a3,300(sp)
    15ba:	12e12423          	sw	a4,296(sp)
    15be:	12f12223          	sw	a5,292(sp)
    15c2:	13012023          	sw	a6,288(sp)
    15c6:	11112e23          	sw	a7,284(sp)
    15ca:	11c12c23          	sw	t3,280(sp)
    15ce:	11d12a23          	sw	t4,276(sp)
    15d2:	11e12823          	sw	t5,272(sp)
    15d6:	11f12623          	sw	t6,268(sp)
    15da:	bd82                	fsd	ft0,248(sp)
    15dc:	b986                	fsd	ft1,240(sp)
    15de:	b58a                	fsd	ft2,232(sp)
    15e0:	b18e                	fsd	ft3,224(sp)
    15e2:	ad92                	fsd	ft4,216(sp)
    15e4:	a996                	fsd	ft5,208(sp)
    15e6:	a59a                	fsd	ft6,200(sp)
    15e8:	a19e                	fsd	ft7,192(sp)
    15ea:	bd22                	fsd	fs0,184(sp)
    15ec:	b926                	fsd	fs1,176(sp)
    15ee:	b52a                	fsd	fa0,168(sp)
    15f0:	b12e                	fsd	fa1,160(sp)
    15f2:	ad32                	fsd	fa2,152(sp)
    15f4:	a936                	fsd	fa3,144(sp)
    15f6:	a53a                	fsd	fa4,136(sp)
    15f8:	a13e                	fsd	fa5,128(sp)
    15fa:	bcc2                	fsd	fa6,120(sp)
    15fc:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    15fe:	200607b7          	lui	a5,0x20060
{
    1602:	b4ca                	fsd	fs2,104(sp)
    1604:	b0ce                	fsd	fs3,96(sp)
    1606:	acd2                	fsd	fs4,88(sp)
    1608:	a8d6                	fsd	fs5,80(sp)
    160a:	a4da                	fsd	fs6,72(sp)
    160c:	a0de                	fsd	fs7,64(sp)
    160e:	bc62                	fsd	fs8,56(sp)
    1610:	b866                	fsd	fs9,48(sp)
    1612:	b46a                	fsd	fs10,40(sp)
    1614:	b06e                	fsd	fs11,32(sp)
    1616:	ac72                	fsd	ft8,24(sp)
    1618:	a876                	fsd	ft9,16(sp)
    161a:	a47a                	fsd	ft10,8(sp)
    161c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    161e:	08000713          	li	a4,128
    1622:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
    // call the weak fic handler
    fic_irq_gpio_1();
    1624:	880ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    1628:	14c12083          	lw	ra,332(sp)
    162c:	14412283          	lw	t0,324(sp)
    1630:	00329073          	fscsr	t0
    1634:	14812283          	lw	t0,328(sp)
    1638:	14012303          	lw	t1,320(sp)
    163c:	13c12383          	lw	t2,316(sp)
    1640:	13812503          	lw	a0,312(sp)
    1644:	13412583          	lw	a1,308(sp)
    1648:	13012603          	lw	a2,304(sp)
    164c:	12c12683          	lw	a3,300(sp)
    1650:	12812703          	lw	a4,296(sp)
    1654:	12412783          	lw	a5,292(sp)
    1658:	12012803          	lw	a6,288(sp)
    165c:	11c12883          	lw	a7,284(sp)
    1660:	11812e03          	lw	t3,280(sp)
    1664:	11412e83          	lw	t4,276(sp)
    1668:	11012f03          	lw	t5,272(sp)
    166c:	10c12f83          	lw	t6,268(sp)
    1670:	306e                	fld	ft0,248(sp)
    1672:	30ce                	fld	ft1,240(sp)
    1674:	312e                	fld	ft2,232(sp)
    1676:	318e                	fld	ft3,224(sp)
    1678:	226e                	fld	ft4,216(sp)
    167a:	22ce                	fld	ft5,208(sp)
    167c:	232e                	fld	ft6,200(sp)
    167e:	238e                	fld	ft7,192(sp)
    1680:	346a                	fld	fs0,184(sp)
    1682:	34ca                	fld	fs1,176(sp)
    1684:	352a                	fld	fa0,168(sp)
    1686:	358a                	fld	fa1,160(sp)
    1688:	266a                	fld	fa2,152(sp)
    168a:	26ca                	fld	fa3,144(sp)
    168c:	272a                	fld	fa4,136(sp)
    168e:	278a                	fld	fa5,128(sp)
    1690:	3866                	fld	fa6,120(sp)
    1692:	38c6                	fld	fa7,112(sp)
    1694:	3926                	fld	fs2,104(sp)
    1696:	3986                	fld	fs3,96(sp)
    1698:	2a66                	fld	fs4,88(sp)
    169a:	2ac6                	fld	fs5,80(sp)
    169c:	2b26                	fld	fs6,72(sp)
    169e:	2b86                	fld	fs7,64(sp)
    16a0:	3c62                	fld	fs8,56(sp)
    16a2:	3cc2                	fld	fs9,48(sp)
    16a4:	3d22                	fld	fs10,40(sp)
    16a6:	3d82                	fld	fs11,32(sp)
    16a8:	2e62                	fld	ft8,24(sp)
    16aa:	2ec2                	fld	ft9,16(sp)
    16ac:	2f22                	fld	ft10,8(sp)
    16ae:	2f82                	fld	ft11,0(sp)
    16b0:	6171                	addi	sp,sp,336
    16b2:	30200073          	mret
	...

000016b8 <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
    16b8:	714d                	addi	sp,sp,-336
    16ba:	14112623          	sw	ra,332(sp)
    16be:	14512423          	sw	t0,328(sp)
    16c2:	003022f3          	frcsr	t0
    16c6:	14512223          	sw	t0,324(sp)
    16ca:	14612023          	sw	t1,320(sp)
    16ce:	12712e23          	sw	t2,316(sp)
    16d2:	12a12c23          	sw	a0,312(sp)
    16d6:	12b12a23          	sw	a1,308(sp)
    16da:	12c12823          	sw	a2,304(sp)
    16de:	12d12623          	sw	a3,300(sp)
    16e2:	12e12423          	sw	a4,296(sp)
    16e6:	12f12223          	sw	a5,292(sp)
    16ea:	13012023          	sw	a6,288(sp)
    16ee:	11112e23          	sw	a7,284(sp)
    16f2:	11c12c23          	sw	t3,280(sp)
    16f6:	11d12a23          	sw	t4,276(sp)
    16fa:	11e12823          	sw	t5,272(sp)
    16fe:	11f12623          	sw	t6,268(sp)
    1702:	bd82                	fsd	ft0,248(sp)
    1704:	b986                	fsd	ft1,240(sp)
    1706:	b58a                	fsd	ft2,232(sp)
    1708:	b18e                	fsd	ft3,224(sp)
    170a:	ad92                	fsd	ft4,216(sp)
    170c:	a996                	fsd	ft5,208(sp)
    170e:	a59a                	fsd	ft6,200(sp)
    1710:	a19e                	fsd	ft7,192(sp)
    1712:	bd22                	fsd	fs0,184(sp)
    1714:	b926                	fsd	fs1,176(sp)
    1716:	b52a                	fsd	fa0,168(sp)
    1718:	b12e                	fsd	fa1,160(sp)
    171a:	ad32                	fsd	fa2,152(sp)
    171c:	a936                	fsd	fa3,144(sp)
    171e:	a53a                	fsd	fa4,136(sp)
    1720:	a13e                	fsd	fa5,128(sp)
    1722:	bcc2                	fsd	fa6,120(sp)
    1724:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1726:	200607b7          	lui	a5,0x20060
{
    172a:	b4ca                	fsd	fs2,104(sp)
    172c:	b0ce                	fsd	fs3,96(sp)
    172e:	acd2                	fsd	fs4,88(sp)
    1730:	a8d6                	fsd	fs5,80(sp)
    1732:	a4da                	fsd	fs6,72(sp)
    1734:	a0de                	fsd	fs7,64(sp)
    1736:	bc62                	fsd	fs8,56(sp)
    1738:	b866                	fsd	fs9,48(sp)
    173a:	b46a                	fsd	fs10,40(sp)
    173c:	b06e                	fsd	fs11,32(sp)
    173e:	ac72                	fsd	ft8,24(sp)
    1740:	a876                	fsd	ft9,16(sp)
    1742:	a47a                	fsd	ft10,8(sp)
    1744:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1746:	10000713          	li	a4,256
    174a:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
    // call the weak fic handler
    fic_irq_gpio_2();
    174c:	f59fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1750:	14c12083          	lw	ra,332(sp)
    1754:	14412283          	lw	t0,324(sp)
    1758:	00329073          	fscsr	t0
    175c:	14812283          	lw	t0,328(sp)
    1760:	14012303          	lw	t1,320(sp)
    1764:	13c12383          	lw	t2,316(sp)
    1768:	13812503          	lw	a0,312(sp)
    176c:	13412583          	lw	a1,308(sp)
    1770:	13012603          	lw	a2,304(sp)
    1774:	12c12683          	lw	a3,300(sp)
    1778:	12812703          	lw	a4,296(sp)
    177c:	12412783          	lw	a5,292(sp)
    1780:	12012803          	lw	a6,288(sp)
    1784:	11c12883          	lw	a7,284(sp)
    1788:	11812e03          	lw	t3,280(sp)
    178c:	11412e83          	lw	t4,276(sp)
    1790:	11012f03          	lw	t5,272(sp)
    1794:	10c12f83          	lw	t6,268(sp)
    1798:	306e                	fld	ft0,248(sp)
    179a:	30ce                	fld	ft1,240(sp)
    179c:	312e                	fld	ft2,232(sp)
    179e:	318e                	fld	ft3,224(sp)
    17a0:	226e                	fld	ft4,216(sp)
    17a2:	22ce                	fld	ft5,208(sp)
    17a4:	232e                	fld	ft6,200(sp)
    17a6:	238e                	fld	ft7,192(sp)
    17a8:	346a                	fld	fs0,184(sp)
    17aa:	34ca                	fld	fs1,176(sp)
    17ac:	352a                	fld	fa0,168(sp)
    17ae:	358a                	fld	fa1,160(sp)
    17b0:	266a                	fld	fa2,152(sp)
    17b2:	26ca                	fld	fa3,144(sp)
    17b4:	272a                	fld	fa4,136(sp)
    17b6:	278a                	fld	fa5,128(sp)
    17b8:	3866                	fld	fa6,120(sp)
    17ba:	38c6                	fld	fa7,112(sp)
    17bc:	3926                	fld	fs2,104(sp)
    17be:	3986                	fld	fs3,96(sp)
    17c0:	2a66                	fld	fs4,88(sp)
    17c2:	2ac6                	fld	fs5,80(sp)
    17c4:	2b26                	fld	fs6,72(sp)
    17c6:	2b86                	fld	fs7,64(sp)
    17c8:	3c62                	fld	fs8,56(sp)
    17ca:	3cc2                	fld	fs9,48(sp)
    17cc:	3d22                	fld	fs10,40(sp)
    17ce:	3d82                	fld	fs11,32(sp)
    17d0:	2e62                	fld	ft8,24(sp)
    17d2:	2ec2                	fld	ft9,16(sp)
    17d4:	2f22                	fld	ft10,8(sp)
    17d6:	2f82                	fld	ft11,0(sp)
    17d8:	6171                	addi	sp,sp,336
    17da:	30200073          	mret
	...

000017e0 <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
    17e0:	714d                	addi	sp,sp,-336
    17e2:	14112623          	sw	ra,332(sp)
    17e6:	14512423          	sw	t0,328(sp)
    17ea:	003022f3          	frcsr	t0
    17ee:	14512223          	sw	t0,324(sp)
    17f2:	14612023          	sw	t1,320(sp)
    17f6:	12712e23          	sw	t2,316(sp)
    17fa:	12a12c23          	sw	a0,312(sp)
    17fe:	12b12a23          	sw	a1,308(sp)
    1802:	12c12823          	sw	a2,304(sp)
    1806:	12d12623          	sw	a3,300(sp)
    180a:	12e12423          	sw	a4,296(sp)
    180e:	12f12223          	sw	a5,292(sp)
    1812:	13012023          	sw	a6,288(sp)
    1816:	11112e23          	sw	a7,284(sp)
    181a:	11c12c23          	sw	t3,280(sp)
    181e:	11d12a23          	sw	t4,276(sp)
    1822:	11e12823          	sw	t5,272(sp)
    1826:	11f12623          	sw	t6,268(sp)
    182a:	bd82                	fsd	ft0,248(sp)
    182c:	b986                	fsd	ft1,240(sp)
    182e:	b58a                	fsd	ft2,232(sp)
    1830:	b18e                	fsd	ft3,224(sp)
    1832:	ad92                	fsd	ft4,216(sp)
    1834:	a996                	fsd	ft5,208(sp)
    1836:	a59a                	fsd	ft6,200(sp)
    1838:	a19e                	fsd	ft7,192(sp)
    183a:	bd22                	fsd	fs0,184(sp)
    183c:	b926                	fsd	fs1,176(sp)
    183e:	b52a                	fsd	fa0,168(sp)
    1840:	b12e                	fsd	fa1,160(sp)
    1842:	ad32                	fsd	fa2,152(sp)
    1844:	a936                	fsd	fa3,144(sp)
    1846:	a53a                	fsd	fa4,136(sp)
    1848:	a13e                	fsd	fa5,128(sp)
    184a:	bcc2                	fsd	fa6,120(sp)
    184c:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    184e:	200607b7          	lui	a5,0x20060
{
    1852:	b4ca                	fsd	fs2,104(sp)
    1854:	b0ce                	fsd	fs3,96(sp)
    1856:	acd2                	fsd	fs4,88(sp)
    1858:	a8d6                	fsd	fs5,80(sp)
    185a:	a4da                	fsd	fs6,72(sp)
    185c:	a0de                	fsd	fs7,64(sp)
    185e:	bc62                	fsd	fs8,56(sp)
    1860:	b866                	fsd	fs9,48(sp)
    1862:	b46a                	fsd	fs10,40(sp)
    1864:	b06e                	fsd	fs11,32(sp)
    1866:	ac72                	fsd	ft8,24(sp)
    1868:	a876                	fsd	ft9,16(sp)
    186a:	a47a                	fsd	ft10,8(sp)
    186c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    186e:	20000713          	li	a4,512
    1872:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
    // call the weak fic handler
    fic_irq_gpio_3();
    1874:	e31fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1878:	14c12083          	lw	ra,332(sp)
    187c:	14412283          	lw	t0,324(sp)
    1880:	00329073          	fscsr	t0
    1884:	14812283          	lw	t0,328(sp)
    1888:	14012303          	lw	t1,320(sp)
    188c:	13c12383          	lw	t2,316(sp)
    1890:	13812503          	lw	a0,312(sp)
    1894:	13412583          	lw	a1,308(sp)
    1898:	13012603          	lw	a2,304(sp)
    189c:	12c12683          	lw	a3,300(sp)
    18a0:	12812703          	lw	a4,296(sp)
    18a4:	12412783          	lw	a5,292(sp)
    18a8:	12012803          	lw	a6,288(sp)
    18ac:	11c12883          	lw	a7,284(sp)
    18b0:	11812e03          	lw	t3,280(sp)
    18b4:	11412e83          	lw	t4,276(sp)
    18b8:	11012f03          	lw	t5,272(sp)
    18bc:	10c12f83          	lw	t6,268(sp)
    18c0:	306e                	fld	ft0,248(sp)
    18c2:	30ce                	fld	ft1,240(sp)
    18c4:	312e                	fld	ft2,232(sp)
    18c6:	318e                	fld	ft3,224(sp)
    18c8:	226e                	fld	ft4,216(sp)
    18ca:	22ce                	fld	ft5,208(sp)
    18cc:	232e                	fld	ft6,200(sp)
    18ce:	238e                	fld	ft7,192(sp)
    18d0:	346a                	fld	fs0,184(sp)
    18d2:	34ca                	fld	fs1,176(sp)
    18d4:	352a                	fld	fa0,168(sp)
    18d6:	358a                	fld	fa1,160(sp)
    18d8:	266a                	fld	fa2,152(sp)
    18da:	26ca                	fld	fa3,144(sp)
    18dc:	272a                	fld	fa4,136(sp)
    18de:	278a                	fld	fa5,128(sp)
    18e0:	3866                	fld	fa6,120(sp)
    18e2:	38c6                	fld	fa7,112(sp)
    18e4:	3926                	fld	fs2,104(sp)
    18e6:	3986                	fld	fs3,96(sp)
    18e8:	2a66                	fld	fs4,88(sp)
    18ea:	2ac6                	fld	fs5,80(sp)
    18ec:	2b26                	fld	fs6,72(sp)
    18ee:	2b86                	fld	fs7,64(sp)
    18f0:	3c62                	fld	fs8,56(sp)
    18f2:	3cc2                	fld	fs9,48(sp)
    18f4:	3d22                	fld	fs10,40(sp)
    18f6:	3d82                	fld	fs11,32(sp)
    18f8:	2e62                	fld	ft8,24(sp)
    18fa:	2ec2                	fld	ft9,16(sp)
    18fc:	2f22                	fld	ft10,8(sp)
    18fe:	2f82                	fld	ft11,0(sp)
    1900:	6171                	addi	sp,sp,336
    1902:	30200073          	mret
	...

00001908 <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
    1908:	714d                	addi	sp,sp,-336
    190a:	14112623          	sw	ra,332(sp)
    190e:	14512423          	sw	t0,328(sp)
    1912:	003022f3          	frcsr	t0
    1916:	14512223          	sw	t0,324(sp)
    191a:	14612023          	sw	t1,320(sp)
    191e:	12712e23          	sw	t2,316(sp)
    1922:	12a12c23          	sw	a0,312(sp)
    1926:	12b12a23          	sw	a1,308(sp)
    192a:	12c12823          	sw	a2,304(sp)
    192e:	12d12623          	sw	a3,300(sp)
    1932:	12e12423          	sw	a4,296(sp)
    1936:	12f12223          	sw	a5,292(sp)
    193a:	13012023          	sw	a6,288(sp)
    193e:	11112e23          	sw	a7,284(sp)
    1942:	11c12c23          	sw	t3,280(sp)
    1946:	11d12a23          	sw	t4,276(sp)
    194a:	11e12823          	sw	t5,272(sp)
    194e:	11f12623          	sw	t6,268(sp)
    1952:	bd82                	fsd	ft0,248(sp)
    1954:	b986                	fsd	ft1,240(sp)
    1956:	b58a                	fsd	ft2,232(sp)
    1958:	b18e                	fsd	ft3,224(sp)
    195a:	ad92                	fsd	ft4,216(sp)
    195c:	a996                	fsd	ft5,208(sp)
    195e:	a59a                	fsd	ft6,200(sp)
    1960:	a19e                	fsd	ft7,192(sp)
    1962:	bd22                	fsd	fs0,184(sp)
    1964:	b926                	fsd	fs1,176(sp)
    1966:	b52a                	fsd	fa0,168(sp)
    1968:	b12e                	fsd	fa1,160(sp)
    196a:	ad32                	fsd	fa2,152(sp)
    196c:	a936                	fsd	fa3,144(sp)
    196e:	a53a                	fsd	fa4,136(sp)
    1970:	a13e                	fsd	fa5,128(sp)
    1972:	bcc2                	fsd	fa6,120(sp)
    1974:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1976:	200607b7          	lui	a5,0x20060
{
    197a:	b4ca                	fsd	fs2,104(sp)
    197c:	b0ce                	fsd	fs3,96(sp)
    197e:	acd2                	fsd	fs4,88(sp)
    1980:	a8d6                	fsd	fs5,80(sp)
    1982:	a4da                	fsd	fs6,72(sp)
    1984:	a0de                	fsd	fs7,64(sp)
    1986:	bc62                	fsd	fs8,56(sp)
    1988:	b866                	fsd	fs9,48(sp)
    198a:	b46a                	fsd	fs10,40(sp)
    198c:	b06e                	fsd	fs11,32(sp)
    198e:	ac72                	fsd	ft8,24(sp)
    1990:	a876                	fsd	ft9,16(sp)
    1992:	a47a                	fsd	ft10,8(sp)
    1994:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1996:	40000713          	li	a4,1024
    199a:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
    // call the weak fic handler
    fic_irq_gpio_4();
    199c:	d09fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    19a0:	14c12083          	lw	ra,332(sp)
    19a4:	14412283          	lw	t0,324(sp)
    19a8:	00329073          	fscsr	t0
    19ac:	14812283          	lw	t0,328(sp)
    19b0:	14012303          	lw	t1,320(sp)
    19b4:	13c12383          	lw	t2,316(sp)
    19b8:	13812503          	lw	a0,312(sp)
    19bc:	13412583          	lw	a1,308(sp)
    19c0:	13012603          	lw	a2,304(sp)
    19c4:	12c12683          	lw	a3,300(sp)
    19c8:	12812703          	lw	a4,296(sp)
    19cc:	12412783          	lw	a5,292(sp)
    19d0:	12012803          	lw	a6,288(sp)
    19d4:	11c12883          	lw	a7,284(sp)
    19d8:	11812e03          	lw	t3,280(sp)
    19dc:	11412e83          	lw	t4,276(sp)
    19e0:	11012f03          	lw	t5,272(sp)
    19e4:	10c12f83          	lw	t6,268(sp)
    19e8:	306e                	fld	ft0,248(sp)
    19ea:	30ce                	fld	ft1,240(sp)
    19ec:	312e                	fld	ft2,232(sp)
    19ee:	318e                	fld	ft3,224(sp)
    19f0:	226e                	fld	ft4,216(sp)
    19f2:	22ce                	fld	ft5,208(sp)
    19f4:	232e                	fld	ft6,200(sp)
    19f6:	238e                	fld	ft7,192(sp)
    19f8:	346a                	fld	fs0,184(sp)
    19fa:	34ca                	fld	fs1,176(sp)
    19fc:	352a                	fld	fa0,168(sp)
    19fe:	358a                	fld	fa1,160(sp)
    1a00:	266a                	fld	fa2,152(sp)
    1a02:	26ca                	fld	fa3,144(sp)
    1a04:	272a                	fld	fa4,136(sp)
    1a06:	278a                	fld	fa5,128(sp)
    1a08:	3866                	fld	fa6,120(sp)
    1a0a:	38c6                	fld	fa7,112(sp)
    1a0c:	3926                	fld	fs2,104(sp)
    1a0e:	3986                	fld	fs3,96(sp)
    1a10:	2a66                	fld	fs4,88(sp)
    1a12:	2ac6                	fld	fs5,80(sp)
    1a14:	2b26                	fld	fs6,72(sp)
    1a16:	2b86                	fld	fs7,64(sp)
    1a18:	3c62                	fld	fs8,56(sp)
    1a1a:	3cc2                	fld	fs9,48(sp)
    1a1c:	3d22                	fld	fs10,40(sp)
    1a1e:	3d82                	fld	fs11,32(sp)
    1a20:	2e62                	fld	ft8,24(sp)
    1a22:	2ec2                	fld	ft9,16(sp)
    1a24:	2f22                	fld	ft10,8(sp)
    1a26:	2f82                	fld	ft11,0(sp)
    1a28:	6171                	addi	sp,sp,336
    1a2a:	30200073          	mret
	...

00001a30 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
    1a30:	714d                	addi	sp,sp,-336
    1a32:	14112623          	sw	ra,332(sp)
    1a36:	14512423          	sw	t0,328(sp)
    1a3a:	003022f3          	frcsr	t0
    1a3e:	14512223          	sw	t0,324(sp)
    1a42:	14612023          	sw	t1,320(sp)
    1a46:	12712e23          	sw	t2,316(sp)
    1a4a:	12a12c23          	sw	a0,312(sp)
    1a4e:	12b12a23          	sw	a1,308(sp)
    1a52:	12c12823          	sw	a2,304(sp)
    1a56:	12d12623          	sw	a3,300(sp)
    1a5a:	12e12423          	sw	a4,296(sp)
    1a5e:	12f12223          	sw	a5,292(sp)
    1a62:	13012023          	sw	a6,288(sp)
    1a66:	11112e23          	sw	a7,284(sp)
    1a6a:	11c12c23          	sw	t3,280(sp)
    1a6e:	11d12a23          	sw	t4,276(sp)
    1a72:	11e12823          	sw	t5,272(sp)
    1a76:	11f12623          	sw	t6,268(sp)
    1a7a:	bd82                	fsd	ft0,248(sp)
    1a7c:	b986                	fsd	ft1,240(sp)
    1a7e:	b58a                	fsd	ft2,232(sp)
    1a80:	b18e                	fsd	ft3,224(sp)
    1a82:	ad92                	fsd	ft4,216(sp)
    1a84:	a996                	fsd	ft5,208(sp)
    1a86:	a59a                	fsd	ft6,200(sp)
    1a88:	a19e                	fsd	ft7,192(sp)
    1a8a:	bd22                	fsd	fs0,184(sp)
    1a8c:	b926                	fsd	fs1,176(sp)
    1a8e:	b52a                	fsd	fa0,168(sp)
    1a90:	b12e                	fsd	fa1,160(sp)
    1a92:	ad32                	fsd	fa2,152(sp)
    1a94:	a936                	fsd	fa3,144(sp)
    1a96:	a53a                	fsd	fa4,136(sp)
    1a98:	a13e                	fsd	fa5,128(sp)
    1a9a:	bcc2                	fsd	fa6,120(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1a9c:	6785                	lui	a5,0x1
{
    1a9e:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1aa0:	80078793          	addi	a5,a5,-2048 # 800 <spi_event_handler+0x9e>
{
    1aa4:	b4ca                	fsd	fs2,104(sp)
    1aa6:	b0ce                	fsd	fs3,96(sp)
    1aa8:	acd2                	fsd	fs4,88(sp)
    1aaa:	a8d6                	fsd	fs5,80(sp)
    1aac:	a4da                	fsd	fs6,72(sp)
    1aae:	a0de                	fsd	fs7,64(sp)
    1ab0:	bc62                	fsd	fs8,56(sp)
    1ab2:	b866                	fsd	fs9,48(sp)
    1ab4:	b46a                	fsd	fs10,40(sp)
    1ab6:	b06e                	fsd	fs11,32(sp)
    1ab8:	ac72                	fsd	ft8,24(sp)
    1aba:	a876                	fsd	ft9,16(sp)
    1abc:	a47a                	fsd	ft10,8(sp)
    1abe:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1ac0:	20060737          	lui	a4,0x20060
    1ac4:	c35c                	sw	a5,4(a4)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
    // call the weak fic handler
    fic_irq_gpio_5();
    1ac6:	bdffe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1aca:	14c12083          	lw	ra,332(sp)
    1ace:	14412283          	lw	t0,324(sp)
    1ad2:	00329073          	fscsr	t0
    1ad6:	14812283          	lw	t0,328(sp)
    1ada:	14012303          	lw	t1,320(sp)
    1ade:	13c12383          	lw	t2,316(sp)
    1ae2:	13812503          	lw	a0,312(sp)
    1ae6:	13412583          	lw	a1,308(sp)
    1aea:	13012603          	lw	a2,304(sp)
    1aee:	12c12683          	lw	a3,300(sp)
    1af2:	12812703          	lw	a4,296(sp)
    1af6:	12412783          	lw	a5,292(sp)
    1afa:	12012803          	lw	a6,288(sp)
    1afe:	11c12883          	lw	a7,284(sp)
    1b02:	11812e03          	lw	t3,280(sp)
    1b06:	11412e83          	lw	t4,276(sp)
    1b0a:	11012f03          	lw	t5,272(sp)
    1b0e:	10c12f83          	lw	t6,268(sp)
    1b12:	306e                	fld	ft0,248(sp)
    1b14:	30ce                	fld	ft1,240(sp)
    1b16:	312e                	fld	ft2,232(sp)
    1b18:	318e                	fld	ft3,224(sp)
    1b1a:	226e                	fld	ft4,216(sp)
    1b1c:	22ce                	fld	ft5,208(sp)
    1b1e:	232e                	fld	ft6,200(sp)
    1b20:	238e                	fld	ft7,192(sp)
    1b22:	346a                	fld	fs0,184(sp)
    1b24:	34ca                	fld	fs1,176(sp)
    1b26:	352a                	fld	fa0,168(sp)
    1b28:	358a                	fld	fa1,160(sp)
    1b2a:	266a                	fld	fa2,152(sp)
    1b2c:	26ca                	fld	fa3,144(sp)
    1b2e:	272a                	fld	fa4,136(sp)
    1b30:	278a                	fld	fa5,128(sp)
    1b32:	3866                	fld	fa6,120(sp)
    1b34:	38c6                	fld	fa7,112(sp)
    1b36:	3926                	fld	fs2,104(sp)
    1b38:	3986                	fld	fs3,96(sp)
    1b3a:	2a66                	fld	fs4,88(sp)
    1b3c:	2ac6                	fld	fs5,80(sp)
    1b3e:	2b26                	fld	fs6,72(sp)
    1b40:	2b86                	fld	fs7,64(sp)
    1b42:	3c62                	fld	fs8,56(sp)
    1b44:	3cc2                	fld	fs9,48(sp)
    1b46:	3d22                	fld	fs10,40(sp)
    1b48:	3d82                	fld	fs11,32(sp)
    1b4a:	2e62                	fld	ft8,24(sp)
    1b4c:	2ec2                	fld	ft9,16(sp)
    1b4e:	2f22                	fld	ft10,8(sp)
    1b50:	2f82                	fld	ft11,0(sp)
    1b52:	6171                	addi	sp,sp,336
    1b54:	30200073          	mret
    1b58:	0000                	unimp
	...

00001b5c <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
    1b5c:	714d                	addi	sp,sp,-336
    1b5e:	14112623          	sw	ra,332(sp)
    1b62:	14512423          	sw	t0,328(sp)
    1b66:	003022f3          	frcsr	t0
    1b6a:	14512223          	sw	t0,324(sp)
    1b6e:	14612023          	sw	t1,320(sp)
    1b72:	12712e23          	sw	t2,316(sp)
    1b76:	12a12c23          	sw	a0,312(sp)
    1b7a:	12b12a23          	sw	a1,308(sp)
    1b7e:	12c12823          	sw	a2,304(sp)
    1b82:	12d12623          	sw	a3,300(sp)
    1b86:	12e12423          	sw	a4,296(sp)
    1b8a:	12f12223          	sw	a5,292(sp)
    1b8e:	13012023          	sw	a6,288(sp)
    1b92:	11112e23          	sw	a7,284(sp)
    1b96:	11c12c23          	sw	t3,280(sp)
    1b9a:	11d12a23          	sw	t4,276(sp)
    1b9e:	11e12823          	sw	t5,272(sp)
    1ba2:	11f12623          	sw	t6,268(sp)
    1ba6:	bd82                	fsd	ft0,248(sp)
    1ba8:	b986                	fsd	ft1,240(sp)
    1baa:	b58a                	fsd	ft2,232(sp)
    1bac:	b18e                	fsd	ft3,224(sp)
    1bae:	ad92                	fsd	ft4,216(sp)
    1bb0:	a996                	fsd	ft5,208(sp)
    1bb2:	a59a                	fsd	ft6,200(sp)
    1bb4:	a19e                	fsd	ft7,192(sp)
    1bb6:	bd22                	fsd	fs0,184(sp)
    1bb8:	b926                	fsd	fs1,176(sp)
    1bba:	b52a                	fsd	fa0,168(sp)
    1bbc:	b12e                	fsd	fa1,160(sp)
    1bbe:	ad32                	fsd	fa2,152(sp)
    1bc0:	a936                	fsd	fa3,144(sp)
    1bc2:	a53a                	fsd	fa4,136(sp)
    1bc4:	a13e                	fsd	fa5,128(sp)
    1bc6:	bcc2                	fsd	fa6,120(sp)
    1bc8:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1bca:	200607b7          	lui	a5,0x20060
{
    1bce:	b4ca                	fsd	fs2,104(sp)
    1bd0:	b0ce                	fsd	fs3,96(sp)
    1bd2:	acd2                	fsd	fs4,88(sp)
    1bd4:	a8d6                	fsd	fs5,80(sp)
    1bd6:	a4da                	fsd	fs6,72(sp)
    1bd8:	a0de                	fsd	fs7,64(sp)
    1bda:	bc62                	fsd	fs8,56(sp)
    1bdc:	b866                	fsd	fs9,48(sp)
    1bde:	b46a                	fsd	fs10,40(sp)
    1be0:	b06e                	fsd	fs11,32(sp)
    1be2:	ac72                	fsd	ft8,24(sp)
    1be4:	a876                	fsd	ft9,16(sp)
    1be6:	a47a                	fsd	ft10,8(sp)
    1be8:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1bea:	6705                	lui	a4,0x1
    1bec:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
    // call the weak fic handler
    fic_irq_gpio_6();
    1bee:	ab7fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1bf2:	14c12083          	lw	ra,332(sp)
    1bf6:	14412283          	lw	t0,324(sp)
    1bfa:	00329073          	fscsr	t0
    1bfe:	14812283          	lw	t0,328(sp)
    1c02:	14012303          	lw	t1,320(sp)
    1c06:	13c12383          	lw	t2,316(sp)
    1c0a:	13812503          	lw	a0,312(sp)
    1c0e:	13412583          	lw	a1,308(sp)
    1c12:	13012603          	lw	a2,304(sp)
    1c16:	12c12683          	lw	a3,300(sp)
    1c1a:	12812703          	lw	a4,296(sp)
    1c1e:	12412783          	lw	a5,292(sp)
    1c22:	12012803          	lw	a6,288(sp)
    1c26:	11c12883          	lw	a7,284(sp)
    1c2a:	11812e03          	lw	t3,280(sp)
    1c2e:	11412e83          	lw	t4,276(sp)
    1c32:	11012f03          	lw	t5,272(sp)
    1c36:	10c12f83          	lw	t6,268(sp)
    1c3a:	306e                	fld	ft0,248(sp)
    1c3c:	30ce                	fld	ft1,240(sp)
    1c3e:	312e                	fld	ft2,232(sp)
    1c40:	318e                	fld	ft3,224(sp)
    1c42:	226e                	fld	ft4,216(sp)
    1c44:	22ce                	fld	ft5,208(sp)
    1c46:	232e                	fld	ft6,200(sp)
    1c48:	238e                	fld	ft7,192(sp)
    1c4a:	346a                	fld	fs0,184(sp)
    1c4c:	34ca                	fld	fs1,176(sp)
    1c4e:	352a                	fld	fa0,168(sp)
    1c50:	358a                	fld	fa1,160(sp)
    1c52:	266a                	fld	fa2,152(sp)
    1c54:	26ca                	fld	fa3,144(sp)
    1c56:	272a                	fld	fa4,136(sp)
    1c58:	278a                	fld	fa5,128(sp)
    1c5a:	3866                	fld	fa6,120(sp)
    1c5c:	38c6                	fld	fa7,112(sp)
    1c5e:	3926                	fld	fs2,104(sp)
    1c60:	3986                	fld	fs3,96(sp)
    1c62:	2a66                	fld	fs4,88(sp)
    1c64:	2ac6                	fld	fs5,80(sp)
    1c66:	2b26                	fld	fs6,72(sp)
    1c68:	2b86                	fld	fs7,64(sp)
    1c6a:	3c62                	fld	fs8,56(sp)
    1c6c:	3cc2                	fld	fs9,48(sp)
    1c6e:	3d22                	fld	fs10,40(sp)
    1c70:	3d82                	fld	fs11,32(sp)
    1c72:	2e62                	fld	ft8,24(sp)
    1c74:	2ec2                	fld	ft9,16(sp)
    1c76:	2f22                	fld	ft10,8(sp)
    1c78:	2f82                	fld	ft11,0(sp)
    1c7a:	6171                	addi	sp,sp,336
    1c7c:	30200073          	mret
    1c80:	0000                	unimp
	...

00001c84 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
    1c84:	714d                	addi	sp,sp,-336
    1c86:	14112623          	sw	ra,332(sp)
    1c8a:	14512423          	sw	t0,328(sp)
    1c8e:	003022f3          	frcsr	t0
    1c92:	14512223          	sw	t0,324(sp)
    1c96:	14612023          	sw	t1,320(sp)
    1c9a:	12712e23          	sw	t2,316(sp)
    1c9e:	12a12c23          	sw	a0,312(sp)
    1ca2:	12b12a23          	sw	a1,308(sp)
    1ca6:	12c12823          	sw	a2,304(sp)
    1caa:	12d12623          	sw	a3,300(sp)
    1cae:	12e12423          	sw	a4,296(sp)
    1cb2:	12f12223          	sw	a5,292(sp)
    1cb6:	13012023          	sw	a6,288(sp)
    1cba:	11112e23          	sw	a7,284(sp)
    1cbe:	11c12c23          	sw	t3,280(sp)
    1cc2:	11d12a23          	sw	t4,276(sp)
    1cc6:	11e12823          	sw	t5,272(sp)
    1cca:	11f12623          	sw	t6,268(sp)
    1cce:	bd82                	fsd	ft0,248(sp)
    1cd0:	b986                	fsd	ft1,240(sp)
    1cd2:	b58a                	fsd	ft2,232(sp)
    1cd4:	b18e                	fsd	ft3,224(sp)
    1cd6:	ad92                	fsd	ft4,216(sp)
    1cd8:	a996                	fsd	ft5,208(sp)
    1cda:	a59a                	fsd	ft6,200(sp)
    1cdc:	a19e                	fsd	ft7,192(sp)
    1cde:	bd22                	fsd	fs0,184(sp)
    1ce0:	b926                	fsd	fs1,176(sp)
    1ce2:	b52a                	fsd	fa0,168(sp)
    1ce4:	b12e                	fsd	fa1,160(sp)
    1ce6:	ad32                	fsd	fa2,152(sp)
    1ce8:	a936                	fsd	fa3,144(sp)
    1cea:	a53a                	fsd	fa4,136(sp)
    1cec:	a13e                	fsd	fa5,128(sp)
    1cee:	bcc2                	fsd	fa6,120(sp)
    1cf0:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1cf2:	200607b7          	lui	a5,0x20060
{
    1cf6:	b4ca                	fsd	fs2,104(sp)
    1cf8:	b0ce                	fsd	fs3,96(sp)
    1cfa:	acd2                	fsd	fs4,88(sp)
    1cfc:	a8d6                	fsd	fs5,80(sp)
    1cfe:	a4da                	fsd	fs6,72(sp)
    1d00:	a0de                	fsd	fs7,64(sp)
    1d02:	bc62                	fsd	fs8,56(sp)
    1d04:	b866                	fsd	fs9,48(sp)
    1d06:	b46a                	fsd	fs10,40(sp)
    1d08:	b06e                	fsd	fs11,32(sp)
    1d0a:	ac72                	fsd	ft8,24(sp)
    1d0c:	a876                	fsd	ft9,16(sp)
    1d0e:	a47a                	fsd	ft10,8(sp)
    1d10:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1d12:	6709                	lui	a4,0x2
    1d14:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
    1d16:	98ffe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1d1a:	14c12083          	lw	ra,332(sp)
    1d1e:	14412283          	lw	t0,324(sp)
    1d22:	00329073          	fscsr	t0
    1d26:	14812283          	lw	t0,328(sp)
    1d2a:	14012303          	lw	t1,320(sp)
    1d2e:	13c12383          	lw	t2,316(sp)
    1d32:	13812503          	lw	a0,312(sp)
    1d36:	13412583          	lw	a1,308(sp)
    1d3a:	13012603          	lw	a2,304(sp)
    1d3e:	12c12683          	lw	a3,300(sp)
    1d42:	12812703          	lw	a4,296(sp)
    1d46:	12412783          	lw	a5,292(sp)
    1d4a:	12012803          	lw	a6,288(sp)
    1d4e:	11c12883          	lw	a7,284(sp)
    1d52:	11812e03          	lw	t3,280(sp)
    1d56:	11412e83          	lw	t4,276(sp)
    1d5a:	11012f03          	lw	t5,272(sp)
    1d5e:	10c12f83          	lw	t6,268(sp)
    1d62:	306e                	fld	ft0,248(sp)
    1d64:	30ce                	fld	ft1,240(sp)
    1d66:	312e                	fld	ft2,232(sp)
    1d68:	318e                	fld	ft3,224(sp)
    1d6a:	226e                	fld	ft4,216(sp)
    1d6c:	22ce                	fld	ft5,208(sp)
    1d6e:	232e                	fld	ft6,200(sp)
    1d70:	238e                	fld	ft7,192(sp)
    1d72:	346a                	fld	fs0,184(sp)
    1d74:	34ca                	fld	fs1,176(sp)
    1d76:	352a                	fld	fa0,168(sp)
    1d78:	358a                	fld	fa1,160(sp)
    1d7a:	266a                	fld	fa2,152(sp)
    1d7c:	26ca                	fld	fa3,144(sp)
    1d7e:	272a                	fld	fa4,136(sp)
    1d80:	278a                	fld	fa5,128(sp)
    1d82:	3866                	fld	fa6,120(sp)
    1d84:	38c6                	fld	fa7,112(sp)
    1d86:	3926                	fld	fs2,104(sp)
    1d88:	3986                	fld	fs3,96(sp)
    1d8a:	2a66                	fld	fs4,88(sp)
    1d8c:	2ac6                	fld	fs5,80(sp)
    1d8e:	2b26                	fld	fs6,72(sp)
    1d90:	2b86                	fld	fs7,64(sp)
    1d92:	3c62                	fld	fs8,56(sp)
    1d94:	3cc2                	fld	fs9,48(sp)
    1d96:	3d22                	fld	fs10,40(sp)
    1d98:	3d82                	fld	fs11,32(sp)
    1d9a:	2e62                	fld	ft8,24(sp)
    1d9c:	2ec2                	fld	ft9,16(sp)
    1d9e:	2f22                	fld	ft10,8(sp)
    1da0:	2f82                	fld	ft11,0(sp)
    1da2:	6171                	addi	sp,sp,336
    1da4:	30200073          	mret
    1da8:	0000                	unimp
	...

00001dac <handler_irq_fast_dma_done>:
{
    1dac:	714d                	addi	sp,sp,-336
    1dae:	14112623          	sw	ra,332(sp)
    1db2:	14512423          	sw	t0,328(sp)
    1db6:	003022f3          	frcsr	t0
    1dba:	14512223          	sw	t0,324(sp)
    1dbe:	14612023          	sw	t1,320(sp)
    1dc2:	12712e23          	sw	t2,316(sp)
    1dc6:	12a12c23          	sw	a0,312(sp)
    1dca:	12b12a23          	sw	a1,308(sp)
    1dce:	12c12823          	sw	a2,304(sp)
    1dd2:	12d12623          	sw	a3,300(sp)
    1dd6:	12e12423          	sw	a4,296(sp)
    1dda:	12f12223          	sw	a5,292(sp)
    1dde:	13012023          	sw	a6,288(sp)
    1de2:	11112e23          	sw	a7,284(sp)
    1de6:	11c12c23          	sw	t3,280(sp)
    1dea:	11d12a23          	sw	t4,276(sp)
    1dee:	11e12823          	sw	t5,272(sp)
    1df2:	11f12623          	sw	t6,268(sp)
    1df6:	bd82                	fsd	ft0,248(sp)
    1df8:	b986                	fsd	ft1,240(sp)
    1dfa:	b58a                	fsd	ft2,232(sp)
    1dfc:	b18e                	fsd	ft3,224(sp)
    1dfe:	ad92                	fsd	ft4,216(sp)
    1e00:	a996                	fsd	ft5,208(sp)
    1e02:	a59a                	fsd	ft6,200(sp)
    1e04:	a19e                	fsd	ft7,192(sp)
    1e06:	bd22                	fsd	fs0,184(sp)
    1e08:	b926                	fsd	fs1,176(sp)
    1e0a:	b52a                	fsd	fa0,168(sp)
    1e0c:	b12e                	fsd	fa1,160(sp)
    1e0e:	ad32                	fsd	fa2,152(sp)
    1e10:	a936                	fsd	fa3,144(sp)
    1e12:	a53a                	fsd	fa4,136(sp)
    1e14:	a13e                	fsd	fa5,128(sp)
    1e16:	bcc2                	fsd	fa6,120(sp)
    1e18:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1e1a:	200607b7          	lui	a5,0x20060
{
    1e1e:	b4ca                	fsd	fs2,104(sp)
    1e20:	b0ce                	fsd	fs3,96(sp)
    1e22:	acd2                	fsd	fs4,88(sp)
    1e24:	a8d6                	fsd	fs5,80(sp)
    1e26:	a4da                	fsd	fs6,72(sp)
    1e28:	a0de                	fsd	fs7,64(sp)
    1e2a:	bc62                	fsd	fs8,56(sp)
    1e2c:	b866                	fsd	fs9,48(sp)
    1e2e:	b46a                	fsd	fs10,40(sp)
    1e30:	b06e                	fsd	fs11,32(sp)
    1e32:	ac72                	fsd	ft8,24(sp)
    1e34:	a876                	fsd	ft9,16(sp)
    1e36:	a47a                	fsd	ft10,8(sp)
    1e38:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1e3a:	4721                	li	a4,8
    1e3c:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
    1e3e:	fe2fe0ef          	jal	620 <fic_irq_dma_done>
}
    1e42:	14c12083          	lw	ra,332(sp)
    1e46:	14412283          	lw	t0,324(sp)
    1e4a:	00329073          	fscsr	t0
    1e4e:	14812283          	lw	t0,328(sp)
    1e52:	14012303          	lw	t1,320(sp)
    1e56:	13c12383          	lw	t2,316(sp)
    1e5a:	13812503          	lw	a0,312(sp)
    1e5e:	13412583          	lw	a1,308(sp)
    1e62:	13012603          	lw	a2,304(sp)
    1e66:	12c12683          	lw	a3,300(sp)
    1e6a:	12812703          	lw	a4,296(sp)
    1e6e:	12412783          	lw	a5,292(sp)
    1e72:	12012803          	lw	a6,288(sp)
    1e76:	11c12883          	lw	a7,284(sp)
    1e7a:	11812e03          	lw	t3,280(sp)
    1e7e:	11412e83          	lw	t4,276(sp)
    1e82:	11012f03          	lw	t5,272(sp)
    1e86:	10c12f83          	lw	t6,268(sp)
    1e8a:	306e                	fld	ft0,248(sp)
    1e8c:	30ce                	fld	ft1,240(sp)
    1e8e:	312e                	fld	ft2,232(sp)
    1e90:	318e                	fld	ft3,224(sp)
    1e92:	226e                	fld	ft4,216(sp)
    1e94:	22ce                	fld	ft5,208(sp)
    1e96:	232e                	fld	ft6,200(sp)
    1e98:	238e                	fld	ft7,192(sp)
    1e9a:	346a                	fld	fs0,184(sp)
    1e9c:	34ca                	fld	fs1,176(sp)
    1e9e:	352a                	fld	fa0,168(sp)
    1ea0:	358a                	fld	fa1,160(sp)
    1ea2:	266a                	fld	fa2,152(sp)
    1ea4:	26ca                	fld	fa3,144(sp)
    1ea6:	272a                	fld	fa4,136(sp)
    1ea8:	278a                	fld	fa5,128(sp)
    1eaa:	3866                	fld	fa6,120(sp)
    1eac:	38c6                	fld	fa7,112(sp)
    1eae:	3926                	fld	fs2,104(sp)
    1eb0:	3986                	fld	fs3,96(sp)
    1eb2:	2a66                	fld	fs4,88(sp)
    1eb4:	2ac6                	fld	fs5,80(sp)
    1eb6:	2b26                	fld	fs6,72(sp)
    1eb8:	2b86                	fld	fs7,64(sp)
    1eba:	3c62                	fld	fs8,56(sp)
    1ebc:	3cc2                	fld	fs9,48(sp)
    1ebe:	3d22                	fld	fs10,40(sp)
    1ec0:	3d82                	fld	fs11,32(sp)
    1ec2:	2e62                	fld	ft8,24(sp)
    1ec4:	2ec2                	fld	ft9,16(sp)
    1ec6:	2f22                	fld	ft10,8(sp)
    1ec8:	2f82                	fld	ft11,0(sp)
    1eca:	6171                	addi	sp,sp,336
    1ecc:	30200073          	mret
    1ed0:	0000                	unimp
	...

00001ed4 <handler_irq_fast_dma_window>:
{
    1ed4:	714d                	addi	sp,sp,-336
    1ed6:	14112623          	sw	ra,332(sp)
    1eda:	14512423          	sw	t0,328(sp)
    1ede:	003022f3          	frcsr	t0
    1ee2:	14512223          	sw	t0,324(sp)
    1ee6:	14612023          	sw	t1,320(sp)
    1eea:	12712e23          	sw	t2,316(sp)
    1eee:	12a12c23          	sw	a0,312(sp)
    1ef2:	12b12a23          	sw	a1,308(sp)
    1ef6:	12c12823          	sw	a2,304(sp)
    1efa:	12d12623          	sw	a3,300(sp)
    1efe:	12e12423          	sw	a4,296(sp)
    1f02:	12f12223          	sw	a5,292(sp)
    1f06:	13012023          	sw	a6,288(sp)
    1f0a:	11112e23          	sw	a7,284(sp)
    1f0e:	11c12c23          	sw	t3,280(sp)
    1f12:	11d12a23          	sw	t4,276(sp)
    1f16:	11e12823          	sw	t5,272(sp)
    1f1a:	11f12623          	sw	t6,268(sp)
    1f1e:	bd82                	fsd	ft0,248(sp)
    1f20:	b986                	fsd	ft1,240(sp)
    1f22:	b58a                	fsd	ft2,232(sp)
    1f24:	b18e                	fsd	ft3,224(sp)
    1f26:	ad92                	fsd	ft4,216(sp)
    1f28:	a996                	fsd	ft5,208(sp)
    1f2a:	a59a                	fsd	ft6,200(sp)
    1f2c:	a19e                	fsd	ft7,192(sp)
    1f2e:	bd22                	fsd	fs0,184(sp)
    1f30:	b926                	fsd	fs1,176(sp)
    1f32:	b52a                	fsd	fa0,168(sp)
    1f34:	b12e                	fsd	fa1,160(sp)
    1f36:	ad32                	fsd	fa2,152(sp)
    1f38:	a936                	fsd	fa3,144(sp)
    1f3a:	a53a                	fsd	fa4,136(sp)
    1f3c:	a13e                	fsd	fa5,128(sp)
    1f3e:	bcc2                	fsd	fa6,120(sp)
    1f40:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1f42:	200607b7          	lui	a5,0x20060
{
    1f46:	b4ca                	fsd	fs2,104(sp)
    1f48:	b0ce                	fsd	fs3,96(sp)
    1f4a:	acd2                	fsd	fs4,88(sp)
    1f4c:	a8d6                	fsd	fs5,80(sp)
    1f4e:	a4da                	fsd	fs6,72(sp)
    1f50:	a0de                	fsd	fs7,64(sp)
    1f52:	bc62                	fsd	fs8,56(sp)
    1f54:	b866                	fsd	fs9,48(sp)
    1f56:	b46a                	fsd	fs10,40(sp)
    1f58:	b06e                	fsd	fs11,32(sp)
    1f5a:	ac72                	fsd	ft8,24(sp)
    1f5c:	a876                	fsd	ft9,16(sp)
    1f5e:	a47a                	fsd	ft10,8(sp)
    1f60:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1f62:	6711                	lui	a4,0x4
    1f64:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
    1f66:	e66fe0ef          	jal	5cc <fic_irq_dma_window>
}
    1f6a:	14c12083          	lw	ra,332(sp)
    1f6e:	14412283          	lw	t0,324(sp)
    1f72:	00329073          	fscsr	t0
    1f76:	14812283          	lw	t0,328(sp)
    1f7a:	14012303          	lw	t1,320(sp)
    1f7e:	13c12383          	lw	t2,316(sp)
    1f82:	13812503          	lw	a0,312(sp)
    1f86:	13412583          	lw	a1,308(sp)
    1f8a:	13012603          	lw	a2,304(sp)
    1f8e:	12c12683          	lw	a3,300(sp)
    1f92:	12812703          	lw	a4,296(sp)
    1f96:	12412783          	lw	a5,292(sp)
    1f9a:	12012803          	lw	a6,288(sp)
    1f9e:	11c12883          	lw	a7,284(sp)
    1fa2:	11812e03          	lw	t3,280(sp)
    1fa6:	11412e83          	lw	t4,276(sp)
    1faa:	11012f03          	lw	t5,272(sp)
    1fae:	10c12f83          	lw	t6,268(sp)
    1fb2:	306e                	fld	ft0,248(sp)
    1fb4:	30ce                	fld	ft1,240(sp)
    1fb6:	312e                	fld	ft2,232(sp)
    1fb8:	318e                	fld	ft3,224(sp)
    1fba:	226e                	fld	ft4,216(sp)
    1fbc:	22ce                	fld	ft5,208(sp)
    1fbe:	232e                	fld	ft6,200(sp)
    1fc0:	238e                	fld	ft7,192(sp)
    1fc2:	346a                	fld	fs0,184(sp)
    1fc4:	34ca                	fld	fs1,176(sp)
    1fc6:	352a                	fld	fa0,168(sp)
    1fc8:	358a                	fld	fa1,160(sp)
    1fca:	266a                	fld	fa2,152(sp)
    1fcc:	26ca                	fld	fa3,144(sp)
    1fce:	272a                	fld	fa4,136(sp)
    1fd0:	278a                	fld	fa5,128(sp)
    1fd2:	3866                	fld	fa6,120(sp)
    1fd4:	38c6                	fld	fa7,112(sp)
    1fd6:	3926                	fld	fs2,104(sp)
    1fd8:	3986                	fld	fs3,96(sp)
    1fda:	2a66                	fld	fs4,88(sp)
    1fdc:	2ac6                	fld	fs5,80(sp)
    1fde:	2b26                	fld	fs6,72(sp)
    1fe0:	2b86                	fld	fs7,64(sp)
    1fe2:	3c62                	fld	fs8,56(sp)
    1fe4:	3cc2                	fld	fs9,48(sp)
    1fe6:	3d22                	fld	fs10,40(sp)
    1fe8:	3d82                	fld	fs11,32(sp)
    1fea:	2e62                	fld	ft8,24(sp)
    1fec:	2ec2                	fld	ft9,16(sp)
    1fee:	2f22                	fld	ft10,8(sp)
    1ff0:	2f82                	fld	ft11,0(sp)
    1ff2:	6171                	addi	sp,sp,336
    1ff4:	30200073          	mret
    1ff8:	0000                	unimp
	...

00001ffc <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    1ffc:	714d                	addi	sp,sp,-336
    1ffe:	14112623          	sw	ra,332(sp)
    2002:	14512423          	sw	t0,328(sp)
    2006:	003022f3          	frcsr	t0
    200a:	14512223          	sw	t0,324(sp)
    200e:	14612023          	sw	t1,320(sp)
    2012:	12712e23          	sw	t2,316(sp)
    2016:	12a12c23          	sw	a0,312(sp)
    201a:	12b12a23          	sw	a1,308(sp)
    201e:	12c12823          	sw	a2,304(sp)
    2022:	12d12623          	sw	a3,300(sp)
    2026:	12e12423          	sw	a4,296(sp)
    202a:	12f12223          	sw	a5,292(sp)
    202e:	13012023          	sw	a6,288(sp)
    2032:	11112e23          	sw	a7,284(sp)
    2036:	11c12c23          	sw	t3,280(sp)
    203a:	11d12a23          	sw	t4,276(sp)
    203e:	11e12823          	sw	t5,272(sp)
    2042:	11f12623          	sw	t6,268(sp)
    2046:	bd82                	fsd	ft0,248(sp)
    2048:	b986                	fsd	ft1,240(sp)
    204a:	b58a                	fsd	ft2,232(sp)
    204c:	b18e                	fsd	ft3,224(sp)
    204e:	ad92                	fsd	ft4,216(sp)
    2050:	a996                	fsd	ft5,208(sp)
    2052:	a59a                	fsd	ft6,200(sp)
    2054:	a19e                	fsd	ft7,192(sp)
    2056:	bd22                	fsd	fs0,184(sp)
    2058:	b926                	fsd	fs1,176(sp)
    205a:	b52a                	fsd	fa0,168(sp)
    205c:	b12e                	fsd	fa1,160(sp)
    205e:	ad32                	fsd	fa2,152(sp)
    2060:	a936                	fsd	fa3,144(sp)
    2062:	a53a                	fsd	fa4,136(sp)
    2064:	a13e                	fsd	fa5,128(sp)
    2066:	bcc2                	fsd	fa6,120(sp)
    2068:	b8c6                	fsd	fa7,112(sp)
    206a:	b4ca                	fsd	fs2,104(sp)
    206c:	b0ce                	fsd	fs3,96(sp)
    206e:	acd2                	fsd	fs4,88(sp)
    2070:	a8d6                	fsd	fs5,80(sp)
    2072:	a4da                	fsd	fs6,72(sp)
    2074:	a0de                	fsd	fs7,64(sp)
    2076:	bc62                	fsd	fs8,56(sp)
    2078:	b866                	fsd	fs9,48(sp)
    207a:	b46a                	fsd	fs10,40(sp)
    207c:	b06e                	fsd	fs11,32(sp)
    207e:	ac72                	fsd	ft8,24(sp)
    2080:	a876                	fsd	ft9,16(sp)
    2082:	a47a                	fsd	ft10,8(sp)
    2084:	a07e                	fsd	ft11,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    2086:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    208a:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
    208c:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
    208e:	00f76963          	bltu	a4,a5,20a0 <handler_exception+0xa4>
    2092:	670d                	lui	a4,0x3
    2094:	078a                	slli	a5,a5,0x2
    2096:	64c70713          	addi	a4,a4,1612 # 364c <main+0x164>
    209a:	97ba                	add	a5,a5,a4
    209c:	439c                	lw	a5,0(a5)
    209e:	8782                	jr	a5
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
    20a0:	a001                	j	20a0 <handler_exception+0xa4>
__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    20a2:	6511                	lui	a0,0x4
    20a4:	8e450513          	addi	a0,a0,-1820 # 38e4 <main+0x3fc>
    20a8:	987fe0ef          	jal	a2e <print_exc_msg>
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    20ac:	6511                	lui	a0,0x4
    20ae:	83450513          	addi	a0,a0,-1996 # 3834 <main+0x34c>
    20b2:	97dfe0ef          	jal	a2e <print_exc_msg>
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    20b6:	6511                	lui	a0,0x4
    20b8:	86c50513          	addi	a0,a0,-1940 # 386c <main+0x384>
    20bc:	973fe0ef          	jal	a2e <print_exc_msg>
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    20c0:	6511                	lui	a0,0x4
    20c2:	8a850513          	addi	a0,a0,-1880 # 38a8 <main+0x3c0>
    20c6:	969fe0ef          	jal	a2e <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
    20ca:	6511                	lui	a0,0x4
    20cc:	91850513          	addi	a0,a0,-1768 # 3918 <main+0x430>
    20d0:	943fe0ef          	jal	a12 <_writestr>
  while (1) {
    20d4:	a001                	j	20d4 <handler_exception+0xd8>
	...

000020d8 <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
    20d8:	714d                	addi	sp,sp,-336
    20da:	14112623          	sw	ra,332(sp)
    20de:	14512423          	sw	t0,328(sp)
    20e2:	003022f3          	frcsr	t0
    20e6:	12a12c23          	sw	a0,312(sp)
  _writestr("Software IRQ triggered!\n"); 
    20ea:	6511                	lui	a0,0x4
__attribute__((weak)) void handler_irq_software(void) {
    20ec:	14512223          	sw	t0,324(sp)
    20f0:	14612023          	sw	t1,320(sp)
    20f4:	12712e23          	sw	t2,316(sp)
    20f8:	12b12a23          	sw	a1,308(sp)
    20fc:	12c12823          	sw	a2,304(sp)
    2100:	12d12623          	sw	a3,300(sp)
    2104:	12e12423          	sw	a4,296(sp)
    2108:	12f12223          	sw	a5,292(sp)
    210c:	13012023          	sw	a6,288(sp)
    2110:	11112e23          	sw	a7,284(sp)
    2114:	11c12c23          	sw	t3,280(sp)
    2118:	11d12a23          	sw	t4,276(sp)
    211c:	11e12823          	sw	t5,272(sp)
    2120:	11f12623          	sw	t6,268(sp)
    2124:	bd82                	fsd	ft0,248(sp)
    2126:	b986                	fsd	ft1,240(sp)
    2128:	b58a                	fsd	ft2,232(sp)
    212a:	b18e                	fsd	ft3,224(sp)
    212c:	ad92                	fsd	ft4,216(sp)
    212e:	a996                	fsd	ft5,208(sp)
    2130:	a59a                	fsd	ft6,200(sp)
    2132:	a19e                	fsd	ft7,192(sp)
    2134:	bd22                	fsd	fs0,184(sp)
    2136:	b926                	fsd	fs1,176(sp)
    2138:	b52a                	fsd	fa0,168(sp)
    213a:	b12e                	fsd	fa1,160(sp)
    213c:	ad32                	fsd	fa2,152(sp)
    213e:	a936                	fsd	fa3,144(sp)
    2140:	a53a                	fsd	fa4,136(sp)
    2142:	a13e                	fsd	fa5,128(sp)
    2144:	bcc2                	fsd	fa6,120(sp)
  _writestr("Software IRQ triggered!\n"); 
    2146:	93850513          	addi	a0,a0,-1736 # 3938 <main+0x450>
__attribute__((weak)) void handler_irq_software(void) {
    214a:	b8c6                	fsd	fa7,112(sp)
    214c:	b4ca                	fsd	fs2,104(sp)
    214e:	b0ce                	fsd	fs3,96(sp)
    2150:	acd2                	fsd	fs4,88(sp)
    2152:	a8d6                	fsd	fs5,80(sp)
    2154:	a4da                	fsd	fs6,72(sp)
    2156:	a0de                	fsd	fs7,64(sp)
    2158:	bc62                	fsd	fs8,56(sp)
    215a:	b866                	fsd	fs9,48(sp)
    215c:	b46a                	fsd	fs10,40(sp)
    215e:	b06e                	fsd	fs11,32(sp)
    2160:	ac72                	fsd	ft8,24(sp)
    2162:	a876                	fsd	ft9,16(sp)
    2164:	a47a                	fsd	ft10,8(sp)
    2166:	a07e                	fsd	ft11,0(sp)
  _writestr("Software IRQ triggered!\n"); 
    2168:	8abfe0ef          	jal	a12 <_writestr>
  while (1) {
    216c:	a001                	j	216c <handler_irq_software+0x94>
	...

00002170 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
    2170:	714d                	addi	sp,sp,-336
    2172:	14112623          	sw	ra,332(sp)
    2176:	14512423          	sw	t0,328(sp)
    217a:	003022f3          	frcsr	t0
    217e:	12a12c23          	sw	a0,312(sp)
  _writestr("Timer IRQ triggered!\n"); 
    2182:	6511                	lui	a0,0x4
__attribute__((weak)) void handler_irq_timer(void) {
    2184:	14512223          	sw	t0,324(sp)
    2188:	14612023          	sw	t1,320(sp)
    218c:	12712e23          	sw	t2,316(sp)
    2190:	12b12a23          	sw	a1,308(sp)
    2194:	12c12823          	sw	a2,304(sp)
    2198:	12d12623          	sw	a3,300(sp)
    219c:	12e12423          	sw	a4,296(sp)
    21a0:	12f12223          	sw	a5,292(sp)
    21a4:	13012023          	sw	a6,288(sp)
    21a8:	11112e23          	sw	a7,284(sp)
    21ac:	11c12c23          	sw	t3,280(sp)
    21b0:	11d12a23          	sw	t4,276(sp)
    21b4:	11e12823          	sw	t5,272(sp)
    21b8:	11f12623          	sw	t6,268(sp)
    21bc:	bd82                	fsd	ft0,248(sp)
    21be:	b986                	fsd	ft1,240(sp)
    21c0:	b58a                	fsd	ft2,232(sp)
    21c2:	b18e                	fsd	ft3,224(sp)
    21c4:	ad92                	fsd	ft4,216(sp)
    21c6:	a996                	fsd	ft5,208(sp)
    21c8:	a59a                	fsd	ft6,200(sp)
    21ca:	a19e                	fsd	ft7,192(sp)
    21cc:	bd22                	fsd	fs0,184(sp)
    21ce:	b926                	fsd	fs1,176(sp)
    21d0:	b52a                	fsd	fa0,168(sp)
    21d2:	b12e                	fsd	fa1,160(sp)
    21d4:	ad32                	fsd	fa2,152(sp)
    21d6:	a936                	fsd	fa3,144(sp)
    21d8:	a53a                	fsd	fa4,136(sp)
    21da:	a13e                	fsd	fa5,128(sp)
    21dc:	bcc2                	fsd	fa6,120(sp)
  _writestr("Timer IRQ triggered!\n"); 
    21de:	95450513          	addi	a0,a0,-1708 # 3954 <main+0x46c>
__attribute__((weak)) void handler_irq_timer(void) {
    21e2:	b8c6                	fsd	fa7,112(sp)
    21e4:	b4ca                	fsd	fs2,104(sp)
    21e6:	b0ce                	fsd	fs3,96(sp)
    21e8:	acd2                	fsd	fs4,88(sp)
    21ea:	a8d6                	fsd	fs5,80(sp)
    21ec:	a4da                	fsd	fs6,72(sp)
    21ee:	a0de                	fsd	fs7,64(sp)
    21f0:	bc62                	fsd	fs8,56(sp)
    21f2:	b866                	fsd	fs9,48(sp)
    21f4:	b46a                	fsd	fs10,40(sp)
    21f6:	b06e                	fsd	fs11,32(sp)
    21f8:	ac72                	fsd	ft8,24(sp)
    21fa:	a876                	fsd	ft9,16(sp)
    21fc:	a47a                	fsd	ft10,8(sp)
    21fe:	a07e                	fsd	ft11,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
    2200:	813fe0ef          	jal	a12 <_writestr>
  while (1) {
    2204:	a001                	j	2204 <handler_irq_timer+0x94>
	...

00002208 <init>:
#endif

int init()
{
    return 0;
}
    2208:	4501                	li	a0,0
    220a:	8082                	ret

0000220c <_close>:
}
    220c:	557d                	li	a0,-1
    220e:	8082                	ret

00002210 <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    2210:	200007b7          	lui	a5,0x20000
    2214:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    2216:	4705                	li	a4,1
    2218:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1ffc13b0>
    asm volatile("wfi");
    221c:	10500073          	wfi

00002220 <_fstat>:
    st->st_mode = S_IFCHR;
    2220:	6789                	lui	a5,0x2
    2222:	c1dc                	sw	a5,4(a1)
}
    2224:	4501                	li	a0,0
    2226:	8082                	ret

00002228 <_isatty>:
    return (file == STDOUT_FILENO);
    2228:	157d                	addi	a0,a0,-1
}
    222a:	00153513          	seqz	a0,a0
    222e:	8082                	ret

00002230 <_lseek>:
}
    2230:	4501                	li	a0,0
    2232:	8082                	ret

00002234 <_read>:
}
    2234:	4501                	li	a0,0
    2236:	8082                	ret

00002238 <_write_r>:
    return _write(fd,buf,cnt);
    2238:	852e                	mv	a0,a1
    223a:	85b2                	mv	a1,a2
    223c:	8636                	mv	a2,a3
    223e:	c78fe06f          	j	6b6 <_write>

00002242 <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
    2242:	00027737          	lui	a4,0x27
    2246:	c4818693          	addi	a3,gp,-952 # ec48 <__BSS_END__>
    224a:	c4870713          	addi	a4,a4,-952 # 26c48 <__heap_end>
{
    224e:	87aa                	mv	a5,a0
    char *old_brk = brk;
    2250:	9301a503          	lw	a0,-1744(gp) # e930 <brk>
    if (__heap_start == __heap_end) {
    2254:	00e68c63          	beq	a3,a4,226c <_sbrk+0x2a>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    2258:	97aa                	add	a5,a5,a0
    225a:	00e7f763          	bgeu	a5,a4,2268 <_sbrk+0x26>
    225e:	00d7e563          	bltu	a5,a3,2268 <_sbrk+0x26>
        brk += incr;
    2262:	92f1a823          	sw	a5,-1744(gp) # e930 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    2266:	8082                	ret
        return (void *)-1; 
    2268:	557d                	li	a0,-1
}
    226a:	8082                	ret
        return NULL; 
    226c:	4501                	li	a0,0
    226e:	8082                	ret

00002270 <atexit>:
    2270:	85aa                	mv	a1,a0
    2272:	4681                	li	a3,0
    2274:	4601                	li	a2,0
    2276:	4501                	li	a0,0
    2278:	a6b1                	j	25c4 <__register_exitproc>

0000227a <exit>:
    227a:	1141                	addi	sp,sp,-16
    227c:	c422                	sw	s0,8(sp)
    227e:	c606                	sw	ra,12(sp)
    2280:	00000797          	auipc	a5,0x0
    2284:	3b878793          	addi	a5,a5,952 # 2638 <__call_exitprocs>
    2288:	842a                	mv	s0,a0
    228a:	c399                	beqz	a5,2290 <exit+0x16>
    228c:	4581                	li	a1,0
    228e:	266d                	jal	2638 <__call_exitprocs>
    2290:	c341a783          	lw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    2294:	c391                	beqz	a5,2298 <exit+0x1e>
    2296:	9782                	jalr	a5
    2298:	8522                	mv	a0,s0
    229a:	3f9d                	jal	2210 <_exit>

0000229c <std>:
    229c:	1141                	addi	sp,sp,-16
    229e:	c422                	sw	s0,8(sp)
    22a0:	c606                	sw	ra,12(sp)
    22a2:	842a                	mv	s0,a0
    22a4:	00b51623          	sh	a1,12(a0)
    22a8:	00c51723          	sh	a2,14(a0)
    22ac:	00052023          	sw	zero,0(a0)
    22b0:	00052223          	sw	zero,4(a0)
    22b4:	00052423          	sw	zero,8(a0)
    22b8:	06052223          	sw	zero,100(a0)
    22bc:	00052823          	sw	zero,16(a0)
    22c0:	00052a23          	sw	zero,20(a0)
    22c4:	00052c23          	sw	zero,24(a0)
    22c8:	4621                	li	a2,8
    22ca:	4581                	li	a1,0
    22cc:	05c50513          	addi	a0,a0,92
    22d0:	ad2fe0ef          	jal	5a2 <memset>
    22d4:	00000797          	auipc	a5,0x0
    22d8:	14078793          	addi	a5,a5,320 # 2414 <__sread>
    22dc:	d05c                	sw	a5,36(s0)
    22de:	00000797          	auipc	a5,0x0
    22e2:	16678793          	addi	a5,a5,358 # 2444 <__swrite>
    22e6:	d41c                	sw	a5,40(s0)
    22e8:	00000797          	auipc	a5,0x0
    22ec:	1aa78793          	addi	a5,a5,426 # 2492 <__sseek>
    22f0:	d45c                	sw	a5,44(s0)
    22f2:	00000797          	auipc	a5,0x0
    22f6:	1d678793          	addi	a5,a5,470 # 24c8 <__sclose>
    22fa:	40b2                	lw	ra,12(sp)
    22fc:	d000                	sw	s0,32(s0)
    22fe:	d81c                	sw	a5,48(s0)
    2300:	4422                	lw	s0,8(sp)
    2302:	0141                	addi	sp,sp,16
    2304:	8082                	ret

00002306 <stdio_exit_handler>:
    2306:	0000c617          	auipc	a2,0xc
    230a:	5d260613          	addi	a2,a2,1490 # e8d8 <__sglue>
    230e:	00000597          	auipc	a1,0x0
    2312:	72c58593          	addi	a1,a1,1836 # 2a3a <_fflush_r>
    2316:	0000c517          	auipc	a0,0xc
    231a:	5ce50513          	addi	a0,a0,1486 # e8e4 <_impure_data>
    231e:	a079                	j	23ac <_fwalk_sglue>

00002320 <cleanup_stdio>:
    2320:	414c                	lw	a1,4(a0)
    2322:	1141                	addi	sp,sp,-16
    2324:	c422                	sw	s0,8(sp)
    2326:	c606                	sw	ra,12(sp)
    2328:	a6818793          	addi	a5,gp,-1432 # ea68 <__sf>
    232c:	842a                	mv	s0,a0
    232e:	00f58463          	beq	a1,a5,2336 <cleanup_stdio+0x16>
    2332:	708000ef          	jal	2a3a <_fflush_r>
    2336:	440c                	lw	a1,8(s0)
    2338:	ad018793          	addi	a5,gp,-1328 # ead0 <__sf+0x68>
    233c:	00f58563          	beq	a1,a5,2346 <cleanup_stdio+0x26>
    2340:	8522                	mv	a0,s0
    2342:	6f8000ef          	jal	2a3a <_fflush_r>
    2346:	444c                	lw	a1,12(s0)
    2348:	b3818793          	addi	a5,gp,-1224 # eb38 <__sf+0xd0>
    234c:	00f58763          	beq	a1,a5,235a <cleanup_stdio+0x3a>
    2350:	8522                	mv	a0,s0
    2352:	4422                	lw	s0,8(sp)
    2354:	40b2                	lw	ra,12(sp)
    2356:	0141                	addi	sp,sp,16
    2358:	a5cd                	j	2a3a <_fflush_r>
    235a:	40b2                	lw	ra,12(sp)
    235c:	4422                	lw	s0,8(sp)
    235e:	0141                	addi	sp,sp,16
    2360:	8082                	ret

00002362 <global_stdio_init.part.0>:
    2362:	1141                	addi	sp,sp,-16
    2364:	00000797          	auipc	a5,0x0
    2368:	fa278793          	addi	a5,a5,-94 # 2306 <stdio_exit_handler>
    236c:	4601                	li	a2,0
    236e:	4591                	li	a1,4
    2370:	a6818513          	addi	a0,gp,-1432 # ea68 <__sf>
    2374:	c606                	sw	ra,12(sp)
    2376:	c2f1aa23          	sw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    237a:	370d                	jal	229c <std>
    237c:	4605                	li	a2,1
    237e:	45a5                	li	a1,9
    2380:	ad018513          	addi	a0,gp,-1328 # ead0 <__sf+0x68>
    2384:	3f21                	jal	229c <std>
    2386:	40b2                	lw	ra,12(sp)
    2388:	4609                	li	a2,2
    238a:	45c9                	li	a1,18
    238c:	b3818513          	addi	a0,gp,-1224 # eb38 <__sf+0xd0>
    2390:	0141                	addi	sp,sp,16
    2392:	b729                	j	229c <std>

00002394 <__sinit>:
    2394:	511c                	lw	a5,32(a0)
    2396:	eb91                	bnez	a5,23aa <__sinit+0x16>
    2398:	00000797          	auipc	a5,0x0
    239c:	f8878793          	addi	a5,a5,-120 # 2320 <cleanup_stdio>
    23a0:	d11c                	sw	a5,32(a0)
    23a2:	c341a783          	lw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    23a6:	e391                	bnez	a5,23aa <__sinit+0x16>
    23a8:	bf6d                	j	2362 <global_stdio_init.part.0>
    23aa:	8082                	ret

000023ac <_fwalk_sglue>:
    23ac:	7179                	addi	sp,sp,-48
    23ae:	d422                	sw	s0,40(sp)
    23b0:	d04a                	sw	s2,32(sp)
    23b2:	ce4e                	sw	s3,28(sp)
    23b4:	cc52                	sw	s4,24(sp)
    23b6:	c85a                	sw	s6,16(sp)
    23b8:	c65e                	sw	s7,12(sp)
    23ba:	d606                	sw	ra,44(sp)
    23bc:	d226                	sw	s1,36(sp)
    23be:	ca56                	sw	s5,20(sp)
    23c0:	89aa                	mv	s3,a0
    23c2:	8a2e                	mv	s4,a1
    23c4:	8432                	mv	s0,a2
    23c6:	4901                	li	s2,0
    23c8:	4b05                	li	s6,1
    23ca:	5bfd                	li	s7,-1
    23cc:	4404                	lw	s1,8(s0)
    23ce:	00442a83          	lw	s5,4(s0)
    23d2:	1afd                	addi	s5,s5,-1
    23d4:	020ad063          	bgez	s5,23f4 <_fwalk_sglue+0x48>
    23d8:	4000                	lw	s0,0(s0)
    23da:	f86d                	bnez	s0,23cc <_fwalk_sglue+0x20>
    23dc:	50b2                	lw	ra,44(sp)
    23de:	5422                	lw	s0,40(sp)
    23e0:	5492                	lw	s1,36(sp)
    23e2:	49f2                	lw	s3,28(sp)
    23e4:	4a62                	lw	s4,24(sp)
    23e6:	4ad2                	lw	s5,20(sp)
    23e8:	4b42                	lw	s6,16(sp)
    23ea:	4bb2                	lw	s7,12(sp)
    23ec:	854a                	mv	a0,s2
    23ee:	5902                	lw	s2,32(sp)
    23f0:	6145                	addi	sp,sp,48
    23f2:	8082                	ret
    23f4:	00c4d783          	lhu	a5,12(s1)
    23f8:	00fb7b63          	bgeu	s6,a5,240e <_fwalk_sglue+0x62>
    23fc:	00e49783          	lh	a5,14(s1)
    2400:	01778763          	beq	a5,s7,240e <_fwalk_sglue+0x62>
    2404:	85a6                	mv	a1,s1
    2406:	854e                	mv	a0,s3
    2408:	9a02                	jalr	s4
    240a:	00a96933          	or	s2,s2,a0
    240e:	06848493          	addi	s1,s1,104
    2412:	b7c1                	j	23d2 <_fwalk_sglue+0x26>

00002414 <__sread>:
    2414:	1141                	addi	sp,sp,-16
    2416:	c422                	sw	s0,8(sp)
    2418:	842e                	mv	s0,a1
    241a:	00e59583          	lh	a1,14(a1)
    241e:	c606                	sw	ra,12(sp)
    2420:	28fd                	jal	251e <_read_r>
    2422:	00054963          	bltz	a0,2434 <__sread+0x20>
    2426:	487c                	lw	a5,84(s0)
    2428:	97aa                	add	a5,a5,a0
    242a:	c87c                	sw	a5,84(s0)
    242c:	40b2                	lw	ra,12(sp)
    242e:	4422                	lw	s0,8(sp)
    2430:	0141                	addi	sp,sp,16
    2432:	8082                	ret
    2434:	00c45783          	lhu	a5,12(s0)
    2438:	777d                	lui	a4,0xfffff
    243a:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    243c:	8ff9                	and	a5,a5,a4
    243e:	00f41623          	sh	a5,12(s0)
    2442:	b7ed                	j	242c <__sread+0x18>

00002444 <__swrite>:
    2444:	00c5d783          	lhu	a5,12(a1)
    2448:	1101                	addi	sp,sp,-32
    244a:	cc22                	sw	s0,24(sp)
    244c:	ca26                	sw	s1,20(sp)
    244e:	c84a                	sw	s2,16(sp)
    2450:	c64e                	sw	s3,12(sp)
    2452:	ce06                	sw	ra,28(sp)
    2454:	1007f793          	andi	a5,a5,256
    2458:	84aa                	mv	s1,a0
    245a:	842e                	mv	s0,a1
    245c:	8932                	mv	s2,a2
    245e:	89b6                	mv	s3,a3
    2460:	c791                	beqz	a5,246c <__swrite+0x28>
    2462:	00e59583          	lh	a1,14(a1)
    2466:	4689                	li	a3,2
    2468:	4601                	li	a2,0
    246a:	2069                	jal	24f4 <_lseek_r>
    246c:	00c45783          	lhu	a5,12(s0)
    2470:	777d                	lui	a4,0xfffff
    2472:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    2474:	8ff9                	and	a5,a5,a4
    2476:	00e41583          	lh	a1,14(s0)
    247a:	00f41623          	sh	a5,12(s0)
    247e:	4462                	lw	s0,24(sp)
    2480:	40f2                	lw	ra,28(sp)
    2482:	86ce                	mv	a3,s3
    2484:	864a                	mv	a2,s2
    2486:	49b2                	lw	s3,12(sp)
    2488:	4942                	lw	s2,16(sp)
    248a:	8526                	mv	a0,s1
    248c:	44d2                	lw	s1,20(sp)
    248e:	6105                	addi	sp,sp,32
    2490:	b365                	j	2238 <_write_r>

00002492 <__sseek>:
    2492:	1141                	addi	sp,sp,-16
    2494:	c422                	sw	s0,8(sp)
    2496:	842e                	mv	s0,a1
    2498:	00e59583          	lh	a1,14(a1)
    249c:	c606                	sw	ra,12(sp)
    249e:	2899                	jal	24f4 <_lseek_r>
    24a0:	577d                	li	a4,-1
    24a2:	00c41783          	lh	a5,12(s0)
    24a6:	00e51b63          	bne	a0,a4,24bc <__sseek+0x2a>
    24aa:	777d                	lui	a4,0xfffff
    24ac:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    24ae:	8ff9                	and	a5,a5,a4
    24b0:	00f41623          	sh	a5,12(s0)
    24b4:	40b2                	lw	ra,12(sp)
    24b6:	4422                	lw	s0,8(sp)
    24b8:	0141                	addi	sp,sp,16
    24ba:	8082                	ret
    24bc:	6705                	lui	a4,0x1
    24be:	8fd9                	or	a5,a5,a4
    24c0:	00f41623          	sh	a5,12(s0)
    24c4:	c868                	sw	a0,84(s0)
    24c6:	b7fd                	j	24b4 <__sseek+0x22>

000024c8 <__sclose>:
    24c8:	00e59583          	lh	a1,14(a1)
    24cc:	a009                	j	24ce <_close_r>

000024ce <_close_r>:
    24ce:	1141                	addi	sp,sp,-16
    24d0:	c422                	sw	s0,8(sp)
    24d2:	842a                	mv	s0,a0
    24d4:	852e                	mv	a0,a1
    24d6:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    24da:	c606                	sw	ra,12(sp)
    24dc:	3b05                	jal	220c <_close>
    24de:	57fd                	li	a5,-1
    24e0:	00f51663          	bne	a0,a5,24ec <_close_r+0x1e>
    24e4:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    24e8:	c391                	beqz	a5,24ec <_close_r+0x1e>
    24ea:	c01c                	sw	a5,0(s0)
    24ec:	40b2                	lw	ra,12(sp)
    24ee:	4422                	lw	s0,8(sp)
    24f0:	0141                	addi	sp,sp,16
    24f2:	8082                	ret

000024f4 <_lseek_r>:
    24f4:	1141                	addi	sp,sp,-16
    24f6:	c422                	sw	s0,8(sp)
    24f8:	842a                	mv	s0,a0
    24fa:	852e                	mv	a0,a1
    24fc:	85b2                	mv	a1,a2
    24fe:	8636                	mv	a2,a3
    2500:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    2504:	c606                	sw	ra,12(sp)
    2506:	332d                	jal	2230 <_lseek>
    2508:	57fd                	li	a5,-1
    250a:	00f51663          	bne	a0,a5,2516 <_lseek_r+0x22>
    250e:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    2512:	c391                	beqz	a5,2516 <_lseek_r+0x22>
    2514:	c01c                	sw	a5,0(s0)
    2516:	40b2                	lw	ra,12(sp)
    2518:	4422                	lw	s0,8(sp)
    251a:	0141                	addi	sp,sp,16
    251c:	8082                	ret

0000251e <_read_r>:
    251e:	1141                	addi	sp,sp,-16
    2520:	c422                	sw	s0,8(sp)
    2522:	842a                	mv	s0,a0
    2524:	852e                	mv	a0,a1
    2526:	85b2                	mv	a1,a2
    2528:	8636                	mv	a2,a3
    252a:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    252e:	c606                	sw	ra,12(sp)
    2530:	3311                	jal	2234 <_read>
    2532:	57fd                	li	a5,-1
    2534:	00f51663          	bne	a0,a5,2540 <_read_r+0x22>
    2538:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    253c:	c391                	beqz	a5,2540 <_read_r+0x22>
    253e:	c01c                	sw	a5,0(s0)
    2540:	40b2                	lw	ra,12(sp)
    2542:	4422                	lw	s0,8(sp)
    2544:	0141                	addi	sp,sp,16
    2546:	8082                	ret

00002548 <__libc_init_array>:
    2548:	1141                	addi	sp,sp,-16
    254a:	c422                	sw	s0,8(sp)
    254c:	c226                	sw	s1,4(sp)
    254e:	00000413          	li	s0,0
    2552:	00000493          	li	s1,0
    2556:	8c81                	sub	s1,s1,s0
    2558:	c04a                	sw	s2,0(sp)
    255a:	c606                	sw	ra,12(sp)
    255c:	8489                	srai	s1,s1,0x2
    255e:	4901                	li	s2,0
    2560:	02991163          	bne	s2,s1,2582 <__libc_init_array+0x3a>
    2564:	00000413          	li	s0,0
    2568:	00000493          	li	s1,0
    256c:	8c81                	sub	s1,s1,s0
    256e:	8489                	srai	s1,s1,0x2
    2570:	4901                	li	s2,0
    2572:	00991d63          	bne	s2,s1,258c <__libc_init_array+0x44>
    2576:	40b2                	lw	ra,12(sp)
    2578:	4422                	lw	s0,8(sp)
    257a:	4492                	lw	s1,4(sp)
    257c:	4902                	lw	s2,0(sp)
    257e:	0141                	addi	sp,sp,16
    2580:	8082                	ret
    2582:	401c                	lw	a5,0(s0)
    2584:	0905                	addi	s2,s2,1
    2586:	0411                	addi	s0,s0,4
    2588:	9782                	jalr	a5
    258a:	bfd9                	j	2560 <__libc_init_array+0x18>
    258c:	401c                	lw	a5,0(s0)
    258e:	0905                	addi	s2,s2,1
    2590:	0411                	addi	s0,s0,4
    2592:	9782                	jalr	a5
    2594:	bff9                	j	2572 <__libc_init_array+0x2a>

00002596 <__libc_fini_array>:
    2596:	1141                	addi	sp,sp,-16
    2598:	c422                	sw	s0,8(sp)
    259a:	c226                	sw	s1,4(sp)
    259c:	00000413          	li	s0,0
    25a0:	00000493          	li	s1,0
    25a4:	8c05                	sub	s0,s0,s1
    25a6:	c606                	sw	ra,12(sp)
    25a8:	8409                	srai	s0,s0,0x2
    25aa:	e411                	bnez	s0,25b6 <__libc_fini_array+0x20>
    25ac:	40b2                	lw	ra,12(sp)
    25ae:	4422                	lw	s0,8(sp)
    25b0:	4492                	lw	s1,4(sp)
    25b2:	0141                	addi	sp,sp,16
    25b4:	8082                	ret
    25b6:	147d                	addi	s0,s0,-1
    25b8:	00241793          	slli	a5,s0,0x2
    25bc:	97a6                	add	a5,a5,s1
    25be:	439c                	lw	a5,0(a5)
    25c0:	9782                	jalr	a5
    25c2:	b7e5                	j	25aa <__libc_fini_array+0x14>

000025c4 <__register_exitproc>:
    25c4:	c3c18713          	addi	a4,gp,-964 # ec3c <__atexit>
    25c8:	431c                	lw	a5,0(a4)
    25ca:	88aa                	mv	a7,a0
    25cc:	ef81                	bnez	a5,25e4 <__register_exitproc+0x20>
    25ce:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    25d2:	c31c                	sw	a5,0(a4)
    25d4:	00000713          	li	a4,0
    25d8:	c701                	beqz	a4,25e0 <__register_exitproc+0x1c>
    25da:	4318                	lw	a4,0(a4)
    25dc:	08e7a423          	sw	a4,136(a5)
    25e0:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    25e4:	43d8                	lw	a4,4(a5)
    25e6:	487d                	li	a6,31
    25e8:	557d                	li	a0,-1
    25ea:	04e84663          	blt	a6,a4,2636 <__register_exitproc+0x72>
    25ee:	02088d63          	beqz	a7,2628 <__register_exitproc+0x64>
    25f2:	0887a803          	lw	a6,136(a5)
    25f6:	04080063          	beqz	a6,2636 <__register_exitproc+0x72>
    25fa:	00271513          	slli	a0,a4,0x2
    25fe:	9542                	add	a0,a0,a6
    2600:	c110                	sw	a2,0(a0)
    2602:	10082303          	lw	t1,256(a6)
    2606:	4605                	li	a2,1
    2608:	00e61633          	sll	a2,a2,a4
    260c:	00c36333          	or	t1,t1,a2
    2610:	10682023          	sw	t1,256(a6)
    2614:	08d52023          	sw	a3,128(a0)
    2618:	4689                	li	a3,2
    261a:	00d89763          	bne	a7,a3,2628 <__register_exitproc+0x64>
    261e:	10482683          	lw	a3,260(a6)
    2622:	8ed1                	or	a3,a3,a2
    2624:	10d82223          	sw	a3,260(a6)
    2628:	00170693          	addi	a3,a4,1 # 1001 <handler_irq_fast_timer_1+0x39>
    262c:	070a                	slli	a4,a4,0x2
    262e:	c3d4                	sw	a3,4(a5)
    2630:	97ba                	add	a5,a5,a4
    2632:	c78c                	sw	a1,8(a5)
    2634:	4501                	li	a0,0
    2636:	8082                	ret

00002638 <__call_exitprocs>:
    2638:	7179                	addi	sp,sp,-48
    263a:	ca56                	sw	s5,20(sp)
    263c:	c85a                	sw	s6,16(sp)
    263e:	c65e                	sw	s7,12(sp)
    2640:	c462                	sw	s8,8(sp)
    2642:	d606                	sw	ra,44(sp)
    2644:	d422                	sw	s0,40(sp)
    2646:	d226                	sw	s1,36(sp)
    2648:	d04a                	sw	s2,32(sp)
    264a:	ce4e                	sw	s3,28(sp)
    264c:	cc52                	sw	s4,24(sp)
    264e:	c266                	sw	s9,4(sp)
    2650:	8b2a                	mv	s6,a0
    2652:	8aae                	mv	s5,a1
    2654:	c3c18b93          	addi	s7,gp,-964 # ec3c <__atexit>
    2658:	4c05                	li	s8,1
    265a:	000ba483          	lw	s1,0(s7)
    265e:	cc81                	beqz	s1,2676 <__call_exitprocs+0x3e>
    2660:	40c0                	lw	s0,4(s1)
    2662:	0884a983          	lw	s3,136(s1)
    2666:	fff40913          	addi	s2,s0,-1
    266a:	040a                	slli	s0,s0,0x2
    266c:	00898a33          	add	s4,s3,s0
    2670:	9426                	add	s0,s0,s1
    2672:	00095f63          	bgez	s2,2690 <__call_exitprocs+0x58>
    2676:	50b2                	lw	ra,44(sp)
    2678:	5422                	lw	s0,40(sp)
    267a:	5492                	lw	s1,36(sp)
    267c:	5902                	lw	s2,32(sp)
    267e:	49f2                	lw	s3,28(sp)
    2680:	4a62                	lw	s4,24(sp)
    2682:	4ad2                	lw	s5,20(sp)
    2684:	4b42                	lw	s6,16(sp)
    2686:	4bb2                	lw	s7,12(sp)
    2688:	4c22                	lw	s8,8(sp)
    268a:	4c92                	lw	s9,4(sp)
    268c:	6145                	addi	sp,sp,48
    268e:	8082                	ret
    2690:	000a8c63          	beqz	s5,26a8 <__call_exitprocs+0x70>
    2694:	00099663          	bnez	s3,26a0 <__call_exitprocs+0x68>
    2698:	197d                	addi	s2,s2,-1
    269a:	1a71                	addi	s4,s4,-4
    269c:	1471                	addi	s0,s0,-4
    269e:	bfd1                	j	2672 <__call_exitprocs+0x3a>
    26a0:	07ca2783          	lw	a5,124(s4)
    26a4:	ff579ae3          	bne	a5,s5,2698 <__call_exitprocs+0x60>
    26a8:	40d8                	lw	a4,4(s1)
    26aa:	405c                	lw	a5,4(s0)
    26ac:	177d                	addi	a4,a4,-1
    26ae:	03271863          	bne	a4,s2,26de <__call_exitprocs+0xa6>
    26b2:	0124a223          	sw	s2,4(s1)
    26b6:	d3ed                	beqz	a5,2698 <__call_exitprocs+0x60>
    26b8:	0044ac83          	lw	s9,4(s1)
    26bc:	00098863          	beqz	s3,26cc <__call_exitprocs+0x94>
    26c0:	1009a683          	lw	a3,256(s3)
    26c4:	012c1733          	sll	a4,s8,s2
    26c8:	8ef9                	and	a3,a3,a4
    26ca:	ee89                	bnez	a3,26e4 <__call_exitprocs+0xac>
    26cc:	9782                	jalr	a5
    26ce:	40d8                	lw	a4,4(s1)
    26d0:	000ba783          	lw	a5,0(s7)
    26d4:	f99713e3          	bne	a4,s9,265a <__call_exitprocs+0x22>
    26d8:	fcf480e3          	beq	s1,a5,2698 <__call_exitprocs+0x60>
    26dc:	bfbd                	j	265a <__call_exitprocs+0x22>
    26de:	00042223          	sw	zero,4(s0)
    26e2:	bfd1                	j	26b6 <__call_exitprocs+0x7e>
    26e4:	1049a683          	lw	a3,260(s3)
    26e8:	ffca2583          	lw	a1,-4(s4)
    26ec:	8f75                	and	a4,a4,a3
    26ee:	e701                	bnez	a4,26f6 <__call_exitprocs+0xbe>
    26f0:	855a                	mv	a0,s6
    26f2:	9782                	jalr	a5
    26f4:	bfe9                	j	26ce <__call_exitprocs+0x96>
    26f6:	852e                	mv	a0,a1
    26f8:	9782                	jalr	a5
    26fa:	bfd1                	j	26ce <__call_exitprocs+0x96>

000026fc <_free_r>:
    26fc:	cdd1                	beqz	a1,2798 <_free_r+0x9c>
    26fe:	ffc5a783          	lw	a5,-4(a1)
    2702:	1101                	addi	sp,sp,-32
    2704:	cc22                	sw	s0,24(sp)
    2706:	ce06                	sw	ra,28(sp)
    2708:	ffc58413          	addi	s0,a1,-4
    270c:	0007d363          	bgez	a5,2712 <_free_r+0x16>
    2710:	943e                	add	s0,s0,a5
    2712:	c62a                	sw	a0,12(sp)
    2714:	2acd                	jal	2906 <__malloc_lock>
    2716:	c4418713          	addi	a4,gp,-956 # ec44 <__malloc_free_list>
    271a:	431c                	lw	a5,0(a4)
    271c:	4532                	lw	a0,12(sp)
    271e:	eb81                	bnez	a5,272e <_free_r+0x32>
    2720:	00042223          	sw	zero,4(s0)
    2724:	c300                	sw	s0,0(a4)
    2726:	4462                	lw	s0,24(sp)
    2728:	40f2                	lw	ra,28(sp)
    272a:	6105                	addi	sp,sp,32
    272c:	aaf1                	j	2908 <__malloc_unlock>
    272e:	00f47d63          	bgeu	s0,a5,2748 <_free_r+0x4c>
    2732:	4010                	lw	a2,0(s0)
    2734:	00c406b3          	add	a3,s0,a2
    2738:	00d79663          	bne	a5,a3,2744 <_free_r+0x48>
    273c:	4394                	lw	a3,0(a5)
    273e:	43dc                	lw	a5,4(a5)
    2740:	96b2                	add	a3,a3,a2
    2742:	c014                	sw	a3,0(s0)
    2744:	c05c                	sw	a5,4(s0)
    2746:	bff9                	j	2724 <_free_r+0x28>
    2748:	873e                	mv	a4,a5
    274a:	43dc                	lw	a5,4(a5)
    274c:	c399                	beqz	a5,2752 <_free_r+0x56>
    274e:	fef47de3          	bgeu	s0,a5,2748 <_free_r+0x4c>
    2752:	4314                	lw	a3,0(a4)
    2754:	00d70633          	add	a2,a4,a3
    2758:	00861f63          	bne	a2,s0,2776 <_free_r+0x7a>
    275c:	4010                	lw	a2,0(s0)
    275e:	96b2                	add	a3,a3,a2
    2760:	c314                	sw	a3,0(a4)
    2762:	00d70633          	add	a2,a4,a3
    2766:	fcc790e3          	bne	a5,a2,2726 <_free_r+0x2a>
    276a:	4390                	lw	a2,0(a5)
    276c:	43dc                	lw	a5,4(a5)
    276e:	96b2                	add	a3,a3,a2
    2770:	c314                	sw	a3,0(a4)
    2772:	c35c                	sw	a5,4(a4)
    2774:	bf4d                	j	2726 <_free_r+0x2a>
    2776:	00c47563          	bgeu	s0,a2,2780 <_free_r+0x84>
    277a:	47b1                	li	a5,12
    277c:	c11c                	sw	a5,0(a0)
    277e:	b765                	j	2726 <_free_r+0x2a>
    2780:	4010                	lw	a2,0(s0)
    2782:	00c406b3          	add	a3,s0,a2
    2786:	00d79663          	bne	a5,a3,2792 <_free_r+0x96>
    278a:	4394                	lw	a3,0(a5)
    278c:	43dc                	lw	a5,4(a5)
    278e:	96b2                	add	a3,a3,a2
    2790:	c014                	sw	a3,0(s0)
    2792:	c05c                	sw	a5,4(s0)
    2794:	c340                	sw	s0,4(a4)
    2796:	bf41                	j	2726 <_free_r+0x2a>
    2798:	8082                	ret

0000279a <sbrk_aligned>:
    279a:	1141                	addi	sp,sp,-16
    279c:	c04a                	sw	s2,0(sp)
    279e:	c4018913          	addi	s2,gp,-960 # ec40 <__malloc_sbrk_start>
    27a2:	00092783          	lw	a5,0(s2)
    27a6:	c422                	sw	s0,8(sp)
    27a8:	c226                	sw	s1,4(sp)
    27aa:	c606                	sw	ra,12(sp)
    27ac:	84aa                	mv	s1,a0
    27ae:	842e                	mv	s0,a1
    27b0:	e789                	bnez	a5,27ba <sbrk_aligned+0x20>
    27b2:	4581                	li	a1,0
    27b4:	2c7d                	jal	2a72 <_sbrk_r>
    27b6:	00a92023          	sw	a0,0(s2)
    27ba:	85a2                	mv	a1,s0
    27bc:	8526                	mv	a0,s1
    27be:	2c55                	jal	2a72 <_sbrk_r>
    27c0:	597d                	li	s2,-1
    27c2:	01251a63          	bne	a0,s2,27d6 <sbrk_aligned+0x3c>
    27c6:	547d                	li	s0,-1
    27c8:	40b2                	lw	ra,12(sp)
    27ca:	8522                	mv	a0,s0
    27cc:	4422                	lw	s0,8(sp)
    27ce:	4492                	lw	s1,4(sp)
    27d0:	4902                	lw	s2,0(sp)
    27d2:	0141                	addi	sp,sp,16
    27d4:	8082                	ret
    27d6:	00350413          	addi	s0,a0,3
    27da:	9871                	andi	s0,s0,-4
    27dc:	fe8506e3          	beq	a0,s0,27c8 <sbrk_aligned+0x2e>
    27e0:	40a405b3          	sub	a1,s0,a0
    27e4:	8526                	mv	a0,s1
    27e6:	2471                	jal	2a72 <_sbrk_r>
    27e8:	ff2510e3          	bne	a0,s2,27c8 <sbrk_aligned+0x2e>
    27ec:	bfe9                	j	27c6 <sbrk_aligned+0x2c>

000027ee <_malloc_r>:
    27ee:	1101                	addi	sp,sp,-32
    27f0:	ca26                	sw	s1,20(sp)
    27f2:	00358493          	addi	s1,a1,3
    27f6:	98f1                	andi	s1,s1,-4
    27f8:	c84a                	sw	s2,16(sp)
    27fa:	ce06                	sw	ra,28(sp)
    27fc:	cc22                	sw	s0,24(sp)
    27fe:	c64e                	sw	s3,12(sp)
    2800:	c452                	sw	s4,8(sp)
    2802:	04a1                	addi	s1,s1,8
    2804:	47b1                	li	a5,12
    2806:	892a                	mv	s2,a0
    2808:	06f4f363          	bgeu	s1,a5,286e <_malloc_r+0x80>
    280c:	84be                	mv	s1,a5
    280e:	06b4e263          	bltu	s1,a1,2872 <_malloc_r+0x84>
    2812:	854a                	mv	a0,s2
    2814:	28cd                	jal	2906 <__malloc_lock>
    2816:	c4418993          	addi	s3,gp,-956 # ec44 <__malloc_free_list>
    281a:	0009a783          	lw	a5,0(s3)
    281e:	843e                	mv	s0,a5
    2820:	e425                	bnez	s0,2888 <_malloc_r+0x9a>
    2822:	85a6                	mv	a1,s1
    2824:	854a                	mv	a0,s2
    2826:	3f95                	jal	279a <sbrk_aligned>
    2828:	57fd                	li	a5,-1
    282a:	842a                	mv	s0,a0
    282c:	0cf51b63          	bne	a0,a5,2902 <_malloc_r+0x114>
    2830:	0009a403          	lw	s0,0(s3)
    2834:	87a2                	mv	a5,s0
    2836:	e7d5                	bnez	a5,28e2 <_malloc_r+0xf4>
    2838:	cc5d                	beqz	s0,28f6 <_malloc_r+0x108>
    283a:	00042a03          	lw	s4,0(s0)
    283e:	4581                	li	a1,0
    2840:	854a                	mv	a0,s2
    2842:	9a22                	add	s4,s4,s0
    2844:	243d                	jal	2a72 <_sbrk_r>
    2846:	0aaa1863          	bne	s4,a0,28f6 <_malloc_r+0x108>
    284a:	401c                	lw	a5,0(s0)
    284c:	854a                	mv	a0,s2
    284e:	8c9d                	sub	s1,s1,a5
    2850:	85a6                	mv	a1,s1
    2852:	37a1                	jal	279a <sbrk_aligned>
    2854:	57fd                	li	a5,-1
    2856:	0af50063          	beq	a0,a5,28f6 <_malloc_r+0x108>
    285a:	401c                	lw	a5,0(s0)
    285c:	97a6                	add	a5,a5,s1
    285e:	c01c                	sw	a5,0(s0)
    2860:	0009a783          	lw	a5,0(s3)
    2864:	43d8                	lw	a4,4(a5)
    2866:	e349                	bnez	a4,28e8 <_malloc_r+0xfa>
    2868:	c401a223          	sw	zero,-956(gp) # ec44 <__malloc_free_list>
    286c:	a83d                	j	28aa <_malloc_r+0xbc>
    286e:	fa04d0e3          	bgez	s1,280e <_malloc_r+0x20>
    2872:	00f92023          	sw	a5,0(s2)
    2876:	4501                	li	a0,0
    2878:	40f2                	lw	ra,28(sp)
    287a:	4462                	lw	s0,24(sp)
    287c:	44d2                	lw	s1,20(sp)
    287e:	4942                	lw	s2,16(sp)
    2880:	49b2                	lw	s3,12(sp)
    2882:	4a22                	lw	s4,8(sp)
    2884:	6105                	addi	sp,sp,32
    2886:	8082                	ret
    2888:	4014                	lw	a3,0(s0)
    288a:	8e85                	sub	a3,a3,s1
    288c:	0406c863          	bltz	a3,28dc <_malloc_r+0xee>
    2890:	472d                	li	a4,11
    2892:	02d77d63          	bgeu	a4,a3,28cc <_malloc_r+0xde>
    2896:	c004                	sw	s1,0(s0)
    2898:	00940733          	add	a4,s0,s1
    289c:	02879663          	bne	a5,s0,28c8 <_malloc_r+0xda>
    28a0:	00e9a023          	sw	a4,0(s3)
    28a4:	405c                	lw	a5,4(s0)
    28a6:	c314                	sw	a3,0(a4)
    28a8:	c35c                	sw	a5,4(a4)
    28aa:	854a                	mv	a0,s2
    28ac:	28b1                	jal	2908 <__malloc_unlock>
    28ae:	00b40513          	addi	a0,s0,11
    28b2:	00440793          	addi	a5,s0,4
    28b6:	9961                	andi	a0,a0,-8
    28b8:	40f50733          	sub	a4,a0,a5
    28bc:	faf50ee3          	beq	a0,a5,2878 <_malloc_r+0x8a>
    28c0:	943a                	add	s0,s0,a4
    28c2:	8f89                	sub	a5,a5,a0
    28c4:	c01c                	sw	a5,0(s0)
    28c6:	bf4d                	j	2878 <_malloc_r+0x8a>
    28c8:	c3d8                	sw	a4,4(a5)
    28ca:	bfe9                	j	28a4 <_malloc_r+0xb6>
    28cc:	4058                	lw	a4,4(s0)
    28ce:	00879563          	bne	a5,s0,28d8 <_malloc_r+0xea>
    28d2:	00e9a023          	sw	a4,0(s3)
    28d6:	bfd1                	j	28aa <_malloc_r+0xbc>
    28d8:	c3d8                	sw	a4,4(a5)
    28da:	bfc1                	j	28aa <_malloc_r+0xbc>
    28dc:	87a2                	mv	a5,s0
    28de:	4040                	lw	s0,4(s0)
    28e0:	b781                	j	2820 <_malloc_r+0x32>
    28e2:	843e                	mv	s0,a5
    28e4:	43dc                	lw	a5,4(a5)
    28e6:	bf81                	j	2836 <_malloc_r+0x48>
    28e8:	873e                	mv	a4,a5
    28ea:	43dc                	lw	a5,4(a5)
    28ec:	fe879ee3          	bne	a5,s0,28e8 <_malloc_r+0xfa>
    28f0:	00072223          	sw	zero,4(a4)
    28f4:	bf5d                	j	28aa <_malloc_r+0xbc>
    28f6:	47b1                	li	a5,12
    28f8:	00f92023          	sw	a5,0(s2)
    28fc:	854a                	mv	a0,s2
    28fe:	2029                	jal	2908 <__malloc_unlock>
    2900:	bf9d                	j	2876 <_malloc_r+0x88>
    2902:	c104                	sw	s1,0(a0)
    2904:	b75d                	j	28aa <_malloc_r+0xbc>

00002906 <__malloc_lock>:
    2906:	8082                	ret

00002908 <__malloc_unlock>:
    2908:	8082                	ret

0000290a <__sflush_r>:
    290a:	00c59783          	lh	a5,12(a1)
    290e:	1101                	addi	sp,sp,-32
    2910:	cc22                	sw	s0,24(sp)
    2912:	ca26                	sw	s1,20(sp)
    2914:	ce06                	sw	ra,28(sp)
    2916:	c84a                	sw	s2,16(sp)
    2918:	c64e                	sw	s3,12(sp)
    291a:	0087f713          	andi	a4,a5,8
    291e:	84aa                	mv	s1,a0
    2920:	842e                	mv	s0,a1
    2922:	e369                	bnez	a4,29e4 <__sflush_r+0xda>
    2924:	41d8                	lw	a4,4(a1)
    2926:	00e04563          	bgtz	a4,2930 <__sflush_r+0x26>
    292a:	41b8                	lw	a4,64(a1)
    292c:	0ae05a63          	blez	a4,29e0 <__sflush_r+0xd6>
    2930:	5458                	lw	a4,44(s0)
    2932:	c75d                	beqz	a4,29e0 <__sflush_r+0xd6>
    2934:	0004a903          	lw	s2,0(s1)
    2938:	01379693          	slli	a3,a5,0x13
    293c:	0004a023          	sw	zero,0(s1)
    2940:	0606dd63          	bgez	a3,29ba <__sflush_r+0xb0>
    2944:	4870                	lw	a2,84(s0)
    2946:	00c45783          	lhu	a5,12(s0)
    294a:	8b91                	andi	a5,a5,4
    294c:	c799                	beqz	a5,295a <__sflush_r+0x50>
    294e:	405c                	lw	a5,4(s0)
    2950:	8e1d                	sub	a2,a2,a5
    2952:	585c                	lw	a5,52(s0)
    2954:	c399                	beqz	a5,295a <__sflush_r+0x50>
    2956:	403c                	lw	a5,64(s0)
    2958:	8e1d                	sub	a2,a2,a5
    295a:	545c                	lw	a5,44(s0)
    295c:	500c                	lw	a1,32(s0)
    295e:	4681                	li	a3,0
    2960:	8526                	mv	a0,s1
    2962:	9782                	jalr	a5
    2964:	577d                	li	a4,-1
    2966:	00c41783          	lh	a5,12(s0)
    296a:	00e51d63          	bne	a0,a4,2984 <__sflush_r+0x7a>
    296e:	4094                	lw	a3,0(s1)
    2970:	4775                	li	a4,29
    2972:	0ad76463          	bltu	a4,a3,2a1a <__sflush_r+0x110>
    2976:	20400737          	lui	a4,0x20400
    297a:	0705                	addi	a4,a4,1 # 20400001 <_sp+0x203c13b1>
    297c:	00d75733          	srl	a4,a4,a3
    2980:	8b05                	andi	a4,a4,1
    2982:	cf41                	beqz	a4,2a1a <__sflush_r+0x110>
    2984:	4818                	lw	a4,16(s0)
    2986:	00042223          	sw	zero,4(s0)
    298a:	c018                	sw	a4,0(s0)
    298c:	01379713          	slli	a4,a5,0x13
    2990:	00075863          	bgez	a4,29a0 <__sflush_r+0x96>
    2994:	57fd                	li	a5,-1
    2996:	00f51463          	bne	a0,a5,299e <__sflush_r+0x94>
    299a:	409c                	lw	a5,0(s1)
    299c:	e391                	bnez	a5,29a0 <__sflush_r+0x96>
    299e:	c868                	sw	a0,84(s0)
    29a0:	584c                	lw	a1,52(s0)
    29a2:	0124a023          	sw	s2,0(s1)
    29a6:	cd8d                	beqz	a1,29e0 <__sflush_r+0xd6>
    29a8:	04440793          	addi	a5,s0,68
    29ac:	00f58463          	beq	a1,a5,29b4 <__sflush_r+0xaa>
    29b0:	8526                	mv	a0,s1
    29b2:	33a9                	jal	26fc <_free_r>
    29b4:	02042a23          	sw	zero,52(s0)
    29b8:	a025                	j	29e0 <__sflush_r+0xd6>
    29ba:	500c                	lw	a1,32(s0)
    29bc:	4601                	li	a2,0
    29be:	4685                	li	a3,1
    29c0:	8526                	mv	a0,s1
    29c2:	9702                	jalr	a4
    29c4:	57fd                	li	a5,-1
    29c6:	862a                	mv	a2,a0
    29c8:	f6f51fe3          	bne	a0,a5,2946 <__sflush_r+0x3c>
    29cc:	409c                	lw	a5,0(s1)
    29ce:	dfa5                	beqz	a5,2946 <__sflush_r+0x3c>
    29d0:	4775                	li	a4,29
    29d2:	00e78563          	beq	a5,a4,29dc <__sflush_r+0xd2>
    29d6:	4759                	li	a4,22
    29d8:	02e79f63          	bne	a5,a4,2a16 <__sflush_r+0x10c>
    29dc:	0124a023          	sw	s2,0(s1)
    29e0:	4501                	li	a0,0
    29e2:	a089                	j	2a24 <__sflush_r+0x11a>
    29e4:	0105a983          	lw	s3,16(a1)
    29e8:	fe098ce3          	beqz	s3,29e0 <__sflush_r+0xd6>
    29ec:	0005a903          	lw	s2,0(a1)
    29f0:	8b8d                	andi	a5,a5,3
    29f2:	0135a023          	sw	s3,0(a1)
    29f6:	41390933          	sub	s2,s2,s3
    29fa:	4701                	li	a4,0
    29fc:	e391                	bnez	a5,2a00 <__sflush_r+0xf6>
    29fe:	49d8                	lw	a4,20(a1)
    2a00:	c418                	sw	a4,8(s0)
    2a02:	fd205fe3          	blez	s2,29e0 <__sflush_r+0xd6>
    2a06:	541c                	lw	a5,40(s0)
    2a08:	500c                	lw	a1,32(s0)
    2a0a:	86ca                	mv	a3,s2
    2a0c:	864e                	mv	a2,s3
    2a0e:	8526                	mv	a0,s1
    2a10:	9782                	jalr	a5
    2a12:	02a04063          	bgtz	a0,2a32 <__sflush_r+0x128>
    2a16:	00c41783          	lh	a5,12(s0)
    2a1a:	0407e793          	ori	a5,a5,64
    2a1e:	00f41623          	sh	a5,12(s0)
    2a22:	557d                	li	a0,-1
    2a24:	40f2                	lw	ra,28(sp)
    2a26:	4462                	lw	s0,24(sp)
    2a28:	44d2                	lw	s1,20(sp)
    2a2a:	4942                	lw	s2,16(sp)
    2a2c:	49b2                	lw	s3,12(sp)
    2a2e:	6105                	addi	sp,sp,32
    2a30:	8082                	ret
    2a32:	99aa                	add	s3,s3,a0
    2a34:	40a90933          	sub	s2,s2,a0
    2a38:	b7e9                	j	2a02 <__sflush_r+0xf8>

00002a3a <_fflush_r>:
    2a3a:	499c                	lw	a5,16(a1)
    2a3c:	cb8d                	beqz	a5,2a6e <_fflush_r+0x34>
    2a3e:	1101                	addi	sp,sp,-32
    2a40:	cc22                	sw	s0,24(sp)
    2a42:	ce06                	sw	ra,28(sp)
    2a44:	842a                	mv	s0,a0
    2a46:	c519                	beqz	a0,2a54 <_fflush_r+0x1a>
    2a48:	511c                	lw	a5,32(a0)
    2a4a:	e789                	bnez	a5,2a54 <_fflush_r+0x1a>
    2a4c:	c62e                	sw	a1,12(sp)
    2a4e:	947ff0ef          	jal	2394 <__sinit>
    2a52:	45b2                	lw	a1,12(sp)
    2a54:	00c59783          	lh	a5,12(a1)
    2a58:	c791                	beqz	a5,2a64 <_fflush_r+0x2a>
    2a5a:	8522                	mv	a0,s0
    2a5c:	4462                	lw	s0,24(sp)
    2a5e:	40f2                	lw	ra,28(sp)
    2a60:	6105                	addi	sp,sp,32
    2a62:	b565                	j	290a <__sflush_r>
    2a64:	40f2                	lw	ra,28(sp)
    2a66:	4462                	lw	s0,24(sp)
    2a68:	4501                	li	a0,0
    2a6a:	6105                	addi	sp,sp,32
    2a6c:	8082                	ret
    2a6e:	4501                	li	a0,0
    2a70:	8082                	ret

00002a72 <_sbrk_r>:
    2a72:	1141                	addi	sp,sp,-16
    2a74:	c422                	sw	s0,8(sp)
    2a76:	842a                	mv	s0,a0
    2a78:	852e                	mv	a0,a1
    2a7a:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    2a7e:	c606                	sw	ra,12(sp)
    2a80:	fc2ff0ef          	jal	2242 <_sbrk>
    2a84:	57fd                	li	a5,-1
    2a86:	00f51663          	bne	a0,a5,2a92 <_sbrk_r+0x20>
    2a8a:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    2a8e:	c391                	beqz	a5,2a92 <_sbrk_r+0x20>
    2a90:	c01c                	sw	a5,0(s0)
    2a92:	40b2                	lw	ra,12(sp)
    2a94:	4422                	lw	s0,8(sp)
    2a96:	0141                	addi	sp,sp,16
    2a98:	8082                	ret

00002a9a <iprintf>:
    2a9a:	7139                	addi	sp,sp,-64
    2a9c:	da3e                	sw	a5,52(sp)
    2a9e:	9341a783          	lw	a5,-1740(gp) # e934 <_impure_ptr>
    2aa2:	d432                	sw	a2,40(sp)
    2aa4:	d636                	sw	a3,44(sp)
    2aa6:	d22e                	sw	a1,36(sp)
    2aa8:	d83a                	sw	a4,48(sp)
    2aaa:	dc42                	sw	a6,56(sp)
    2aac:	de46                	sw	a7,60(sp)
    2aae:	478c                	lw	a1,8(a5)
    2ab0:	1054                	addi	a3,sp,36
    2ab2:	862a                	mv	a2,a0
    2ab4:	853e                	mv	a0,a5
    2ab6:	ce06                	sw	ra,28(sp)
    2ab8:	c636                	sw	a3,12(sp)
    2aba:	2c65                	jal	2d72 <_vfiprintf_r>
    2abc:	40f2                	lw	ra,28(sp)
    2abe:	6121                	addi	sp,sp,64
    2ac0:	8082                	ret

00002ac2 <putchar>:
    2ac2:	85aa                	mv	a1,a0
    2ac4:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2ac8:	4510                	lw	a2,8(a0)
    2aca:	15b0006f          	j	3424 <_putc_r>

00002ace <_puts_r>:
    2ace:	511c                	lw	a5,32(a0)
    2ad0:	1101                	addi	sp,sp,-32
    2ad2:	cc22                	sw	s0,24(sp)
    2ad4:	ca26                	sw	s1,20(sp)
    2ad6:	c84a                	sw	s2,16(sp)
    2ad8:	ce06                	sw	ra,28(sp)
    2ada:	c64e                	sw	s3,12(sp)
    2adc:	c452                	sw	s4,8(sp)
    2ade:	4500                	lw	s0,8(a0)
    2ae0:	84aa                	mv	s1,a0
    2ae2:	892e                	mv	s2,a1
    2ae4:	e399                	bnez	a5,2aea <_puts_r+0x1c>
    2ae6:	8afff0ef          	jal	2394 <__sinit>
    2aea:	00c45783          	lhu	a5,12(s0)
    2aee:	8ba1                	andi	a5,a5,8
    2af0:	c399                	beqz	a5,2af6 <_puts_r+0x28>
    2af2:	481c                	lw	a5,16(s0)
    2af4:	e7a5                	bnez	a5,2b5c <_puts_r+0x8e>
    2af6:	85a2                	mv	a1,s0
    2af8:	8526                	mv	a0,s1
    2afa:	2a21                	jal	2c12 <__swsetup_r>
    2afc:	c125                	beqz	a0,2b5c <_puts_r+0x8e>
    2afe:	557d                	li	a0,-1
    2b00:	40f2                	lw	ra,28(sp)
    2b02:	4462                	lw	s0,24(sp)
    2b04:	44d2                	lw	s1,20(sp)
    2b06:	4942                	lw	s2,16(sp)
    2b08:	49b2                	lw	s3,12(sp)
    2b0a:	4a22                	lw	s4,8(sp)
    2b0c:	6105                	addi	sp,sp,32
    2b0e:	8082                	ret
    2b10:	c41c                	sw	a5,8(s0)
    2b12:	0905                	addi	s2,s2,1
    2b14:	0007d763          	bgez	a5,2b22 <_puts_r+0x54>
    2b18:	4c18                	lw	a4,24(s0)
    2b1a:	02e7cb63          	blt	a5,a4,2b50 <_puts_r+0x82>
    2b1e:	03458963          	beq	a1,s4,2b50 <_puts_r+0x82>
    2b22:	401c                	lw	a5,0(s0)
    2b24:	00178713          	addi	a4,a5,1
    2b28:	c018                	sw	a4,0(s0)
    2b2a:	00b78023          	sb	a1,0(a5)
    2b2e:	441c                	lw	a5,8(s0)
    2b30:	00094583          	lbu	a1,0(s2)
    2b34:	17fd                	addi	a5,a5,-1
    2b36:	fde9                	bnez	a1,2b10 <_puts_r+0x42>
    2b38:	c41c                	sw	a5,8(s0)
    2b3a:	0207d463          	bgez	a5,2b62 <_puts_r+0x94>
    2b3e:	8622                	mv	a2,s0
    2b40:	45a9                	li	a1,10
    2b42:	8526                	mv	a0,s1
    2b44:	281d                	jal	2b7a <__swbuf_r>
    2b46:	57fd                	li	a5,-1
    2b48:	faf50be3          	beq	a0,a5,2afe <_puts_r+0x30>
    2b4c:	4529                	li	a0,10
    2b4e:	bf4d                	j	2b00 <_puts_r+0x32>
    2b50:	8622                	mv	a2,s0
    2b52:	8526                	mv	a0,s1
    2b54:	201d                	jal	2b7a <__swbuf_r>
    2b56:	fd351ce3          	bne	a0,s3,2b2e <_puts_r+0x60>
    2b5a:	b755                	j	2afe <_puts_r+0x30>
    2b5c:	59fd                	li	s3,-1
    2b5e:	4a29                	li	s4,10
    2b60:	b7f9                	j	2b2e <_puts_r+0x60>
    2b62:	401c                	lw	a5,0(s0)
    2b64:	00178713          	addi	a4,a5,1
    2b68:	c018                	sw	a4,0(s0)
    2b6a:	4729                	li	a4,10
    2b6c:	00e78023          	sb	a4,0(a5)
    2b70:	bff1                	j	2b4c <_puts_r+0x7e>

00002b72 <puts>:
    2b72:	85aa                	mv	a1,a0
    2b74:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2b78:	bf99                	j	2ace <_puts_r>

00002b7a <__swbuf_r>:
    2b7a:	1101                	addi	sp,sp,-32
    2b7c:	cc22                	sw	s0,24(sp)
    2b7e:	ca26                	sw	s1,20(sp)
    2b80:	c84a                	sw	s2,16(sp)
    2b82:	ce06                	sw	ra,28(sp)
    2b84:	c64e                	sw	s3,12(sp)
    2b86:	892a                	mv	s2,a0
    2b88:	84ae                	mv	s1,a1
    2b8a:	8432                	mv	s0,a2
    2b8c:	c509                	beqz	a0,2b96 <__swbuf_r+0x1c>
    2b8e:	511c                	lw	a5,32(a0)
    2b90:	e399                	bnez	a5,2b96 <__swbuf_r+0x1c>
    2b92:	803ff0ef          	jal	2394 <__sinit>
    2b96:	4c1c                	lw	a5,24(s0)
    2b98:	c41c                	sw	a5,8(s0)
    2b9a:	00c45783          	lhu	a5,12(s0)
    2b9e:	8ba1                	andi	a5,a5,8
    2ba0:	c399                	beqz	a5,2ba6 <__swbuf_r+0x2c>
    2ba2:	481c                	lw	a5,16(s0)
    2ba4:	ef91                	bnez	a5,2bc0 <__swbuf_r+0x46>
    2ba6:	85a2                	mv	a1,s0
    2ba8:	854a                	mv	a0,s2
    2baa:	20a5                	jal	2c12 <__swsetup_r>
    2bac:	c911                	beqz	a0,2bc0 <__swbuf_r+0x46>
    2bae:	54fd                	li	s1,-1
    2bb0:	40f2                	lw	ra,28(sp)
    2bb2:	4462                	lw	s0,24(sp)
    2bb4:	4942                	lw	s2,16(sp)
    2bb6:	49b2                	lw	s3,12(sp)
    2bb8:	8526                	mv	a0,s1
    2bba:	44d2                	lw	s1,20(sp)
    2bbc:	6105                	addi	sp,sp,32
    2bbe:	8082                	ret
    2bc0:	401c                	lw	a5,0(s0)
    2bc2:	4818                	lw	a4,16(s0)
    2bc4:	0ff4f993          	zext.b	s3,s1
    2bc8:	0ff4f493          	zext.b	s1,s1
    2bcc:	40e78533          	sub	a0,a5,a4
    2bd0:	485c                	lw	a5,20(s0)
    2bd2:	00f54663          	blt	a0,a5,2bde <__swbuf_r+0x64>
    2bd6:	85a2                	mv	a1,s0
    2bd8:	854a                	mv	a0,s2
    2bda:	3585                	jal	2a3a <_fflush_r>
    2bdc:	f969                	bnez	a0,2bae <__swbuf_r+0x34>
    2bde:	441c                	lw	a5,8(s0)
    2be0:	17fd                	addi	a5,a5,-1
    2be2:	c41c                	sw	a5,8(s0)
    2be4:	401c                	lw	a5,0(s0)
    2be6:	00178713          	addi	a4,a5,1
    2bea:	c018                	sw	a4,0(s0)
    2bec:	01378023          	sb	s3,0(a5)
    2bf0:	4858                	lw	a4,20(s0)
    2bf2:	00150793          	addi	a5,a0,1
    2bf6:	00f70963          	beq	a4,a5,2c08 <__swbuf_r+0x8e>
    2bfa:	00c45783          	lhu	a5,12(s0)
    2bfe:	8b85                	andi	a5,a5,1
    2c00:	dbc5                	beqz	a5,2bb0 <__swbuf_r+0x36>
    2c02:	47a9                	li	a5,10
    2c04:	faf496e3          	bne	s1,a5,2bb0 <__swbuf_r+0x36>
    2c08:	85a2                	mv	a1,s0
    2c0a:	854a                	mv	a0,s2
    2c0c:	353d                	jal	2a3a <_fflush_r>
    2c0e:	d14d                	beqz	a0,2bb0 <__swbuf_r+0x36>
    2c10:	bf79                	j	2bae <__swbuf_r+0x34>

00002c12 <__swsetup_r>:
    2c12:	1141                	addi	sp,sp,-16
    2c14:	c226                	sw	s1,4(sp)
    2c16:	84aa                	mv	s1,a0
    2c18:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2c1c:	c422                	sw	s0,8(sp)
    2c1e:	c606                	sw	ra,12(sp)
    2c20:	842e                	mv	s0,a1
    2c22:	c509                	beqz	a0,2c2c <__swsetup_r+0x1a>
    2c24:	511c                	lw	a5,32(a0)
    2c26:	e399                	bnez	a5,2c2c <__swsetup_r+0x1a>
    2c28:	f6cff0ef          	jal	2394 <__sinit>
    2c2c:	00c41783          	lh	a5,12(s0)
    2c30:	0087f713          	andi	a4,a5,8
    2c34:	e731                	bnez	a4,2c80 <__swsetup_r+0x6e>
    2c36:	0107f713          	andi	a4,a5,16
    2c3a:	eb09                	bnez	a4,2c4c <__swsetup_r+0x3a>
    2c3c:	4725                	li	a4,9
    2c3e:	c098                	sw	a4,0(s1)
    2c40:	0407e793          	ori	a5,a5,64
    2c44:	00f41623          	sh	a5,12(s0)
    2c48:	557d                	li	a0,-1
    2c4a:	a0bd                	j	2cb8 <__swsetup_r+0xa6>
    2c4c:	0047f713          	andi	a4,a5,4
    2c50:	c705                	beqz	a4,2c78 <__swsetup_r+0x66>
    2c52:	584c                	lw	a1,52(s0)
    2c54:	c991                	beqz	a1,2c68 <__swsetup_r+0x56>
    2c56:	04440793          	addi	a5,s0,68
    2c5a:	00f58563          	beq	a1,a5,2c64 <__swsetup_r+0x52>
    2c5e:	8526                	mv	a0,s1
    2c60:	a9dff0ef          	jal	26fc <_free_r>
    2c64:	02042a23          	sw	zero,52(s0)
    2c68:	00c41783          	lh	a5,12(s0)
    2c6c:	4818                	lw	a4,16(s0)
    2c6e:	00042223          	sw	zero,4(s0)
    2c72:	fdb7f793          	andi	a5,a5,-37
    2c76:	c018                	sw	a4,0(s0)
    2c78:	0087e793          	ori	a5,a5,8
    2c7c:	00f41623          	sh	a5,12(s0)
    2c80:	4818                	lw	a4,16(s0)
    2c82:	eb11                	bnez	a4,2c96 <__swsetup_r+0x84>
    2c84:	2807f793          	andi	a5,a5,640
    2c88:	20000713          	li	a4,512
    2c8c:	00e78563          	beq	a5,a4,2c96 <__swsetup_r+0x84>
    2c90:	85a2                	mv	a1,s0
    2c92:	8526                	mv	a0,s1
    2c94:	2731                	jal	33a0 <__smakebuf_r>
    2c96:	00c41783          	lh	a5,12(s0)
    2c9a:	0017f713          	andi	a4,a5,1
    2c9e:	c315                	beqz	a4,2cc2 <__swsetup_r+0xb0>
    2ca0:	4858                	lw	a4,20(s0)
    2ca2:	00042423          	sw	zero,8(s0)
    2ca6:	40e00733          	neg	a4,a4
    2caa:	cc18                	sw	a4,24(s0)
    2cac:	4818                	lw	a4,16(s0)
    2cae:	4501                	li	a0,0
    2cb0:	e701                	bnez	a4,2cb8 <__swsetup_r+0xa6>
    2cb2:	0807f713          	andi	a4,a5,128
    2cb6:	f749                	bnez	a4,2c40 <__swsetup_r+0x2e>
    2cb8:	40b2                	lw	ra,12(sp)
    2cba:	4422                	lw	s0,8(sp)
    2cbc:	4492                	lw	s1,4(sp)
    2cbe:	0141                	addi	sp,sp,16
    2cc0:	8082                	ret
    2cc2:	0027f713          	andi	a4,a5,2
    2cc6:	4681                	li	a3,0
    2cc8:	e311                	bnez	a4,2ccc <__swsetup_r+0xba>
    2cca:	4854                	lw	a3,20(s0)
    2ccc:	c414                	sw	a3,8(s0)
    2cce:	bff9                	j	2cac <__swsetup_r+0x9a>

00002cd0 <memcmp>:
    2cd0:	4701                	li	a4,0
    2cd2:	00e61463          	bne	a2,a4,2cda <memcmp+0xa>
    2cd6:	4501                	li	a0,0
    2cd8:	8082                	ret
    2cda:	00e507b3          	add	a5,a0,a4
    2cde:	0705                	addi	a4,a4,1
    2ce0:	00e586b3          	add	a3,a1,a4
    2ce4:	0007c783          	lbu	a5,0(a5)
    2ce8:	fff6c683          	lbu	a3,-1(a3)
    2cec:	fed783e3          	beq	a5,a3,2cd2 <memcmp+0x2>
    2cf0:	40d78533          	sub	a0,a5,a3
    2cf4:	8082                	ret

00002cf6 <strlen>:
    2cf6:	87aa                	mv	a5,a0
    2cf8:	0007c703          	lbu	a4,0(a5)
    2cfc:	0785                	addi	a5,a5,1
    2cfe:	ff6d                	bnez	a4,2cf8 <strlen+0x2>
    2d00:	40a78533          	sub	a0,a5,a0
    2d04:	157d                	addi	a0,a0,-1
    2d06:	8082                	ret

00002d08 <__sfputc_r>:
    2d08:	461c                	lw	a5,8(a2)
    2d0a:	17fd                	addi	a5,a5,-1
    2d0c:	c61c                	sw	a5,8(a2)
    2d0e:	0007d963          	bgez	a5,2d20 <__sfputc_r+0x18>
    2d12:	4e18                	lw	a4,24(a2)
    2d14:	00e7c563          	blt	a5,a4,2d1e <__sfputc_r+0x16>
    2d18:	47a9                	li	a5,10
    2d1a:	00f59363          	bne	a1,a5,2d20 <__sfputc_r+0x18>
    2d1e:	bdb1                	j	2b7a <__swbuf_r>
    2d20:	421c                	lw	a5,0(a2)
    2d22:	852e                	mv	a0,a1
    2d24:	00178713          	addi	a4,a5,1
    2d28:	c218                	sw	a4,0(a2)
    2d2a:	00b78023          	sb	a1,0(a5)
    2d2e:	8082                	ret

00002d30 <__sfputs_r>:
    2d30:	1101                	addi	sp,sp,-32
    2d32:	cc22                	sw	s0,24(sp)
    2d34:	ca26                	sw	s1,20(sp)
    2d36:	c84a                	sw	s2,16(sp)
    2d38:	c64e                	sw	s3,12(sp)
    2d3a:	c452                	sw	s4,8(sp)
    2d3c:	ce06                	sw	ra,28(sp)
    2d3e:	892a                	mv	s2,a0
    2d40:	89ae                	mv	s3,a1
    2d42:	8432                	mv	s0,a2
    2d44:	00d604b3          	add	s1,a2,a3
    2d48:	5a7d                	li	s4,-1
    2d4a:	00941463          	bne	s0,s1,2d52 <__sfputs_r+0x22>
    2d4e:	4501                	li	a0,0
    2d50:	a809                	j	2d62 <__sfputs_r+0x32>
    2d52:	00044583          	lbu	a1,0(s0)
    2d56:	864e                	mv	a2,s3
    2d58:	854a                	mv	a0,s2
    2d5a:	377d                	jal	2d08 <__sfputc_r>
    2d5c:	0405                	addi	s0,s0,1
    2d5e:	ff4516e3          	bne	a0,s4,2d4a <__sfputs_r+0x1a>
    2d62:	40f2                	lw	ra,28(sp)
    2d64:	4462                	lw	s0,24(sp)
    2d66:	44d2                	lw	s1,20(sp)
    2d68:	4942                	lw	s2,16(sp)
    2d6a:	49b2                	lw	s3,12(sp)
    2d6c:	4a22                	lw	s4,8(sp)
    2d6e:	6105                	addi	sp,sp,32
    2d70:	8082                	ret

00002d72 <_vfiprintf_r>:
    2d72:	7135                	addi	sp,sp,-160
    2d74:	cd22                	sw	s0,152(sp)
    2d76:	cb26                	sw	s1,148(sp)
    2d78:	c94a                	sw	s2,144(sp)
    2d7a:	c74e                	sw	s3,140(sp)
    2d7c:	cf06                	sw	ra,156(sp)
    2d7e:	c552                	sw	s4,136(sp)
    2d80:	c356                	sw	s5,132(sp)
    2d82:	c15a                	sw	s6,128(sp)
    2d84:	dede                	sw	s7,124(sp)
    2d86:	dce2                	sw	s8,120(sp)
    2d88:	dae6                	sw	s9,116(sp)
    2d8a:	89aa                	mv	s3,a0
    2d8c:	892e                	mv	s2,a1
    2d8e:	84b2                	mv	s1,a2
    2d90:	8436                	mv	s0,a3
    2d92:	c509                	beqz	a0,2d9c <_vfiprintf_r+0x2a>
    2d94:	511c                	lw	a5,32(a0)
    2d96:	e399                	bnez	a5,2d9c <_vfiprintf_r+0x2a>
    2d98:	dfcff0ef          	jal	2394 <__sinit>
    2d9c:	00c95783          	lhu	a5,12(s2)
    2da0:	8ba1                	andi	a5,a5,8
    2da2:	c7f9                	beqz	a5,2e70 <_vfiprintf_r+0xfe>
    2da4:	01092783          	lw	a5,16(s2)
    2da8:	c7e1                	beqz	a5,2e70 <_vfiprintf_r+0xfe>
    2daa:	02000793          	li	a5,32
    2dae:	02f104a3          	sb	a5,41(sp)
    2db2:	03000793          	li	a5,48
    2db6:	d202                	sw	zero,36(sp)
    2db8:	02f10523          	sb	a5,42(sp)
    2dbc:	c622                	sw	s0,12(sp)
    2dbe:	02500b93          	li	s7,37
    2dc2:	5afd                	li	s5,-1
    2dc4:	4c05                	li	s8,1
    2dc6:	4b29                	li	s6,10
    2dc8:	8426                	mv	s0,s1
    2dca:	00044783          	lbu	a5,0(s0)
    2dce:	c399                	beqz	a5,2dd4 <_vfiprintf_r+0x62>
    2dd0:	0d779263          	bne	a5,s7,2e94 <_vfiprintf_r+0x122>
    2dd4:	40940cb3          	sub	s9,s0,s1
    2dd8:	00940c63          	beq	s0,s1,2df0 <_vfiprintf_r+0x7e>
    2ddc:	86e6                	mv	a3,s9
    2dde:	8626                	mv	a2,s1
    2de0:	85ca                	mv	a1,s2
    2de2:	854e                	mv	a0,s3
    2de4:	37b1                	jal	2d30 <__sfputs_r>
    2de6:	1d550563          	beq	a0,s5,2fb0 <_vfiprintf_r+0x23e>
    2dea:	5792                	lw	a5,36(sp)
    2dec:	97e6                	add	a5,a5,s9
    2dee:	d23e                	sw	a5,36(sp)
    2df0:	00044783          	lbu	a5,0(s0)
    2df4:	1a078e63          	beqz	a5,2fb0 <_vfiprintf_r+0x23e>
    2df8:	00140493          	addi	s1,s0,1
    2dfc:	c802                	sw	zero,16(sp)
    2dfe:	ce02                	sw	zero,28(sp)
    2e00:	ca56                	sw	s5,20(sp)
    2e02:	cc02                	sw	zero,24(sp)
    2e04:	040109a3          	sb	zero,83(sp)
    2e08:	d482                	sw	zero,104(sp)
    2e0a:	00001c97          	auipc	s9,0x1
    2e0e:	b62c8c93          	addi	s9,s9,-1182 # 396c <main+0x484>
    2e12:	0004c583          	lbu	a1,0(s1)
    2e16:	4615                	li	a2,5
    2e18:	00001517          	auipc	a0,0x1
    2e1c:	b5450513          	addi	a0,a0,-1196 # 396c <main+0x484>
    2e20:	2db1                	jal	347c <memchr>
    2e22:	4742                	lw	a4,16(sp)
    2e24:	87aa                	mv	a5,a0
    2e26:	00148413          	addi	s0,s1,1
    2e2a:	e53d                	bnez	a0,2e98 <_vfiprintf_r+0x126>
    2e2c:	01077793          	andi	a5,a4,16
    2e30:	c789                	beqz	a5,2e3a <_vfiprintf_r+0xc8>
    2e32:	02000793          	li	a5,32
    2e36:	04f109a3          	sb	a5,83(sp)
    2e3a:	00877793          	andi	a5,a4,8
    2e3e:	c789                	beqz	a5,2e48 <_vfiprintf_r+0xd6>
    2e40:	02b00793          	li	a5,43
    2e44:	04f109a3          	sb	a5,83(sp)
    2e48:	0004c683          	lbu	a3,0(s1)
    2e4c:	02a00793          	li	a5,42
    2e50:	04f68c63          	beq	a3,a5,2ea8 <_vfiprintf_r+0x136>
    2e54:	47f2                	lw	a5,28(sp)
    2e56:	8426                	mv	s0,s1
    2e58:	4681                	li	a3,0
    2e5a:	4625                	li	a2,9
    2e5c:	00044703          	lbu	a4,0(s0)
    2e60:	00140593          	addi	a1,s0,1
    2e64:	fd070713          	addi	a4,a4,-48
    2e68:	08e67663          	bgeu	a2,a4,2ef4 <_vfiprintf_r+0x182>
    2e6c:	e6a9                	bnez	a3,2eb6 <_vfiprintf_r+0x144>
    2e6e:	a8a1                	j	2ec6 <_vfiprintf_r+0x154>
    2e70:	85ca                	mv	a1,s2
    2e72:	854e                	mv	a0,s3
    2e74:	3b79                	jal	2c12 <__swsetup_r>
    2e76:	d915                	beqz	a0,2daa <_vfiprintf_r+0x38>
    2e78:	557d                	li	a0,-1
    2e7a:	40fa                	lw	ra,156(sp)
    2e7c:	446a                	lw	s0,152(sp)
    2e7e:	44da                	lw	s1,148(sp)
    2e80:	494a                	lw	s2,144(sp)
    2e82:	49ba                	lw	s3,140(sp)
    2e84:	4a2a                	lw	s4,136(sp)
    2e86:	4a9a                	lw	s5,132(sp)
    2e88:	4b0a                	lw	s6,128(sp)
    2e8a:	5bf6                	lw	s7,124(sp)
    2e8c:	5c66                	lw	s8,120(sp)
    2e8e:	5cd6                	lw	s9,116(sp)
    2e90:	610d                	addi	sp,sp,160
    2e92:	8082                	ret
    2e94:	0405                	addi	s0,s0,1
    2e96:	bf15                	j	2dca <_vfiprintf_r+0x58>
    2e98:	419787b3          	sub	a5,a5,s9
    2e9c:	00fc17b3          	sll	a5,s8,a5
    2ea0:	8fd9                	or	a5,a5,a4
    2ea2:	c83e                	sw	a5,16(sp)
    2ea4:	84a2                	mv	s1,s0
    2ea6:	b7b5                	j	2e12 <_vfiprintf_r+0xa0>
    2ea8:	47b2                	lw	a5,12(sp)
    2eaa:	00478693          	addi	a3,a5,4
    2eae:	439c                	lw	a5,0(a5)
    2eb0:	c636                	sw	a3,12(sp)
    2eb2:	0007c463          	bltz	a5,2eba <_vfiprintf_r+0x148>
    2eb6:	ce3e                	sw	a5,28(sp)
    2eb8:	a039                	j	2ec6 <_vfiprintf_r+0x154>
    2eba:	40f007b3          	neg	a5,a5
    2ebe:	00276713          	ori	a4,a4,2
    2ec2:	ce3e                	sw	a5,28(sp)
    2ec4:	c83a                	sw	a4,16(sp)
    2ec6:	00044703          	lbu	a4,0(s0)
    2eca:	02e00793          	li	a5,46
    2ece:	04f71763          	bne	a4,a5,2f1c <_vfiprintf_r+0x1aa>
    2ed2:	00144703          	lbu	a4,1(s0)
    2ed6:	02a00793          	li	a5,42
    2eda:	02f71363          	bne	a4,a5,2f00 <_vfiprintf_r+0x18e>
    2ede:	47b2                	lw	a5,12(sp)
    2ee0:	0409                	addi	s0,s0,2
    2ee2:	00478713          	addi	a4,a5,4
    2ee6:	439c                	lw	a5,0(a5)
    2ee8:	c63a                	sw	a4,12(sp)
    2eea:	0007d363          	bgez	a5,2ef0 <_vfiprintf_r+0x17e>
    2eee:	57fd                	li	a5,-1
    2ef0:	ca3e                	sw	a5,20(sp)
    2ef2:	a02d                	j	2f1c <_vfiprintf_r+0x1aa>
    2ef4:	036787b3          	mul	a5,a5,s6
    2ef8:	842e                	mv	s0,a1
    2efa:	4685                	li	a3,1
    2efc:	97ba                	add	a5,a5,a4
    2efe:	bfb9                	j	2e5c <_vfiprintf_r+0xea>
    2f00:	0405                	addi	s0,s0,1
    2f02:	ca02                	sw	zero,20(sp)
    2f04:	4681                	li	a3,0
    2f06:	4781                	li	a5,0
    2f08:	4625                	li	a2,9
    2f0a:	00044703          	lbu	a4,0(s0)
    2f0e:	00140593          	addi	a1,s0,1
    2f12:	fd070713          	addi	a4,a4,-48
    2f16:	06e67463          	bgeu	a2,a4,2f7e <_vfiprintf_r+0x20c>
    2f1a:	faf9                	bnez	a3,2ef0 <_vfiprintf_r+0x17e>
    2f1c:	00044583          	lbu	a1,0(s0)
    2f20:	460d                	li	a2,3
    2f22:	00001517          	auipc	a0,0x1
    2f26:	a5250513          	addi	a0,a0,-1454 # 3974 <main+0x48c>
    2f2a:	2b89                	jal	347c <memchr>
    2f2c:	cd11                	beqz	a0,2f48 <_vfiprintf_r+0x1d6>
    2f2e:	00001797          	auipc	a5,0x1
    2f32:	a4678793          	addi	a5,a5,-1466 # 3974 <main+0x48c>
    2f36:	8d1d                	sub	a0,a0,a5
    2f38:	47c2                	lw	a5,16(sp)
    2f3a:	04000713          	li	a4,64
    2f3e:	00a71733          	sll	a4,a4,a0
    2f42:	8fd9                	or	a5,a5,a4
    2f44:	0405                	addi	s0,s0,1
    2f46:	c83e                	sw	a5,16(sp)
    2f48:	00044583          	lbu	a1,0(s0)
    2f4c:	4619                	li	a2,6
    2f4e:	00001517          	auipc	a0,0x1
    2f52:	a2a50513          	addi	a0,a0,-1494 # 3978 <main+0x490>
    2f56:	00140493          	addi	s1,s0,1
    2f5a:	02b10423          	sb	a1,40(sp)
    2f5e:	2b39                	jal	347c <memchr>
    2f60:	c125                	beqz	a0,2fc0 <_vfiprintf_r+0x24e>
    2f62:	00000793          	li	a5,0
    2f66:	e795                	bnez	a5,2f92 <_vfiprintf_r+0x220>
    2f68:	4742                	lw	a4,16(sp)
    2f6a:	47b2                	lw	a5,12(sp)
    2f6c:	10077713          	andi	a4,a4,256
    2f70:	cf09                	beqz	a4,2f8a <_vfiprintf_r+0x218>
    2f72:	0791                	addi	a5,a5,4
    2f74:	c63e                	sw	a5,12(sp)
    2f76:	5792                	lw	a5,36(sp)
    2f78:	97d2                	add	a5,a5,s4
    2f7a:	d23e                	sw	a5,36(sp)
    2f7c:	b5b1                	j	2dc8 <_vfiprintf_r+0x56>
    2f7e:	036787b3          	mul	a5,a5,s6
    2f82:	842e                	mv	s0,a1
    2f84:	4685                	li	a3,1
    2f86:	97ba                	add	a5,a5,a4
    2f88:	b749                	j	2f0a <_vfiprintf_r+0x198>
    2f8a:	079d                	addi	a5,a5,7
    2f8c:	9be1                	andi	a5,a5,-8
    2f8e:	07a1                	addi	a5,a5,8
    2f90:	b7d5                	j	2f74 <_vfiprintf_r+0x202>
    2f92:	0078                	addi	a4,sp,12
    2f94:	00000697          	auipc	a3,0x0
    2f98:	d9c68693          	addi	a3,a3,-612 # 2d30 <__sfputs_r>
    2f9c:	864a                	mv	a2,s2
    2f9e:	080c                	addi	a1,sp,16
    2fa0:	854e                	mv	a0,s3
    2fa2:	00000097          	auipc	ra,0x0
    2fa6:	000000e7          	jalr	zero # 0 <__vector_start>
    2faa:	8a2a                	mv	s4,a0
    2fac:	fd5515e3          	bne	a0,s5,2f76 <_vfiprintf_r+0x204>
    2fb0:	00c95783          	lhu	a5,12(s2)
    2fb4:	0407f793          	andi	a5,a5,64
    2fb8:	ec0790e3          	bnez	a5,2e78 <_vfiprintf_r+0x106>
    2fbc:	5512                	lw	a0,36(sp)
    2fbe:	bd75                	j	2e7a <_vfiprintf_r+0x108>
    2fc0:	0078                	addi	a4,sp,12
    2fc2:	00000697          	auipc	a3,0x0
    2fc6:	d6e68693          	addi	a3,a3,-658 # 2d30 <__sfputs_r>
    2fca:	864a                	mv	a2,s2
    2fcc:	080c                	addi	a1,sp,16
    2fce:	854e                	mv	a0,s3
    2fd0:	2a19                	jal	30e6 <_printf_i>
    2fd2:	bfe1                	j	2faa <_vfiprintf_r+0x238>

00002fd4 <_printf_common>:
    2fd4:	7179                	addi	sp,sp,-48
    2fd6:	ca56                	sw	s5,20(sp)
    2fd8:	499c                	lw	a5,16(a1)
    2fda:	8aba                	mv	s5,a4
    2fdc:	4598                	lw	a4,8(a1)
    2fde:	d422                	sw	s0,40(sp)
    2fe0:	d04a                	sw	s2,32(sp)
    2fe2:	ce4e                	sw	s3,28(sp)
    2fe4:	cc52                	sw	s4,24(sp)
    2fe6:	d606                	sw	ra,44(sp)
    2fe8:	d226                	sw	s1,36(sp)
    2fea:	c85a                	sw	s6,16(sp)
    2fec:	c65e                	sw	s7,12(sp)
    2fee:	89aa                	mv	s3,a0
    2ff0:	842e                	mv	s0,a1
    2ff2:	8932                	mv	s2,a2
    2ff4:	8a36                	mv	s4,a3
    2ff6:	00e7d363          	bge	a5,a4,2ffc <_printf_common+0x28>
    2ffa:	87ba                	mv	a5,a4
    2ffc:	00f92023          	sw	a5,0(s2)
    3000:	04344703          	lbu	a4,67(s0)
    3004:	c701                	beqz	a4,300c <_printf_common+0x38>
    3006:	0785                	addi	a5,a5,1
    3008:	00f92023          	sw	a5,0(s2)
    300c:	401c                	lw	a5,0(s0)
    300e:	0207f793          	andi	a5,a5,32
    3012:	c791                	beqz	a5,301e <_printf_common+0x4a>
    3014:	00092783          	lw	a5,0(s2)
    3018:	0789                	addi	a5,a5,2
    301a:	00f92023          	sw	a5,0(s2)
    301e:	4004                	lw	s1,0(s0)
    3020:	8899                	andi	s1,s1,6
    3022:	e891                	bnez	s1,3036 <_printf_common+0x62>
    3024:	01940b13          	addi	s6,s0,25
    3028:	5bfd                	li	s7,-1
    302a:	445c                	lw	a5,12(s0)
    302c:	00092703          	lw	a4,0(s2)
    3030:	8f99                	sub	a5,a5,a4
    3032:	04f4cd63          	blt	s1,a5,308c <w25q.c.a2dff0dd+0x1e>
    3036:	04344783          	lbu	a5,67(s0)
    303a:	00f036b3          	snez	a3,a5
    303e:	401c                	lw	a5,0(s0)
    3040:	0207f793          	andi	a5,a5,32
    3044:	ebad                	bnez	a5,30b6 <w25q.c.a2dff0dd+0x48>
    3046:	04340613          	addi	a2,s0,67
    304a:	85d2                	mv	a1,s4
    304c:	854e                	mv	a0,s3
    304e:	9a82                	jalr	s5
    3050:	57fd                	li	a5,-1
    3052:	04f50463          	beq	a0,a5,309a <w25q.c.a2dff0dd+0x2c>
    3056:	401c                	lw	a5,0(s0)
    3058:	4711                	li	a4,4
    305a:	4481                	li	s1,0
    305c:	8b99                	andi	a5,a5,6
    305e:	00e79a63          	bne	a5,a4,3072 <w25q.c.a2dff0dd+0x4>
    3062:	00092783          	lw	a5,0(s2)
    3066:	4444                	lw	s1,12(s0)
    3068:	8c9d                	sub	s1,s1,a5
    306a:	fff4c793          	not	a5,s1
    306e:	87fd                	srai	a5,a5,0x1f
    3070:	8cfd                	and	s1,s1,a5
    3072:	441c                	lw	a5,8(s0)
    3074:	4818                	lw	a4,16(s0)
    3076:	00f75463          	bge	a4,a5,307e <w25q.c.a2dff0dd+0x10>
    307a:	8f99                	sub	a5,a5,a4
    307c:	94be                	add	s1,s1,a5
    307e:	4901                	li	s2,0
    3080:	0469                	addi	s0,s0,26
    3082:	5b7d                	li	s6,-1
    3084:	05249863          	bne	s1,s2,30d4 <w25q.c.a2dff0dd+0x66>
    3088:	4501                	li	a0,0
    308a:	a809                	j	309c <w25q.c.a2dff0dd+0x2e>
    308c:	4685                	li	a3,1
    308e:	865a                	mv	a2,s6
    3090:	85d2                	mv	a1,s4
    3092:	854e                	mv	a0,s3
    3094:	9a82                	jalr	s5
    3096:	01751e63          	bne	a0,s7,30b2 <w25q.c.a2dff0dd+0x44>
    309a:	557d                	li	a0,-1
    309c:	50b2                	lw	ra,44(sp)
    309e:	5422                	lw	s0,40(sp)
    30a0:	5492                	lw	s1,36(sp)
    30a2:	5902                	lw	s2,32(sp)
    30a4:	49f2                	lw	s3,28(sp)
    30a6:	4a62                	lw	s4,24(sp)
    30a8:	4ad2                	lw	s5,20(sp)
    30aa:	4b42                	lw	s6,16(sp)
    30ac:	4bb2                	lw	s7,12(sp)
    30ae:	6145                	addi	sp,sp,48
    30b0:	8082                	ret
    30b2:	0485                	addi	s1,s1,1
    30b4:	bf9d                	j	302a <_printf_common+0x56>
    30b6:	00d40733          	add	a4,s0,a3
    30ba:	03000613          	li	a2,48
    30be:	04c701a3          	sb	a2,67(a4)
    30c2:	04544703          	lbu	a4,69(s0)
    30c6:	00168793          	addi	a5,a3,1
    30ca:	97a2                	add	a5,a5,s0
    30cc:	0689                	addi	a3,a3,2
    30ce:	04e781a3          	sb	a4,67(a5)
    30d2:	bf95                	j	3046 <_printf_common+0x72>
    30d4:	4685                	li	a3,1
    30d6:	8622                	mv	a2,s0
    30d8:	85d2                	mv	a1,s4
    30da:	854e                	mv	a0,s3
    30dc:	9a82                	jalr	s5
    30de:	fb650ee3          	beq	a0,s6,309a <w25q.c.a2dff0dd+0x2c>
    30e2:	0905                	addi	s2,s2,1
    30e4:	b745                	j	3084 <w25q.c.a2dff0dd+0x16>

000030e6 <_printf_i>:
    30e6:	7179                	addi	sp,sp,-48
    30e8:	d422                	sw	s0,40(sp)
    30ea:	d226                	sw	s1,36(sp)
    30ec:	d04a                	sw	s2,32(sp)
    30ee:	ce4e                	sw	s3,28(sp)
    30f0:	d606                	sw	ra,44(sp)
    30f2:	cc52                	sw	s4,24(sp)
    30f4:	ca56                	sw	s5,20(sp)
    30f6:	c85a                	sw	s6,16(sp)
    30f8:	0185c803          	lbu	a6,24(a1)
    30fc:	07800793          	li	a5,120
    3100:	84aa                	mv	s1,a0
    3102:	842e                	mv	s0,a1
    3104:	8932                	mv	s2,a2
    3106:	89b6                	mv	s3,a3
    3108:	0307e263          	bltu	a5,a6,312c <_printf_i+0x46>
    310c:	06200793          	li	a5,98
    3110:	04358693          	addi	a3,a1,67
    3114:	0307e163          	bltu	a5,a6,3136 <_printf_i+0x50>
    3118:	1a080e63          	beqz	a6,32d4 <_printf_i+0x1ee>
    311c:	05800793          	li	a5,88
    3120:	00001617          	auipc	a2,0x1
    3124:	86060613          	addi	a2,a2,-1952 # 3980 <main+0x498>
    3128:	14f80163          	beq	a6,a5,326a <_printf_i+0x184>
    312c:	04240a93          	addi	s5,s0,66
    3130:	05040123          	sb	a6,66(s0)
    3134:	a815                	j	3168 <_printf_i+0x82>
    3136:	f9d80793          	addi	a5,a6,-99
    313a:	0ff7f793          	zext.b	a5,a5
    313e:	4655                	li	a2,21
    3140:	fef666e3          	bltu	a2,a5,312c <_printf_i+0x46>
    3144:	00000617          	auipc	a2,0x0
    3148:	53860613          	addi	a2,a2,1336 # 367c <main+0x194>
    314c:	078a                	slli	a5,a5,0x2
    314e:	97b2                	add	a5,a5,a2
    3150:	439c                	lw	a5,0(a5)
    3152:	97b2                	add	a5,a5,a2
    3154:	8782                	jr	a5
    3156:	431c                	lw	a5,0(a4)
    3158:	04258a93          	addi	s5,a1,66
    315c:	00478693          	addi	a3,a5,4
    3160:	439c                	lw	a5,0(a5)
    3162:	c314                	sw	a3,0(a4)
    3164:	04f58123          	sb	a5,66(a1)
    3168:	4785                	li	a5,1
    316a:	aa41                	j	32fa <_printf_i+0x214>
    316c:	419c                	lw	a5,0(a1)
    316e:	4308                	lw	a0,0(a4)
    3170:	0807f613          	andi	a2,a5,128
    3174:	00450593          	addi	a1,a0,4
    3178:	c20d                	beqz	a2,319a <_printf_i+0xb4>
    317a:	411c                	lw	a5,0(a0)
    317c:	c30c                	sw	a1,0(a4)
    317e:	0007d863          	bgez	a5,318e <_printf_i+0xa8>
    3182:	02d00713          	li	a4,45
    3186:	40f007b3          	neg	a5,a5
    318a:	04e401a3          	sb	a4,67(s0)
    318e:	00000617          	auipc	a2,0x0
    3192:	7f260613          	addi	a2,a2,2034 # 3980 <main+0x498>
    3196:	4829                	li	a6,10
    3198:	a089                	j	31da <_printf_i+0xf4>
    319a:	0407f613          	andi	a2,a5,64
    319e:	411c                	lw	a5,0(a0)
    31a0:	c30c                	sw	a1,0(a4)
    31a2:	de71                	beqz	a2,317e <_printf_i+0x98>
    31a4:	07c2                	slli	a5,a5,0x10
    31a6:	87c1                	srai	a5,a5,0x10
    31a8:	bfd9                	j	317e <_printf_i+0x98>
    31aa:	418c                	lw	a1,0(a1)
    31ac:	4310                	lw	a2,0(a4)
    31ae:	0805f513          	andi	a0,a1,128
    31b2:	421c                	lw	a5,0(a2)
    31b4:	0611                	addi	a2,a2,4
    31b6:	e511                	bnez	a0,31c2 <_printf_i+0xdc>
    31b8:	0405f593          	andi	a1,a1,64
    31bc:	c199                	beqz	a1,31c2 <_printf_i+0xdc>
    31be:	07c2                	slli	a5,a5,0x10
    31c0:	83c1                	srli	a5,a5,0x10
    31c2:	c310                	sw	a2,0(a4)
    31c4:	06f00713          	li	a4,111
    31c8:	00000617          	auipc	a2,0x0
    31cc:	7b860613          	addi	a2,a2,1976 # 3980 <main+0x498>
    31d0:	0ce81c63          	bne	a6,a4,32a8 <_printf_i+0x1c2>
    31d4:	4821                	li	a6,8
    31d6:	040401a3          	sb	zero,67(s0)
    31da:	4058                	lw	a4,4(s0)
    31dc:	c418                	sw	a4,8(s0)
    31de:	00074863          	bltz	a4,31ee <_printf_i+0x108>
    31e2:	400c                	lw	a1,0(s0)
    31e4:	8f5d                	or	a4,a4,a5
    31e6:	8ab6                	mv	s5,a3
    31e8:	99ed                	andi	a1,a1,-5
    31ea:	c00c                	sw	a1,0(s0)
    31ec:	cf19                	beqz	a4,320a <_printf_i+0x124>
    31ee:	8ab6                	mv	s5,a3
    31f0:	0307f733          	remu	a4,a5,a6
    31f4:	1afd                	addi	s5,s5,-1
    31f6:	9732                	add	a4,a4,a2
    31f8:	00074703          	lbu	a4,0(a4)
    31fc:	00ea8023          	sb	a4,0(s5)
    3200:	873e                	mv	a4,a5
    3202:	0307d7b3          	divu	a5,a5,a6
    3206:	ff0775e3          	bgeu	a4,a6,31f0 <_printf_i+0x10a>
    320a:	47a1                	li	a5,8
    320c:	00f81e63          	bne	a6,a5,3228 <_printf_i+0x142>
    3210:	401c                	lw	a5,0(s0)
    3212:	8b85                	andi	a5,a5,1
    3214:	cb91                	beqz	a5,3228 <_printf_i+0x142>
    3216:	4058                	lw	a4,4(s0)
    3218:	481c                	lw	a5,16(s0)
    321a:	00e7c763          	blt	a5,a4,3228 <_printf_i+0x142>
    321e:	03000793          	li	a5,48
    3222:	fefa8fa3          	sb	a5,-1(s5)
    3226:	1afd                	addi	s5,s5,-1
    3228:	415686b3          	sub	a3,a3,s5
    322c:	c814                	sw	a3,16(s0)
    322e:	874e                	mv	a4,s3
    3230:	86ca                	mv	a3,s2
    3232:	0070                	addi	a2,sp,12
    3234:	85a2                	mv	a1,s0
    3236:	8526                	mv	a0,s1
    3238:	3b71                	jal	2fd4 <_printf_common>
    323a:	5a7d                	li	s4,-1
    323c:	0d451363          	bne	a0,s4,3302 <_printf_i+0x21c>
    3240:	557d                	li	a0,-1
    3242:	50b2                	lw	ra,44(sp)
    3244:	5422                	lw	s0,40(sp)
    3246:	5492                	lw	s1,36(sp)
    3248:	5902                	lw	s2,32(sp)
    324a:	49f2                	lw	s3,28(sp)
    324c:	4a62                	lw	s4,24(sp)
    324e:	4ad2                	lw	s5,20(sp)
    3250:	4b42                	lw	s6,16(sp)
    3252:	6145                	addi	sp,sp,48
    3254:	8082                	ret
    3256:	419c                	lw	a5,0(a1)
    3258:	0207e793          	ori	a5,a5,32
    325c:	c19c                	sw	a5,0(a1)
    325e:	07800813          	li	a6,120
    3262:	00000617          	auipc	a2,0x0
    3266:	73260613          	addi	a2,a2,1842 # 3994 <main+0x4ac>
    326a:	050402a3          	sb	a6,69(s0)
    326e:	400c                	lw	a1,0(s0)
    3270:	4308                	lw	a0,0(a4)
    3272:	0805f813          	andi	a6,a1,128
    3276:	411c                	lw	a5,0(a0)
    3278:	0511                	addi	a0,a0,4
    327a:	00081863          	bnez	a6,328a <_printf_i+0x1a4>
    327e:	0405f813          	andi	a6,a1,64
    3282:	00080463          	beqz	a6,328a <_printf_i+0x1a4>
    3286:	07c2                	slli	a5,a5,0x10
    3288:	83c1                	srli	a5,a5,0x10
    328a:	c308                	sw	a0,0(a4)
    328c:	0015f713          	andi	a4,a1,1
    3290:	c701                	beqz	a4,3298 <_printf_i+0x1b2>
    3292:	0205e593          	ori	a1,a1,32
    3296:	c00c                	sw	a1,0(s0)
    3298:	c399                	beqz	a5,329e <_printf_i+0x1b8>
    329a:	4841                	li	a6,16
    329c:	bf2d                	j	31d6 <_printf_i+0xf0>
    329e:	4018                	lw	a4,0(s0)
    32a0:	fdf77713          	andi	a4,a4,-33
    32a4:	c018                	sw	a4,0(s0)
    32a6:	bfd5                	j	329a <_printf_i+0x1b4>
    32a8:	4829                	li	a6,10
    32aa:	b735                	j	31d6 <_printf_i+0xf0>
    32ac:	4190                	lw	a2,0(a1)
    32ae:	431c                	lw	a5,0(a4)
    32b0:	49cc                	lw	a1,20(a1)
    32b2:	08067813          	andi	a6,a2,128
    32b6:	00478513          	addi	a0,a5,4
    32ba:	00080663          	beqz	a6,32c6 <_printf_i+0x1e0>
    32be:	c308                	sw	a0,0(a4)
    32c0:	439c                	lw	a5,0(a5)
    32c2:	c38c                	sw	a1,0(a5)
    32c4:	a801                	j	32d4 <_printf_i+0x1ee>
    32c6:	c308                	sw	a0,0(a4)
    32c8:	04067613          	andi	a2,a2,64
    32cc:	439c                	lw	a5,0(a5)
    32ce:	da75                	beqz	a2,32c2 <_printf_i+0x1dc>
    32d0:	00b79023          	sh	a1,0(a5)
    32d4:	00042823          	sw	zero,16(s0)
    32d8:	8ab6                	mv	s5,a3
    32da:	bf91                	j	322e <_printf_i+0x148>
    32dc:	431c                	lw	a5,0(a4)
    32de:	41d0                	lw	a2,4(a1)
    32e0:	4581                	li	a1,0
    32e2:	00478693          	addi	a3,a5,4
    32e6:	c314                	sw	a3,0(a4)
    32e8:	0007aa83          	lw	s5,0(a5)
    32ec:	8556                	mv	a0,s5
    32ee:	2279                	jal	347c <memchr>
    32f0:	c501                	beqz	a0,32f8 <_printf_i+0x212>
    32f2:	41550533          	sub	a0,a0,s5
    32f6:	c048                	sw	a0,4(s0)
    32f8:	405c                	lw	a5,4(s0)
    32fa:	c81c                	sw	a5,16(s0)
    32fc:	040401a3          	sb	zero,67(s0)
    3300:	b73d                	j	322e <_printf_i+0x148>
    3302:	4814                	lw	a3,16(s0)
    3304:	8656                	mv	a2,s5
    3306:	85ca                	mv	a1,s2
    3308:	8526                	mv	a0,s1
    330a:	9982                	jalr	s3
    330c:	f3450ae3          	beq	a0,s4,3240 <_printf_i+0x15a>
    3310:	401c                	lw	a5,0(s0)
    3312:	8b89                	andi	a5,a5,2
    3314:	e78d                	bnez	a5,333e <_printf_i+0x258>
    3316:	47b2                	lw	a5,12(sp)
    3318:	4448                	lw	a0,12(s0)
    331a:	f2f554e3          	bge	a0,a5,3242 <_printf_i+0x15c>
    331e:	853e                	mv	a0,a5
    3320:	b70d                	j	3242 <_printf_i+0x15c>
    3322:	4685                	li	a3,1
    3324:	865a                	mv	a2,s6
    3326:	85ca                	mv	a1,s2
    3328:	8526                	mv	a0,s1
    332a:	9982                	jalr	s3
    332c:	f1450ae3          	beq	a0,s4,3240 <_printf_i+0x15a>
    3330:	0a85                	addi	s5,s5,1
    3332:	445c                	lw	a5,12(s0)
    3334:	4732                	lw	a4,12(sp)
    3336:	8f99                	sub	a5,a5,a4
    3338:	fefac5e3          	blt	s5,a5,3322 <_printf_i+0x23c>
    333c:	bfe9                	j	3316 <_printf_i+0x230>
    333e:	4a81                	li	s5,0
    3340:	01940b13          	addi	s6,s0,25
    3344:	b7fd                	j	3332 <_printf_i+0x24c>

00003346 <__swhatbuf_r>:
    3346:	7159                	addi	sp,sp,-112
    3348:	d4a2                	sw	s0,104(sp)
    334a:	842e                	mv	s0,a1
    334c:	00e59583          	lh	a1,14(a1)
    3350:	d2a6                	sw	s1,100(sp)
    3352:	d0ca                	sw	s2,96(sp)
    3354:	d686                	sw	ra,108(sp)
    3356:	84b2                	mv	s1,a2
    3358:	8936                	mv	s2,a3
    335a:	0205d363          	bgez	a1,3380 <__swhatbuf_r+0x3a>
    335e:	00c45783          	lhu	a5,12(s0)
    3362:	0807f793          	andi	a5,a5,128
    3366:	eb8d                	bnez	a5,3398 <__swhatbuf_r+0x52>
    3368:	40000713          	li	a4,1024
    336c:	50b6                	lw	ra,108(sp)
    336e:	5426                	lw	s0,104(sp)
    3370:	00f92023          	sw	a5,0(s2)
    3374:	c098                	sw	a4,0(s1)
    3376:	5906                	lw	s2,96(sp)
    3378:	5496                	lw	s1,100(sp)
    337a:	4501                	li	a0,0
    337c:	6165                	addi	sp,sp,112
    337e:	8082                	ret
    3380:	0030                	addi	a2,sp,8
    3382:	2a11                	jal	3496 <_fstat_r>
    3384:	fc054de3          	bltz	a0,335e <__swhatbuf_r+0x18>
    3388:	47b2                	lw	a5,12(sp)
    338a:	673d                	lui	a4,0xf
    338c:	8ff9                	and	a5,a5,a4
    338e:	7779                	lui	a4,0xffffe
    3390:	97ba                	add	a5,a5,a4
    3392:	0017b793          	seqz	a5,a5
    3396:	bfc9                	j	3368 <__swhatbuf_r+0x22>
    3398:	4781                	li	a5,0
    339a:	04000713          	li	a4,64
    339e:	b7f9                	j	336c <__swhatbuf_r+0x26>

000033a0 <__smakebuf_r>:
    33a0:	00c5d783          	lhu	a5,12(a1)
    33a4:	1101                	addi	sp,sp,-32
    33a6:	cc22                	sw	s0,24(sp)
    33a8:	ce06                	sw	ra,28(sp)
    33aa:	ca26                	sw	s1,20(sp)
    33ac:	c84a                	sw	s2,16(sp)
    33ae:	8b89                	andi	a5,a5,2
    33b0:	842e                	mv	s0,a1
    33b2:	cf89                	beqz	a5,33cc <__smakebuf_r+0x2c>
    33b4:	04740793          	addi	a5,s0,71
    33b8:	c01c                	sw	a5,0(s0)
    33ba:	c81c                	sw	a5,16(s0)
    33bc:	4785                	li	a5,1
    33be:	c85c                	sw	a5,20(s0)
    33c0:	40f2                	lw	ra,28(sp)
    33c2:	4462                	lw	s0,24(sp)
    33c4:	44d2                	lw	s1,20(sp)
    33c6:	4942                	lw	s2,16(sp)
    33c8:	6105                	addi	sp,sp,32
    33ca:	8082                	ret
    33cc:	0074                	addi	a3,sp,12
    33ce:	0030                	addi	a2,sp,8
    33d0:	84aa                	mv	s1,a0
    33d2:	3f95                	jal	3346 <__swhatbuf_r>
    33d4:	4922                	lw	s2,8(sp)
    33d6:	8526                	mv	a0,s1
    33d8:	85ca                	mv	a1,s2
    33da:	c14ff0ef          	jal	27ee <_malloc_r>
    33de:	00c41783          	lh	a5,12(s0)
    33e2:	e911                	bnez	a0,33f6 <__smakebuf_r+0x56>
    33e4:	2007f713          	andi	a4,a5,512
    33e8:	ff61                	bnez	a4,33c0 <__smakebuf_r+0x20>
    33ea:	9bf1                	andi	a5,a5,-4
    33ec:	0027e793          	ori	a5,a5,2
    33f0:	00f41623          	sh	a5,12(s0)
    33f4:	b7c1                	j	33b4 <__smakebuf_r+0x14>
    33f6:	0807e793          	ori	a5,a5,128
    33fa:	00f41623          	sh	a5,12(s0)
    33fe:	47b2                	lw	a5,12(sp)
    3400:	c008                	sw	a0,0(s0)
    3402:	c808                	sw	a0,16(s0)
    3404:	01242a23          	sw	s2,20(s0)
    3408:	dfc5                	beqz	a5,33c0 <__smakebuf_r+0x20>
    340a:	00e41583          	lh	a1,14(s0)
    340e:	8526                	mv	a0,s1
    3410:	2845                	jal	34c0 <_isatty_r>
    3412:	d55d                	beqz	a0,33c0 <__smakebuf_r+0x20>
    3414:	00c45783          	lhu	a5,12(s0)
    3418:	9bf1                	andi	a5,a5,-4
    341a:	0017e793          	ori	a5,a5,1
    341e:	00f41623          	sh	a5,12(s0)
    3422:	bf79                	j	33c0 <__smakebuf_r+0x20>

00003424 <_putc_r>:
    3424:	1101                	addi	sp,sp,-32
    3426:	cc22                	sw	s0,24(sp)
    3428:	ce06                	sw	ra,28(sp)
    342a:	842a                	mv	s0,a0
    342c:	c909                	beqz	a0,343e <_putc_r+0x1a>
    342e:	511c                	lw	a5,32(a0)
    3430:	e799                	bnez	a5,343e <_putc_r+0x1a>
    3432:	c632                	sw	a2,12(sp)
    3434:	c42e                	sw	a1,8(sp)
    3436:	f5ffe0ef          	jal	2394 <__sinit>
    343a:	4632                	lw	a2,12(sp)
    343c:	45a2                	lw	a1,8(sp)
    343e:	461c                	lw	a5,8(a2)
    3440:	17fd                	addi	a5,a5,-1
    3442:	c61c                	sw	a5,8(a2)
    3444:	0207d063          	bgez	a5,3464 <_putc_r+0x40>
    3448:	4e18                	lw	a4,24(a2)
    344a:	00e7c763          	blt	a5,a4,3458 <_putc_r+0x34>
    344e:	0ff5f793          	zext.b	a5,a1
    3452:	4729                	li	a4,10
    3454:	00e79863          	bne	a5,a4,3464 <_putc_r+0x40>
    3458:	8522                	mv	a0,s0
    345a:	4462                	lw	s0,24(sp)
    345c:	40f2                	lw	ra,28(sp)
    345e:	6105                	addi	sp,sp,32
    3460:	f1aff06f          	j	2b7a <__swbuf_r>
    3464:	421c                	lw	a5,0(a2)
    3466:	0ff5f513          	zext.b	a0,a1
    346a:	00178713          	addi	a4,a5,1
    346e:	c218                	sw	a4,0(a2)
    3470:	00b78023          	sb	a1,0(a5)
    3474:	40f2                	lw	ra,28(sp)
    3476:	4462                	lw	s0,24(sp)
    3478:	6105                	addi	sp,sp,32
    347a:	8082                	ret

0000347c <memchr>:
    347c:	0ff5f593          	zext.b	a1,a1
    3480:	962a                	add	a2,a2,a0
    3482:	00c51463          	bne	a0,a2,348a <memchr+0xe>
    3486:	4501                	li	a0,0
    3488:	8082                	ret
    348a:	00054783          	lbu	a5,0(a0)
    348e:	feb78de3          	beq	a5,a1,3488 <memchr+0xc>
    3492:	0505                	addi	a0,a0,1
    3494:	b7fd                	j	3482 <memchr+0x6>

00003496 <_fstat_r>:
    3496:	1141                	addi	sp,sp,-16
    3498:	c422                	sw	s0,8(sp)
    349a:	842a                	mv	s0,a0
    349c:	852e                	mv	a0,a1
    349e:	85b2                	mv	a1,a2
    34a0:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    34a4:	c606                	sw	ra,12(sp)
    34a6:	d7bfe0ef          	jal	2220 <_fstat>
    34aa:	57fd                	li	a5,-1
    34ac:	00f51663          	bne	a0,a5,34b8 <_fstat_r+0x22>
    34b0:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    34b4:	c391                	beqz	a5,34b8 <_fstat_r+0x22>
    34b6:	c01c                	sw	a5,0(s0)
    34b8:	40b2                	lw	ra,12(sp)
    34ba:	4422                	lw	s0,8(sp)
    34bc:	0141                	addi	sp,sp,16
    34be:	8082                	ret

000034c0 <_isatty_r>:
    34c0:	1141                	addi	sp,sp,-16
    34c2:	c422                	sw	s0,8(sp)
    34c4:	842a                	mv	s0,a0
    34c6:	852e                	mv	a0,a1
    34c8:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    34cc:	c606                	sw	ra,12(sp)
    34ce:	d5bfe0ef          	jal	2228 <_isatty>
    34d2:	57fd                	li	a5,-1
    34d4:	00f51663          	bne	a0,a5,34e0 <_isatty_r+0x20>
    34d8:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    34dc:	c391                	beqz	a5,34e0 <_isatty_r+0x20>
    34de:	c01c                	sw	a5,0(s0)
    34e0:	40b2                	lw	ra,12(sp)
    34e2:	4422                	lw	s0,8(sp)
    34e4:	0141                	addi	sp,sp,16
    34e6:	8082                	ret

000034e8 <main>:
    } else {
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
    }
}

int main(void) {
    34e8:	7159                	addi	sp,sp,-112
    34ea:	d686                	sw	ra,108(sp)
    34ec:	d4a2                	sw	s0,104(sp)
    34ee:	d2a6                	sw	s1,100(sp)
    34f0:	d0ca                	sw	s2,96(sp)
    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
    34f2:	4785                	li	a5,1
    34f4:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    34f8:	4401                	li	s0,0
    34fa:	b0041073          	csrw	mcycle,s0

    printf("   KECCAK ABSORPTION TEST            \n");
    34fe:	650d                	lui	a0,0x3
    3500:	6d450513          	addi	a0,a0,1748 # 36d4 <main+0x1ec>
    3504:	e6eff0ef          	jal	2b72 <puts>
    printf("Testing SHA3/SHAKE with HW acceleration\n\n");
    3508:	650d                	lui	a0,0x3
    350a:	6fc50513          	addi	a0,a0,1788 # 36fc <main+0x214>
    350e:	e64ff0ef          	jal	2b72 <puts>
    printf("Test: SHA3-256 single block\n");
    3512:	650d                	lui	a0,0x3
    3514:	72850513          	addi	a0,a0,1832 # 3728 <main+0x240>
    3518:	e5aff0ef          	jal	2b72 <puts>
    const uint8_t expected[32] = {
    351c:	6791                	lui	a5,0x4
    351e:	80078793          	addi	a5,a5,-2048 # 3800 <main+0x318>
    3522:	0007a303          	lw	t1,0(a5)
    3526:	0047a883          	lw	a7,4(a5)
    352a:	0087a803          	lw	a6,8(a5)
    352e:	47c8                	lw	a0,12(a5)
    3530:	4b8c                	lw	a1,16(a5)
    3532:	4bd0                	lw	a2,20(a5)
    3534:	4f94                	lw	a3,24(a5)
    3536:	4fd8                	lw	a4,28(a5)
    const uint8_t msg[] = "abc";
    3538:	006367b7          	lui	a5,0x636
    353c:	26178793          	addi	a5,a5,609 # 636261 <_sp+0x5f7611>
    3540:	c63e                	sw	a5,12(sp)
    const uint8_t expected[32] = {
    3542:	d81a                	sw	t1,48(sp)
    3544:	da46                	sw	a7,52(sp)
    3546:	dc42                	sw	a6,56(sp)
    3548:	de2a                	sw	a0,60(sp)
    354a:	c0ae                	sw	a1,64(sp)
    354c:	c2b2                	sw	a2,68(sp)
    354e:	c4b6                	sw	a3,72(sp)
    3550:	c6ba                	sw	a4,76(sp)
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    3552:	b0041073          	csrw	mcycle,s0
    sha3_256(hash, msg, sizeof(msg)-1);
    3556:	460d                	li	a2,3
    3558:	0808                	addi	a0,sp,16
    355a:	006c                	addi	a1,sp,12
    355c:	d12fd0ef          	jal	a6e <pqcrystals_kyber_fips202_ref_sha3_256>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    3560:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    3564:	650d                	lui	a0,0x3
    3566:	74450513          	addi	a0,a0,1860 # 3744 <main+0x25c>
    356a:	d30ff0ef          	jal	2a9a <iprintf>
    total_tests++;
    356e:	c301a403          	lw	s0,-976(gp) # ec30 <total_tests>
    if(memcmp(result, expected, len) == 0) {
    3572:	180c                	addi	a1,sp,48
    3574:	0808                	addi	a0,sp,16
    total_tests++;
    3576:	0405                	addi	s0,s0,1
    if(memcmp(result, expected, len) == 0) {
    3578:	02000613          	li	a2,32
    total_tests++;
    357c:	c281a823          	sw	s0,-976(gp) # ec30 <total_tests>
    if(memcmp(result, expected, len) == 0) {
    3580:	f50ff0ef          	jal	2cd0 <memcmp>
    3584:	e521                	bnez	a0,35cc <main+0xe4>
        passed_tests++;
    3586:	c2c1a583          	lw	a1,-980(gp) # ec2c <passed_tests>
    358a:	0585                	addi	a1,a1,1
    358c:	c2b1a623          	sw	a1,-980(gp) # ec2c <passed_tests>
    test_sha3_256_multi_block();
    test_shake128();
    test_shake256();
    test_multi_squeeze();
    */
    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
    3590:	650d                	lui	a0,0x3
    3592:	8622                	mv	a2,s0
    3594:	7a450513          	addi	a0,a0,1956 # 37a4 <main+0x2bc>
    3598:	d02ff0ef          	jal	2a9a <iprintf>

    if (passed_tests == total_tests) {
    359c:	c2c1a703          	lw	a4,-980(gp) # ec2c <passed_tests>
    35a0:	c301a783          	lw	a5,-976(gp) # ec30 <total_tests>
    35a4:	00f70e63          	beq	a4,a5,35c0 <main+0xd8>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
    35a8:	650d                	lui	a0,0x3
    35aa:	7dc50513          	addi	a0,a0,2012 # 37dc <main+0x2f4>
    35ae:	dc4ff0ef          	jal	2b72 <puts>
    }

    return EXIT_SUCCESS;
}
    35b2:	50b6                	lw	ra,108(sp)
    35b4:	5426                	lw	s0,104(sp)
    35b6:	5496                	lw	s1,100(sp)
    35b8:	5906                	lw	s2,96(sp)
    35ba:	4501                	li	a0,0
    35bc:	6165                	addi	sp,sp,112
    35be:	8082                	ret
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    35c0:	650d                	lui	a0,0x3
    35c2:	7bc50513          	addi	a0,a0,1980 # 37bc <main+0x2d4>
    35c6:	dacff0ef          	jal	2b72 <puts>
    35ca:	b7e5                	j	35b2 <main+0xca>
        printf("[FAIL] %s\n", test_name);
    35cc:	658d                	lui	a1,0x3
    35ce:	650d                	lui	a0,0x3
    35d0:	75458593          	addi	a1,a1,1876 # 3754 <main+0x26c>
    35d4:	76c50513          	addi	a0,a0,1900 # 376c <main+0x284>
    35d8:	cece                	sw	s3,92(sp)
    35da:	ccd2                	sw	s4,88(sp)
    35dc:	cbeff0ef          	jal	2a9a <iprintf>
        printf("  Expected: ");
    35e0:	650d                	lui	a0,0x3
    35e2:	77850513          	addi	a0,a0,1912 # 3778 <main+0x290>
    35e6:	cb4ff0ef          	jal	2a9a <iprintf>
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", expected[i]);
    35ea:	1800                	addi	s0,sp,48
    35ec:	04010993          	addi	s3,sp,64
    35f0:	648d                	lui	s1,0x3
    35f2:	00044583          	lbu	a1,0(s0)
    35f6:	78848513          	addi	a0,s1,1928 # 3788 <main+0x2a0>
    35fa:	0405                	addi	s0,s0,1
    35fc:	c9eff0ef          	jal	2a9a <iprintf>
    3600:	ff3419e3          	bne	s0,s3,35f2 <main+0x10a>
        if(len > 16) printf("...");
    3604:	6a0d                	lui	s4,0x3
    3606:	790a0513          	addi	a0,s4,1936 # 3790 <main+0x2a8>
    360a:	c90ff0ef          	jal	2a9a <iprintf>
        printf("\n  Got:      ");
    360e:	650d                	lui	a0,0x3
    3610:	79450513          	addi	a0,a0,1940 # 3794 <main+0x2ac>
    3614:	c86ff0ef          	jal	2a9a <iprintf>
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", result[i]);
    3618:	0800                	addi	s0,sp,16
    361a:	02010993          	addi	s3,sp,32
    361e:	00044583          	lbu	a1,0(s0)
    3622:	78848513          	addi	a0,s1,1928
    3626:	0405                	addi	s0,s0,1
    3628:	c72ff0ef          	jal	2a9a <iprintf>
    362c:	ff3419e3          	bne	s0,s3,361e <main+0x136>
        if(len > 16) printf("...");
    3630:	790a0513          	addi	a0,s4,1936
    3634:	c66ff0ef          	jal	2a9a <iprintf>
        printf("\n");
    3638:	4529                	li	a0,10
    363a:	c88ff0ef          	jal	2ac2 <putchar>
    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
    363e:	c301a403          	lw	s0,-976(gp) # ec30 <total_tests>
    3642:	c2c1a583          	lw	a1,-980(gp) # ec2c <passed_tests>
    3646:	49f6                	lw	s3,92(sp)
    3648:	4a66                	lw	s4,88(sp)
        return 0;
    364a:	b799                	j	3590 <main+0xa8>
    364c:	20ac                	fld	fa1,64(s1)
    364e:	0000                	unimp
    3650:	20ac                	fld	fa1,64(s1)
    3652:	0000                	unimp
    3654:	20b6                	fld	ft1,328(sp)
    3656:	0000                	unimp
    3658:	20c0                	fld	fs0,128(s1)
    365a:	0000                	unimp
    365c:	20a0                	fld	fs0,64(s1)
    365e:	0000                	unimp
    3660:	20a2                	fld	ft1,8(sp)
    3662:	0000                	unimp
    3664:	20a0                	fld	fs0,64(s1)
    3666:	0000                	unimp
    3668:	20a2                	fld	ft1,8(sp)
    366a:	0000                	unimp
    366c:	20a0                	fld	fs0,64(s1)
    366e:	0000                	unimp
    3670:	20a0                	fld	fs0,64(s1)
    3672:	0000                	unimp
    3674:	20a0                	fld	fs0,64(s1)
    3676:	0000                	unimp
    3678:	20ca                	fld	ft1,144(sp)
    367a:	0000                	unimp
    367c:	fada                	fsw	fs6,116(sp)
    367e:	ffff                	.insn	2, 0xffff
    3680:	faf0                	fsw	fa2,116(a3)
    3682:	ffff                	.insn	2, 0xffff
    3684:	fab0                	fsw	fa2,112(a3)
    3686:	ffff                	.insn	2, 0xffff
    3688:	fab0                	fsw	fa2,112(a3)
    368a:	ffff                	.insn	2, 0xffff
    368c:	fab0                	fsw	fa2,112(a3)
    368e:	ffff                	.insn	2, 0xffff
    3690:	fab0                	fsw	fa2,112(a3)
    3692:	ffff                	.insn	2, 0xffff
    3694:	faf0                	fsw	fa2,116(a3)
    3696:	ffff                	.insn	2, 0xffff
    3698:	fab0                	fsw	fa2,112(a3)
    369a:	ffff                	.insn	2, 0xffff
    369c:	fab0                	fsw	fa2,112(a3)
    369e:	ffff                	.insn	2, 0xffff
    36a0:	fab0                	fsw	fa2,112(a3)
    36a2:	ffff                	.insn	2, 0xffff
    36a4:	fab0                	fsw	fa2,112(a3)
    36a6:	ffff                	.insn	2, 0xffff
    36a8:	fc30                	fsw	fa2,120(s0)
    36aa:	ffff                	.insn	2, 0xffff
    36ac:	fb2e                	fsw	fa1,180(sp)
    36ae:	ffff                	.insn	2, 0xffff
    36b0:	fbda                	fsw	fs6,244(sp)
    36b2:	ffff                	.insn	2, 0xffff
    36b4:	fab0                	fsw	fa2,112(a3)
    36b6:	ffff                	.insn	2, 0xffff
    36b8:	fab0                	fsw	fa2,112(a3)
    36ba:	ffff                	.insn	2, 0xffff
    36bc:	fc60                	fsw	fs0,124(s0)
    36be:	ffff                	.insn	2, 0xffff
    36c0:	fab0                	fsw	fa2,112(a3)
    36c2:	ffff                	.insn	2, 0xffff
    36c4:	fb2e                	fsw	fa1,180(sp)
    36c6:	ffff                	.insn	2, 0xffff
    36c8:	fab0                	fsw	fa2,112(a3)
    36ca:	ffff                	.insn	2, 0xffff
    36cc:	fab0                	fsw	fa2,112(a3)
    36ce:	ffff                	.insn	2, 0xffff
    36d0:	fbe2                	fsw	fs8,244(sp)
    36d2:	ffff                	.insn	2, 0xffff
    36d4:	2020                	fld	fs0,64(s0)
    36d6:	4b20                	lw	s0,80(a4)
    36d8:	4345                	li	t1,17
    36da:	204b4143          	fmadd.s	ft2,fs6,ft4,ft4,rmm
    36de:	4241                	li	tp,16
    36e0:	50524f53          	.insn	4, 0x50524f53
    36e4:	4954                	lw	a3,20(a0)
    36e6:	54204e4f          	.insn	4, 0x54204e4f
    36ea:	5345                	li	t1,-15
    36ec:	2054                	fld	fa3,128(s0)
    36ee:	2020                	fld	fs0,64(s0)
    36f0:	2020                	fld	fs0,64(s0)
    36f2:	2020                	fld	fs0,64(s0)
    36f4:	2020                	fld	fs0,64(s0)
    36f6:	2020                	fld	fs0,64(s0)
    36f8:	0020                	addi	s0,sp,8
    36fa:	0000                	unimp
    36fc:	6554                	flw	fa3,12(a0)
    36fe:	6e697473          	csrrci	s0,0x6e6,18
    3702:	48532067          	.insn	4, 0x48532067
    3706:	3341                	jal	3486 <memchr+0xa>
    3708:	4148532f          	.insn	4, 0x4148532f
    370c:	7720454b          	.insn	4, 0x7720454b
    3710:	7469                	lui	s0,0xffffa
    3712:	2068                	fld	fa0,192(s0)
    3714:	5748                	lw	a0,44(a4)
    3716:	6120                	flw	fs0,64(a0)
    3718:	6c656363          	bltu	a0,t1,3dde <_etext+0x436>
    371c:	7265                	lui	tp,0xffff9
    371e:	7461                	lui	s0,0xffff8
    3720:	6f69                	lui	t5,0x1a
    3722:	0a6e                	slli	s4,s4,0x1b
    3724:	0000                	unimp
    3726:	0000                	unimp
    3728:	6554                	flw	fa3,12(a0)
    372a:	203a7473          	csrrci	s0,0x203,20
    372e:	33414853          	.insn	4, 0x33414853
    3732:	322d                	jal	305c <_printf_common+0x88>
    3734:	3635                	jal	3260 <_printf_i+0x17a>
    3736:	7320                	flw	fs0,96(a4)
    3738:	6e69                	lui	t3,0x1a
    373a:	20656c67          	.insn	4, 0x20656c67
    373e:	6c62                	flw	fs8,24(sp)
    3740:	006b636f          	jal	t1,b9746 <_sp+0x7aaf6>
    3744:	2020                	fld	fs0,64(s0)
    3746:	6c637943          	.insn	4, 0x6c637943
    374a:	7365                	lui	t1,0xffff9
    374c:	203a                	fld	ft0,392(sp)
    374e:	7525                	lui	a0,0xfffe9
    3750:	000a                	c.slli	zero,0x2
    3752:	0000                	unimp
    3754:	33414853          	.insn	4, 0x33414853
    3758:	322d                	jal	3082 <w25q.c.a2dff0dd+0x14>
    375a:	3635                	jal	3286 <_printf_i+0x1a0>
    375c:	7320                	flw	fs0,96(a4)
    375e:	6e69                	lui	t3,0x1a
    3760:	20656c67          	.insn	4, 0x20656c67
    3764:	6c62                	flw	fs8,24(sp)
    3766:	006b636f          	jal	t1,b976c <_sp+0x7ab1c>
    376a:	0000                	unimp
    376c:	4941465b          	.insn	4, 0x4941465b
    3770:	5d4c                	lw	a1,60(a0)
    3772:	2520                	fld	fs0,72(a0)
    3774:	00000a73          	.insn	4, 0x0a73
    3778:	2020                	fld	fs0,64(s0)
    377a:	7845                	lui	a6,0xffff1
    377c:	6570                	flw	fa2,76(a0)
    377e:	64657463          	bgeu	a0,t1,3dc6 <_etext+0x41e>
    3782:	203a                	fld	ft0,392(sp)
    3784:	0000                	unimp
    3786:	0000                	unimp
    3788:	3025                	jal	2fb0 <_vfiprintf_r+0x23e>
    378a:	7832                	flw	fa6,44(sp)
    378c:	0000                	unimp
    378e:	0000                	unimp
    3790:	2e2e                	fld	ft8,200(sp)
    3792:	002e                	c.slli	zero,0xb
    3794:	200a                	fld	ft0,128(sp)
    3796:	4720                	lw	s0,72(a4)
    3798:	203a746f          	jal	s0,ab19a <_sp+0x6c54a>
    379c:	2020                	fld	fs0,64(s0)
    379e:	2020                	fld	fs0,64(s0)
    37a0:	0020                	addi	s0,sp,8
    37a2:	0000                	unimp
    37a4:	2020                	fld	fs0,64(s0)
    37a6:	6554                	flw	fa3,12(a0)
    37a8:	3a737473          	csrrci	s0,0x3a7,6
    37ac:	2520                	fld	fs0,72(a0)
    37ae:	2f64                	fld	fs1,216(a4)
    37b0:	6425                	lui	s0,0x9
    37b2:	7020                	flw	fs0,96(s0)
    37b4:	7361                	lui	t1,0xffff8
    37b6:	0a646573          	csrrsi	a0,0xa6,8
    37ba:	0000                	unimp
    37bc:	4946                	lw	s2,80(sp)
    37be:	414e                	lw	sp,208(sp)
    37c0:	204c                	fld	fa1,128(s0)
    37c2:	54415453          	.insn	4, 0x54415453
    37c6:	5355                	li	t1,-11
    37c8:	203a                	fld	ft0,392(sp)
    37ca:	4c41                	li	s8,16
    37cc:	204c                	fld	fa1,128(s0)
    37ce:	4554                	lw	a3,12(a0)
    37d0:	20535453          	.insn	4, 0x20535453
    37d4:	4150                	lw	a2,4(a0)
    37d6:	44455353          	.insn	4, 0x44455353
    37da:	0000                	unimp
    37dc:	4946                	lw	s2,80(sp)
    37de:	414e                	lw	sp,208(sp)
    37e0:	204c                	fld	fa1,128(s0)
    37e2:	54415453          	.insn	4, 0x54415453
    37e6:	5355                	li	t1,-11
    37e8:	203a                	fld	ft0,392(sp)
    37ea:	4554                	lw	a3,12(a0)
    37ec:	46205453          	.insn	4, 0x46205453
    37f0:	4941                	li	s2,16
    37f2:	554c                	lw	a1,44(a0)
    37f4:	4552                	lw	a0,20(sp)
    37f6:	4420                	lw	s0,72(s0)
    37f8:	5445                	li	s0,-15
    37fa:	4345                	li	t1,17
    37fc:	4554                	lw	a3,12(a0)
    37fe:	0044                	addi	s1,sp,4
    3800:	983a                	add	a6,a6,a4
    3802:	a75d                	j	3fa8 <_etext+0x600>
    3804:	b225e24f          	fnmadd.d	ft4,fa1,ft2,fs6,unknown
    3808:	5c04                	lw	s1,56(s0)
    380a:	d36b2d17          	auipc	s10,0xd36b2
    380e:	bd90                	fsd	fa2,56(a1)
    3810:	5f85                	li	t6,-31
    3812:	6e08                	flw	fa0,24(a2)
    3814:	9d3e                	add	s10,s10,a5
    3816:	5b52                	lw	s6,52(sp)
    3818:	bf46                	fsd	fa7,440(sp)
    381a:	45e2                	lw	a1,24(sp)
    381c:	4311                	li	t1,4
    381e:	3215                	jal	3142 <_printf_i+0x5c>
    3820:	0000                	unimp
    3822:	0000                	unimp
    3824:	544d                	li	s0,-13
    3826:	4156                	lw	sp,84(sp)
    3828:	204c                	fld	fa1,128(s0)
    382a:	6176                	flw	ft2,92(sp)
    382c:	756c                	flw	fa1,108(a0)
    382e:	2065                	jal	38d6 <main+0x3ee>
    3830:	7369                	lui	t1,0xffffa
    3832:	0020                	addi	s0,sp,8
    3834:	6e49                	lui	t3,0x12
    3836:	75727473          	csrrci	s0,0x757,4
    383a:	6f697463          	bgeu	s2,s6,3f22 <_etext+0x57a>
    383e:	206e                	fld	ft0,216(sp)
    3840:	6361                	lui	t1,0x18
    3842:	73736563          	bltu	t1,s7,3f6c <_etext+0x5c4>
    3846:	6620                	flw	fs0,72(a2)
    3848:	7561                	lui	a0,0xffff8
    384a:	746c                	flw	fa1,108(s0)
    384c:	202c                	fld	fa1,64(s0)
    384e:	746d                	lui	s0,0xffffb
    3850:	6176                	flw	ft2,92(sp)
    3852:	206c                	fld	fa1,192(s0)
    3854:	776f6873          	csrrsi	a6,0x776,30
    3858:	61662073          	csrs	0x616,a2
    385c:	6c75                	lui	s8,0x1d
    385e:	2074                	fld	fa3,192(s0)
    3860:	6461                	lui	s0,0x18
    3862:	7264                	flw	fs1,100(a2)
    3864:	7365                	lui	t1,0xffff9
    3866:	00000a73          	.insn	4, 0x0a73
    386a:	0000                	unimp
    386c:	6c49                	lui	s8,0x12
    386e:	656c                	flw	fa1,76(a0)
    3870:	206c6167          	.insn	4, 0x206c6167
    3874:	6e49                	lui	t3,0x12
    3876:	75727473          	csrrci	s0,0x757,4
    387a:	6f697463          	bgeu	s2,s6,3f62 <_etext+0x5ba>
    387e:	206e                	fld	ft0,216(sp)
    3880:	6166                	flw	ft2,88(sp)
    3882:	6c75                	lui	s8,0x1d
    3884:	2c74                	fld	fa3,216(s0)
    3886:	6d20                	flw	fs0,88(a0)
    3888:	7674                	flw	fa3,108(a2)
    388a:	6c61                	lui	s8,0x18
    388c:	7320                	flw	fs0,96(a4)
    388e:	6f68                	flw	fa0,92(a4)
    3890:	69207377          	.insn	4, 0x69207377
    3894:	736e                	flw	ft6,248(sp)
    3896:	7274                	flw	fa3,100(a2)
    3898:	6375                	lui	t1,0x1d
    389a:	6974                	flw	fa3,84(a0)
    389c:	63206e6f          	jal	t3,9ece <syscalls.c.b6d2745e+0xf12>
    38a0:	65746e6f          	jal	t3,4a6f6 <_sp+0xbaa6>
    38a4:	746e                	flw	fs0,248(sp)
    38a6:	000a                	c.slli	zero,0x2
    38a8:	7242                	flw	ft4,48(sp)
    38aa:	6165                	addi	sp,sp,112
    38ac:	696f706b          	.insn	4, 0x696f706b
    38b0:	746e                	flw	fs0,248(sp)
    38b2:	7420                	flw	fs0,104(s0)
    38b4:	6972                	flw	fs2,28(sp)
    38b6:	72656767          	.insn	4, 0x72656767
    38ba:	2c64                	fld	fs1,216(s0)
    38bc:	6d20                	flw	fs0,88(a0)
    38be:	7674                	flw	fa3,108(a2)
    38c0:	6c61                	lui	s8,0x18
    38c2:	7320                	flw	fs0,96(a4)
    38c4:	6f68                	flw	fa0,92(a4)
    38c6:	74207377          	.insn	4, 0x74207377
    38ca:	6568                	flw	fa0,76(a0)
    38cc:	6220                	flw	fs0,64(a2)
    38ce:	6572                	flw	fa0,28(sp)
    38d0:	6b61                	lui	s6,0x18
    38d2:	6f70                	flw	fa2,92(a4)
    38d4:	6e69                	lui	t3,0x1a
    38d6:	2074                	fld	fa3,192(s0)
    38d8:	6461                	lui	s0,0x18
    38da:	7264                	flw	fs1,100(a2)
    38dc:	7365                	lui	t1,0xffff9
    38de:	00000a73          	.insn	4, 0x0a73
    38e2:	0000                	unimp
    38e4:	6f4c                	flw	fa1,28(a4)
    38e6:	6461                	lui	s0,0x18
    38e8:	6f74532f          	.insn	4, 0x6f74532f
    38ec:	6572                	flw	fa0,28(sp)
    38ee:	6620                	flw	fs0,72(a2)
    38f0:	7561                	lui	a0,0xffff8
    38f2:	746c                	flw	fa1,108(s0)
    38f4:	202c                	fld	fa1,64(s0)
    38f6:	746d                	lui	s0,0xffffb
    38f8:	6176                	flw	ft2,92(sp)
    38fa:	206c                	fld	fa1,192(s0)
    38fc:	776f6873          	csrrsi	a6,0x776,30
    3900:	68742073          	csrs	0x687,s0
    3904:	2065                	jal	39ac <_etext+0x4>
    3906:	6166                	flw	ft2,88(sp)
    3908:	6c75                	lui	s8,0x1d
    390a:	2074                	fld	fa3,192(s0)
    390c:	6461                	lui	s0,0x18
    390e:	7264                	flw	fs1,100(a2)
    3910:	7365                	lui	t1,0xffff9
    3912:	00000a73          	.insn	4, 0x0a73
    3916:	0000                	unimp
    3918:	6e45                	lui	t3,0x11
    391a:	6976                	flw	fs2,92(sp)
    391c:	6f72                	flw	ft10,28(sp)
    391e:	6d6e                	flw	fs10,216(sp)
    3920:	6e65                	lui	t3,0x19
    3922:	2074                	fld	fa3,192(s0)
    3924:	6c6c6163          	bltu	s8,t1,3fe6 <_etext+0x63e>
    3928:	6520                	flw	fs0,72(a0)
    392a:	636e                	flw	ft6,216(sp)
    392c:	746e756f          	jal	a0,eb072 <_sp+0xac422>
    3930:	7265                	lui	tp,0xffff9
    3932:	6465                	lui	s0,0x19
    3934:	000a                	c.slli	zero,0x2
    3936:	0000                	unimp
    3938:	74666f53          	.insn	4, 0x74666f53
    393c:	65726177          	.insn	4, 0x65726177
    3940:	4920                	lw	s0,80(a0)
    3942:	5152                	lw	sp,52(sp)
    3944:	7420                	flw	fs0,104(s0)
    3946:	6972                	flw	fs2,28(sp)
    3948:	72656767          	.insn	4, 0x72656767
    394c:	6465                	lui	s0,0x19
    394e:	0a21                	addi	s4,s4,8
    3950:	0000                	unimp
    3952:	0000                	unimp
    3954:	6954                	flw	fa3,20(a0)
    3956:	656d                	lui	a0,0x1b
    3958:	2072                	fld	ft0,280(sp)
    395a:	5249                	li	tp,-14
    395c:	2051                	jal	39e0 <_etext+0x38>
    395e:	7274                	flw	fa3,100(a2)
    3960:	6769                	lui	a4,0x1a
    3962:	65726567          	.insn	4, 0x65726567
    3966:	2164                	fld	fs1,192(a0)
    3968:	000a                	c.slli	zero,0x2
    396a:	0000                	unimp
    396c:	2b302d23          	sw	s3,698(zero) # 2ba <w25q128jw_read_standard+0x84>
    3970:	0020                	addi	s0,sp,8
    3972:	0000                	unimp
    3974:	6c68                	flw	fa0,92(s0)
    3976:	004c                	addi	a1,sp,4
    3978:	6665                	lui	a2,0x19
    397a:	47464567          	.insn	4, 0x47464567
    397e:	0000                	unimp
    3980:	3130                	fld	fa2,96(a0)
    3982:	3332                	fld	ft6,296(sp)
    3984:	3534                	fld	fa3,104(a0)
    3986:	3736                	fld	fa4,360(sp)
    3988:	3938                	fld	fa4,112(a0)
    398a:	4241                	li	tp,16
    398c:	46454443          	.insn	4, 0x46454443
    3990:	0000                	unimp
    3992:	0000                	unimp
    3994:	3130                	fld	fa2,96(a0)
    3996:	3332                	fld	ft6,296(sp)
    3998:	3534                	fld	fa3,104(a0)
    399a:	3736                	fld	fa4,360(sp)
    399c:	3938                	fld	fa4,112(a0)
    399e:	6261                	lui	tp,0x18
    39a0:	66656463          	bltu	a0,t1,4008 <_etext+0x660>
    39a4:	0000                	unimp
	...
