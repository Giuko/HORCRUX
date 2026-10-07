
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	2300206f          	j	2230 <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	5c40006f          	j	5c8 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	5c00006f          	j	5c8 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	3000206f          	j	230c <handler_irq_software>
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
  1c:	3880206f          	j	23a4 <handler_irq_timer>
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
  2c:	0940106f          	j	10c0 <handler_irq_external>
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
  40:	1bc0106f          	j	11fc <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	2e00106f          	j	1324 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	4040106f          	j	144c <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	7950106f          	j	1fe0 <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	5950006f          	j	de4 <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	7010006f          	j	f54 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	6440106f          	j	169c <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	7680106f          	j	17c4 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	08d0106f          	j	18ec <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	1b10106f          	j	1a14 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	2d50106f          	j	1b3c <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	3f90106f          	j	1c64 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	5210106f          	j	1d90 <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	6450106f          	j	1eb8 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	0900206f          	j	2108 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	4f80106f          	j	1574 <handler_irq_fast_external_peripheral>

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
 1ae:	00004597          	auipc	a1,0x4
 1b2:	db258593          	addi	a1,a1,-590 # 3f60 <_etext>
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
 20c:	5c250513          	addi	a0,a0,1474 # 27ca <__libc_fini_array>
    call atexit
 210:	294020ef          	jal	24a4 <atexit>
    call __libc_init_array
 214:	568020ef          	jal	277c <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 218:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 21a:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 21c:	4601                	li	a2,0
    call main
 21e:	630030ef          	jal	384e <main>
    tail exit
 222:	28c0206f          	j	24ae <exit>

00000226 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 226:	216020ef          	jal	243c <init>

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

00000a12 <keccak_absorb_once_hw>:
**************************************************/
static void keccak_absorb_once_hw(unsigned int r,
                                   const uint8_t *in,
                                   size_t inlen,
                                   uint8_t p)
{
     a12:	7155                	addi	sp,sp,-208
     a14:	c1ce                	sw	s3,192(sp)
     a16:	dd56                	sw	s5,184(sp)
     a18:	89b2                	mv	s3,a2
     a1a:	8aaa                	mv	s5,a0
     a1c:	c3ca                	sw	s2,196(sp)
     a1e:	df52                	sw	s4,188(sp)
     a20:	db5a                	sw	s6,180(sp)
     a22:	c786                	sw	ra,204(sp)
     a24:	c5a6                	sw	s1,200(sp)
     a26:	8a2e                	mv	s4,a1
     a28:	8b36                	mv	s6,a3
  unsigned int i;
  unsigned int rate_words = r / 4; /* number of 32-bit words in rate (always even) */
     a2a:	00255913          	srli	s2,a0,0x2

  /* 1. Zero HW state */
  keccak_hw_init();
     a2e:	3605                	jal	54e <keccak_hw_init>

  /* 2. Absorb full blocks: XOR rate words into HW, then permute in-place */
  while(inlen >= r) {
     a30:	0759e063          	bltu	s3,s5,a90 <keccak_absorb_once_hw+0x7e>
     a34:	d95e                	sw	s7,176(sp)
    for(i = 0; i < rate_words; i += 2)
     a36:	84d2                	mv	s1,s4
     a38:	4b81                	li	s7,0
         ((uint32_t)x[2] << 16) | ((uint32_t)x[3] << 24);
     a3a:	0054c803          	lbu	a6,5(s1)
     a3e:	0014c683          	lbu	a3,1(s1)
     a42:	0004c603          	lbu	a2,0(s1)
     a46:	0044c883          	lbu	a7,4(s1)
     a4a:	0064c703          	lbu	a4,6(s1)
     a4e:	0024c783          	lbu	a5,2(s1)
     a52:	0074c583          	lbu	a1,7(s1)
     a56:	0034c503          	lbu	a0,3(s1)
     a5a:	0822                	slli	a6,a6,0x8
     a5c:	06a2                	slli	a3,a3,0x8
     a5e:	8ed1                	or	a3,a3,a2
     a60:	01186833          	or	a6,a6,a7
     a64:	0742                	slli	a4,a4,0x10
     a66:	07c2                	slli	a5,a5,0x10
     a68:	01076733          	or	a4,a4,a6
     a6c:	8fd5                	or	a5,a5,a3
     a6e:	05e2                	slli	a1,a1,0x18
     a70:	0562                	slli	a0,a0,0x18
      keccak_hw_absorb_xor(load32(in + 4*i), load32(in + 4*(i+1)), i);
     a72:	865e                	mv	a2,s7
     a74:	8dd9                	or	a1,a1,a4
     a76:	8d5d                	or	a0,a0,a5
    for(i = 0; i < rate_words; i += 2)
     a78:	0b89                	addi	s7,s7,2
      keccak_hw_absorb_xor(load32(in + 4*i), load32(in + 4*(i+1)), i);
     a7a:	3ce9                	jal	554 <keccak_hw_absorb_xor>
    for(i = 0; i < rate_words; i += 2)
     a7c:	04a1                	addi	s1,s1,8
     a7e:	fb2beee3          	bltu	s7,s2,a3a <keccak_absorb_once_hw+0x28>
    in += r;
    inlen -= r;
     a82:	415989b3          	sub	s3,s3,s5
    in += r;
     a86:	9a56                	add	s4,s4,s5
    keccak_hw_permute();
     a88:	3cc9                	jal	55a <keccak_hw_permute>
  while(inlen >= r) {
     a8a:	fb59f6e3          	bgeu	s3,s5,a36 <keccak_absorb_once_hw+0x24>
     a8e:	5bca                	lw	s7,176(sp)
  }

  /* 3. Absorb remaining bytes + domain byte + final bit
   *    Build 32-bit XOR words for the partial block */
  {
    uint32_t xor_buf[42] = {0}; /* max rate_words = 168/4 = 42 (SHAKE128) */
     a90:	0024                	addi	s1,sp,8
     a92:	8526                	mv	a0,s1
     a94:	0a800613          	li	a2,168
     a98:	4581                	li	a1,0
     a9a:	3621                	jal	5a2 <memset>

    for(i = 0; i < inlen; i++)
     a9c:	02098a63          	beqz	s3,ad0 <keccak_absorb_once_hw+0xbe>
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     aa0:	000a4703          	lbu	a4,0(s4)
    for(i = 0; i < inlen; i++)
     aa4:	4785                	li	a5,1
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     aa6:	c43a                	sw	a4,8(sp)
    for(i = 0; i < inlen; i++)
     aa8:	02f98463          	beq	s3,a5,ad0 <keccak_absorb_once_hw+0xbe>
      xor_buf[i/4] |= (uint32_t)in[i] << (8*(i%4));
     aac:	ffc7f693          	andi	a3,a5,-4
     ab0:	00fa0733          	add	a4,s4,a5
     ab4:	96a6                	add	a3,a3,s1
     ab6:	00074703          	lbu	a4,0(a4) # 20000000 <_sp+0x1ffc13b0>
     aba:	428c                	lw	a1,0(a3)
     abc:	0037f613          	andi	a2,a5,3
     ac0:	060e                	slli	a2,a2,0x3
     ac2:	00c71733          	sll	a4,a4,a2
     ac6:	8f4d                	or	a4,a4,a1
     ac8:	c298                	sw	a4,0(a3)
    for(i = 0; i < inlen; i++)
     aca:	0785                	addi	a5,a5,1
     acc:	ff3790e3          	bne	a5,s3,aac <keccak_absorb_once_hw+0x9a>

    /* Domain separation byte at position inlen */
    xor_buf[inlen/4] |= (uint32_t)p << (8*(inlen%4));
     ad0:	ffc9f693          	andi	a3,s3,-4
     ad4:	96a6                	add	a3,a3,s1
     ad6:	4290                	lw	a2,0(a3)
     ad8:	0039f793          	andi	a5,s3,3
     adc:	078e                	slli	a5,a5,0x3
     ade:	00fb1733          	sll	a4,s6,a5

    /* Final bit: bit 63 of last rate lane = bit 31 of word (rate_words - 1) */
    xor_buf[rate_words - 1] |= 0x80000000u;
     ae2:	fff90793          	addi	a5,s2,-1
    xor_buf[inlen/4] |= (uint32_t)p << (8*(inlen%4));
     ae6:	8f51                	or	a4,a4,a2
    xor_buf[rate_words - 1] |= 0x80000000u;
     ae8:	078a                	slli	a5,a5,0x2
    xor_buf[inlen/4] |= (uint32_t)p << (8*(inlen%4));
     aea:	c298                	sw	a4,0(a3)
    xor_buf[rate_words - 1] |= 0x80000000u;
     aec:	97a6                	add	a5,a5,s1
     aee:	4398                	lw	a4,0(a5)
     af0:	800006b7          	lui	a3,0x80000

    /* XOR non-zero pairs into HW state */
    for(i = 0; i < rate_words; i += 2) {
     af4:	4981                	li	s3,0
    xor_buf[rate_words - 1] |= 0x80000000u;
     af6:	8f55                	or	a4,a4,a3
     af8:	c398                	sw	a4,0(a5)
    for(i = 0; i < rate_words; i += 2) {
     afa:	a029                	j	b04 <keccak_absorb_once_hw+0xf2>
     afc:	0989                	addi	s3,s3,2
     afe:	04a1                	addi	s1,s1,8
     b00:	0129fd63          	bgeu	s3,s2,b1a <keccak_absorb_once_hw+0x108>
      if(xor_buf[i] | xor_buf[i+1])
     b04:	4088                	lw	a0,0(s1)
     b06:	40cc                	lw	a1,4(s1)
     b08:	00b567b3          	or	a5,a0,a1
     b0c:	dbe5                	beqz	a5,afc <keccak_absorb_once_hw+0xea>
        keccak_hw_absorb_xor(xor_buf[i], xor_buf[i+1], i);
     b0e:	864e                	mv	a2,s3
    for(i = 0; i < rate_words; i += 2) {
     b10:	0989                	addi	s3,s3,2
        keccak_hw_absorb_xor(xor_buf[i], xor_buf[i+1], i);
     b12:	3489                	jal	554 <keccak_hw_absorb_xor>
    for(i = 0; i < rate_words; i += 2) {
     b14:	04a1                	addi	s1,s1,8
     b16:	ff29e7e3          	bltu	s3,s2,b04 <keccak_absorb_once_hw+0xf2>
    }
  }
}
     b1a:	40be                	lw	ra,204(sp)
     b1c:	44ae                	lw	s1,200(sp)
     b1e:	491e                	lw	s2,196(sp)
     b20:	498e                	lw	s3,192(sp)
     b22:	5a7a                	lw	s4,188(sp)
     b24:	5aea                	lw	s5,184(sp)
     b26:	5b5a                	lw	s6,180(sp)
     b28:	6169                	addi	sp,sp,208
     b2a:	8082                	ret

00000b2c <keccak_hw_store_bytes>:
* Description: Read bytes from the HW keccak result (after permutation).
*
* Arguments:   - uint8_t *out: pointer to output buffer
*              - size_t len: number of bytes to read
**************************************************/
static void keccak_hw_store_bytes(uint8_t *out, size_t len) {
     b2c:	1101                	addi	sp,sp,-32
     b2e:	c84e                	sw	s3,16(sp)
     b30:	c652                	sw	s4,12(sp)
     b32:	c456                	sw	s5,8(sp)
     b34:	ce06                	sw	ra,28(sp)
     b36:	cc26                	sw	s1,24(sp)
  unsigned int i;
  uint32_t w;

  /* Full 32-bit words */
  for(i = 0; i < len/4; i++) {
     b38:	0025d993          	srli	s3,a1,0x2
static void keccak_hw_store_bytes(uint8_t *out, size_t len) {
     b3c:	8a2a                	mv	s4,a0
    out[4*i+2] = (uint8_t)(w >> 16);
    out[4*i+3] = (uint8_t)(w >> 24);
  }

  /* Remaining bytes (< 4) */
  if(len % 4) {
     b3e:	0035fa93          	andi	s5,a1,3
  for(i = 0; i < len/4; i++) {
     b42:	06098c63          	beqz	s3,bba <keccak_hw_store_bytes+0x8e>
     b46:	ca4a                	sw	s2,20(sp)
     b48:	84aa                	mv	s1,a0
     b4a:	4901                	li	s2,0
    w = keccak_hw_store_word(i);
     b4c:	854a                	mv	a0,s2
     b4e:	3491                	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     b50:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     b54:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     b58:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     b5c:	00a48023          	sb	a0,0(s1)
    out[4*i+1] = (uint8_t)(w >> 8);
     b60:	00d480a3          	sb	a3,1(s1)
    out[4*i+2] = (uint8_t)(w >> 16);
     b64:	00e48123          	sb	a4,2(s1)
    out[4*i+3] = (uint8_t)(w >> 24);
     b68:	00f481a3          	sb	a5,3(s1)
  for(i = 0; i < len/4; i++) {
     b6c:	0905                	addi	s2,s2,1
     b6e:	0491                	addi	s1,s1,4
     b70:	fd391ee3          	bne	s2,s3,b4c <keccak_hw_store_bytes+0x20>
  if(len % 4) {
     b74:	000a9a63          	bnez	s5,b88 <keccak_hw_store_bytes+0x5c>
    w = keccak_hw_store_word(i);
    for(unsigned int b = 0; b < len % 4; b++)
      out[4*i + b] = (uint8_t)(w >> (8*b));
  }
}
     b78:	40f2                	lw	ra,28(sp)
     b7a:	4952                	lw	s2,20(sp)
     b7c:	44e2                	lw	s1,24(sp)
     b7e:	49c2                	lw	s3,16(sp)
     b80:	4a32                	lw	s4,12(sp)
     b82:	4aa2                	lw	s5,8(sp)
     b84:	6105                	addi	sp,sp,32
     b86:	8082                	ret
     b88:	4952                	lw	s2,20(sp)
      out[4*i + b] = (uint8_t)(w >> (8*b));
     b8a:	00299493          	slli	s1,s3,0x2
    w = keccak_hw_store_word(i);
     b8e:	854e                	mv	a0,s3
     b90:	3409                	jal	592 <keccak_hw_store_word>
    for(unsigned int b = 0; b < len % 4; b++)
     b92:	4781                	li	a5,0
      out[4*i + b] = (uint8_t)(w >> (8*b));
     b94:	00978733          	add	a4,a5,s1
     b98:	00379693          	slli	a3,a5,0x3
     b9c:	9752                	add	a4,a4,s4
     b9e:	00d556b3          	srl	a3,a0,a3
     ba2:	00d70023          	sb	a3,0(a4)
    for(unsigned int b = 0; b < len % 4; b++)
     ba6:	0785                	addi	a5,a5,1
     ba8:	ff57e6e3          	bltu	a5,s5,b94 <keccak_hw_store_bytes+0x68>
}
     bac:	40f2                	lw	ra,28(sp)
     bae:	44e2                	lw	s1,24(sp)
     bb0:	49c2                	lw	s3,16(sp)
     bb2:	4a32                	lw	s4,12(sp)
     bb4:	4aa2                	lw	s5,8(sp)
     bb6:	6105                	addi	sp,sp,32
     bb8:	8082                	ret
  for(i = 0; i < len/4; i++) {
     bba:	4481                	li	s1,0
     bbc:	bfc9                	j	b8e <keccak_hw_store_bytes+0x62>

00000bbe <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     bbe:	1141                	addi	sp,sp,-16
     bc0:	c426                	sw	s1,8(sp)
     bc2:	c606                	sw	ra,12(sp)
     bc4:	84aa                	mv	s1,a0
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     bc6:	364020ef          	jal	2f2a <strlen>
}
     bca:	40b2                	lw	ra,12(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     bcc:	85a6                	mv	a1,s1
}
     bce:	44a2                	lw	s1,8(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     bd0:	00150613          	addi	a2,a0,1
     bd4:	4505                	li	a0,1
}
     bd6:	0141                	addi	sp,sp,16
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     bd8:	bcf9                	j	6b6 <_write>

00000bda <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     bda:	1101                	addi	sp,sp,-32
     bdc:	ce06                	sw	ra,28(sp)
     bde:	cc26                	sw	s1,24(sp)
  _writestr(msg );
     be0:	3ff9                	jal	bbe <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     be2:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     be6:	6511                	lui	a0,0x4
     be8:	ddc50513          	addi	a0,a0,-548 # 3ddc <main+0x58e>
     bec:	3fc9                	jal	bbe <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     bee:	01049793          	slli	a5,s1,0x10
     bf2:	83c1                	srli	a5,a5,0x10
     bf4:	00849713          	slli	a4,s1,0x8
     bf8:	83a1                	srli	a5,a5,0x8
     bfa:	0184d693          	srli	a3,s1,0x18
     bfe:	8fd9                	or	a5,a5,a4
     c00:	80c1                	srli	s1,s1,0x10
     c02:	4729                	li	a4,10
  _writestr(p);
     c04:	0028                	addi	a0,sp,8
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     c06:	00d10423          	sb	a3,8(sp)
     c0a:	009104a3          	sb	s1,9(sp)
     c0e:	00f11523          	sh	a5,10(sp)
     c12:	00e11623          	sh	a4,12(sp)
  _writestr(p);
     c16:	3765                	jal	bbe <_writestr>
  while (1) {
     c18:	a001                	j	c18 <print_exc_msg+0x3e>

00000c1a <pqcrystals_kyber_fips202_ref_shake128>:
*              - size_t outlen: requested output length in bytes
*              - const uint8_t *in: pointer to input
*              - size_t inlen: length of input in bytes
**************************************************/
void shake128(uint8_t *out, size_t outlen, const uint8_t *in, size_t inlen)
{
     c1a:	1101                	addi	sp,sp,-32
     c1c:	87b2                	mv	a5,a2
     c1e:	c652                	sw	s4,12(sp)
     c20:	c456                	sw	s5,8(sp)
     c22:	c25a                	sw	s6,4(sp)
  keccak_absorb_once_hw(SHAKE128_RATE, in, inlen, 0x1F);
     c24:	8636                	mv	a2,a3
{
     c26:	8aaa                	mv	s5,a0
     c28:	8a2e                	mv	s4,a1
  keccak_absorb_once_hw(SHAKE128_RATE, in, inlen, 0x1F);
     c2a:	46fd                	li	a3,31
     c2c:	85be                	mv	a1,a5
     c2e:	0a800513          	li	a0,168

  /* Squeeze full blocks (state stays in HW between permutations) */
  while(outlen >= SHAKE128_RATE) {
     c32:	0a700b13          	li	s6,167
{
     c36:	ce06                	sw	ra,28(sp)
  keccak_absorb_once_hw(SHAKE128_RATE, in, inlen, 0x1F);
     c38:	3be9                	jal	a12 <keccak_absorb_once_hw>
  while(outlen >= SHAKE128_RATE) {
     c3a:	054b7763          	bgeu	s6,s4,c88 <pqcrystals_kyber_fips202_ref_shake128+0x6e>
     c3e:	c84e                	sw	s3,16(sp)
     c40:	cc26                	sw	s1,24(sp)
     c42:	ca4a                	sw	s2,20(sp)
  for(i = 0; i < len/4; i++) {
     c44:	02a00993          	li	s3,42
    keccak_hw_permute();
     c48:	3a09                	jal	55a <keccak_hw_permute>
    keccak_hw_store_bytes(out, SHAKE128_RATE);
     c4a:	84d6                	mv	s1,s5
  for(i = 0; i < len/4; i++) {
     c4c:	4901                	li	s2,0
    w = keccak_hw_store_word(i);
     c4e:	854a                	mv	a0,s2
     c50:	3289                	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     c52:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     c56:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     c5a:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     c5e:	00a48023          	sb	a0,0(s1)
    out[4*i+1] = (uint8_t)(w >> 8);
     c62:	00d480a3          	sb	a3,1(s1)
    out[4*i+2] = (uint8_t)(w >> 16);
     c66:	00e48123          	sb	a4,2(s1)
    out[4*i+3] = (uint8_t)(w >> 24);
     c6a:	00f481a3          	sb	a5,3(s1)
  for(i = 0; i < len/4; i++) {
     c6e:	0905                	addi	s2,s2,1
     c70:	0491                	addi	s1,s1,4
     c72:	fd391ee3          	bne	s2,s3,c4e <pqcrystals_kyber_fips202_ref_shake128+0x34>
    out += SHAKE128_RATE;
    outlen -= SHAKE128_RATE;
     c76:	f58a0a13          	addi	s4,s4,-168
    out += SHAKE128_RATE;
     c7a:	0a8a8a93          	addi	s5,s5,168
  while(outlen >= SHAKE128_RATE) {
     c7e:	fd4b65e3          	bltu	s6,s4,c48 <pqcrystals_kyber_fips202_ref_shake128+0x2e>
     c82:	44e2                	lw	s1,24(sp)
     c84:	4952                	lw	s2,20(sp)
     c86:	49c2                	lw	s3,16(sp)
  }

  /* Squeeze remaining bytes */
  if(outlen > 0) {
     c88:	000a1863          	bnez	s4,c98 <pqcrystals_kyber_fips202_ref_shake128+0x7e>
    keccak_hw_permute();
    keccak_hw_store_bytes(out, outlen);
  }
}
     c8c:	40f2                	lw	ra,28(sp)
     c8e:	4a32                	lw	s4,12(sp)
     c90:	4aa2                	lw	s5,8(sp)
     c92:	4b12                	lw	s6,4(sp)
     c94:	6105                	addi	sp,sp,32
     c96:	8082                	ret
    keccak_hw_permute();
     c98:	30c9                	jal	55a <keccak_hw_permute>
}
     c9a:	40f2                	lw	ra,28(sp)
     c9c:	4b12                	lw	s6,4(sp)
    keccak_hw_store_bytes(out, outlen);
     c9e:	85d2                	mv	a1,s4
     ca0:	8556                	mv	a0,s5
}
     ca2:	4a32                	lw	s4,12(sp)
     ca4:	4aa2                	lw	s5,8(sp)
     ca6:	6105                	addi	sp,sp,32
    keccak_hw_store_bytes(out, outlen);
     ca8:	b551                	j	b2c <keccak_hw_store_bytes>

00000caa <pqcrystals_kyber_fips202_ref_shake256>:
*              - size_t outlen: requested output length in bytes
*              - const uint8_t *in: pointer to input
*              - size_t inlen: length of input in bytes
**************************************************/
void shake256(uint8_t *out, size_t outlen, const uint8_t *in, size_t inlen)
{
     caa:	1101                	addi	sp,sp,-32
     cac:	87b2                	mv	a5,a2
     cae:	c652                	sw	s4,12(sp)
     cb0:	c456                	sw	s5,8(sp)
     cb2:	c25a                	sw	s6,4(sp)
  keccak_absorb_once_hw(SHAKE256_RATE, in, inlen, 0x1F);
     cb4:	8636                	mv	a2,a3
{
     cb6:	8aaa                	mv	s5,a0
     cb8:	8a2e                	mv	s4,a1
  keccak_absorb_once_hw(SHAKE256_RATE, in, inlen, 0x1F);
     cba:	46fd                	li	a3,31
     cbc:	85be                	mv	a1,a5
     cbe:	08800513          	li	a0,136

  /* Squeeze full blocks (state stays in HW between permutations) */
  while(outlen >= SHAKE256_RATE) {
     cc2:	08700b13          	li	s6,135
{
     cc6:	ce06                	sw	ra,28(sp)
  keccak_absorb_once_hw(SHAKE256_RATE, in, inlen, 0x1F);
     cc8:	33a9                	jal	a12 <keccak_absorb_once_hw>
  while(outlen >= SHAKE256_RATE) {
     cca:	054b7863          	bgeu	s6,s4,d1a <pqcrystals_kyber_fips202_ref_shake256+0x70>
     cce:	c84e                	sw	s3,16(sp)
     cd0:	cc26                	sw	s1,24(sp)
     cd2:	ca4a                	sw	s2,20(sp)
  for(i = 0; i < len/4; i++) {
     cd4:	02200993          	li	s3,34
    keccak_hw_permute();
     cd8:	883ff0ef          	jal	55a <keccak_hw_permute>
    keccak_hw_store_bytes(out, SHAKE256_RATE);
     cdc:	84d6                	mv	s1,s5
  for(i = 0; i < len/4; i++) {
     cde:	4901                	li	s2,0
    w = keccak_hw_store_word(i);
     ce0:	854a                	mv	a0,s2
     ce2:	3845                	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     ce4:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     ce8:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     cec:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     cf0:	00a48023          	sb	a0,0(s1)
    out[4*i+1] = (uint8_t)(w >> 8);
     cf4:	00d480a3          	sb	a3,1(s1)
    out[4*i+2] = (uint8_t)(w >> 16);
     cf8:	00e48123          	sb	a4,2(s1)
    out[4*i+3] = (uint8_t)(w >> 24);
     cfc:	00f481a3          	sb	a5,3(s1)
  for(i = 0; i < len/4; i++) {
     d00:	0905                	addi	s2,s2,1
     d02:	0491                	addi	s1,s1,4
     d04:	fd391ee3          	bne	s2,s3,ce0 <pqcrystals_kyber_fips202_ref_shake256+0x36>
    out += SHAKE256_RATE;
    outlen -= SHAKE256_RATE;
     d08:	f78a0a13          	addi	s4,s4,-136
    out += SHAKE256_RATE;
     d0c:	088a8a93          	addi	s5,s5,136
  while(outlen >= SHAKE256_RATE) {
     d10:	fd4b64e3          	bltu	s6,s4,cd8 <pqcrystals_kyber_fips202_ref_shake256+0x2e>
     d14:	44e2                	lw	s1,24(sp)
     d16:	4952                	lw	s2,20(sp)
     d18:	49c2                	lw	s3,16(sp)
  }

  /* Squeeze remaining bytes */
  if(outlen > 0) {
     d1a:	000a1863          	bnez	s4,d2a <pqcrystals_kyber_fips202_ref_shake256+0x80>
    keccak_hw_permute();
    keccak_hw_store_bytes(out, outlen);
  }
}
     d1e:	40f2                	lw	ra,28(sp)
     d20:	4a32                	lw	s4,12(sp)
     d22:	4aa2                	lw	s5,8(sp)
     d24:	4b12                	lw	s6,4(sp)
     d26:	6105                	addi	sp,sp,32
     d28:	8082                	ret
    keccak_hw_permute();
     d2a:	831ff0ef          	jal	55a <keccak_hw_permute>
}
     d2e:	40f2                	lw	ra,28(sp)
     d30:	4b12                	lw	s6,4(sp)
    keccak_hw_store_bytes(out, outlen);
     d32:	85d2                	mv	a1,s4
     d34:	8556                	mv	a0,s5
}
     d36:	4a32                	lw	s4,12(sp)
     d38:	4aa2                	lw	s5,8(sp)
     d3a:	6105                	addi	sp,sp,32
    keccak_hw_store_bytes(out, outlen);
     d3c:	bbc5                	j	b2c <keccak_hw_store_bytes>

00000d3e <pqcrystals_kyber_fips202_ref_sha3_256>:
* Arguments:   - uint8_t *h: pointer to output (32 bytes)
*              - const uint8_t *in: pointer to input
*              - size_t inlen: length of input in bytes
**************************************************/
void sha3_256(uint8_t h[32], const uint8_t *in, size_t inlen)
{
     d3e:	1141                	addi	sp,sp,-16
     d40:	c426                	sw	s1,8(sp)
  keccak_absorb_once_hw(SHA3_256_RATE, in, inlen, 0x06);
     d42:	4699                	li	a3,6
{
     d44:	84aa                	mv	s1,a0
  keccak_absorb_once_hw(SHA3_256_RATE, in, inlen, 0x06);
     d46:	08800513          	li	a0,136
{
     d4a:	c606                	sw	ra,12(sp)
     d4c:	c24a                	sw	s2,4(sp)
     d4e:	c04e                	sw	s3,0(sp)
  for(i = 0; i < len/4; i++) {
     d50:	4901                	li	s2,0
  keccak_absorb_once_hw(SHA3_256_RATE, in, inlen, 0x06);
     d52:	31c1                	jal	a12 <keccak_absorb_once_hw>
  for(i = 0; i < len/4; i++) {
     d54:	49a1                	li	s3,8
  keccak_hw_permute();
     d56:	805ff0ef          	jal	55a <keccak_hw_permute>
    w = keccak_hw_store_word(i);
     d5a:	854a                	mv	a0,s2
     d5c:	837ff0ef          	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     d60:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     d64:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     d68:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     d6c:	00a48023          	sb	a0,0(s1)
    out[4*i+1] = (uint8_t)(w >> 8);
     d70:	00d480a3          	sb	a3,1(s1)
    out[4*i+2] = (uint8_t)(w >> 16);
     d74:	00e48123          	sb	a4,2(s1)
    out[4*i+3] = (uint8_t)(w >> 24);
     d78:	00f481a3          	sb	a5,3(s1)
  for(i = 0; i < len/4; i++) {
     d7c:	0905                	addi	s2,s2,1
     d7e:	0491                	addi	s1,s1,4
     d80:	fd391de3          	bne	s2,s3,d5a <pqcrystals_kyber_fips202_ref_sha3_256+0x1c>
  keccak_hw_store_bytes(h, 32);
}
     d84:	40b2                	lw	ra,12(sp)
     d86:	44a2                	lw	s1,8(sp)
     d88:	4912                	lw	s2,4(sp)
     d8a:	4982                	lw	s3,0(sp)
     d8c:	0141                	addi	sp,sp,16
     d8e:	8082                	ret

00000d90 <pqcrystals_kyber_fips202_ref_sha3_512>:
* Arguments:   - uint8_t *h: pointer to output (64 bytes)
*              - const uint8_t *in: pointer to input
*              - size_t inlen: length of input in bytes
**************************************************/
void sha3_512(uint8_t h[64], const uint8_t *in, size_t inlen)
{
     d90:	1141                	addi	sp,sp,-16
     d92:	c426                	sw	s1,8(sp)
  keccak_absorb_once_hw(SHA3_512_RATE, in, inlen, 0x06);
     d94:	4699                	li	a3,6
{
     d96:	84aa                	mv	s1,a0
  keccak_absorb_once_hw(SHA3_512_RATE, in, inlen, 0x06);
     d98:	04800513          	li	a0,72
{
     d9c:	c606                	sw	ra,12(sp)
     d9e:	c24a                	sw	s2,4(sp)
     da0:	c04e                	sw	s3,0(sp)
  for(i = 0; i < len/4; i++) {
     da2:	4901                	li	s2,0
  keccak_absorb_once_hw(SHA3_512_RATE, in, inlen, 0x06);
     da4:	31bd                	jal	a12 <keccak_absorb_once_hw>
  for(i = 0; i < len/4; i++) {
     da6:	49c1                	li	s3,16
  keccak_hw_permute();
     da8:	fb2ff0ef          	jal	55a <keccak_hw_permute>
    w = keccak_hw_store_word(i);
     dac:	854a                	mv	a0,s2
     dae:	fe4ff0ef          	jal	592 <keccak_hw_store_word>
    out[4*i+1] = (uint8_t)(w >> 8);
     db2:	00855693          	srli	a3,a0,0x8
    out[4*i+2] = (uint8_t)(w >> 16);
     db6:	01055713          	srli	a4,a0,0x10
    out[4*i+3] = (uint8_t)(w >> 24);
     dba:	01855793          	srli	a5,a0,0x18
    out[4*i]   = (uint8_t)(w);
     dbe:	00a48023          	sb	a0,0(s1)
    out[4*i+1] = (uint8_t)(w >> 8);
     dc2:	00d480a3          	sb	a3,1(s1)
    out[4*i+2] = (uint8_t)(w >> 16);
     dc6:	00e48123          	sb	a4,2(s1)
    out[4*i+3] = (uint8_t)(w >> 24);
     dca:	00f481a3          	sb	a5,3(s1)
  for(i = 0; i < len/4; i++) {
     dce:	0905                	addi	s2,s2,1
     dd0:	0491                	addi	s1,s1,4
     dd2:	fd391de3          	bne	s2,s3,dac <pqcrystals_kyber_fips202_ref_sha3_512+0x1c>
  keccak_hw_store_bytes(h, 64);
}
     dd6:	40b2                	lw	ra,12(sp)
     dd8:	44a2                	lw	s1,8(sp)
     dda:	4912                	lw	s2,4(sp)
     ddc:	4982                	lw	s3,0(sp)
     dde:	0141                	addi	sp,sp,16
     de0:	8082                	ret
	...

00000de4 <handler_irq_fast_spi>:
    // call the weak fic handler
    fic_irq_ext_peripheral();
}

void handler_irq_fast_spi(void)
{
     de4:	710d                	addi	sp,sp,-352
     de6:	14112e23          	sw	ra,348(sp)
     dea:	14512c23          	sw	t0,344(sp)
     dee:	003022f3          	frcsr	t0
     df2:	14a12423          	sw	a0,328(sp)
     df6:	12e12c23          	sw	a4,312(sp)
     dfa:	12f12a23          	sw	a5,308(sp)
     dfe:	14512a23          	sw	t0,340(sp)
     e02:	14612823          	sw	t1,336(sp)
     e06:	14712623          	sw	t2,332(sp)
     e0a:	14b12223          	sw	a1,324(sp)
     e0e:	14c12023          	sw	a2,320(sp)
     e12:	12d12e23          	sw	a3,316(sp)
     e16:	13012823          	sw	a6,304(sp)
     e1a:	13112623          	sw	a7,300(sp)
     e1e:	13c12423          	sw	t3,296(sp)
     e22:	13d12223          	sw	t4,292(sp)
     e26:	13e12023          	sw	t5,288(sp)
     e2a:	11f12e23          	sw	t6,284(sp)
     e2e:	a602                	fsd	ft0,264(sp)
     e30:	a206                	fsd	ft1,256(sp)
     e32:	bd8a                	fsd	ft2,248(sp)
     e34:	b98e                	fsd	ft3,240(sp)
     e36:	b592                	fsd	ft4,232(sp)
     e38:	b196                	fsd	ft5,224(sp)
     e3a:	ad9a                	fsd	ft6,216(sp)
     e3c:	a99e                	fsd	ft7,208(sp)
     e3e:	a5a2                	fsd	fs0,200(sp)
     e40:	a1a6                	fsd	fs1,192(sp)
     e42:	bd2a                	fsd	fa0,184(sp)
     e44:	b92e                	fsd	fa1,176(sp)
     e46:	b532                	fsd	fa2,168(sp)
     e48:	b136                	fsd	fa3,160(sp)
     e4a:	ad3a                	fsd	fa4,152(sp)
     e4c:	a93e                	fsd	fa5,144(sp)
     e4e:	a542                	fsd	fa6,136(sp)
     e50:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e52:	200607b7          	lui	a5,0x20060
{
     e56:	bcca                	fsd	fs2,120(sp)
     e58:	b8ce                	fsd	fs3,112(sp)
     e5a:	b4d2                	fsd	fs4,104(sp)
     e5c:	b0d6                	fsd	fs5,96(sp)
     e5e:	acda                	fsd	fs6,88(sp)
     e60:	a8de                	fsd	fs7,80(sp)
     e62:	a4e2                	fsd	fs8,72(sp)
     e64:	a0e6                	fsd	fs9,64(sp)
     e66:	bc6a                	fsd	fs10,56(sp)
     e68:	b86e                	fsd	fs11,48(sp)
     e6a:	b472                	fsd	ft8,40(sp)
     e6c:	b076                	fsd	ft9,32(sp)
     e6e:	ac7a                	fsd	ft10,24(sp)
     e70:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e72:	4741                	li	a4,16
     e74:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     e76:	30010537          	lui	a0,0x30010
     e7a:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     e7c:	03f7f793          	andi	a5,a5,63
    if (errors) {
     e80:	cfd9                	beqz	a5,f1e <handler_irq_fast_spi+0x13a>
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     e82:	67bd                	lui	a5,0xf
     e84:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     e88:	4fb8                	lw	a4,88(a5)
     e8a:	4789                	li	a5,2
     e8c:	0af70d63          	beq	a4,a5,f46 <handler_irq_fast_spi+0x162>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
    // call the weak fic handler
    fic_irq_spi();
}
     e90:	15c12083          	lw	ra,348(sp)
     e94:	15412283          	lw	t0,340(sp)
     e98:	00329073          	fscsr	t0
     e9c:	15812283          	lw	t0,344(sp)
     ea0:	15012303          	lw	t1,336(sp)
     ea4:	14c12383          	lw	t2,332(sp)
     ea8:	14812503          	lw	a0,328(sp)
     eac:	14412583          	lw	a1,324(sp)
     eb0:	14012603          	lw	a2,320(sp)
     eb4:	13c12683          	lw	a3,316(sp)
     eb8:	13812703          	lw	a4,312(sp)
     ebc:	13412783          	lw	a5,308(sp)
     ec0:	13012803          	lw	a6,304(sp)
     ec4:	12c12883          	lw	a7,300(sp)
     ec8:	12812e03          	lw	t3,296(sp)
     ecc:	12412e83          	lw	t4,292(sp)
     ed0:	12012f03          	lw	t5,288(sp)
     ed4:	11c12f83          	lw	t6,284(sp)
     ed8:	2032                	fld	ft0,264(sp)
     eda:	2092                	fld	ft1,256(sp)
     edc:	316e                	fld	ft2,248(sp)
     ede:	31ce                	fld	ft3,240(sp)
     ee0:	322e                	fld	ft4,232(sp)
     ee2:	328e                	fld	ft5,224(sp)
     ee4:	236e                	fld	ft6,216(sp)
     ee6:	23ce                	fld	ft7,208(sp)
     ee8:	242e                	fld	fs0,200(sp)
     eea:	248e                	fld	fs1,192(sp)
     eec:	356a                	fld	fa0,184(sp)
     eee:	35ca                	fld	fa1,176(sp)
     ef0:	362a                	fld	fa2,168(sp)
     ef2:	368a                	fld	fa3,160(sp)
     ef4:	276a                	fld	fa4,152(sp)
     ef6:	27ca                	fld	fa5,144(sp)
     ef8:	282a                	fld	fa6,136(sp)
     efa:	288a                	fld	fa7,128(sp)
     efc:	3966                	fld	fs2,120(sp)
     efe:	39c6                	fld	fs3,112(sp)
     f00:	3a26                	fld	fs4,104(sp)
     f02:	3a86                	fld	fs5,96(sp)
     f04:	2b66                	fld	fs6,88(sp)
     f06:	2bc6                	fld	fs7,80(sp)
     f08:	2c26                	fld	fs8,72(sp)
     f0a:	2c86                	fld	fs9,64(sp)
     f0c:	3d62                	fld	fs10,56(sp)
     f0e:	3dc2                	fld	fs11,48(sp)
     f10:	3e22                	fld	ft8,40(sp)
     f12:	3e82                	fld	ft9,32(sp)
     f14:	2f62                	fld	ft10,24(sp)
     f16:	2fc2                	fld	ft11,16(sp)
     f18:	6135                	addi	sp,sp,352
     f1a:	30200073          	mret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     f1e:	411c                	lw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     f20:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
     f22:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     f26:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_host1, &events);
     f28:	3c51                	jal	9bc <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     f2a:	67bd                	lui	a5,0xf
     f2c:	80078793          	addi	a5,a5,-2048 # e800 <peripherals>
     f30:	4fb8                	lw	a4,88(a5)
     f32:	4789                	li	a5,2
     f34:	f4f71ee3          	bne	a4,a5,e90 <handler_irq_fast_spi+0xac>
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     f38:	45b2                	lw	a1,12(sp)
     f3a:	653d                	lui	a0,0xf
     f3c:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     f40:	823ff0ef          	jal	762 <spi_event_handler>
     f44:	b7b1                	j	e90 <handler_irq_fast_spi+0xac>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     f46:	653d                	lui	a0,0xf
     f48:	84850513          	addi	a0,a0,-1976 # e848 <peripherals+0x48>
     f4c:	3aad                	jal	8c6 <spi_error_handler.isra.0>
     f4e:	b789                	j	e90 <handler_irq_fast_spi+0xac>
     f50:	0000                	unimp
	...

00000f54 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     f54:	710d                	addi	sp,sp,-352
     f56:	14112e23          	sw	ra,348(sp)
     f5a:	14512c23          	sw	t0,344(sp)
     f5e:	003022f3          	frcsr	t0
     f62:	14a12423          	sw	a0,328(sp)
     f66:	12e12c23          	sw	a4,312(sp)
     f6a:	12f12a23          	sw	a5,308(sp)
     f6e:	14512a23          	sw	t0,340(sp)
     f72:	14612823          	sw	t1,336(sp)
     f76:	14712623          	sw	t2,332(sp)
     f7a:	14b12223          	sw	a1,324(sp)
     f7e:	14c12023          	sw	a2,320(sp)
     f82:	12d12e23          	sw	a3,316(sp)
     f86:	13012823          	sw	a6,304(sp)
     f8a:	13112623          	sw	a7,300(sp)
     f8e:	13c12423          	sw	t3,296(sp)
     f92:	13d12223          	sw	t4,292(sp)
     f96:	13e12023          	sw	t5,288(sp)
     f9a:	11f12e23          	sw	t6,284(sp)
     f9e:	a602                	fsd	ft0,264(sp)
     fa0:	a206                	fsd	ft1,256(sp)
     fa2:	bd8a                	fsd	ft2,248(sp)
     fa4:	b98e                	fsd	ft3,240(sp)
     fa6:	b592                	fsd	ft4,232(sp)
     fa8:	b196                	fsd	ft5,224(sp)
     faa:	ad9a                	fsd	ft6,216(sp)
     fac:	a99e                	fsd	ft7,208(sp)
     fae:	a5a2                	fsd	fs0,200(sp)
     fb0:	a1a6                	fsd	fs1,192(sp)
     fb2:	bd2a                	fsd	fa0,184(sp)
     fb4:	b92e                	fsd	fa1,176(sp)
     fb6:	b532                	fsd	fa2,168(sp)
     fb8:	b136                	fsd	fa3,160(sp)
     fba:	ad3a                	fsd	fa4,152(sp)
     fbc:	a93e                	fsd	fa5,144(sp)
     fbe:	a542                	fsd	fa6,136(sp)
     fc0:	a146                	fsd	fa7,128(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fc2:	200607b7          	lui	a5,0x20060
{
     fc6:	bcca                	fsd	fs2,120(sp)
     fc8:	b8ce                	fsd	fs3,112(sp)
     fca:	b4d2                	fsd	fs4,104(sp)
     fcc:	b0d6                	fsd	fs5,96(sp)
     fce:	acda                	fsd	fs6,88(sp)
     fd0:	a8de                	fsd	fs7,80(sp)
     fd2:	a4e2                	fsd	fs8,72(sp)
     fd4:	a0e6                	fsd	fs9,64(sp)
     fd6:	bc6a                	fsd	fs10,56(sp)
     fd8:	b86e                	fsd	fs11,48(sp)
     fda:	b472                	fsd	ft8,40(sp)
     fdc:	b076                	fsd	ft9,32(sp)
     fde:	ac7a                	fsd	ft10,24(sp)
     fe0:	a87e                	fsd	ft11,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fe2:	02000713          	li	a4,32
     fe6:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     fe8:	20020537          	lui	a0,0x20020
     fec:	595c                	lw	a5,52(a0)
  return (bitfield >> index) & mask;
     fee:	03f7f793          	andi	a5,a5,63
    if (errors) {
     ff2:	cfd9                	beqz	a5,1090 <handler_irq_fast_spi_flash+0x13c>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     ff4:	653d                	lui	a0,0xf
     ff6:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
     ffa:	4b98                	lw	a4,16(a5)
     ffc:	4789                	li	a5,2
     ffe:	0af70c63          	beq	a4,a5,10b6 <handler_irq_fast_spi_flash+0x162>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
    // call the weak fic handler
    fic_irq_spi_flash();
}
    1002:	15c12083          	lw	ra,348(sp)
    1006:	15412283          	lw	t0,340(sp)
    100a:	00329073          	fscsr	t0
    100e:	15812283          	lw	t0,344(sp)
    1012:	15012303          	lw	t1,336(sp)
    1016:	14c12383          	lw	t2,332(sp)
    101a:	14812503          	lw	a0,328(sp)
    101e:	14412583          	lw	a1,324(sp)
    1022:	14012603          	lw	a2,320(sp)
    1026:	13c12683          	lw	a3,316(sp)
    102a:	13812703          	lw	a4,312(sp)
    102e:	13412783          	lw	a5,308(sp)
    1032:	13012803          	lw	a6,304(sp)
    1036:	12c12883          	lw	a7,300(sp)
    103a:	12812e03          	lw	t3,296(sp)
    103e:	12412e83          	lw	t4,292(sp)
    1042:	12012f03          	lw	t5,288(sp)
    1046:	11c12f83          	lw	t6,284(sp)
    104a:	2032                	fld	ft0,264(sp)
    104c:	2092                	fld	ft1,256(sp)
    104e:	316e                	fld	ft2,248(sp)
    1050:	31ce                	fld	ft3,240(sp)
    1052:	322e                	fld	ft4,232(sp)
    1054:	328e                	fld	ft5,224(sp)
    1056:	236e                	fld	ft6,216(sp)
    1058:	23ce                	fld	ft7,208(sp)
    105a:	242e                	fld	fs0,200(sp)
    105c:	248e                	fld	fs1,192(sp)
    105e:	356a                	fld	fa0,184(sp)
    1060:	35ca                	fld	fa1,176(sp)
    1062:	362a                	fld	fa2,168(sp)
    1064:	368a                	fld	fa3,160(sp)
    1066:	276a                	fld	fa4,152(sp)
    1068:	27ca                	fld	fa5,144(sp)
    106a:	282a                	fld	fa6,136(sp)
    106c:	288a                	fld	fa7,128(sp)
    106e:	3966                	fld	fs2,120(sp)
    1070:	39c6                	fld	fs3,112(sp)
    1072:	3a26                	fld	fs4,104(sp)
    1074:	3a86                	fld	fs5,96(sp)
    1076:	2b66                	fld	fs6,88(sp)
    1078:	2bc6                	fld	fs7,80(sp)
    107a:	2c26                	fld	fs8,72(sp)
    107c:	2c86                	fld	fs9,64(sp)
    107e:	3d62                	fld	fs10,56(sp)
    1080:	3dc2                	fld	fs11,48(sp)
    1082:	3e22                	fld	ft8,40(sp)
    1084:	3e82                	fld	ft9,32(sp)
    1086:	2f62                	fld	ft10,24(sp)
    1088:	2fc2                	fld	ft11,16(sp)
    108a:	6135                	addi	sp,sp,352
    108c:	30200073          	mret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
    1090:	411c                	lw	a5,0(a0)
        spi_get_events(spi_flash, &events);
    1092:	006c                	addi	a1,sp,12
  bitfield |= (value & mask) << index;
    1094:	0027e793          	ori	a5,a5,2
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
    1098:	c11c                	sw	a5,0(a0)
        spi_get_events(spi_flash, &events);
    109a:	320d                	jal	9bc <spi_get_events.isra.0>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
    109c:	653d                	lui	a0,0xf
    109e:	80050793          	addi	a5,a0,-2048 # e800 <peripherals>
    10a2:	4b98                	lw	a4,16(a5)
    10a4:	4789                	li	a5,2
    10a6:	f4f71ee3          	bne	a4,a5,1002 <handler_irq_fast_spi_flash+0xae>
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
    10aa:	45b2                	lw	a1,12(sp)
    10ac:	80050513          	addi	a0,a0,-2048
    10b0:	eb2ff0ef          	jal	762 <spi_event_handler>
    10b4:	b7b9                	j	1002 <handler_irq_fast_spi_flash+0xae>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
    10b6:	80050513          	addi	a0,a0,-2048
    10ba:	80dff0ef          	jal	8c6 <spi_error_handler.isra.0>
    10be:	b791                	j	1002 <handler_irq_fast_spi_flash+0xae>

000010c0 <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
    10c0:	710d                	addi	sp,sp,-352
    10c2:	14112e23          	sw	ra,348(sp)
    10c6:	14512c23          	sw	t0,344(sp)
    10ca:	003022f3          	frcsr	t0
    10ce:	14512a23          	sw	t0,340(sp)
    10d2:	14612823          	sw	t1,336(sp)
    10d6:	14712623          	sw	t2,332(sp)
    10da:	14912423          	sw	s1,328(sp)
    10de:	14a12223          	sw	a0,324(sp)
    10e2:	14b12023          	sw	a1,320(sp)
    10e6:	12c12e23          	sw	a2,316(sp)
    10ea:	12d12c23          	sw	a3,312(sp)
    10ee:	12e12a23          	sw	a4,308(sp)
    10f2:	12f12823          	sw	a5,304(sp)
    10f6:	13012623          	sw	a6,300(sp)
    10fa:	13112423          	sw	a7,296(sp)
    10fe:	13212223          	sw	s2,292(sp)
    1102:	13c12023          	sw	t3,288(sp)
    1106:	11d12e23          	sw	t4,284(sp)
    110a:	11e12c23          	sw	t5,280(sp)
    110e:	11f12a23          	sw	t6,276(sp)
    1112:	bd82                	fsd	ft0,248(sp)
    1114:	b986                	fsd	ft1,240(sp)
    1116:	b58a                	fsd	ft2,232(sp)
    1118:	b18e                	fsd	ft3,224(sp)
    111a:	ad92                	fsd	ft4,216(sp)
    111c:	a996                	fsd	ft5,208(sp)
    111e:	a59a                	fsd	ft6,200(sp)
    1120:	a19e                	fsd	ft7,192(sp)
    1122:	bd22                	fsd	fs0,184(sp)
    1124:	b926                	fsd	fs1,176(sp)
    1126:	b52a                	fsd	fa0,168(sp)
    1128:	b12e                	fsd	fa1,160(sp)
    112a:	ad32                	fsd	fa2,152(sp)
    112c:	a936                	fsd	fa3,144(sp)
    112e:	a53a                	fsd	fa4,136(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
    1130:	300004b7          	lui	s1,0x30000
{
    1134:	a13e                	fsd	fa5,128(sp)
  *claim_data = rv_plic_peri->CC0;
    1136:	20c4a903          	lw	s2,524(s1) # 3000020c <_sp+0x2ffc15bc>
{
    113a:	bcc2                	fsd	fa6,120(sp)
    113c:	b8c6                	fsd	fa7,112(sp)
    113e:	b4ca                	fsd	fs2,104(sp)
    1140:	b0ce                	fsd	fs3,96(sp)
    1142:	acd2                	fsd	fs4,88(sp)
    1144:	a8d6                	fsd	fs5,80(sp)
    1146:	a4da                	fsd	fs6,72(sp)
    1148:	a0de                	fsd	fs7,64(sp)
    114a:	bc62                	fsd	fs8,56(sp)
    114c:	b866                	fsd	fs9,48(sp)
    114e:	b46a                	fsd	fs10,40(sp)
    1150:	b06e                	fsd	fs11,32(sp)
    1152:	ac72                	fsd	ft8,24(sp)
    1154:	a876                	fsd	ft9,16(sp)
    1156:	a47a                	fsd	ft10,8(sp)
    1158:	a07e                	fsd	ft11,0(sp)
    handlers[int_id](int_id);
    115a:	4781                	li	a5,0
    115c:	854a                	mv	a0,s2
    115e:	9782                	jalr	a5
}
    1160:	15c12083          	lw	ra,348(sp)
    1164:	15412283          	lw	t0,340(sp)
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
    1168:	2124a623          	sw	s2,524(s1)
}
    116c:	00329073          	fscsr	t0
    1170:	15812283          	lw	t0,344(sp)
    1174:	15012303          	lw	t1,336(sp)
    1178:	14c12383          	lw	t2,332(sp)
    117c:	14812483          	lw	s1,328(sp)
    1180:	14412503          	lw	a0,324(sp)
    1184:	14012583          	lw	a1,320(sp)
    1188:	13c12603          	lw	a2,316(sp)
    118c:	13812683          	lw	a3,312(sp)
    1190:	13412703          	lw	a4,308(sp)
    1194:	13012783          	lw	a5,304(sp)
    1198:	12c12803          	lw	a6,300(sp)
    119c:	12812883          	lw	a7,296(sp)
    11a0:	12412903          	lw	s2,292(sp)
    11a4:	12012e03          	lw	t3,288(sp)
    11a8:	11c12e83          	lw	t4,284(sp)
    11ac:	11812f03          	lw	t5,280(sp)
    11b0:	11412f83          	lw	t6,276(sp)
    11b4:	306e                	fld	ft0,248(sp)
    11b6:	30ce                	fld	ft1,240(sp)
    11b8:	312e                	fld	ft2,232(sp)
    11ba:	318e                	fld	ft3,224(sp)
    11bc:	226e                	fld	ft4,216(sp)
    11be:	22ce                	fld	ft5,208(sp)
    11c0:	232e                	fld	ft6,200(sp)
    11c2:	238e                	fld	ft7,192(sp)
    11c4:	346a                	fld	fs0,184(sp)
    11c6:	34ca                	fld	fs1,176(sp)
    11c8:	352a                	fld	fa0,168(sp)
    11ca:	358a                	fld	fa1,160(sp)
    11cc:	266a                	fld	fa2,152(sp)
    11ce:	26ca                	fld	fa3,144(sp)
    11d0:	272a                	fld	fa4,136(sp)
    11d2:	278a                	fld	fa5,128(sp)
    11d4:	3866                	fld	fa6,120(sp)
    11d6:	38c6                	fld	fa7,112(sp)
    11d8:	3926                	fld	fs2,104(sp)
    11da:	3986                	fld	fs3,96(sp)
    11dc:	2a66                	fld	fs4,88(sp)
    11de:	2ac6                	fld	fs5,80(sp)
    11e0:	2b26                	fld	fs6,72(sp)
    11e2:	2b86                	fld	fs7,64(sp)
    11e4:	3c62                	fld	fs8,56(sp)
    11e6:	3cc2                	fld	fs9,48(sp)
    11e8:	3d22                	fld	fs10,40(sp)
    11ea:	3d82                	fld	fs11,32(sp)
    11ec:	2e62                	fld	ft8,24(sp)
    11ee:	2ec2                	fld	ft9,16(sp)
    11f0:	2f22                	fld	ft10,8(sp)
    11f2:	2f82                	fld	ft11,0(sp)
    11f4:	6135                	addi	sp,sp,352
    11f6:	30200073          	mret
	...

000011fc <handler_irq_fast_timer_1>:
{
    11fc:	714d                	addi	sp,sp,-336
    11fe:	14112623          	sw	ra,332(sp)
    1202:	14512423          	sw	t0,328(sp)
    1206:	003022f3          	frcsr	t0
    120a:	14512223          	sw	t0,324(sp)
    120e:	14612023          	sw	t1,320(sp)
    1212:	12712e23          	sw	t2,316(sp)
    1216:	12a12c23          	sw	a0,312(sp)
    121a:	12b12a23          	sw	a1,308(sp)
    121e:	12c12823          	sw	a2,304(sp)
    1222:	12d12623          	sw	a3,300(sp)
    1226:	12e12423          	sw	a4,296(sp)
    122a:	12f12223          	sw	a5,292(sp)
    122e:	13012023          	sw	a6,288(sp)
    1232:	11112e23          	sw	a7,284(sp)
    1236:	11c12c23          	sw	t3,280(sp)
    123a:	11d12a23          	sw	t4,276(sp)
    123e:	11e12823          	sw	t5,272(sp)
    1242:	11f12623          	sw	t6,268(sp)
    1246:	bd82                	fsd	ft0,248(sp)
    1248:	b986                	fsd	ft1,240(sp)
    124a:	b58a                	fsd	ft2,232(sp)
    124c:	b18e                	fsd	ft3,224(sp)
    124e:	ad92                	fsd	ft4,216(sp)
    1250:	a996                	fsd	ft5,208(sp)
    1252:	a59a                	fsd	ft6,200(sp)
    1254:	a19e                	fsd	ft7,192(sp)
    1256:	bd22                	fsd	fs0,184(sp)
    1258:	b926                	fsd	fs1,176(sp)
    125a:	b52a                	fsd	fa0,168(sp)
    125c:	b12e                	fsd	fa1,160(sp)
    125e:	ad32                	fsd	fa2,152(sp)
    1260:	a936                	fsd	fa3,144(sp)
    1262:	a53a                	fsd	fa4,136(sp)
    1264:	a13e                	fsd	fa5,128(sp)
    1266:	bcc2                	fsd	fa6,120(sp)
    1268:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    126a:	200607b7          	lui	a5,0x20060
{
    126e:	b4ca                	fsd	fs2,104(sp)
    1270:	b0ce                	fsd	fs3,96(sp)
    1272:	acd2                	fsd	fs4,88(sp)
    1274:	a8d6                	fsd	fs5,80(sp)
    1276:	a4da                	fsd	fs6,72(sp)
    1278:	a0de                	fsd	fs7,64(sp)
    127a:	bc62                	fsd	fs8,56(sp)
    127c:	b866                	fsd	fs9,48(sp)
    127e:	b46a                	fsd	fs10,40(sp)
    1280:	b06e                	fsd	fs11,32(sp)
    1282:	ac72                	fsd	ft8,24(sp)
    1284:	a876                	fsd	ft9,16(sp)
    1286:	a47a                	fsd	ft10,8(sp)
    1288:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    128a:	4705                	li	a4,1
    128c:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
    128e:	c16ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    1292:	14c12083          	lw	ra,332(sp)
    1296:	14412283          	lw	t0,324(sp)
    129a:	00329073          	fscsr	t0
    129e:	14812283          	lw	t0,328(sp)
    12a2:	14012303          	lw	t1,320(sp)
    12a6:	13c12383          	lw	t2,316(sp)
    12aa:	13812503          	lw	a0,312(sp)
    12ae:	13412583          	lw	a1,308(sp)
    12b2:	13012603          	lw	a2,304(sp)
    12b6:	12c12683          	lw	a3,300(sp)
    12ba:	12812703          	lw	a4,296(sp)
    12be:	12412783          	lw	a5,292(sp)
    12c2:	12012803          	lw	a6,288(sp)
    12c6:	11c12883          	lw	a7,284(sp)
    12ca:	11812e03          	lw	t3,280(sp)
    12ce:	11412e83          	lw	t4,276(sp)
    12d2:	11012f03          	lw	t5,272(sp)
    12d6:	10c12f83          	lw	t6,268(sp)
    12da:	306e                	fld	ft0,248(sp)
    12dc:	30ce                	fld	ft1,240(sp)
    12de:	312e                	fld	ft2,232(sp)
    12e0:	318e                	fld	ft3,224(sp)
    12e2:	226e                	fld	ft4,216(sp)
    12e4:	22ce                	fld	ft5,208(sp)
    12e6:	232e                	fld	ft6,200(sp)
    12e8:	238e                	fld	ft7,192(sp)
    12ea:	346a                	fld	fs0,184(sp)
    12ec:	34ca                	fld	fs1,176(sp)
    12ee:	352a                	fld	fa0,168(sp)
    12f0:	358a                	fld	fa1,160(sp)
    12f2:	266a                	fld	fa2,152(sp)
    12f4:	26ca                	fld	fa3,144(sp)
    12f6:	272a                	fld	fa4,136(sp)
    12f8:	278a                	fld	fa5,128(sp)
    12fa:	3866                	fld	fa6,120(sp)
    12fc:	38c6                	fld	fa7,112(sp)
    12fe:	3926                	fld	fs2,104(sp)
    1300:	3986                	fld	fs3,96(sp)
    1302:	2a66                	fld	fs4,88(sp)
    1304:	2ac6                	fld	fs5,80(sp)
    1306:	2b26                	fld	fs6,72(sp)
    1308:	2b86                	fld	fs7,64(sp)
    130a:	3c62                	fld	fs8,56(sp)
    130c:	3cc2                	fld	fs9,48(sp)
    130e:	3d22                	fld	fs10,40(sp)
    1310:	3d82                	fld	fs11,32(sp)
    1312:	2e62                	fld	ft8,24(sp)
    1314:	2ec2                	fld	ft9,16(sp)
    1316:	2f22                	fld	ft10,8(sp)
    1318:	2f82                	fld	ft11,0(sp)
    131a:	6171                	addi	sp,sp,336
    131c:	30200073          	mret
    1320:	0000                	unimp
	...

00001324 <handler_irq_fast_timer_2>:
{
    1324:	714d                	addi	sp,sp,-336
    1326:	14112623          	sw	ra,332(sp)
    132a:	14512423          	sw	t0,328(sp)
    132e:	003022f3          	frcsr	t0
    1332:	14512223          	sw	t0,324(sp)
    1336:	14612023          	sw	t1,320(sp)
    133a:	12712e23          	sw	t2,316(sp)
    133e:	12a12c23          	sw	a0,312(sp)
    1342:	12b12a23          	sw	a1,308(sp)
    1346:	12c12823          	sw	a2,304(sp)
    134a:	12d12623          	sw	a3,300(sp)
    134e:	12e12423          	sw	a4,296(sp)
    1352:	12f12223          	sw	a5,292(sp)
    1356:	13012023          	sw	a6,288(sp)
    135a:	11112e23          	sw	a7,284(sp)
    135e:	11c12c23          	sw	t3,280(sp)
    1362:	11d12a23          	sw	t4,276(sp)
    1366:	11e12823          	sw	t5,272(sp)
    136a:	11f12623          	sw	t6,268(sp)
    136e:	bd82                	fsd	ft0,248(sp)
    1370:	b986                	fsd	ft1,240(sp)
    1372:	b58a                	fsd	ft2,232(sp)
    1374:	b18e                	fsd	ft3,224(sp)
    1376:	ad92                	fsd	ft4,216(sp)
    1378:	a996                	fsd	ft5,208(sp)
    137a:	a59a                	fsd	ft6,200(sp)
    137c:	a19e                	fsd	ft7,192(sp)
    137e:	bd22                	fsd	fs0,184(sp)
    1380:	b926                	fsd	fs1,176(sp)
    1382:	b52a                	fsd	fa0,168(sp)
    1384:	b12e                	fsd	fa1,160(sp)
    1386:	ad32                	fsd	fa2,152(sp)
    1388:	a936                	fsd	fa3,144(sp)
    138a:	a53a                	fsd	fa4,136(sp)
    138c:	a13e                	fsd	fa5,128(sp)
    138e:	bcc2                	fsd	fa6,120(sp)
    1390:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1392:	200607b7          	lui	a5,0x20060
{
    1396:	b4ca                	fsd	fs2,104(sp)
    1398:	b0ce                	fsd	fs3,96(sp)
    139a:	acd2                	fsd	fs4,88(sp)
    139c:	a8d6                	fsd	fs5,80(sp)
    139e:	a4da                	fsd	fs6,72(sp)
    13a0:	a0de                	fsd	fs7,64(sp)
    13a2:	bc62                	fsd	fs8,56(sp)
    13a4:	b866                	fsd	fs9,48(sp)
    13a6:	b46a                	fsd	fs10,40(sp)
    13a8:	b06e                	fsd	fs11,32(sp)
    13aa:	ac72                	fsd	ft8,24(sp)
    13ac:	a876                	fsd	ft9,16(sp)
    13ae:	a47a                	fsd	ft10,8(sp)
    13b0:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    13b2:	4709                	li	a4,2
    13b4:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
    13b6:	aeeff0ef          	jal	6a4 <fic_irq_timer_1>
}
    13ba:	14c12083          	lw	ra,332(sp)
    13be:	14412283          	lw	t0,324(sp)
    13c2:	00329073          	fscsr	t0
    13c6:	14812283          	lw	t0,328(sp)
    13ca:	14012303          	lw	t1,320(sp)
    13ce:	13c12383          	lw	t2,316(sp)
    13d2:	13812503          	lw	a0,312(sp)
    13d6:	13412583          	lw	a1,308(sp)
    13da:	13012603          	lw	a2,304(sp)
    13de:	12c12683          	lw	a3,300(sp)
    13e2:	12812703          	lw	a4,296(sp)
    13e6:	12412783          	lw	a5,292(sp)
    13ea:	12012803          	lw	a6,288(sp)
    13ee:	11c12883          	lw	a7,284(sp)
    13f2:	11812e03          	lw	t3,280(sp)
    13f6:	11412e83          	lw	t4,276(sp)
    13fa:	11012f03          	lw	t5,272(sp)
    13fe:	10c12f83          	lw	t6,268(sp)
    1402:	306e                	fld	ft0,248(sp)
    1404:	30ce                	fld	ft1,240(sp)
    1406:	312e                	fld	ft2,232(sp)
    1408:	318e                	fld	ft3,224(sp)
    140a:	226e                	fld	ft4,216(sp)
    140c:	22ce                	fld	ft5,208(sp)
    140e:	232e                	fld	ft6,200(sp)
    1410:	238e                	fld	ft7,192(sp)
    1412:	346a                	fld	fs0,184(sp)
    1414:	34ca                	fld	fs1,176(sp)
    1416:	352a                	fld	fa0,168(sp)
    1418:	358a                	fld	fa1,160(sp)
    141a:	266a                	fld	fa2,152(sp)
    141c:	26ca                	fld	fa3,144(sp)
    141e:	272a                	fld	fa4,136(sp)
    1420:	278a                	fld	fa5,128(sp)
    1422:	3866                	fld	fa6,120(sp)
    1424:	38c6                	fld	fa7,112(sp)
    1426:	3926                	fld	fs2,104(sp)
    1428:	3986                	fld	fs3,96(sp)
    142a:	2a66                	fld	fs4,88(sp)
    142c:	2ac6                	fld	fs5,80(sp)
    142e:	2b26                	fld	fs6,72(sp)
    1430:	2b86                	fld	fs7,64(sp)
    1432:	3c62                	fld	fs8,56(sp)
    1434:	3cc2                	fld	fs9,48(sp)
    1436:	3d22                	fld	fs10,40(sp)
    1438:	3d82                	fld	fs11,32(sp)
    143a:	2e62                	fld	ft8,24(sp)
    143c:	2ec2                	fld	ft9,16(sp)
    143e:	2f22                	fld	ft10,8(sp)
    1440:	2f82                	fld	ft11,0(sp)
    1442:	6171                	addi	sp,sp,336
    1444:	30200073          	mret
    1448:	0000                	unimp
	...

0000144c <handler_irq_fast_timer_3>:
{
    144c:	714d                	addi	sp,sp,-336
    144e:	14112623          	sw	ra,332(sp)
    1452:	14512423          	sw	t0,328(sp)
    1456:	003022f3          	frcsr	t0
    145a:	14512223          	sw	t0,324(sp)
    145e:	14612023          	sw	t1,320(sp)
    1462:	12712e23          	sw	t2,316(sp)
    1466:	12a12c23          	sw	a0,312(sp)
    146a:	12b12a23          	sw	a1,308(sp)
    146e:	12c12823          	sw	a2,304(sp)
    1472:	12d12623          	sw	a3,300(sp)
    1476:	12e12423          	sw	a4,296(sp)
    147a:	12f12223          	sw	a5,292(sp)
    147e:	13012023          	sw	a6,288(sp)
    1482:	11112e23          	sw	a7,284(sp)
    1486:	11c12c23          	sw	t3,280(sp)
    148a:	11d12a23          	sw	t4,276(sp)
    148e:	11e12823          	sw	t5,272(sp)
    1492:	11f12623          	sw	t6,268(sp)
    1496:	bd82                	fsd	ft0,248(sp)
    1498:	b986                	fsd	ft1,240(sp)
    149a:	b58a                	fsd	ft2,232(sp)
    149c:	b18e                	fsd	ft3,224(sp)
    149e:	ad92                	fsd	ft4,216(sp)
    14a0:	a996                	fsd	ft5,208(sp)
    14a2:	a59a                	fsd	ft6,200(sp)
    14a4:	a19e                	fsd	ft7,192(sp)
    14a6:	bd22                	fsd	fs0,184(sp)
    14a8:	b926                	fsd	fs1,176(sp)
    14aa:	b52a                	fsd	fa0,168(sp)
    14ac:	b12e                	fsd	fa1,160(sp)
    14ae:	ad32                	fsd	fa2,152(sp)
    14b0:	a936                	fsd	fa3,144(sp)
    14b2:	a53a                	fsd	fa4,136(sp)
    14b4:	a13e                	fsd	fa5,128(sp)
    14b6:	bcc2                	fsd	fa6,120(sp)
    14b8:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    14ba:	200607b7          	lui	a5,0x20060
{
    14be:	b4ca                	fsd	fs2,104(sp)
    14c0:	b0ce                	fsd	fs3,96(sp)
    14c2:	acd2                	fsd	fs4,88(sp)
    14c4:	a8d6                	fsd	fs5,80(sp)
    14c6:	a4da                	fsd	fs6,72(sp)
    14c8:	a0de                	fsd	fs7,64(sp)
    14ca:	bc62                	fsd	fs8,56(sp)
    14cc:	b866                	fsd	fs9,48(sp)
    14ce:	b46a                	fsd	fs10,40(sp)
    14d0:	b06e                	fsd	fs11,32(sp)
    14d2:	ac72                	fsd	ft8,24(sp)
    14d4:	a876                	fsd	ft9,16(sp)
    14d6:	a47a                	fsd	ft10,8(sp)
    14d8:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    14da:	4711                	li	a4,4
    14dc:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
    14de:	9c6ff0ef          	jal	6a4 <fic_irq_timer_1>
}
    14e2:	14c12083          	lw	ra,332(sp)
    14e6:	14412283          	lw	t0,324(sp)
    14ea:	00329073          	fscsr	t0
    14ee:	14812283          	lw	t0,328(sp)
    14f2:	14012303          	lw	t1,320(sp)
    14f6:	13c12383          	lw	t2,316(sp)
    14fa:	13812503          	lw	a0,312(sp)
    14fe:	13412583          	lw	a1,308(sp)
    1502:	13012603          	lw	a2,304(sp)
    1506:	12c12683          	lw	a3,300(sp)
    150a:	12812703          	lw	a4,296(sp)
    150e:	12412783          	lw	a5,292(sp)
    1512:	12012803          	lw	a6,288(sp)
    1516:	11c12883          	lw	a7,284(sp)
    151a:	11812e03          	lw	t3,280(sp)
    151e:	11412e83          	lw	t4,276(sp)
    1522:	11012f03          	lw	t5,272(sp)
    1526:	10c12f83          	lw	t6,268(sp)
    152a:	306e                	fld	ft0,248(sp)
    152c:	30ce                	fld	ft1,240(sp)
    152e:	312e                	fld	ft2,232(sp)
    1530:	318e                	fld	ft3,224(sp)
    1532:	226e                	fld	ft4,216(sp)
    1534:	22ce                	fld	ft5,208(sp)
    1536:	232e                	fld	ft6,200(sp)
    1538:	238e                	fld	ft7,192(sp)
    153a:	346a                	fld	fs0,184(sp)
    153c:	34ca                	fld	fs1,176(sp)
    153e:	352a                	fld	fa0,168(sp)
    1540:	358a                	fld	fa1,160(sp)
    1542:	266a                	fld	fa2,152(sp)
    1544:	26ca                	fld	fa3,144(sp)
    1546:	272a                	fld	fa4,136(sp)
    1548:	278a                	fld	fa5,128(sp)
    154a:	3866                	fld	fa6,120(sp)
    154c:	38c6                	fld	fa7,112(sp)
    154e:	3926                	fld	fs2,104(sp)
    1550:	3986                	fld	fs3,96(sp)
    1552:	2a66                	fld	fs4,88(sp)
    1554:	2ac6                	fld	fs5,80(sp)
    1556:	2b26                	fld	fs6,72(sp)
    1558:	2b86                	fld	fs7,64(sp)
    155a:	3c62                	fld	fs8,56(sp)
    155c:	3cc2                	fld	fs9,48(sp)
    155e:	3d22                	fld	fs10,40(sp)
    1560:	3d82                	fld	fs11,32(sp)
    1562:	2e62                	fld	ft8,24(sp)
    1564:	2ec2                	fld	ft9,16(sp)
    1566:	2f22                	fld	ft10,8(sp)
    1568:	2f82                	fld	ft11,0(sp)
    156a:	6171                	addi	sp,sp,336
    156c:	30200073          	mret
    1570:	0000                	unimp
	...

00001574 <handler_irq_fast_external_peripheral>:
{
    1574:	714d                	addi	sp,sp,-336
    1576:	14112623          	sw	ra,332(sp)
    157a:	14512423          	sw	t0,328(sp)
    157e:	003022f3          	frcsr	t0
    1582:	14512223          	sw	t0,324(sp)
    1586:	14612023          	sw	t1,320(sp)
    158a:	12712e23          	sw	t2,316(sp)
    158e:	12a12c23          	sw	a0,312(sp)
    1592:	12b12a23          	sw	a1,308(sp)
    1596:	12c12823          	sw	a2,304(sp)
    159a:	12d12623          	sw	a3,300(sp)
    159e:	12e12423          	sw	a4,296(sp)
    15a2:	12f12223          	sw	a5,292(sp)
    15a6:	13012023          	sw	a6,288(sp)
    15aa:	11112e23          	sw	a7,284(sp)
    15ae:	11c12c23          	sw	t3,280(sp)
    15b2:	11d12a23          	sw	t4,276(sp)
    15b6:	11e12823          	sw	t5,272(sp)
    15ba:	11f12623          	sw	t6,268(sp)
    15be:	bd82                	fsd	ft0,248(sp)
    15c0:	b986                	fsd	ft1,240(sp)
    15c2:	b58a                	fsd	ft2,232(sp)
    15c4:	b18e                	fsd	ft3,224(sp)
    15c6:	ad92                	fsd	ft4,216(sp)
    15c8:	a996                	fsd	ft5,208(sp)
    15ca:	a59a                	fsd	ft6,200(sp)
    15cc:	a19e                	fsd	ft7,192(sp)
    15ce:	bd22                	fsd	fs0,184(sp)
    15d0:	b926                	fsd	fs1,176(sp)
    15d2:	b52a                	fsd	fa0,168(sp)
    15d4:	b12e                	fsd	fa1,160(sp)
    15d6:	ad32                	fsd	fa2,152(sp)
    15d8:	a936                	fsd	fa3,144(sp)
    15da:	a53a                	fsd	fa4,136(sp)
    15dc:	a13e                	fsd	fa5,128(sp)
    15de:	bcc2                	fsd	fa6,120(sp)
    15e0:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    15e2:	200607b7          	lui	a5,0x20060
{
    15e6:	b4ca                	fsd	fs2,104(sp)
    15e8:	b0ce                	fsd	fs3,96(sp)
    15ea:	acd2                	fsd	fs4,88(sp)
    15ec:	a8d6                	fsd	fs5,80(sp)
    15ee:	a4da                	fsd	fs6,72(sp)
    15f0:	a0de                	fsd	fs7,64(sp)
    15f2:	bc62                	fsd	fs8,56(sp)
    15f4:	b866                	fsd	fs9,48(sp)
    15f6:	b46a                	fsd	fs10,40(sp)
    15f8:	b06e                	fsd	fs11,32(sp)
    15fa:	ac72                	fsd	ft8,24(sp)
    15fc:	a876                	fsd	ft9,16(sp)
    15fe:	a47a                	fsd	ft10,8(sp)
    1600:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1602:	6721                	lui	a4,0x8
    1604:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
    1606:	89eff0ef          	jal	6a4 <fic_irq_timer_1>
}
    160a:	14c12083          	lw	ra,332(sp)
    160e:	14412283          	lw	t0,324(sp)
    1612:	00329073          	fscsr	t0
    1616:	14812283          	lw	t0,328(sp)
    161a:	14012303          	lw	t1,320(sp)
    161e:	13c12383          	lw	t2,316(sp)
    1622:	13812503          	lw	a0,312(sp)
    1626:	13412583          	lw	a1,308(sp)
    162a:	13012603          	lw	a2,304(sp)
    162e:	12c12683          	lw	a3,300(sp)
    1632:	12812703          	lw	a4,296(sp)
    1636:	12412783          	lw	a5,292(sp)
    163a:	12012803          	lw	a6,288(sp)
    163e:	11c12883          	lw	a7,284(sp)
    1642:	11812e03          	lw	t3,280(sp)
    1646:	11412e83          	lw	t4,276(sp)
    164a:	11012f03          	lw	t5,272(sp)
    164e:	10c12f83          	lw	t6,268(sp)
    1652:	306e                	fld	ft0,248(sp)
    1654:	30ce                	fld	ft1,240(sp)
    1656:	312e                	fld	ft2,232(sp)
    1658:	318e                	fld	ft3,224(sp)
    165a:	226e                	fld	ft4,216(sp)
    165c:	22ce                	fld	ft5,208(sp)
    165e:	232e                	fld	ft6,200(sp)
    1660:	238e                	fld	ft7,192(sp)
    1662:	346a                	fld	fs0,184(sp)
    1664:	34ca                	fld	fs1,176(sp)
    1666:	352a                	fld	fa0,168(sp)
    1668:	358a                	fld	fa1,160(sp)
    166a:	266a                	fld	fa2,152(sp)
    166c:	26ca                	fld	fa3,144(sp)
    166e:	272a                	fld	fa4,136(sp)
    1670:	278a                	fld	fa5,128(sp)
    1672:	3866                	fld	fa6,120(sp)
    1674:	38c6                	fld	fa7,112(sp)
    1676:	3926                	fld	fs2,104(sp)
    1678:	3986                	fld	fs3,96(sp)
    167a:	2a66                	fld	fs4,88(sp)
    167c:	2ac6                	fld	fs5,80(sp)
    167e:	2b26                	fld	fs6,72(sp)
    1680:	2b86                	fld	fs7,64(sp)
    1682:	3c62                	fld	fs8,56(sp)
    1684:	3cc2                	fld	fs9,48(sp)
    1686:	3d22                	fld	fs10,40(sp)
    1688:	3d82                	fld	fs11,32(sp)
    168a:	2e62                	fld	ft8,24(sp)
    168c:	2ec2                	fld	ft9,16(sp)
    168e:	2f22                	fld	ft10,8(sp)
    1690:	2f82                	fld	ft11,0(sp)
    1692:	6171                	addi	sp,sp,336
    1694:	30200073          	mret
    1698:	0000                	unimp
	...

0000169c <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
    169c:	714d                	addi	sp,sp,-336
    169e:	14112623          	sw	ra,332(sp)
    16a2:	14512423          	sw	t0,328(sp)
    16a6:	003022f3          	frcsr	t0
    16aa:	14512223          	sw	t0,324(sp)
    16ae:	14612023          	sw	t1,320(sp)
    16b2:	12712e23          	sw	t2,316(sp)
    16b6:	12a12c23          	sw	a0,312(sp)
    16ba:	12b12a23          	sw	a1,308(sp)
    16be:	12c12823          	sw	a2,304(sp)
    16c2:	12d12623          	sw	a3,300(sp)
    16c6:	12e12423          	sw	a4,296(sp)
    16ca:	12f12223          	sw	a5,292(sp)
    16ce:	13012023          	sw	a6,288(sp)
    16d2:	11112e23          	sw	a7,284(sp)
    16d6:	11c12c23          	sw	t3,280(sp)
    16da:	11d12a23          	sw	t4,276(sp)
    16de:	11e12823          	sw	t5,272(sp)
    16e2:	11f12623          	sw	t6,268(sp)
    16e6:	bd82                	fsd	ft0,248(sp)
    16e8:	b986                	fsd	ft1,240(sp)
    16ea:	b58a                	fsd	ft2,232(sp)
    16ec:	b18e                	fsd	ft3,224(sp)
    16ee:	ad92                	fsd	ft4,216(sp)
    16f0:	a996                	fsd	ft5,208(sp)
    16f2:	a59a                	fsd	ft6,200(sp)
    16f4:	a19e                	fsd	ft7,192(sp)
    16f6:	bd22                	fsd	fs0,184(sp)
    16f8:	b926                	fsd	fs1,176(sp)
    16fa:	b52a                	fsd	fa0,168(sp)
    16fc:	b12e                	fsd	fa1,160(sp)
    16fe:	ad32                	fsd	fa2,152(sp)
    1700:	a936                	fsd	fa3,144(sp)
    1702:	a53a                	fsd	fa4,136(sp)
    1704:	a13e                	fsd	fa5,128(sp)
    1706:	bcc2                	fsd	fa6,120(sp)
    1708:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    170a:	200607b7          	lui	a5,0x20060
{
    170e:	b4ca                	fsd	fs2,104(sp)
    1710:	b0ce                	fsd	fs3,96(sp)
    1712:	acd2                	fsd	fs4,88(sp)
    1714:	a8d6                	fsd	fs5,80(sp)
    1716:	a4da                	fsd	fs6,72(sp)
    1718:	a0de                	fsd	fs7,64(sp)
    171a:	bc62                	fsd	fs8,56(sp)
    171c:	b866                	fsd	fs9,48(sp)
    171e:	b46a                	fsd	fs10,40(sp)
    1720:	b06e                	fsd	fs11,32(sp)
    1722:	ac72                	fsd	ft8,24(sp)
    1724:	a876                	fsd	ft9,16(sp)
    1726:	a47a                	fsd	ft10,8(sp)
    1728:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    172a:	04000713          	li	a4,64
    172e:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
    // call the weak fic handler
    fic_irq_gpio_0();
    1730:	f75fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1734:	14c12083          	lw	ra,332(sp)
    1738:	14412283          	lw	t0,324(sp)
    173c:	00329073          	fscsr	t0
    1740:	14812283          	lw	t0,328(sp)
    1744:	14012303          	lw	t1,320(sp)
    1748:	13c12383          	lw	t2,316(sp)
    174c:	13812503          	lw	a0,312(sp)
    1750:	13412583          	lw	a1,308(sp)
    1754:	13012603          	lw	a2,304(sp)
    1758:	12c12683          	lw	a3,300(sp)
    175c:	12812703          	lw	a4,296(sp)
    1760:	12412783          	lw	a5,292(sp)
    1764:	12012803          	lw	a6,288(sp)
    1768:	11c12883          	lw	a7,284(sp)
    176c:	11812e03          	lw	t3,280(sp)
    1770:	11412e83          	lw	t4,276(sp)
    1774:	11012f03          	lw	t5,272(sp)
    1778:	10c12f83          	lw	t6,268(sp)
    177c:	306e                	fld	ft0,248(sp)
    177e:	30ce                	fld	ft1,240(sp)
    1780:	312e                	fld	ft2,232(sp)
    1782:	318e                	fld	ft3,224(sp)
    1784:	226e                	fld	ft4,216(sp)
    1786:	22ce                	fld	ft5,208(sp)
    1788:	232e                	fld	ft6,200(sp)
    178a:	238e                	fld	ft7,192(sp)
    178c:	346a                	fld	fs0,184(sp)
    178e:	34ca                	fld	fs1,176(sp)
    1790:	352a                	fld	fa0,168(sp)
    1792:	358a                	fld	fa1,160(sp)
    1794:	266a                	fld	fa2,152(sp)
    1796:	26ca                	fld	fa3,144(sp)
    1798:	272a                	fld	fa4,136(sp)
    179a:	278a                	fld	fa5,128(sp)
    179c:	3866                	fld	fa6,120(sp)
    179e:	38c6                	fld	fa7,112(sp)
    17a0:	3926                	fld	fs2,104(sp)
    17a2:	3986                	fld	fs3,96(sp)
    17a4:	2a66                	fld	fs4,88(sp)
    17a6:	2ac6                	fld	fs5,80(sp)
    17a8:	2b26                	fld	fs6,72(sp)
    17aa:	2b86                	fld	fs7,64(sp)
    17ac:	3c62                	fld	fs8,56(sp)
    17ae:	3cc2                	fld	fs9,48(sp)
    17b0:	3d22                	fld	fs10,40(sp)
    17b2:	3d82                	fld	fs11,32(sp)
    17b4:	2e62                	fld	ft8,24(sp)
    17b6:	2ec2                	fld	ft9,16(sp)
    17b8:	2f22                	fld	ft10,8(sp)
    17ba:	2f82                	fld	ft11,0(sp)
    17bc:	6171                	addi	sp,sp,336
    17be:	30200073          	mret
	...

000017c4 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
    17c4:	714d                	addi	sp,sp,-336
    17c6:	14112623          	sw	ra,332(sp)
    17ca:	14512423          	sw	t0,328(sp)
    17ce:	003022f3          	frcsr	t0
    17d2:	14512223          	sw	t0,324(sp)
    17d6:	14612023          	sw	t1,320(sp)
    17da:	12712e23          	sw	t2,316(sp)
    17de:	12a12c23          	sw	a0,312(sp)
    17e2:	12b12a23          	sw	a1,308(sp)
    17e6:	12c12823          	sw	a2,304(sp)
    17ea:	12d12623          	sw	a3,300(sp)
    17ee:	12e12423          	sw	a4,296(sp)
    17f2:	12f12223          	sw	a5,292(sp)
    17f6:	13012023          	sw	a6,288(sp)
    17fa:	11112e23          	sw	a7,284(sp)
    17fe:	11c12c23          	sw	t3,280(sp)
    1802:	11d12a23          	sw	t4,276(sp)
    1806:	11e12823          	sw	t5,272(sp)
    180a:	11f12623          	sw	t6,268(sp)
    180e:	bd82                	fsd	ft0,248(sp)
    1810:	b986                	fsd	ft1,240(sp)
    1812:	b58a                	fsd	ft2,232(sp)
    1814:	b18e                	fsd	ft3,224(sp)
    1816:	ad92                	fsd	ft4,216(sp)
    1818:	a996                	fsd	ft5,208(sp)
    181a:	a59a                	fsd	ft6,200(sp)
    181c:	a19e                	fsd	ft7,192(sp)
    181e:	bd22                	fsd	fs0,184(sp)
    1820:	b926                	fsd	fs1,176(sp)
    1822:	b52a                	fsd	fa0,168(sp)
    1824:	b12e                	fsd	fa1,160(sp)
    1826:	ad32                	fsd	fa2,152(sp)
    1828:	a936                	fsd	fa3,144(sp)
    182a:	a53a                	fsd	fa4,136(sp)
    182c:	a13e                	fsd	fa5,128(sp)
    182e:	bcc2                	fsd	fa6,120(sp)
    1830:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1832:	200607b7          	lui	a5,0x20060
{
    1836:	b4ca                	fsd	fs2,104(sp)
    1838:	b0ce                	fsd	fs3,96(sp)
    183a:	acd2                	fsd	fs4,88(sp)
    183c:	a8d6                	fsd	fs5,80(sp)
    183e:	a4da                	fsd	fs6,72(sp)
    1840:	a0de                	fsd	fs7,64(sp)
    1842:	bc62                	fsd	fs8,56(sp)
    1844:	b866                	fsd	fs9,48(sp)
    1846:	b46a                	fsd	fs10,40(sp)
    1848:	b06e                	fsd	fs11,32(sp)
    184a:	ac72                	fsd	ft8,24(sp)
    184c:	a876                	fsd	ft9,16(sp)
    184e:	a47a                	fsd	ft10,8(sp)
    1850:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1852:	08000713          	li	a4,128
    1856:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
    // call the weak fic handler
    fic_irq_gpio_1();
    1858:	e4dfe0ef          	jal	6a4 <fic_irq_timer_1>
}
    185c:	14c12083          	lw	ra,332(sp)
    1860:	14412283          	lw	t0,324(sp)
    1864:	00329073          	fscsr	t0
    1868:	14812283          	lw	t0,328(sp)
    186c:	14012303          	lw	t1,320(sp)
    1870:	13c12383          	lw	t2,316(sp)
    1874:	13812503          	lw	a0,312(sp)
    1878:	13412583          	lw	a1,308(sp)
    187c:	13012603          	lw	a2,304(sp)
    1880:	12c12683          	lw	a3,300(sp)
    1884:	12812703          	lw	a4,296(sp)
    1888:	12412783          	lw	a5,292(sp)
    188c:	12012803          	lw	a6,288(sp)
    1890:	11c12883          	lw	a7,284(sp)
    1894:	11812e03          	lw	t3,280(sp)
    1898:	11412e83          	lw	t4,276(sp)
    189c:	11012f03          	lw	t5,272(sp)
    18a0:	10c12f83          	lw	t6,268(sp)
    18a4:	306e                	fld	ft0,248(sp)
    18a6:	30ce                	fld	ft1,240(sp)
    18a8:	312e                	fld	ft2,232(sp)
    18aa:	318e                	fld	ft3,224(sp)
    18ac:	226e                	fld	ft4,216(sp)
    18ae:	22ce                	fld	ft5,208(sp)
    18b0:	232e                	fld	ft6,200(sp)
    18b2:	238e                	fld	ft7,192(sp)
    18b4:	346a                	fld	fs0,184(sp)
    18b6:	34ca                	fld	fs1,176(sp)
    18b8:	352a                	fld	fa0,168(sp)
    18ba:	358a                	fld	fa1,160(sp)
    18bc:	266a                	fld	fa2,152(sp)
    18be:	26ca                	fld	fa3,144(sp)
    18c0:	272a                	fld	fa4,136(sp)
    18c2:	278a                	fld	fa5,128(sp)
    18c4:	3866                	fld	fa6,120(sp)
    18c6:	38c6                	fld	fa7,112(sp)
    18c8:	3926                	fld	fs2,104(sp)
    18ca:	3986                	fld	fs3,96(sp)
    18cc:	2a66                	fld	fs4,88(sp)
    18ce:	2ac6                	fld	fs5,80(sp)
    18d0:	2b26                	fld	fs6,72(sp)
    18d2:	2b86                	fld	fs7,64(sp)
    18d4:	3c62                	fld	fs8,56(sp)
    18d6:	3cc2                	fld	fs9,48(sp)
    18d8:	3d22                	fld	fs10,40(sp)
    18da:	3d82                	fld	fs11,32(sp)
    18dc:	2e62                	fld	ft8,24(sp)
    18de:	2ec2                	fld	ft9,16(sp)
    18e0:	2f22                	fld	ft10,8(sp)
    18e2:	2f82                	fld	ft11,0(sp)
    18e4:	6171                	addi	sp,sp,336
    18e6:	30200073          	mret
	...

000018ec <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
    18ec:	714d                	addi	sp,sp,-336
    18ee:	14112623          	sw	ra,332(sp)
    18f2:	14512423          	sw	t0,328(sp)
    18f6:	003022f3          	frcsr	t0
    18fa:	14512223          	sw	t0,324(sp)
    18fe:	14612023          	sw	t1,320(sp)
    1902:	12712e23          	sw	t2,316(sp)
    1906:	12a12c23          	sw	a0,312(sp)
    190a:	12b12a23          	sw	a1,308(sp)
    190e:	12c12823          	sw	a2,304(sp)
    1912:	12d12623          	sw	a3,300(sp)
    1916:	12e12423          	sw	a4,296(sp)
    191a:	12f12223          	sw	a5,292(sp)
    191e:	13012023          	sw	a6,288(sp)
    1922:	11112e23          	sw	a7,284(sp)
    1926:	11c12c23          	sw	t3,280(sp)
    192a:	11d12a23          	sw	t4,276(sp)
    192e:	11e12823          	sw	t5,272(sp)
    1932:	11f12623          	sw	t6,268(sp)
    1936:	bd82                	fsd	ft0,248(sp)
    1938:	b986                	fsd	ft1,240(sp)
    193a:	b58a                	fsd	ft2,232(sp)
    193c:	b18e                	fsd	ft3,224(sp)
    193e:	ad92                	fsd	ft4,216(sp)
    1940:	a996                	fsd	ft5,208(sp)
    1942:	a59a                	fsd	ft6,200(sp)
    1944:	a19e                	fsd	ft7,192(sp)
    1946:	bd22                	fsd	fs0,184(sp)
    1948:	b926                	fsd	fs1,176(sp)
    194a:	b52a                	fsd	fa0,168(sp)
    194c:	b12e                	fsd	fa1,160(sp)
    194e:	ad32                	fsd	fa2,152(sp)
    1950:	a936                	fsd	fa3,144(sp)
    1952:	a53a                	fsd	fa4,136(sp)
    1954:	a13e                	fsd	fa5,128(sp)
    1956:	bcc2                	fsd	fa6,120(sp)
    1958:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    195a:	200607b7          	lui	a5,0x20060
{
    195e:	b4ca                	fsd	fs2,104(sp)
    1960:	b0ce                	fsd	fs3,96(sp)
    1962:	acd2                	fsd	fs4,88(sp)
    1964:	a8d6                	fsd	fs5,80(sp)
    1966:	a4da                	fsd	fs6,72(sp)
    1968:	a0de                	fsd	fs7,64(sp)
    196a:	bc62                	fsd	fs8,56(sp)
    196c:	b866                	fsd	fs9,48(sp)
    196e:	b46a                	fsd	fs10,40(sp)
    1970:	b06e                	fsd	fs11,32(sp)
    1972:	ac72                	fsd	ft8,24(sp)
    1974:	a876                	fsd	ft9,16(sp)
    1976:	a47a                	fsd	ft10,8(sp)
    1978:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    197a:	10000713          	li	a4,256
    197e:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
    // call the weak fic handler
    fic_irq_gpio_2();
    1980:	d25fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1984:	14c12083          	lw	ra,332(sp)
    1988:	14412283          	lw	t0,324(sp)
    198c:	00329073          	fscsr	t0
    1990:	14812283          	lw	t0,328(sp)
    1994:	14012303          	lw	t1,320(sp)
    1998:	13c12383          	lw	t2,316(sp)
    199c:	13812503          	lw	a0,312(sp)
    19a0:	13412583          	lw	a1,308(sp)
    19a4:	13012603          	lw	a2,304(sp)
    19a8:	12c12683          	lw	a3,300(sp)
    19ac:	12812703          	lw	a4,296(sp)
    19b0:	12412783          	lw	a5,292(sp)
    19b4:	12012803          	lw	a6,288(sp)
    19b8:	11c12883          	lw	a7,284(sp)
    19bc:	11812e03          	lw	t3,280(sp)
    19c0:	11412e83          	lw	t4,276(sp)
    19c4:	11012f03          	lw	t5,272(sp)
    19c8:	10c12f83          	lw	t6,268(sp)
    19cc:	306e                	fld	ft0,248(sp)
    19ce:	30ce                	fld	ft1,240(sp)
    19d0:	312e                	fld	ft2,232(sp)
    19d2:	318e                	fld	ft3,224(sp)
    19d4:	226e                	fld	ft4,216(sp)
    19d6:	22ce                	fld	ft5,208(sp)
    19d8:	232e                	fld	ft6,200(sp)
    19da:	238e                	fld	ft7,192(sp)
    19dc:	346a                	fld	fs0,184(sp)
    19de:	34ca                	fld	fs1,176(sp)
    19e0:	352a                	fld	fa0,168(sp)
    19e2:	358a                	fld	fa1,160(sp)
    19e4:	266a                	fld	fa2,152(sp)
    19e6:	26ca                	fld	fa3,144(sp)
    19e8:	272a                	fld	fa4,136(sp)
    19ea:	278a                	fld	fa5,128(sp)
    19ec:	3866                	fld	fa6,120(sp)
    19ee:	38c6                	fld	fa7,112(sp)
    19f0:	3926                	fld	fs2,104(sp)
    19f2:	3986                	fld	fs3,96(sp)
    19f4:	2a66                	fld	fs4,88(sp)
    19f6:	2ac6                	fld	fs5,80(sp)
    19f8:	2b26                	fld	fs6,72(sp)
    19fa:	2b86                	fld	fs7,64(sp)
    19fc:	3c62                	fld	fs8,56(sp)
    19fe:	3cc2                	fld	fs9,48(sp)
    1a00:	3d22                	fld	fs10,40(sp)
    1a02:	3d82                	fld	fs11,32(sp)
    1a04:	2e62                	fld	ft8,24(sp)
    1a06:	2ec2                	fld	ft9,16(sp)
    1a08:	2f22                	fld	ft10,8(sp)
    1a0a:	2f82                	fld	ft11,0(sp)
    1a0c:	6171                	addi	sp,sp,336
    1a0e:	30200073          	mret
	...

00001a14 <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
    1a14:	714d                	addi	sp,sp,-336
    1a16:	14112623          	sw	ra,332(sp)
    1a1a:	14512423          	sw	t0,328(sp)
    1a1e:	003022f3          	frcsr	t0
    1a22:	14512223          	sw	t0,324(sp)
    1a26:	14612023          	sw	t1,320(sp)
    1a2a:	12712e23          	sw	t2,316(sp)
    1a2e:	12a12c23          	sw	a0,312(sp)
    1a32:	12b12a23          	sw	a1,308(sp)
    1a36:	12c12823          	sw	a2,304(sp)
    1a3a:	12d12623          	sw	a3,300(sp)
    1a3e:	12e12423          	sw	a4,296(sp)
    1a42:	12f12223          	sw	a5,292(sp)
    1a46:	13012023          	sw	a6,288(sp)
    1a4a:	11112e23          	sw	a7,284(sp)
    1a4e:	11c12c23          	sw	t3,280(sp)
    1a52:	11d12a23          	sw	t4,276(sp)
    1a56:	11e12823          	sw	t5,272(sp)
    1a5a:	11f12623          	sw	t6,268(sp)
    1a5e:	bd82                	fsd	ft0,248(sp)
    1a60:	b986                	fsd	ft1,240(sp)
    1a62:	b58a                	fsd	ft2,232(sp)
    1a64:	b18e                	fsd	ft3,224(sp)
    1a66:	ad92                	fsd	ft4,216(sp)
    1a68:	a996                	fsd	ft5,208(sp)
    1a6a:	a59a                	fsd	ft6,200(sp)
    1a6c:	a19e                	fsd	ft7,192(sp)
    1a6e:	bd22                	fsd	fs0,184(sp)
    1a70:	b926                	fsd	fs1,176(sp)
    1a72:	b52a                	fsd	fa0,168(sp)
    1a74:	b12e                	fsd	fa1,160(sp)
    1a76:	ad32                	fsd	fa2,152(sp)
    1a78:	a936                	fsd	fa3,144(sp)
    1a7a:	a53a                	fsd	fa4,136(sp)
    1a7c:	a13e                	fsd	fa5,128(sp)
    1a7e:	bcc2                	fsd	fa6,120(sp)
    1a80:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1a82:	200607b7          	lui	a5,0x20060
{
    1a86:	b4ca                	fsd	fs2,104(sp)
    1a88:	b0ce                	fsd	fs3,96(sp)
    1a8a:	acd2                	fsd	fs4,88(sp)
    1a8c:	a8d6                	fsd	fs5,80(sp)
    1a8e:	a4da                	fsd	fs6,72(sp)
    1a90:	a0de                	fsd	fs7,64(sp)
    1a92:	bc62                	fsd	fs8,56(sp)
    1a94:	b866                	fsd	fs9,48(sp)
    1a96:	b46a                	fsd	fs10,40(sp)
    1a98:	b06e                	fsd	fs11,32(sp)
    1a9a:	ac72                	fsd	ft8,24(sp)
    1a9c:	a876                	fsd	ft9,16(sp)
    1a9e:	a47a                	fsd	ft10,8(sp)
    1aa0:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1aa2:	20000713          	li	a4,512
    1aa6:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
    // call the weak fic handler
    fic_irq_gpio_3();
    1aa8:	bfdfe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1aac:	14c12083          	lw	ra,332(sp)
    1ab0:	14412283          	lw	t0,324(sp)
    1ab4:	00329073          	fscsr	t0
    1ab8:	14812283          	lw	t0,328(sp)
    1abc:	14012303          	lw	t1,320(sp)
    1ac0:	13c12383          	lw	t2,316(sp)
    1ac4:	13812503          	lw	a0,312(sp)
    1ac8:	13412583          	lw	a1,308(sp)
    1acc:	13012603          	lw	a2,304(sp)
    1ad0:	12c12683          	lw	a3,300(sp)
    1ad4:	12812703          	lw	a4,296(sp)
    1ad8:	12412783          	lw	a5,292(sp)
    1adc:	12012803          	lw	a6,288(sp)
    1ae0:	11c12883          	lw	a7,284(sp)
    1ae4:	11812e03          	lw	t3,280(sp)
    1ae8:	11412e83          	lw	t4,276(sp)
    1aec:	11012f03          	lw	t5,272(sp)
    1af0:	10c12f83          	lw	t6,268(sp)
    1af4:	306e                	fld	ft0,248(sp)
    1af6:	30ce                	fld	ft1,240(sp)
    1af8:	312e                	fld	ft2,232(sp)
    1afa:	318e                	fld	ft3,224(sp)
    1afc:	226e                	fld	ft4,216(sp)
    1afe:	22ce                	fld	ft5,208(sp)
    1b00:	232e                	fld	ft6,200(sp)
    1b02:	238e                	fld	ft7,192(sp)
    1b04:	346a                	fld	fs0,184(sp)
    1b06:	34ca                	fld	fs1,176(sp)
    1b08:	352a                	fld	fa0,168(sp)
    1b0a:	358a                	fld	fa1,160(sp)
    1b0c:	266a                	fld	fa2,152(sp)
    1b0e:	26ca                	fld	fa3,144(sp)
    1b10:	272a                	fld	fa4,136(sp)
    1b12:	278a                	fld	fa5,128(sp)
    1b14:	3866                	fld	fa6,120(sp)
    1b16:	38c6                	fld	fa7,112(sp)
    1b18:	3926                	fld	fs2,104(sp)
    1b1a:	3986                	fld	fs3,96(sp)
    1b1c:	2a66                	fld	fs4,88(sp)
    1b1e:	2ac6                	fld	fs5,80(sp)
    1b20:	2b26                	fld	fs6,72(sp)
    1b22:	2b86                	fld	fs7,64(sp)
    1b24:	3c62                	fld	fs8,56(sp)
    1b26:	3cc2                	fld	fs9,48(sp)
    1b28:	3d22                	fld	fs10,40(sp)
    1b2a:	3d82                	fld	fs11,32(sp)
    1b2c:	2e62                	fld	ft8,24(sp)
    1b2e:	2ec2                	fld	ft9,16(sp)
    1b30:	2f22                	fld	ft10,8(sp)
    1b32:	2f82                	fld	ft11,0(sp)
    1b34:	6171                	addi	sp,sp,336
    1b36:	30200073          	mret
	...

00001b3c <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
    1b3c:	714d                	addi	sp,sp,-336
    1b3e:	14112623          	sw	ra,332(sp)
    1b42:	14512423          	sw	t0,328(sp)
    1b46:	003022f3          	frcsr	t0
    1b4a:	14512223          	sw	t0,324(sp)
    1b4e:	14612023          	sw	t1,320(sp)
    1b52:	12712e23          	sw	t2,316(sp)
    1b56:	12a12c23          	sw	a0,312(sp)
    1b5a:	12b12a23          	sw	a1,308(sp)
    1b5e:	12c12823          	sw	a2,304(sp)
    1b62:	12d12623          	sw	a3,300(sp)
    1b66:	12e12423          	sw	a4,296(sp)
    1b6a:	12f12223          	sw	a5,292(sp)
    1b6e:	13012023          	sw	a6,288(sp)
    1b72:	11112e23          	sw	a7,284(sp)
    1b76:	11c12c23          	sw	t3,280(sp)
    1b7a:	11d12a23          	sw	t4,276(sp)
    1b7e:	11e12823          	sw	t5,272(sp)
    1b82:	11f12623          	sw	t6,268(sp)
    1b86:	bd82                	fsd	ft0,248(sp)
    1b88:	b986                	fsd	ft1,240(sp)
    1b8a:	b58a                	fsd	ft2,232(sp)
    1b8c:	b18e                	fsd	ft3,224(sp)
    1b8e:	ad92                	fsd	ft4,216(sp)
    1b90:	a996                	fsd	ft5,208(sp)
    1b92:	a59a                	fsd	ft6,200(sp)
    1b94:	a19e                	fsd	ft7,192(sp)
    1b96:	bd22                	fsd	fs0,184(sp)
    1b98:	b926                	fsd	fs1,176(sp)
    1b9a:	b52a                	fsd	fa0,168(sp)
    1b9c:	b12e                	fsd	fa1,160(sp)
    1b9e:	ad32                	fsd	fa2,152(sp)
    1ba0:	a936                	fsd	fa3,144(sp)
    1ba2:	a53a                	fsd	fa4,136(sp)
    1ba4:	a13e                	fsd	fa5,128(sp)
    1ba6:	bcc2                	fsd	fa6,120(sp)
    1ba8:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1baa:	200607b7          	lui	a5,0x20060
{
    1bae:	b4ca                	fsd	fs2,104(sp)
    1bb0:	b0ce                	fsd	fs3,96(sp)
    1bb2:	acd2                	fsd	fs4,88(sp)
    1bb4:	a8d6                	fsd	fs5,80(sp)
    1bb6:	a4da                	fsd	fs6,72(sp)
    1bb8:	a0de                	fsd	fs7,64(sp)
    1bba:	bc62                	fsd	fs8,56(sp)
    1bbc:	b866                	fsd	fs9,48(sp)
    1bbe:	b46a                	fsd	fs10,40(sp)
    1bc0:	b06e                	fsd	fs11,32(sp)
    1bc2:	ac72                	fsd	ft8,24(sp)
    1bc4:	a876                	fsd	ft9,16(sp)
    1bc6:	a47a                	fsd	ft10,8(sp)
    1bc8:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1bca:	40000713          	li	a4,1024
    1bce:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
    // call the weak fic handler
    fic_irq_gpio_4();
    1bd0:	ad5fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1bd4:	14c12083          	lw	ra,332(sp)
    1bd8:	14412283          	lw	t0,324(sp)
    1bdc:	00329073          	fscsr	t0
    1be0:	14812283          	lw	t0,328(sp)
    1be4:	14012303          	lw	t1,320(sp)
    1be8:	13c12383          	lw	t2,316(sp)
    1bec:	13812503          	lw	a0,312(sp)
    1bf0:	13412583          	lw	a1,308(sp)
    1bf4:	13012603          	lw	a2,304(sp)
    1bf8:	12c12683          	lw	a3,300(sp)
    1bfc:	12812703          	lw	a4,296(sp)
    1c00:	12412783          	lw	a5,292(sp)
    1c04:	12012803          	lw	a6,288(sp)
    1c08:	11c12883          	lw	a7,284(sp)
    1c0c:	11812e03          	lw	t3,280(sp)
    1c10:	11412e83          	lw	t4,276(sp)
    1c14:	11012f03          	lw	t5,272(sp)
    1c18:	10c12f83          	lw	t6,268(sp)
    1c1c:	306e                	fld	ft0,248(sp)
    1c1e:	30ce                	fld	ft1,240(sp)
    1c20:	312e                	fld	ft2,232(sp)
    1c22:	318e                	fld	ft3,224(sp)
    1c24:	226e                	fld	ft4,216(sp)
    1c26:	22ce                	fld	ft5,208(sp)
    1c28:	232e                	fld	ft6,200(sp)
    1c2a:	238e                	fld	ft7,192(sp)
    1c2c:	346a                	fld	fs0,184(sp)
    1c2e:	34ca                	fld	fs1,176(sp)
    1c30:	352a                	fld	fa0,168(sp)
    1c32:	358a                	fld	fa1,160(sp)
    1c34:	266a                	fld	fa2,152(sp)
    1c36:	26ca                	fld	fa3,144(sp)
    1c38:	272a                	fld	fa4,136(sp)
    1c3a:	278a                	fld	fa5,128(sp)
    1c3c:	3866                	fld	fa6,120(sp)
    1c3e:	38c6                	fld	fa7,112(sp)
    1c40:	3926                	fld	fs2,104(sp)
    1c42:	3986                	fld	fs3,96(sp)
    1c44:	2a66                	fld	fs4,88(sp)
    1c46:	2ac6                	fld	fs5,80(sp)
    1c48:	2b26                	fld	fs6,72(sp)
    1c4a:	2b86                	fld	fs7,64(sp)
    1c4c:	3c62                	fld	fs8,56(sp)
    1c4e:	3cc2                	fld	fs9,48(sp)
    1c50:	3d22                	fld	fs10,40(sp)
    1c52:	3d82                	fld	fs11,32(sp)
    1c54:	2e62                	fld	ft8,24(sp)
    1c56:	2ec2                	fld	ft9,16(sp)
    1c58:	2f22                	fld	ft10,8(sp)
    1c5a:	2f82                	fld	ft11,0(sp)
    1c5c:	6171                	addi	sp,sp,336
    1c5e:	30200073          	mret
	...

00001c64 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
    1c64:	714d                	addi	sp,sp,-336
    1c66:	14112623          	sw	ra,332(sp)
    1c6a:	14512423          	sw	t0,328(sp)
    1c6e:	003022f3          	frcsr	t0
    1c72:	14512223          	sw	t0,324(sp)
    1c76:	14612023          	sw	t1,320(sp)
    1c7a:	12712e23          	sw	t2,316(sp)
    1c7e:	12a12c23          	sw	a0,312(sp)
    1c82:	12b12a23          	sw	a1,308(sp)
    1c86:	12c12823          	sw	a2,304(sp)
    1c8a:	12d12623          	sw	a3,300(sp)
    1c8e:	12e12423          	sw	a4,296(sp)
    1c92:	12f12223          	sw	a5,292(sp)
    1c96:	13012023          	sw	a6,288(sp)
    1c9a:	11112e23          	sw	a7,284(sp)
    1c9e:	11c12c23          	sw	t3,280(sp)
    1ca2:	11d12a23          	sw	t4,276(sp)
    1ca6:	11e12823          	sw	t5,272(sp)
    1caa:	11f12623          	sw	t6,268(sp)
    1cae:	bd82                	fsd	ft0,248(sp)
    1cb0:	b986                	fsd	ft1,240(sp)
    1cb2:	b58a                	fsd	ft2,232(sp)
    1cb4:	b18e                	fsd	ft3,224(sp)
    1cb6:	ad92                	fsd	ft4,216(sp)
    1cb8:	a996                	fsd	ft5,208(sp)
    1cba:	a59a                	fsd	ft6,200(sp)
    1cbc:	a19e                	fsd	ft7,192(sp)
    1cbe:	bd22                	fsd	fs0,184(sp)
    1cc0:	b926                	fsd	fs1,176(sp)
    1cc2:	b52a                	fsd	fa0,168(sp)
    1cc4:	b12e                	fsd	fa1,160(sp)
    1cc6:	ad32                	fsd	fa2,152(sp)
    1cc8:	a936                	fsd	fa3,144(sp)
    1cca:	a53a                	fsd	fa4,136(sp)
    1ccc:	a13e                	fsd	fa5,128(sp)
    1cce:	bcc2                	fsd	fa6,120(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1cd0:	6785                	lui	a5,0x1
{
    1cd2:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1cd4:	80078793          	addi	a5,a5,-2048 # 800 <spi_event_handler+0x9e>
{
    1cd8:	b4ca                	fsd	fs2,104(sp)
    1cda:	b0ce                	fsd	fs3,96(sp)
    1cdc:	acd2                	fsd	fs4,88(sp)
    1cde:	a8d6                	fsd	fs5,80(sp)
    1ce0:	a4da                	fsd	fs6,72(sp)
    1ce2:	a0de                	fsd	fs7,64(sp)
    1ce4:	bc62                	fsd	fs8,56(sp)
    1ce6:	b866                	fsd	fs9,48(sp)
    1ce8:	b46a                	fsd	fs10,40(sp)
    1cea:	b06e                	fsd	fs11,32(sp)
    1cec:	ac72                	fsd	ft8,24(sp)
    1cee:	a876                	fsd	ft9,16(sp)
    1cf0:	a47a                	fsd	ft10,8(sp)
    1cf2:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1cf4:	20060737          	lui	a4,0x20060
    1cf8:	c35c                	sw	a5,4(a4)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
    // call the weak fic handler
    fic_irq_gpio_5();
    1cfa:	9abfe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1cfe:	14c12083          	lw	ra,332(sp)
    1d02:	14412283          	lw	t0,324(sp)
    1d06:	00329073          	fscsr	t0
    1d0a:	14812283          	lw	t0,328(sp)
    1d0e:	14012303          	lw	t1,320(sp)
    1d12:	13c12383          	lw	t2,316(sp)
    1d16:	13812503          	lw	a0,312(sp)
    1d1a:	13412583          	lw	a1,308(sp)
    1d1e:	13012603          	lw	a2,304(sp)
    1d22:	12c12683          	lw	a3,300(sp)
    1d26:	12812703          	lw	a4,296(sp)
    1d2a:	12412783          	lw	a5,292(sp)
    1d2e:	12012803          	lw	a6,288(sp)
    1d32:	11c12883          	lw	a7,284(sp)
    1d36:	11812e03          	lw	t3,280(sp)
    1d3a:	11412e83          	lw	t4,276(sp)
    1d3e:	11012f03          	lw	t5,272(sp)
    1d42:	10c12f83          	lw	t6,268(sp)
    1d46:	306e                	fld	ft0,248(sp)
    1d48:	30ce                	fld	ft1,240(sp)
    1d4a:	312e                	fld	ft2,232(sp)
    1d4c:	318e                	fld	ft3,224(sp)
    1d4e:	226e                	fld	ft4,216(sp)
    1d50:	22ce                	fld	ft5,208(sp)
    1d52:	232e                	fld	ft6,200(sp)
    1d54:	238e                	fld	ft7,192(sp)
    1d56:	346a                	fld	fs0,184(sp)
    1d58:	34ca                	fld	fs1,176(sp)
    1d5a:	352a                	fld	fa0,168(sp)
    1d5c:	358a                	fld	fa1,160(sp)
    1d5e:	266a                	fld	fa2,152(sp)
    1d60:	26ca                	fld	fa3,144(sp)
    1d62:	272a                	fld	fa4,136(sp)
    1d64:	278a                	fld	fa5,128(sp)
    1d66:	3866                	fld	fa6,120(sp)
    1d68:	38c6                	fld	fa7,112(sp)
    1d6a:	3926                	fld	fs2,104(sp)
    1d6c:	3986                	fld	fs3,96(sp)
    1d6e:	2a66                	fld	fs4,88(sp)
    1d70:	2ac6                	fld	fs5,80(sp)
    1d72:	2b26                	fld	fs6,72(sp)
    1d74:	2b86                	fld	fs7,64(sp)
    1d76:	3c62                	fld	fs8,56(sp)
    1d78:	3cc2                	fld	fs9,48(sp)
    1d7a:	3d22                	fld	fs10,40(sp)
    1d7c:	3d82                	fld	fs11,32(sp)
    1d7e:	2e62                	fld	ft8,24(sp)
    1d80:	2ec2                	fld	ft9,16(sp)
    1d82:	2f22                	fld	ft10,8(sp)
    1d84:	2f82                	fld	ft11,0(sp)
    1d86:	6171                	addi	sp,sp,336
    1d88:	30200073          	mret
    1d8c:	0000                	unimp
	...

00001d90 <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
    1d90:	714d                	addi	sp,sp,-336
    1d92:	14112623          	sw	ra,332(sp)
    1d96:	14512423          	sw	t0,328(sp)
    1d9a:	003022f3          	frcsr	t0
    1d9e:	14512223          	sw	t0,324(sp)
    1da2:	14612023          	sw	t1,320(sp)
    1da6:	12712e23          	sw	t2,316(sp)
    1daa:	12a12c23          	sw	a0,312(sp)
    1dae:	12b12a23          	sw	a1,308(sp)
    1db2:	12c12823          	sw	a2,304(sp)
    1db6:	12d12623          	sw	a3,300(sp)
    1dba:	12e12423          	sw	a4,296(sp)
    1dbe:	12f12223          	sw	a5,292(sp)
    1dc2:	13012023          	sw	a6,288(sp)
    1dc6:	11112e23          	sw	a7,284(sp)
    1dca:	11c12c23          	sw	t3,280(sp)
    1dce:	11d12a23          	sw	t4,276(sp)
    1dd2:	11e12823          	sw	t5,272(sp)
    1dd6:	11f12623          	sw	t6,268(sp)
    1dda:	bd82                	fsd	ft0,248(sp)
    1ddc:	b986                	fsd	ft1,240(sp)
    1dde:	b58a                	fsd	ft2,232(sp)
    1de0:	b18e                	fsd	ft3,224(sp)
    1de2:	ad92                	fsd	ft4,216(sp)
    1de4:	a996                	fsd	ft5,208(sp)
    1de6:	a59a                	fsd	ft6,200(sp)
    1de8:	a19e                	fsd	ft7,192(sp)
    1dea:	bd22                	fsd	fs0,184(sp)
    1dec:	b926                	fsd	fs1,176(sp)
    1dee:	b52a                	fsd	fa0,168(sp)
    1df0:	b12e                	fsd	fa1,160(sp)
    1df2:	ad32                	fsd	fa2,152(sp)
    1df4:	a936                	fsd	fa3,144(sp)
    1df6:	a53a                	fsd	fa4,136(sp)
    1df8:	a13e                	fsd	fa5,128(sp)
    1dfa:	bcc2                	fsd	fa6,120(sp)
    1dfc:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1dfe:	200607b7          	lui	a5,0x20060
{
    1e02:	b4ca                	fsd	fs2,104(sp)
    1e04:	b0ce                	fsd	fs3,96(sp)
    1e06:	acd2                	fsd	fs4,88(sp)
    1e08:	a8d6                	fsd	fs5,80(sp)
    1e0a:	a4da                	fsd	fs6,72(sp)
    1e0c:	a0de                	fsd	fs7,64(sp)
    1e0e:	bc62                	fsd	fs8,56(sp)
    1e10:	b866                	fsd	fs9,48(sp)
    1e12:	b46a                	fsd	fs10,40(sp)
    1e14:	b06e                	fsd	fs11,32(sp)
    1e16:	ac72                	fsd	ft8,24(sp)
    1e18:	a876                	fsd	ft9,16(sp)
    1e1a:	a47a                	fsd	ft10,8(sp)
    1e1c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1e1e:	6705                	lui	a4,0x1
    1e20:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
    // call the weak fic handler
    fic_irq_gpio_6();
    1e22:	883fe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1e26:	14c12083          	lw	ra,332(sp)
    1e2a:	14412283          	lw	t0,324(sp)
    1e2e:	00329073          	fscsr	t0
    1e32:	14812283          	lw	t0,328(sp)
    1e36:	14012303          	lw	t1,320(sp)
    1e3a:	13c12383          	lw	t2,316(sp)
    1e3e:	13812503          	lw	a0,312(sp)
    1e42:	13412583          	lw	a1,308(sp)
    1e46:	13012603          	lw	a2,304(sp)
    1e4a:	12c12683          	lw	a3,300(sp)
    1e4e:	12812703          	lw	a4,296(sp)
    1e52:	12412783          	lw	a5,292(sp)
    1e56:	12012803          	lw	a6,288(sp)
    1e5a:	11c12883          	lw	a7,284(sp)
    1e5e:	11812e03          	lw	t3,280(sp)
    1e62:	11412e83          	lw	t4,276(sp)
    1e66:	11012f03          	lw	t5,272(sp)
    1e6a:	10c12f83          	lw	t6,268(sp)
    1e6e:	306e                	fld	ft0,248(sp)
    1e70:	30ce                	fld	ft1,240(sp)
    1e72:	312e                	fld	ft2,232(sp)
    1e74:	318e                	fld	ft3,224(sp)
    1e76:	226e                	fld	ft4,216(sp)
    1e78:	22ce                	fld	ft5,208(sp)
    1e7a:	232e                	fld	ft6,200(sp)
    1e7c:	238e                	fld	ft7,192(sp)
    1e7e:	346a                	fld	fs0,184(sp)
    1e80:	34ca                	fld	fs1,176(sp)
    1e82:	352a                	fld	fa0,168(sp)
    1e84:	358a                	fld	fa1,160(sp)
    1e86:	266a                	fld	fa2,152(sp)
    1e88:	26ca                	fld	fa3,144(sp)
    1e8a:	272a                	fld	fa4,136(sp)
    1e8c:	278a                	fld	fa5,128(sp)
    1e8e:	3866                	fld	fa6,120(sp)
    1e90:	38c6                	fld	fa7,112(sp)
    1e92:	3926                	fld	fs2,104(sp)
    1e94:	3986                	fld	fs3,96(sp)
    1e96:	2a66                	fld	fs4,88(sp)
    1e98:	2ac6                	fld	fs5,80(sp)
    1e9a:	2b26                	fld	fs6,72(sp)
    1e9c:	2b86                	fld	fs7,64(sp)
    1e9e:	3c62                	fld	fs8,56(sp)
    1ea0:	3cc2                	fld	fs9,48(sp)
    1ea2:	3d22                	fld	fs10,40(sp)
    1ea4:	3d82                	fld	fs11,32(sp)
    1ea6:	2e62                	fld	ft8,24(sp)
    1ea8:	2ec2                	fld	ft9,16(sp)
    1eaa:	2f22                	fld	ft10,8(sp)
    1eac:	2f82                	fld	ft11,0(sp)
    1eae:	6171                	addi	sp,sp,336
    1eb0:	30200073          	mret
    1eb4:	0000                	unimp
	...

00001eb8 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
    1eb8:	714d                	addi	sp,sp,-336
    1eba:	14112623          	sw	ra,332(sp)
    1ebe:	14512423          	sw	t0,328(sp)
    1ec2:	003022f3          	frcsr	t0
    1ec6:	14512223          	sw	t0,324(sp)
    1eca:	14612023          	sw	t1,320(sp)
    1ece:	12712e23          	sw	t2,316(sp)
    1ed2:	12a12c23          	sw	a0,312(sp)
    1ed6:	12b12a23          	sw	a1,308(sp)
    1eda:	12c12823          	sw	a2,304(sp)
    1ede:	12d12623          	sw	a3,300(sp)
    1ee2:	12e12423          	sw	a4,296(sp)
    1ee6:	12f12223          	sw	a5,292(sp)
    1eea:	13012023          	sw	a6,288(sp)
    1eee:	11112e23          	sw	a7,284(sp)
    1ef2:	11c12c23          	sw	t3,280(sp)
    1ef6:	11d12a23          	sw	t4,276(sp)
    1efa:	11e12823          	sw	t5,272(sp)
    1efe:	11f12623          	sw	t6,268(sp)
    1f02:	bd82                	fsd	ft0,248(sp)
    1f04:	b986                	fsd	ft1,240(sp)
    1f06:	b58a                	fsd	ft2,232(sp)
    1f08:	b18e                	fsd	ft3,224(sp)
    1f0a:	ad92                	fsd	ft4,216(sp)
    1f0c:	a996                	fsd	ft5,208(sp)
    1f0e:	a59a                	fsd	ft6,200(sp)
    1f10:	a19e                	fsd	ft7,192(sp)
    1f12:	bd22                	fsd	fs0,184(sp)
    1f14:	b926                	fsd	fs1,176(sp)
    1f16:	b52a                	fsd	fa0,168(sp)
    1f18:	b12e                	fsd	fa1,160(sp)
    1f1a:	ad32                	fsd	fa2,152(sp)
    1f1c:	a936                	fsd	fa3,144(sp)
    1f1e:	a53a                	fsd	fa4,136(sp)
    1f20:	a13e                	fsd	fa5,128(sp)
    1f22:	bcc2                	fsd	fa6,120(sp)
    1f24:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1f26:	200607b7          	lui	a5,0x20060
{
    1f2a:	b4ca                	fsd	fs2,104(sp)
    1f2c:	b0ce                	fsd	fs3,96(sp)
    1f2e:	acd2                	fsd	fs4,88(sp)
    1f30:	a8d6                	fsd	fs5,80(sp)
    1f32:	a4da                	fsd	fs6,72(sp)
    1f34:	a0de                	fsd	fs7,64(sp)
    1f36:	bc62                	fsd	fs8,56(sp)
    1f38:	b866                	fsd	fs9,48(sp)
    1f3a:	b46a                	fsd	fs10,40(sp)
    1f3c:	b06e                	fsd	fs11,32(sp)
    1f3e:	ac72                	fsd	ft8,24(sp)
    1f40:	a876                	fsd	ft9,16(sp)
    1f42:	a47a                	fsd	ft10,8(sp)
    1f44:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1f46:	6709                	lui	a4,0x2
    1f48:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
    1f4a:	f5afe0ef          	jal	6a4 <fic_irq_timer_1>
}
    1f4e:	14c12083          	lw	ra,332(sp)
    1f52:	14412283          	lw	t0,324(sp)
    1f56:	00329073          	fscsr	t0
    1f5a:	14812283          	lw	t0,328(sp)
    1f5e:	14012303          	lw	t1,320(sp)
    1f62:	13c12383          	lw	t2,316(sp)
    1f66:	13812503          	lw	a0,312(sp)
    1f6a:	13412583          	lw	a1,308(sp)
    1f6e:	13012603          	lw	a2,304(sp)
    1f72:	12c12683          	lw	a3,300(sp)
    1f76:	12812703          	lw	a4,296(sp)
    1f7a:	12412783          	lw	a5,292(sp)
    1f7e:	12012803          	lw	a6,288(sp)
    1f82:	11c12883          	lw	a7,284(sp)
    1f86:	11812e03          	lw	t3,280(sp)
    1f8a:	11412e83          	lw	t4,276(sp)
    1f8e:	11012f03          	lw	t5,272(sp)
    1f92:	10c12f83          	lw	t6,268(sp)
    1f96:	306e                	fld	ft0,248(sp)
    1f98:	30ce                	fld	ft1,240(sp)
    1f9a:	312e                	fld	ft2,232(sp)
    1f9c:	318e                	fld	ft3,224(sp)
    1f9e:	226e                	fld	ft4,216(sp)
    1fa0:	22ce                	fld	ft5,208(sp)
    1fa2:	232e                	fld	ft6,200(sp)
    1fa4:	238e                	fld	ft7,192(sp)
    1fa6:	346a                	fld	fs0,184(sp)
    1fa8:	34ca                	fld	fs1,176(sp)
    1faa:	352a                	fld	fa0,168(sp)
    1fac:	358a                	fld	fa1,160(sp)
    1fae:	266a                	fld	fa2,152(sp)
    1fb0:	26ca                	fld	fa3,144(sp)
    1fb2:	272a                	fld	fa4,136(sp)
    1fb4:	278a                	fld	fa5,128(sp)
    1fb6:	3866                	fld	fa6,120(sp)
    1fb8:	38c6                	fld	fa7,112(sp)
    1fba:	3926                	fld	fs2,104(sp)
    1fbc:	3986                	fld	fs3,96(sp)
    1fbe:	2a66                	fld	fs4,88(sp)
    1fc0:	2ac6                	fld	fs5,80(sp)
    1fc2:	2b26                	fld	fs6,72(sp)
    1fc4:	2b86                	fld	fs7,64(sp)
    1fc6:	3c62                	fld	fs8,56(sp)
    1fc8:	3cc2                	fld	fs9,48(sp)
    1fca:	3d22                	fld	fs10,40(sp)
    1fcc:	3d82                	fld	fs11,32(sp)
    1fce:	2e62                	fld	ft8,24(sp)
    1fd0:	2ec2                	fld	ft9,16(sp)
    1fd2:	2f22                	fld	ft10,8(sp)
    1fd4:	2f82                	fld	ft11,0(sp)
    1fd6:	6171                	addi	sp,sp,336
    1fd8:	30200073          	mret
    1fdc:	0000                	unimp
	...

00001fe0 <handler_irq_fast_dma_done>:
{
    1fe0:	714d                	addi	sp,sp,-336
    1fe2:	14112623          	sw	ra,332(sp)
    1fe6:	14512423          	sw	t0,328(sp)
    1fea:	003022f3          	frcsr	t0
    1fee:	14512223          	sw	t0,324(sp)
    1ff2:	14612023          	sw	t1,320(sp)
    1ff6:	12712e23          	sw	t2,316(sp)
    1ffa:	12a12c23          	sw	a0,312(sp)
    1ffe:	12b12a23          	sw	a1,308(sp)
    2002:	12c12823          	sw	a2,304(sp)
    2006:	12d12623          	sw	a3,300(sp)
    200a:	12e12423          	sw	a4,296(sp)
    200e:	12f12223          	sw	a5,292(sp)
    2012:	13012023          	sw	a6,288(sp)
    2016:	11112e23          	sw	a7,284(sp)
    201a:	11c12c23          	sw	t3,280(sp)
    201e:	11d12a23          	sw	t4,276(sp)
    2022:	11e12823          	sw	t5,272(sp)
    2026:	11f12623          	sw	t6,268(sp)
    202a:	bd82                	fsd	ft0,248(sp)
    202c:	b986                	fsd	ft1,240(sp)
    202e:	b58a                	fsd	ft2,232(sp)
    2030:	b18e                	fsd	ft3,224(sp)
    2032:	ad92                	fsd	ft4,216(sp)
    2034:	a996                	fsd	ft5,208(sp)
    2036:	a59a                	fsd	ft6,200(sp)
    2038:	a19e                	fsd	ft7,192(sp)
    203a:	bd22                	fsd	fs0,184(sp)
    203c:	b926                	fsd	fs1,176(sp)
    203e:	b52a                	fsd	fa0,168(sp)
    2040:	b12e                	fsd	fa1,160(sp)
    2042:	ad32                	fsd	fa2,152(sp)
    2044:	a936                	fsd	fa3,144(sp)
    2046:	a53a                	fsd	fa4,136(sp)
    2048:	a13e                	fsd	fa5,128(sp)
    204a:	bcc2                	fsd	fa6,120(sp)
    204c:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    204e:	200607b7          	lui	a5,0x20060
{
    2052:	b4ca                	fsd	fs2,104(sp)
    2054:	b0ce                	fsd	fs3,96(sp)
    2056:	acd2                	fsd	fs4,88(sp)
    2058:	a8d6                	fsd	fs5,80(sp)
    205a:	a4da                	fsd	fs6,72(sp)
    205c:	a0de                	fsd	fs7,64(sp)
    205e:	bc62                	fsd	fs8,56(sp)
    2060:	b866                	fsd	fs9,48(sp)
    2062:	b46a                	fsd	fs10,40(sp)
    2064:	b06e                	fsd	fs11,32(sp)
    2066:	ac72                	fsd	ft8,24(sp)
    2068:	a876                	fsd	ft9,16(sp)
    206a:	a47a                	fsd	ft10,8(sp)
    206c:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    206e:	4721                	li	a4,8
    2070:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
    2072:	daefe0ef          	jal	620 <fic_irq_dma_done>
}
    2076:	14c12083          	lw	ra,332(sp)
    207a:	14412283          	lw	t0,324(sp)
    207e:	00329073          	fscsr	t0
    2082:	14812283          	lw	t0,328(sp)
    2086:	14012303          	lw	t1,320(sp)
    208a:	13c12383          	lw	t2,316(sp)
    208e:	13812503          	lw	a0,312(sp)
    2092:	13412583          	lw	a1,308(sp)
    2096:	13012603          	lw	a2,304(sp)
    209a:	12c12683          	lw	a3,300(sp)
    209e:	12812703          	lw	a4,296(sp)
    20a2:	12412783          	lw	a5,292(sp)
    20a6:	12012803          	lw	a6,288(sp)
    20aa:	11c12883          	lw	a7,284(sp)
    20ae:	11812e03          	lw	t3,280(sp)
    20b2:	11412e83          	lw	t4,276(sp)
    20b6:	11012f03          	lw	t5,272(sp)
    20ba:	10c12f83          	lw	t6,268(sp)
    20be:	306e                	fld	ft0,248(sp)
    20c0:	30ce                	fld	ft1,240(sp)
    20c2:	312e                	fld	ft2,232(sp)
    20c4:	318e                	fld	ft3,224(sp)
    20c6:	226e                	fld	ft4,216(sp)
    20c8:	22ce                	fld	ft5,208(sp)
    20ca:	232e                	fld	ft6,200(sp)
    20cc:	238e                	fld	ft7,192(sp)
    20ce:	346a                	fld	fs0,184(sp)
    20d0:	34ca                	fld	fs1,176(sp)
    20d2:	352a                	fld	fa0,168(sp)
    20d4:	358a                	fld	fa1,160(sp)
    20d6:	266a                	fld	fa2,152(sp)
    20d8:	26ca                	fld	fa3,144(sp)
    20da:	272a                	fld	fa4,136(sp)
    20dc:	278a                	fld	fa5,128(sp)
    20de:	3866                	fld	fa6,120(sp)
    20e0:	38c6                	fld	fa7,112(sp)
    20e2:	3926                	fld	fs2,104(sp)
    20e4:	3986                	fld	fs3,96(sp)
    20e6:	2a66                	fld	fs4,88(sp)
    20e8:	2ac6                	fld	fs5,80(sp)
    20ea:	2b26                	fld	fs6,72(sp)
    20ec:	2b86                	fld	fs7,64(sp)
    20ee:	3c62                	fld	fs8,56(sp)
    20f0:	3cc2                	fld	fs9,48(sp)
    20f2:	3d22                	fld	fs10,40(sp)
    20f4:	3d82                	fld	fs11,32(sp)
    20f6:	2e62                	fld	ft8,24(sp)
    20f8:	2ec2                	fld	ft9,16(sp)
    20fa:	2f22                	fld	ft10,8(sp)
    20fc:	2f82                	fld	ft11,0(sp)
    20fe:	6171                	addi	sp,sp,336
    2100:	30200073          	mret
    2104:	0000                	unimp
	...

00002108 <handler_irq_fast_dma_window>:
{
    2108:	714d                	addi	sp,sp,-336
    210a:	14112623          	sw	ra,332(sp)
    210e:	14512423          	sw	t0,328(sp)
    2112:	003022f3          	frcsr	t0
    2116:	14512223          	sw	t0,324(sp)
    211a:	14612023          	sw	t1,320(sp)
    211e:	12712e23          	sw	t2,316(sp)
    2122:	12a12c23          	sw	a0,312(sp)
    2126:	12b12a23          	sw	a1,308(sp)
    212a:	12c12823          	sw	a2,304(sp)
    212e:	12d12623          	sw	a3,300(sp)
    2132:	12e12423          	sw	a4,296(sp)
    2136:	12f12223          	sw	a5,292(sp)
    213a:	13012023          	sw	a6,288(sp)
    213e:	11112e23          	sw	a7,284(sp)
    2142:	11c12c23          	sw	t3,280(sp)
    2146:	11d12a23          	sw	t4,276(sp)
    214a:	11e12823          	sw	t5,272(sp)
    214e:	11f12623          	sw	t6,268(sp)
    2152:	bd82                	fsd	ft0,248(sp)
    2154:	b986                	fsd	ft1,240(sp)
    2156:	b58a                	fsd	ft2,232(sp)
    2158:	b18e                	fsd	ft3,224(sp)
    215a:	ad92                	fsd	ft4,216(sp)
    215c:	a996                	fsd	ft5,208(sp)
    215e:	a59a                	fsd	ft6,200(sp)
    2160:	a19e                	fsd	ft7,192(sp)
    2162:	bd22                	fsd	fs0,184(sp)
    2164:	b926                	fsd	fs1,176(sp)
    2166:	b52a                	fsd	fa0,168(sp)
    2168:	b12e                	fsd	fa1,160(sp)
    216a:	ad32                	fsd	fa2,152(sp)
    216c:	a936                	fsd	fa3,144(sp)
    216e:	a53a                	fsd	fa4,136(sp)
    2170:	a13e                	fsd	fa5,128(sp)
    2172:	bcc2                	fsd	fa6,120(sp)
    2174:	b8c6                	fsd	fa7,112(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    2176:	200607b7          	lui	a5,0x20060
{
    217a:	b4ca                	fsd	fs2,104(sp)
    217c:	b0ce                	fsd	fs3,96(sp)
    217e:	acd2                	fsd	fs4,88(sp)
    2180:	a8d6                	fsd	fs5,80(sp)
    2182:	a4da                	fsd	fs6,72(sp)
    2184:	a0de                	fsd	fs7,64(sp)
    2186:	bc62                	fsd	fs8,56(sp)
    2188:	b866                	fsd	fs9,48(sp)
    218a:	b46a                	fsd	fs10,40(sp)
    218c:	b06e                	fsd	fs11,32(sp)
    218e:	ac72                	fsd	ft8,24(sp)
    2190:	a876                	fsd	ft9,16(sp)
    2192:	a47a                	fsd	ft10,8(sp)
    2194:	a07e                	fsd	ft11,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    2196:	6711                	lui	a4,0x4
    2198:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
    219a:	c32fe0ef          	jal	5cc <fic_irq_dma_window>
}
    219e:	14c12083          	lw	ra,332(sp)
    21a2:	14412283          	lw	t0,324(sp)
    21a6:	00329073          	fscsr	t0
    21aa:	14812283          	lw	t0,328(sp)
    21ae:	14012303          	lw	t1,320(sp)
    21b2:	13c12383          	lw	t2,316(sp)
    21b6:	13812503          	lw	a0,312(sp)
    21ba:	13412583          	lw	a1,308(sp)
    21be:	13012603          	lw	a2,304(sp)
    21c2:	12c12683          	lw	a3,300(sp)
    21c6:	12812703          	lw	a4,296(sp)
    21ca:	12412783          	lw	a5,292(sp)
    21ce:	12012803          	lw	a6,288(sp)
    21d2:	11c12883          	lw	a7,284(sp)
    21d6:	11812e03          	lw	t3,280(sp)
    21da:	11412e83          	lw	t4,276(sp)
    21de:	11012f03          	lw	t5,272(sp)
    21e2:	10c12f83          	lw	t6,268(sp)
    21e6:	306e                	fld	ft0,248(sp)
    21e8:	30ce                	fld	ft1,240(sp)
    21ea:	312e                	fld	ft2,232(sp)
    21ec:	318e                	fld	ft3,224(sp)
    21ee:	226e                	fld	ft4,216(sp)
    21f0:	22ce                	fld	ft5,208(sp)
    21f2:	232e                	fld	ft6,200(sp)
    21f4:	238e                	fld	ft7,192(sp)
    21f6:	346a                	fld	fs0,184(sp)
    21f8:	34ca                	fld	fs1,176(sp)
    21fa:	352a                	fld	fa0,168(sp)
    21fc:	358a                	fld	fa1,160(sp)
    21fe:	266a                	fld	fa2,152(sp)
    2200:	26ca                	fld	fa3,144(sp)
    2202:	272a                	fld	fa4,136(sp)
    2204:	278a                	fld	fa5,128(sp)
    2206:	3866                	fld	fa6,120(sp)
    2208:	38c6                	fld	fa7,112(sp)
    220a:	3926                	fld	fs2,104(sp)
    220c:	3986                	fld	fs3,96(sp)
    220e:	2a66                	fld	fs4,88(sp)
    2210:	2ac6                	fld	fs5,80(sp)
    2212:	2b26                	fld	fs6,72(sp)
    2214:	2b86                	fld	fs7,64(sp)
    2216:	3c62                	fld	fs8,56(sp)
    2218:	3cc2                	fld	fs9,48(sp)
    221a:	3d22                	fld	fs10,40(sp)
    221c:	3d82                	fld	fs11,32(sp)
    221e:	2e62                	fld	ft8,24(sp)
    2220:	2ec2                	fld	ft9,16(sp)
    2222:	2f22                	fld	ft10,8(sp)
    2224:	2f82                	fld	ft11,0(sp)
    2226:	6171                	addi	sp,sp,336
    2228:	30200073          	mret
    222c:	0000                	unimp
	...

00002230 <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    2230:	714d                	addi	sp,sp,-336
    2232:	14112623          	sw	ra,332(sp)
    2236:	14512423          	sw	t0,328(sp)
    223a:	003022f3          	frcsr	t0
    223e:	14512223          	sw	t0,324(sp)
    2242:	14612023          	sw	t1,320(sp)
    2246:	12712e23          	sw	t2,316(sp)
    224a:	12a12c23          	sw	a0,312(sp)
    224e:	12b12a23          	sw	a1,308(sp)
    2252:	12c12823          	sw	a2,304(sp)
    2256:	12d12623          	sw	a3,300(sp)
    225a:	12e12423          	sw	a4,296(sp)
    225e:	12f12223          	sw	a5,292(sp)
    2262:	13012023          	sw	a6,288(sp)
    2266:	11112e23          	sw	a7,284(sp)
    226a:	11c12c23          	sw	t3,280(sp)
    226e:	11d12a23          	sw	t4,276(sp)
    2272:	11e12823          	sw	t5,272(sp)
    2276:	11f12623          	sw	t6,268(sp)
    227a:	bd82                	fsd	ft0,248(sp)
    227c:	b986                	fsd	ft1,240(sp)
    227e:	b58a                	fsd	ft2,232(sp)
    2280:	b18e                	fsd	ft3,224(sp)
    2282:	ad92                	fsd	ft4,216(sp)
    2284:	a996                	fsd	ft5,208(sp)
    2286:	a59a                	fsd	ft6,200(sp)
    2288:	a19e                	fsd	ft7,192(sp)
    228a:	bd22                	fsd	fs0,184(sp)
    228c:	b926                	fsd	fs1,176(sp)
    228e:	b52a                	fsd	fa0,168(sp)
    2290:	b12e                	fsd	fa1,160(sp)
    2292:	ad32                	fsd	fa2,152(sp)
    2294:	a936                	fsd	fa3,144(sp)
    2296:	a53a                	fsd	fa4,136(sp)
    2298:	a13e                	fsd	fa5,128(sp)
    229a:	bcc2                	fsd	fa6,120(sp)
    229c:	b8c6                	fsd	fa7,112(sp)
    229e:	b4ca                	fsd	fs2,104(sp)
    22a0:	b0ce                	fsd	fs3,96(sp)
    22a2:	acd2                	fsd	fs4,88(sp)
    22a4:	a8d6                	fsd	fs5,80(sp)
    22a6:	a4da                	fsd	fs6,72(sp)
    22a8:	a0de                	fsd	fs7,64(sp)
    22aa:	bc62                	fsd	fs8,56(sp)
    22ac:	b866                	fsd	fs9,48(sp)
    22ae:	b46a                	fsd	fs10,40(sp)
    22b0:	b06e                	fsd	fs11,32(sp)
    22b2:	ac72                	fsd	ft8,24(sp)
    22b4:	a876                	fsd	ft9,16(sp)
    22b6:	a47a                	fsd	ft10,8(sp)
    22b8:	a07e                	fsd	ft11,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    22ba:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    22be:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
    22c0:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
    22c2:	00f76963          	bltu	a4,a5,22d4 <handler_exception+0xa4>
    22c6:	6711                	lui	a4,0x4
    22c8:	078a                	slli	a5,a5,0x2
    22ca:	aac70713          	addi	a4,a4,-1364 # 3aac <main+0x25e>
    22ce:	97ba                	add	a5,a5,a4
    22d0:	439c                	lw	a5,0(a5)
    22d2:	8782                	jr	a5
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
    22d4:	a001                	j	22d4 <handler_exception+0xa4>
__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    22d6:	6511                	lui	a0,0x4
    22d8:	e9c50513          	addi	a0,a0,-356 # 3e9c <main+0x64e>
    22dc:	8fffe0ef          	jal	bda <print_exc_msg>
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    22e0:	6511                	lui	a0,0x4
    22e2:	dec50513          	addi	a0,a0,-532 # 3dec <main+0x59e>
    22e6:	8f5fe0ef          	jal	bda <print_exc_msg>
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    22ea:	6511                	lui	a0,0x4
    22ec:	e2450513          	addi	a0,a0,-476 # 3e24 <main+0x5d6>
    22f0:	8ebfe0ef          	jal	bda <print_exc_msg>
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    22f4:	6511                	lui	a0,0x4
    22f6:	e6050513          	addi	a0,a0,-416 # 3e60 <main+0x612>
    22fa:	8e1fe0ef          	jal	bda <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
    22fe:	6511                	lui	a0,0x4
    2300:	ed050513          	addi	a0,a0,-304 # 3ed0 <main+0x682>
    2304:	8bbfe0ef          	jal	bbe <_writestr>
  while (1) {
    2308:	a001                	j	2308 <handler_exception+0xd8>
	...

0000230c <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
    230c:	714d                	addi	sp,sp,-336
    230e:	14112623          	sw	ra,332(sp)
    2312:	14512423          	sw	t0,328(sp)
    2316:	003022f3          	frcsr	t0
    231a:	12a12c23          	sw	a0,312(sp)
  _writestr("Software IRQ triggered!\n"); 
    231e:	6511                	lui	a0,0x4
__attribute__((weak)) void handler_irq_software(void) {
    2320:	14512223          	sw	t0,324(sp)
    2324:	14612023          	sw	t1,320(sp)
    2328:	12712e23          	sw	t2,316(sp)
    232c:	12b12a23          	sw	a1,308(sp)
    2330:	12c12823          	sw	a2,304(sp)
    2334:	12d12623          	sw	a3,300(sp)
    2338:	12e12423          	sw	a4,296(sp)
    233c:	12f12223          	sw	a5,292(sp)
    2340:	13012023          	sw	a6,288(sp)
    2344:	11112e23          	sw	a7,284(sp)
    2348:	11c12c23          	sw	t3,280(sp)
    234c:	11d12a23          	sw	t4,276(sp)
    2350:	11e12823          	sw	t5,272(sp)
    2354:	11f12623          	sw	t6,268(sp)
    2358:	bd82                	fsd	ft0,248(sp)
    235a:	b986                	fsd	ft1,240(sp)
    235c:	b58a                	fsd	ft2,232(sp)
    235e:	b18e                	fsd	ft3,224(sp)
    2360:	ad92                	fsd	ft4,216(sp)
    2362:	a996                	fsd	ft5,208(sp)
    2364:	a59a                	fsd	ft6,200(sp)
    2366:	a19e                	fsd	ft7,192(sp)
    2368:	bd22                	fsd	fs0,184(sp)
    236a:	b926                	fsd	fs1,176(sp)
    236c:	b52a                	fsd	fa0,168(sp)
    236e:	b12e                	fsd	fa1,160(sp)
    2370:	ad32                	fsd	fa2,152(sp)
    2372:	a936                	fsd	fa3,144(sp)
    2374:	a53a                	fsd	fa4,136(sp)
    2376:	a13e                	fsd	fa5,128(sp)
    2378:	bcc2                	fsd	fa6,120(sp)
  _writestr("Software IRQ triggered!\n"); 
    237a:	ef050513          	addi	a0,a0,-272 # 3ef0 <main+0x6a2>
__attribute__((weak)) void handler_irq_software(void) {
    237e:	b8c6                	fsd	fa7,112(sp)
    2380:	b4ca                	fsd	fs2,104(sp)
    2382:	b0ce                	fsd	fs3,96(sp)
    2384:	acd2                	fsd	fs4,88(sp)
    2386:	a8d6                	fsd	fs5,80(sp)
    2388:	a4da                	fsd	fs6,72(sp)
    238a:	a0de                	fsd	fs7,64(sp)
    238c:	bc62                	fsd	fs8,56(sp)
    238e:	b866                	fsd	fs9,48(sp)
    2390:	b46a                	fsd	fs10,40(sp)
    2392:	b06e                	fsd	fs11,32(sp)
    2394:	ac72                	fsd	ft8,24(sp)
    2396:	a876                	fsd	ft9,16(sp)
    2398:	a47a                	fsd	ft10,8(sp)
    239a:	a07e                	fsd	ft11,0(sp)
  _writestr("Software IRQ triggered!\n"); 
    239c:	823fe0ef          	jal	bbe <_writestr>
  while (1) {
    23a0:	a001                	j	23a0 <handler_irq_software+0x94>
	...

000023a4 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
    23a4:	714d                	addi	sp,sp,-336
    23a6:	14112623          	sw	ra,332(sp)
    23aa:	14512423          	sw	t0,328(sp)
    23ae:	003022f3          	frcsr	t0
    23b2:	12a12c23          	sw	a0,312(sp)
  _writestr("Timer IRQ triggered!\n"); 
    23b6:	6511                	lui	a0,0x4
__attribute__((weak)) void handler_irq_timer(void) {
    23b8:	14512223          	sw	t0,324(sp)
    23bc:	14612023          	sw	t1,320(sp)
    23c0:	12712e23          	sw	t2,316(sp)
    23c4:	12b12a23          	sw	a1,308(sp)
    23c8:	12c12823          	sw	a2,304(sp)
    23cc:	12d12623          	sw	a3,300(sp)
    23d0:	12e12423          	sw	a4,296(sp)
    23d4:	12f12223          	sw	a5,292(sp)
    23d8:	13012023          	sw	a6,288(sp)
    23dc:	11112e23          	sw	a7,284(sp)
    23e0:	11c12c23          	sw	t3,280(sp)
    23e4:	11d12a23          	sw	t4,276(sp)
    23e8:	11e12823          	sw	t5,272(sp)
    23ec:	11f12623          	sw	t6,268(sp)
    23f0:	bd82                	fsd	ft0,248(sp)
    23f2:	b986                	fsd	ft1,240(sp)
    23f4:	b58a                	fsd	ft2,232(sp)
    23f6:	b18e                	fsd	ft3,224(sp)
    23f8:	ad92                	fsd	ft4,216(sp)
    23fa:	a996                	fsd	ft5,208(sp)
    23fc:	a59a                	fsd	ft6,200(sp)
    23fe:	a19e                	fsd	ft7,192(sp)
    2400:	bd22                	fsd	fs0,184(sp)
    2402:	b926                	fsd	fs1,176(sp)
    2404:	b52a                	fsd	fa0,168(sp)
    2406:	b12e                	fsd	fa1,160(sp)
    2408:	ad32                	fsd	fa2,152(sp)
    240a:	a936                	fsd	fa3,144(sp)
    240c:	a53a                	fsd	fa4,136(sp)
    240e:	a13e                	fsd	fa5,128(sp)
    2410:	bcc2                	fsd	fa6,120(sp)
  _writestr("Timer IRQ triggered!\n"); 
    2412:	f0c50513          	addi	a0,a0,-244 # 3f0c <main+0x6be>
__attribute__((weak)) void handler_irq_timer(void) {
    2416:	b8c6                	fsd	fa7,112(sp)
    2418:	b4ca                	fsd	fs2,104(sp)
    241a:	b0ce                	fsd	fs3,96(sp)
    241c:	acd2                	fsd	fs4,88(sp)
    241e:	a8d6                	fsd	fs5,80(sp)
    2420:	a4da                	fsd	fs6,72(sp)
    2422:	a0de                	fsd	fs7,64(sp)
    2424:	bc62                	fsd	fs8,56(sp)
    2426:	b866                	fsd	fs9,48(sp)
    2428:	b46a                	fsd	fs10,40(sp)
    242a:	b06e                	fsd	fs11,32(sp)
    242c:	ac72                	fsd	ft8,24(sp)
    242e:	a876                	fsd	ft9,16(sp)
    2430:	a47a                	fsd	ft10,8(sp)
    2432:	a07e                	fsd	ft11,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
    2434:	f8afe0ef          	jal	bbe <_writestr>
  while (1) {
    2438:	a001                	j	2438 <handler_irq_timer+0x94>
	...

0000243c <init>:
#endif

int init()
{
    return 0;
}
    243c:	4501                	li	a0,0
    243e:	8082                	ret

00002440 <_close>:
}
    2440:	557d                	li	a0,-1
    2442:	8082                	ret

00002444 <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    2444:	200007b7          	lui	a5,0x20000
    2448:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    244a:	4705                	li	a4,1
    244c:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1ffc13b0>
    asm volatile("wfi");
    2450:	10500073          	wfi

00002454 <_fstat>:
    st->st_mode = S_IFCHR;
    2454:	6789                	lui	a5,0x2
    2456:	c1dc                	sw	a5,4(a1)
}
    2458:	4501                	li	a0,0
    245a:	8082                	ret

0000245c <_isatty>:
    return (file == STDOUT_FILENO);
    245c:	157d                	addi	a0,a0,-1
}
    245e:	00153513          	seqz	a0,a0
    2462:	8082                	ret

00002464 <_lseek>:
}
    2464:	4501                	li	a0,0
    2466:	8082                	ret

00002468 <_read>:
}
    2468:	4501                	li	a0,0
    246a:	8082                	ret

0000246c <_write_r>:
    return _write(fd,buf,cnt);
    246c:	852e                	mv	a0,a1
    246e:	85b2                	mv	a1,a2
    2470:	8636                	mv	a2,a3
    2472:	a44fe06f          	j	6b6 <_write>

00002476 <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
    2476:	00027737          	lui	a4,0x27
    247a:	c4818693          	addi	a3,gp,-952 # ec48 <__BSS_END__>
    247e:	c4870713          	addi	a4,a4,-952 # 26c48 <__heap_end>
{
    2482:	87aa                	mv	a5,a0
    char *old_brk = brk;
    2484:	9301a503          	lw	a0,-1744(gp) # e930 <brk>
    if (__heap_start == __heap_end) {
    2488:	00e68c63          	beq	a3,a4,24a0 <_sbrk+0x2a>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    248c:	97aa                	add	a5,a5,a0
    248e:	00e7f763          	bgeu	a5,a4,249c <_sbrk+0x26>
    2492:	00d7e563          	bltu	a5,a3,249c <_sbrk+0x26>
        brk += incr;
    2496:	92f1a823          	sw	a5,-1744(gp) # e930 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    249a:	8082                	ret
        return (void *)-1; 
    249c:	557d                	li	a0,-1
}
    249e:	8082                	ret
        return NULL; 
    24a0:	4501                	li	a0,0
    24a2:	8082                	ret

000024a4 <atexit>:
    24a4:	85aa                	mv	a1,a0
    24a6:	4681                	li	a3,0
    24a8:	4601                	li	a2,0
    24aa:	4501                	li	a0,0
    24ac:	a6b1                	j	27f8 <__register_exitproc>

000024ae <exit>:
    24ae:	1141                	addi	sp,sp,-16
    24b0:	c422                	sw	s0,8(sp)
    24b2:	c606                	sw	ra,12(sp)
    24b4:	00000797          	auipc	a5,0x0
    24b8:	3b878793          	addi	a5,a5,952 # 286c <__call_exitprocs>
    24bc:	842a                	mv	s0,a0
    24be:	c399                	beqz	a5,24c4 <exit+0x16>
    24c0:	4581                	li	a1,0
    24c2:	266d                	jal	286c <__call_exitprocs>
    24c4:	c341a783          	lw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    24c8:	c391                	beqz	a5,24cc <exit+0x1e>
    24ca:	9782                	jalr	a5
    24cc:	8522                	mv	a0,s0
    24ce:	3f9d                	jal	2444 <_exit>

000024d0 <std>:
    24d0:	1141                	addi	sp,sp,-16
    24d2:	c422                	sw	s0,8(sp)
    24d4:	c606                	sw	ra,12(sp)
    24d6:	842a                	mv	s0,a0
    24d8:	00b51623          	sh	a1,12(a0)
    24dc:	00c51723          	sh	a2,14(a0)
    24e0:	00052023          	sw	zero,0(a0)
    24e4:	00052223          	sw	zero,4(a0)
    24e8:	00052423          	sw	zero,8(a0)
    24ec:	06052223          	sw	zero,100(a0)
    24f0:	00052823          	sw	zero,16(a0)
    24f4:	00052a23          	sw	zero,20(a0)
    24f8:	00052c23          	sw	zero,24(a0)
    24fc:	4621                	li	a2,8
    24fe:	4581                	li	a1,0
    2500:	05c50513          	addi	a0,a0,92
    2504:	89efe0ef          	jal	5a2 <memset>
    2508:	00000797          	auipc	a5,0x0
    250c:	14078793          	addi	a5,a5,320 # 2648 <__sread>
    2510:	d05c                	sw	a5,36(s0)
    2512:	00000797          	auipc	a5,0x0
    2516:	16678793          	addi	a5,a5,358 # 2678 <__swrite>
    251a:	d41c                	sw	a5,40(s0)
    251c:	00000797          	auipc	a5,0x0
    2520:	1aa78793          	addi	a5,a5,426 # 26c6 <__sseek>
    2524:	d45c                	sw	a5,44(s0)
    2526:	00000797          	auipc	a5,0x0
    252a:	1d678793          	addi	a5,a5,470 # 26fc <__sclose>
    252e:	40b2                	lw	ra,12(sp)
    2530:	d000                	sw	s0,32(s0)
    2532:	d81c                	sw	a5,48(s0)
    2534:	4422                	lw	s0,8(sp)
    2536:	0141                	addi	sp,sp,16
    2538:	8082                	ret

0000253a <stdio_exit_handler>:
    253a:	0000c617          	auipc	a2,0xc
    253e:	39e60613          	addi	a2,a2,926 # e8d8 <__sglue>
    2542:	00000597          	auipc	a1,0x0
    2546:	72c58593          	addi	a1,a1,1836 # 2c6e <_fflush_r>
    254a:	0000c517          	auipc	a0,0xc
    254e:	39a50513          	addi	a0,a0,922 # e8e4 <_impure_data>
    2552:	a079                	j	25e0 <_fwalk_sglue>

00002554 <cleanup_stdio>:
    2554:	414c                	lw	a1,4(a0)
    2556:	1141                	addi	sp,sp,-16
    2558:	c422                	sw	s0,8(sp)
    255a:	c606                	sw	ra,12(sp)
    255c:	a6818793          	addi	a5,gp,-1432 # ea68 <__sf>
    2560:	842a                	mv	s0,a0
    2562:	00f58463          	beq	a1,a5,256a <cleanup_stdio+0x16>
    2566:	708000ef          	jal	2c6e <_fflush_r>
    256a:	440c                	lw	a1,8(s0)
    256c:	ad018793          	addi	a5,gp,-1328 # ead0 <__sf+0x68>
    2570:	00f58563          	beq	a1,a5,257a <cleanup_stdio+0x26>
    2574:	8522                	mv	a0,s0
    2576:	6f8000ef          	jal	2c6e <_fflush_r>
    257a:	444c                	lw	a1,12(s0)
    257c:	b3818793          	addi	a5,gp,-1224 # eb38 <__sf+0xd0>
    2580:	00f58763          	beq	a1,a5,258e <cleanup_stdio+0x3a>
    2584:	8522                	mv	a0,s0
    2586:	4422                	lw	s0,8(sp)
    2588:	40b2                	lw	ra,12(sp)
    258a:	0141                	addi	sp,sp,16
    258c:	a5cd                	j	2c6e <_fflush_r>
    258e:	40b2                	lw	ra,12(sp)
    2590:	4422                	lw	s0,8(sp)
    2592:	0141                	addi	sp,sp,16
    2594:	8082                	ret

00002596 <global_stdio_init.part.0>:
    2596:	1141                	addi	sp,sp,-16
    2598:	00000797          	auipc	a5,0x0
    259c:	fa278793          	addi	a5,a5,-94 # 253a <stdio_exit_handler>
    25a0:	4601                	li	a2,0
    25a2:	4591                	li	a1,4
    25a4:	a6818513          	addi	a0,gp,-1432 # ea68 <__sf>
    25a8:	c606                	sw	ra,12(sp)
    25aa:	c2f1aa23          	sw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    25ae:	370d                	jal	24d0 <std>
    25b0:	4605                	li	a2,1
    25b2:	45a5                	li	a1,9
    25b4:	ad018513          	addi	a0,gp,-1328 # ead0 <__sf+0x68>
    25b8:	3f21                	jal	24d0 <std>
    25ba:	40b2                	lw	ra,12(sp)
    25bc:	4609                	li	a2,2
    25be:	45c9                	li	a1,18
    25c0:	b3818513          	addi	a0,gp,-1224 # eb38 <__sf+0xd0>
    25c4:	0141                	addi	sp,sp,16
    25c6:	b729                	j	24d0 <std>

000025c8 <__sinit>:
    25c8:	511c                	lw	a5,32(a0)
    25ca:	eb91                	bnez	a5,25de <__sinit+0x16>
    25cc:	00000797          	auipc	a5,0x0
    25d0:	f8878793          	addi	a5,a5,-120 # 2554 <cleanup_stdio>
    25d4:	d11c                	sw	a5,32(a0)
    25d6:	c341a783          	lw	a5,-972(gp) # ec34 <__stdio_exit_handler>
    25da:	e391                	bnez	a5,25de <__sinit+0x16>
    25dc:	bf6d                	j	2596 <global_stdio_init.part.0>
    25de:	8082                	ret

000025e0 <_fwalk_sglue>:
    25e0:	7179                	addi	sp,sp,-48
    25e2:	d422                	sw	s0,40(sp)
    25e4:	d04a                	sw	s2,32(sp)
    25e6:	ce4e                	sw	s3,28(sp)
    25e8:	cc52                	sw	s4,24(sp)
    25ea:	c85a                	sw	s6,16(sp)
    25ec:	c65e                	sw	s7,12(sp)
    25ee:	d606                	sw	ra,44(sp)
    25f0:	d226                	sw	s1,36(sp)
    25f2:	ca56                	sw	s5,20(sp)
    25f4:	89aa                	mv	s3,a0
    25f6:	8a2e                	mv	s4,a1
    25f8:	8432                	mv	s0,a2
    25fa:	4901                	li	s2,0
    25fc:	4b05                	li	s6,1
    25fe:	5bfd                	li	s7,-1
    2600:	4404                	lw	s1,8(s0)
    2602:	00442a83          	lw	s5,4(s0)
    2606:	1afd                	addi	s5,s5,-1
    2608:	020ad063          	bgez	s5,2628 <_fwalk_sglue+0x48>
    260c:	4000                	lw	s0,0(s0)
    260e:	f86d                	bnez	s0,2600 <_fwalk_sglue+0x20>
    2610:	50b2                	lw	ra,44(sp)
    2612:	5422                	lw	s0,40(sp)
    2614:	5492                	lw	s1,36(sp)
    2616:	49f2                	lw	s3,28(sp)
    2618:	4a62                	lw	s4,24(sp)
    261a:	4ad2                	lw	s5,20(sp)
    261c:	4b42                	lw	s6,16(sp)
    261e:	4bb2                	lw	s7,12(sp)
    2620:	854a                	mv	a0,s2
    2622:	5902                	lw	s2,32(sp)
    2624:	6145                	addi	sp,sp,48
    2626:	8082                	ret
    2628:	00c4d783          	lhu	a5,12(s1)
    262c:	00fb7b63          	bgeu	s6,a5,2642 <_fwalk_sglue+0x62>
    2630:	00e49783          	lh	a5,14(s1)
    2634:	01778763          	beq	a5,s7,2642 <_fwalk_sglue+0x62>
    2638:	85a6                	mv	a1,s1
    263a:	854e                	mv	a0,s3
    263c:	9a02                	jalr	s4
    263e:	00a96933          	or	s2,s2,a0
    2642:	06848493          	addi	s1,s1,104
    2646:	b7c1                	j	2606 <_fwalk_sglue+0x26>

00002648 <__sread>:
    2648:	1141                	addi	sp,sp,-16
    264a:	c422                	sw	s0,8(sp)
    264c:	842e                	mv	s0,a1
    264e:	00e59583          	lh	a1,14(a1)
    2652:	c606                	sw	ra,12(sp)
    2654:	28fd                	jal	2752 <_read_r>
    2656:	00054963          	bltz	a0,2668 <__sread+0x20>
    265a:	487c                	lw	a5,84(s0)
    265c:	97aa                	add	a5,a5,a0
    265e:	c87c                	sw	a5,84(s0)
    2660:	40b2                	lw	ra,12(sp)
    2662:	4422                	lw	s0,8(sp)
    2664:	0141                	addi	sp,sp,16
    2666:	8082                	ret
    2668:	00c45783          	lhu	a5,12(s0)
    266c:	777d                	lui	a4,0xfffff
    266e:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    2670:	8ff9                	and	a5,a5,a4
    2672:	00f41623          	sh	a5,12(s0)
    2676:	b7ed                	j	2660 <__sread+0x18>

00002678 <__swrite>:
    2678:	00c5d783          	lhu	a5,12(a1)
    267c:	1101                	addi	sp,sp,-32
    267e:	cc22                	sw	s0,24(sp)
    2680:	ca26                	sw	s1,20(sp)
    2682:	c84a                	sw	s2,16(sp)
    2684:	c64e                	sw	s3,12(sp)
    2686:	ce06                	sw	ra,28(sp)
    2688:	1007f793          	andi	a5,a5,256
    268c:	84aa                	mv	s1,a0
    268e:	842e                	mv	s0,a1
    2690:	8932                	mv	s2,a2
    2692:	89b6                	mv	s3,a3
    2694:	c791                	beqz	a5,26a0 <__swrite+0x28>
    2696:	00e59583          	lh	a1,14(a1)
    269a:	4689                	li	a3,2
    269c:	4601                	li	a2,0
    269e:	2069                	jal	2728 <_lseek_r>
    26a0:	00c45783          	lhu	a5,12(s0)
    26a4:	777d                	lui	a4,0xfffff
    26a6:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    26a8:	8ff9                	and	a5,a5,a4
    26aa:	00e41583          	lh	a1,14(s0)
    26ae:	00f41623          	sh	a5,12(s0)
    26b2:	4462                	lw	s0,24(sp)
    26b4:	40f2                	lw	ra,28(sp)
    26b6:	86ce                	mv	a3,s3
    26b8:	864a                	mv	a2,s2
    26ba:	49b2                	lw	s3,12(sp)
    26bc:	4942                	lw	s2,16(sp)
    26be:	8526                	mv	a0,s1
    26c0:	44d2                	lw	s1,20(sp)
    26c2:	6105                	addi	sp,sp,32
    26c4:	b365                	j	246c <_write_r>

000026c6 <__sseek>:
    26c6:	1141                	addi	sp,sp,-16
    26c8:	c422                	sw	s0,8(sp)
    26ca:	842e                	mv	s0,a1
    26cc:	00e59583          	lh	a1,14(a1)
    26d0:	c606                	sw	ra,12(sp)
    26d2:	2899                	jal	2728 <_lseek_r>
    26d4:	577d                	li	a4,-1
    26d6:	00c41783          	lh	a5,12(s0)
    26da:	00e51b63          	bne	a0,a4,26f0 <__sseek+0x2a>
    26de:	777d                	lui	a4,0xfffff
    26e0:	177d                	addi	a4,a4,-1 # ffffefff <_lma_data_end+0xbfff03b7>
    26e2:	8ff9                	and	a5,a5,a4
    26e4:	00f41623          	sh	a5,12(s0)
    26e8:	40b2                	lw	ra,12(sp)
    26ea:	4422                	lw	s0,8(sp)
    26ec:	0141                	addi	sp,sp,16
    26ee:	8082                	ret
    26f0:	6705                	lui	a4,0x1
    26f2:	8fd9                	or	a5,a5,a4
    26f4:	00f41623          	sh	a5,12(s0)
    26f8:	c868                	sw	a0,84(s0)
    26fa:	b7fd                	j	26e8 <__sseek+0x22>

000026fc <__sclose>:
    26fc:	00e59583          	lh	a1,14(a1)
    2700:	a009                	j	2702 <_close_r>

00002702 <_close_r>:
    2702:	1141                	addi	sp,sp,-16
    2704:	c422                	sw	s0,8(sp)
    2706:	842a                	mv	s0,a0
    2708:	852e                	mv	a0,a1
    270a:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    270e:	c606                	sw	ra,12(sp)
    2710:	3b05                	jal	2440 <_close>
    2712:	57fd                	li	a5,-1
    2714:	00f51663          	bne	a0,a5,2720 <_close_r+0x1e>
    2718:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    271c:	c391                	beqz	a5,2720 <_close_r+0x1e>
    271e:	c01c                	sw	a5,0(s0)
    2720:	40b2                	lw	ra,12(sp)
    2722:	4422                	lw	s0,8(sp)
    2724:	0141                	addi	sp,sp,16
    2726:	8082                	ret

00002728 <_lseek_r>:
    2728:	1141                	addi	sp,sp,-16
    272a:	c422                	sw	s0,8(sp)
    272c:	842a                	mv	s0,a0
    272e:	852e                	mv	a0,a1
    2730:	85b2                	mv	a1,a2
    2732:	8636                	mv	a2,a3
    2734:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    2738:	c606                	sw	ra,12(sp)
    273a:	332d                	jal	2464 <_lseek>
    273c:	57fd                	li	a5,-1
    273e:	00f51663          	bne	a0,a5,274a <_lseek_r+0x22>
    2742:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    2746:	c391                	beqz	a5,274a <_lseek_r+0x22>
    2748:	c01c                	sw	a5,0(s0)
    274a:	40b2                	lw	ra,12(sp)
    274c:	4422                	lw	s0,8(sp)
    274e:	0141                	addi	sp,sp,16
    2750:	8082                	ret

00002752 <_read_r>:
    2752:	1141                	addi	sp,sp,-16
    2754:	c422                	sw	s0,8(sp)
    2756:	842a                	mv	s0,a0
    2758:	852e                	mv	a0,a1
    275a:	85b2                	mv	a1,a2
    275c:	8636                	mv	a2,a3
    275e:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    2762:	c606                	sw	ra,12(sp)
    2764:	3311                	jal	2468 <_read>
    2766:	57fd                	li	a5,-1
    2768:	00f51663          	bne	a0,a5,2774 <_read_r+0x22>
    276c:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    2770:	c391                	beqz	a5,2774 <_read_r+0x22>
    2772:	c01c                	sw	a5,0(s0)
    2774:	40b2                	lw	ra,12(sp)
    2776:	4422                	lw	s0,8(sp)
    2778:	0141                	addi	sp,sp,16
    277a:	8082                	ret

0000277c <__libc_init_array>:
    277c:	1141                	addi	sp,sp,-16
    277e:	c422                	sw	s0,8(sp)
    2780:	c226                	sw	s1,4(sp)
    2782:	00000413          	li	s0,0
    2786:	00000493          	li	s1,0
    278a:	8c81                	sub	s1,s1,s0
    278c:	c04a                	sw	s2,0(sp)
    278e:	c606                	sw	ra,12(sp)
    2790:	8489                	srai	s1,s1,0x2
    2792:	4901                	li	s2,0
    2794:	02991163          	bne	s2,s1,27b6 <__libc_init_array+0x3a>
    2798:	00000413          	li	s0,0
    279c:	00000493          	li	s1,0
    27a0:	8c81                	sub	s1,s1,s0
    27a2:	8489                	srai	s1,s1,0x2
    27a4:	4901                	li	s2,0
    27a6:	00991d63          	bne	s2,s1,27c0 <__libc_init_array+0x44>
    27aa:	40b2                	lw	ra,12(sp)
    27ac:	4422                	lw	s0,8(sp)
    27ae:	4492                	lw	s1,4(sp)
    27b0:	4902                	lw	s2,0(sp)
    27b2:	0141                	addi	sp,sp,16
    27b4:	8082                	ret
    27b6:	401c                	lw	a5,0(s0)
    27b8:	0905                	addi	s2,s2,1
    27ba:	0411                	addi	s0,s0,4
    27bc:	9782                	jalr	a5
    27be:	bfd9                	j	2794 <__libc_init_array+0x18>
    27c0:	401c                	lw	a5,0(s0)
    27c2:	0905                	addi	s2,s2,1
    27c4:	0411                	addi	s0,s0,4
    27c6:	9782                	jalr	a5
    27c8:	bff9                	j	27a6 <__libc_init_array+0x2a>

000027ca <__libc_fini_array>:
    27ca:	1141                	addi	sp,sp,-16
    27cc:	c422                	sw	s0,8(sp)
    27ce:	c226                	sw	s1,4(sp)
    27d0:	00000413          	li	s0,0
    27d4:	00000493          	li	s1,0
    27d8:	8c05                	sub	s0,s0,s1
    27da:	c606                	sw	ra,12(sp)
    27dc:	8409                	srai	s0,s0,0x2
    27de:	e411                	bnez	s0,27ea <__libc_fini_array+0x20>
    27e0:	40b2                	lw	ra,12(sp)
    27e2:	4422                	lw	s0,8(sp)
    27e4:	4492                	lw	s1,4(sp)
    27e6:	0141                	addi	sp,sp,16
    27e8:	8082                	ret
    27ea:	147d                	addi	s0,s0,-1
    27ec:	00241793          	slli	a5,s0,0x2
    27f0:	97a6                	add	a5,a5,s1
    27f2:	439c                	lw	a5,0(a5)
    27f4:	9782                	jalr	a5
    27f6:	b7e5                	j	27de <__libc_fini_array+0x14>

000027f8 <__register_exitproc>:
    27f8:	c3c18713          	addi	a4,gp,-964 # ec3c <__atexit>
    27fc:	431c                	lw	a5,0(a4)
    27fe:	88aa                	mv	a7,a0
    2800:	ef81                	bnez	a5,2818 <__register_exitproc+0x20>
    2802:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    2806:	c31c                	sw	a5,0(a4)
    2808:	00000713          	li	a4,0
    280c:	c701                	beqz	a4,2814 <__register_exitproc+0x1c>
    280e:	4318                	lw	a4,0(a4)
    2810:	08e7a423          	sw	a4,136(a5)
    2814:	ba018793          	addi	a5,gp,-1120 # eba0 <__atexit0>
    2818:	43d8                	lw	a4,4(a5)
    281a:	487d                	li	a6,31
    281c:	557d                	li	a0,-1
    281e:	04e84663          	blt	a6,a4,286a <__register_exitproc+0x72>
    2822:	02088d63          	beqz	a7,285c <__register_exitproc+0x64>
    2826:	0887a803          	lw	a6,136(a5)
    282a:	04080063          	beqz	a6,286a <__register_exitproc+0x72>
    282e:	00271513          	slli	a0,a4,0x2
    2832:	9542                	add	a0,a0,a6
    2834:	c110                	sw	a2,0(a0)
    2836:	10082303          	lw	t1,256(a6)
    283a:	4605                	li	a2,1
    283c:	00e61633          	sll	a2,a2,a4
    2840:	00c36333          	or	t1,t1,a2
    2844:	10682023          	sw	t1,256(a6)
    2848:	08d52023          	sw	a3,128(a0)
    284c:	4689                	li	a3,2
    284e:	00d89763          	bne	a7,a3,285c <__register_exitproc+0x64>
    2852:	10482683          	lw	a3,260(a6)
    2856:	8ed1                	or	a3,a3,a2
    2858:	10d82223          	sw	a3,260(a6)
    285c:	00170693          	addi	a3,a4,1 # 1001 <handler_irq_fast_spi_flash+0xad>
    2860:	070a                	slli	a4,a4,0x2
    2862:	c3d4                	sw	a3,4(a5)
    2864:	97ba                	add	a5,a5,a4
    2866:	c78c                	sw	a1,8(a5)
    2868:	4501                	li	a0,0
    286a:	8082                	ret

0000286c <__call_exitprocs>:
    286c:	7179                	addi	sp,sp,-48
    286e:	ca56                	sw	s5,20(sp)
    2870:	c85a                	sw	s6,16(sp)
    2872:	c65e                	sw	s7,12(sp)
    2874:	c462                	sw	s8,8(sp)
    2876:	d606                	sw	ra,44(sp)
    2878:	d422                	sw	s0,40(sp)
    287a:	d226                	sw	s1,36(sp)
    287c:	d04a                	sw	s2,32(sp)
    287e:	ce4e                	sw	s3,28(sp)
    2880:	cc52                	sw	s4,24(sp)
    2882:	c266                	sw	s9,4(sp)
    2884:	8b2a                	mv	s6,a0
    2886:	8aae                	mv	s5,a1
    2888:	c3c18b93          	addi	s7,gp,-964 # ec3c <__atexit>
    288c:	4c05                	li	s8,1
    288e:	000ba483          	lw	s1,0(s7)
    2892:	cc81                	beqz	s1,28aa <__call_exitprocs+0x3e>
    2894:	40c0                	lw	s0,4(s1)
    2896:	0884a983          	lw	s3,136(s1)
    289a:	fff40913          	addi	s2,s0,-1
    289e:	040a                	slli	s0,s0,0x2
    28a0:	00898a33          	add	s4,s3,s0
    28a4:	9426                	add	s0,s0,s1
    28a6:	00095f63          	bgez	s2,28c4 <__call_exitprocs+0x58>
    28aa:	50b2                	lw	ra,44(sp)
    28ac:	5422                	lw	s0,40(sp)
    28ae:	5492                	lw	s1,36(sp)
    28b0:	5902                	lw	s2,32(sp)
    28b2:	49f2                	lw	s3,28(sp)
    28b4:	4a62                	lw	s4,24(sp)
    28b6:	4ad2                	lw	s5,20(sp)
    28b8:	4b42                	lw	s6,16(sp)
    28ba:	4bb2                	lw	s7,12(sp)
    28bc:	4c22                	lw	s8,8(sp)
    28be:	4c92                	lw	s9,4(sp)
    28c0:	6145                	addi	sp,sp,48
    28c2:	8082                	ret
    28c4:	000a8c63          	beqz	s5,28dc <__call_exitprocs+0x70>
    28c8:	00099663          	bnez	s3,28d4 <__call_exitprocs+0x68>
    28cc:	197d                	addi	s2,s2,-1
    28ce:	1a71                	addi	s4,s4,-4
    28d0:	1471                	addi	s0,s0,-4
    28d2:	bfd1                	j	28a6 <__call_exitprocs+0x3a>
    28d4:	07ca2783          	lw	a5,124(s4)
    28d8:	ff579ae3          	bne	a5,s5,28cc <__call_exitprocs+0x60>
    28dc:	40d8                	lw	a4,4(s1)
    28de:	405c                	lw	a5,4(s0)
    28e0:	177d                	addi	a4,a4,-1
    28e2:	03271863          	bne	a4,s2,2912 <__call_exitprocs+0xa6>
    28e6:	0124a223          	sw	s2,4(s1)
    28ea:	d3ed                	beqz	a5,28cc <__call_exitprocs+0x60>
    28ec:	0044ac83          	lw	s9,4(s1)
    28f0:	00098863          	beqz	s3,2900 <__call_exitprocs+0x94>
    28f4:	1009a683          	lw	a3,256(s3)
    28f8:	012c1733          	sll	a4,s8,s2
    28fc:	8ef9                	and	a3,a3,a4
    28fe:	ee89                	bnez	a3,2918 <__call_exitprocs+0xac>
    2900:	9782                	jalr	a5
    2902:	40d8                	lw	a4,4(s1)
    2904:	000ba783          	lw	a5,0(s7)
    2908:	f99713e3          	bne	a4,s9,288e <__call_exitprocs+0x22>
    290c:	fcf480e3          	beq	s1,a5,28cc <__call_exitprocs+0x60>
    2910:	bfbd                	j	288e <__call_exitprocs+0x22>
    2912:	00042223          	sw	zero,4(s0)
    2916:	bfd1                	j	28ea <__call_exitprocs+0x7e>
    2918:	1049a683          	lw	a3,260(s3)
    291c:	ffca2583          	lw	a1,-4(s4)
    2920:	8f75                	and	a4,a4,a3
    2922:	e701                	bnez	a4,292a <__call_exitprocs+0xbe>
    2924:	855a                	mv	a0,s6
    2926:	9782                	jalr	a5
    2928:	bfe9                	j	2902 <__call_exitprocs+0x96>
    292a:	852e                	mv	a0,a1
    292c:	9782                	jalr	a5
    292e:	bfd1                	j	2902 <__call_exitprocs+0x96>

00002930 <_free_r>:
    2930:	cdd1                	beqz	a1,29cc <_free_r+0x9c>
    2932:	ffc5a783          	lw	a5,-4(a1)
    2936:	1101                	addi	sp,sp,-32
    2938:	cc22                	sw	s0,24(sp)
    293a:	ce06                	sw	ra,28(sp)
    293c:	ffc58413          	addi	s0,a1,-4
    2940:	0007d363          	bgez	a5,2946 <_free_r+0x16>
    2944:	943e                	add	s0,s0,a5
    2946:	c62a                	sw	a0,12(sp)
    2948:	2acd                	jal	2b3a <__malloc_lock>
    294a:	c4418713          	addi	a4,gp,-956 # ec44 <__malloc_free_list>
    294e:	431c                	lw	a5,0(a4)
    2950:	4532                	lw	a0,12(sp)
    2952:	eb81                	bnez	a5,2962 <_free_r+0x32>
    2954:	00042223          	sw	zero,4(s0)
    2958:	c300                	sw	s0,0(a4)
    295a:	4462                	lw	s0,24(sp)
    295c:	40f2                	lw	ra,28(sp)
    295e:	6105                	addi	sp,sp,32
    2960:	aaf1                	j	2b3c <__malloc_unlock>
    2962:	00f47d63          	bgeu	s0,a5,297c <_free_r+0x4c>
    2966:	4010                	lw	a2,0(s0)
    2968:	00c406b3          	add	a3,s0,a2
    296c:	00d79663          	bne	a5,a3,2978 <_free_r+0x48>
    2970:	4394                	lw	a3,0(a5)
    2972:	43dc                	lw	a5,4(a5)
    2974:	96b2                	add	a3,a3,a2
    2976:	c014                	sw	a3,0(s0)
    2978:	c05c                	sw	a5,4(s0)
    297a:	bff9                	j	2958 <_free_r+0x28>
    297c:	873e                	mv	a4,a5
    297e:	43dc                	lw	a5,4(a5)
    2980:	c399                	beqz	a5,2986 <_free_r+0x56>
    2982:	fef47de3          	bgeu	s0,a5,297c <_free_r+0x4c>
    2986:	4314                	lw	a3,0(a4)
    2988:	00d70633          	add	a2,a4,a3
    298c:	00861f63          	bne	a2,s0,29aa <_free_r+0x7a>
    2990:	4010                	lw	a2,0(s0)
    2992:	96b2                	add	a3,a3,a2
    2994:	c314                	sw	a3,0(a4)
    2996:	00d70633          	add	a2,a4,a3
    299a:	fcc790e3          	bne	a5,a2,295a <_free_r+0x2a>
    299e:	4390                	lw	a2,0(a5)
    29a0:	43dc                	lw	a5,4(a5)
    29a2:	96b2                	add	a3,a3,a2
    29a4:	c314                	sw	a3,0(a4)
    29a6:	c35c                	sw	a5,4(a4)
    29a8:	bf4d                	j	295a <_free_r+0x2a>
    29aa:	00c47563          	bgeu	s0,a2,29b4 <_free_r+0x84>
    29ae:	47b1                	li	a5,12
    29b0:	c11c                	sw	a5,0(a0)
    29b2:	b765                	j	295a <_free_r+0x2a>
    29b4:	4010                	lw	a2,0(s0)
    29b6:	00c406b3          	add	a3,s0,a2
    29ba:	00d79663          	bne	a5,a3,29c6 <_free_r+0x96>
    29be:	4394                	lw	a3,0(a5)
    29c0:	43dc                	lw	a5,4(a5)
    29c2:	96b2                	add	a3,a3,a2
    29c4:	c014                	sw	a3,0(s0)
    29c6:	c05c                	sw	a5,4(s0)
    29c8:	c340                	sw	s0,4(a4)
    29ca:	bf41                	j	295a <_free_r+0x2a>
    29cc:	8082                	ret

000029ce <sbrk_aligned>:
    29ce:	1141                	addi	sp,sp,-16
    29d0:	c04a                	sw	s2,0(sp)
    29d2:	c4018913          	addi	s2,gp,-960 # ec40 <__malloc_sbrk_start>
    29d6:	00092783          	lw	a5,0(s2)
    29da:	c422                	sw	s0,8(sp)
    29dc:	c226                	sw	s1,4(sp)
    29de:	c606                	sw	ra,12(sp)
    29e0:	84aa                	mv	s1,a0
    29e2:	842e                	mv	s0,a1
    29e4:	e789                	bnez	a5,29ee <sbrk_aligned+0x20>
    29e6:	4581                	li	a1,0
    29e8:	2c7d                	jal	2ca6 <_sbrk_r>
    29ea:	00a92023          	sw	a0,0(s2)
    29ee:	85a2                	mv	a1,s0
    29f0:	8526                	mv	a0,s1
    29f2:	2c55                	jal	2ca6 <_sbrk_r>
    29f4:	597d                	li	s2,-1
    29f6:	01251a63          	bne	a0,s2,2a0a <sbrk_aligned+0x3c>
    29fa:	547d                	li	s0,-1
    29fc:	40b2                	lw	ra,12(sp)
    29fe:	8522                	mv	a0,s0
    2a00:	4422                	lw	s0,8(sp)
    2a02:	4492                	lw	s1,4(sp)
    2a04:	4902                	lw	s2,0(sp)
    2a06:	0141                	addi	sp,sp,16
    2a08:	8082                	ret
    2a0a:	00350413          	addi	s0,a0,3
    2a0e:	9871                	andi	s0,s0,-4
    2a10:	fe8506e3          	beq	a0,s0,29fc <sbrk_aligned+0x2e>
    2a14:	40a405b3          	sub	a1,s0,a0
    2a18:	8526                	mv	a0,s1
    2a1a:	2471                	jal	2ca6 <_sbrk_r>
    2a1c:	ff2510e3          	bne	a0,s2,29fc <sbrk_aligned+0x2e>
    2a20:	bfe9                	j	29fa <sbrk_aligned+0x2c>

00002a22 <_malloc_r>:
    2a22:	1101                	addi	sp,sp,-32
    2a24:	ca26                	sw	s1,20(sp)
    2a26:	00358493          	addi	s1,a1,3
    2a2a:	98f1                	andi	s1,s1,-4
    2a2c:	c84a                	sw	s2,16(sp)
    2a2e:	ce06                	sw	ra,28(sp)
    2a30:	cc22                	sw	s0,24(sp)
    2a32:	c64e                	sw	s3,12(sp)
    2a34:	c452                	sw	s4,8(sp)
    2a36:	04a1                	addi	s1,s1,8
    2a38:	47b1                	li	a5,12
    2a3a:	892a                	mv	s2,a0
    2a3c:	06f4f363          	bgeu	s1,a5,2aa2 <_malloc_r+0x80>
    2a40:	84be                	mv	s1,a5
    2a42:	06b4e263          	bltu	s1,a1,2aa6 <_malloc_r+0x84>
    2a46:	854a                	mv	a0,s2
    2a48:	28cd                	jal	2b3a <__malloc_lock>
    2a4a:	c4418993          	addi	s3,gp,-956 # ec44 <__malloc_free_list>
    2a4e:	0009a783          	lw	a5,0(s3)
    2a52:	843e                	mv	s0,a5
    2a54:	e425                	bnez	s0,2abc <_malloc_r+0x9a>
    2a56:	85a6                	mv	a1,s1
    2a58:	854a                	mv	a0,s2
    2a5a:	3f95                	jal	29ce <sbrk_aligned>
    2a5c:	57fd                	li	a5,-1
    2a5e:	842a                	mv	s0,a0
    2a60:	0cf51b63          	bne	a0,a5,2b36 <_malloc_r+0x114>
    2a64:	0009a403          	lw	s0,0(s3)
    2a68:	87a2                	mv	a5,s0
    2a6a:	e7d5                	bnez	a5,2b16 <_malloc_r+0xf4>
    2a6c:	cc5d                	beqz	s0,2b2a <_malloc_r+0x108>
    2a6e:	00042a03          	lw	s4,0(s0)
    2a72:	4581                	li	a1,0
    2a74:	854a                	mv	a0,s2
    2a76:	9a22                	add	s4,s4,s0
    2a78:	243d                	jal	2ca6 <_sbrk_r>
    2a7a:	0aaa1863          	bne	s4,a0,2b2a <_malloc_r+0x108>
    2a7e:	401c                	lw	a5,0(s0)
    2a80:	854a                	mv	a0,s2
    2a82:	8c9d                	sub	s1,s1,a5
    2a84:	85a6                	mv	a1,s1
    2a86:	37a1                	jal	29ce <sbrk_aligned>
    2a88:	57fd                	li	a5,-1
    2a8a:	0af50063          	beq	a0,a5,2b2a <_malloc_r+0x108>
    2a8e:	401c                	lw	a5,0(s0)
    2a90:	97a6                	add	a5,a5,s1
    2a92:	c01c                	sw	a5,0(s0)
    2a94:	0009a783          	lw	a5,0(s3)
    2a98:	43d8                	lw	a4,4(a5)
    2a9a:	e349                	bnez	a4,2b1c <_malloc_r+0xfa>
    2a9c:	c401a223          	sw	zero,-956(gp) # ec44 <__malloc_free_list>
    2aa0:	a83d                	j	2ade <_malloc_r+0xbc>
    2aa2:	fa04d0e3          	bgez	s1,2a42 <_malloc_r+0x20>
    2aa6:	00f92023          	sw	a5,0(s2)
    2aaa:	4501                	li	a0,0
    2aac:	40f2                	lw	ra,28(sp)
    2aae:	4462                	lw	s0,24(sp)
    2ab0:	44d2                	lw	s1,20(sp)
    2ab2:	4942                	lw	s2,16(sp)
    2ab4:	49b2                	lw	s3,12(sp)
    2ab6:	4a22                	lw	s4,8(sp)
    2ab8:	6105                	addi	sp,sp,32
    2aba:	8082                	ret
    2abc:	4014                	lw	a3,0(s0)
    2abe:	8e85                	sub	a3,a3,s1
    2ac0:	0406c863          	bltz	a3,2b10 <_malloc_r+0xee>
    2ac4:	472d                	li	a4,11
    2ac6:	02d77d63          	bgeu	a4,a3,2b00 <_malloc_r+0xde>
    2aca:	c004                	sw	s1,0(s0)
    2acc:	00940733          	add	a4,s0,s1
    2ad0:	02879663          	bne	a5,s0,2afc <_malloc_r+0xda>
    2ad4:	00e9a023          	sw	a4,0(s3)
    2ad8:	405c                	lw	a5,4(s0)
    2ada:	c314                	sw	a3,0(a4)
    2adc:	c35c                	sw	a5,4(a4)
    2ade:	854a                	mv	a0,s2
    2ae0:	28b1                	jal	2b3c <__malloc_unlock>
    2ae2:	00b40513          	addi	a0,s0,11
    2ae6:	00440793          	addi	a5,s0,4
    2aea:	9961                	andi	a0,a0,-8
    2aec:	40f50733          	sub	a4,a0,a5
    2af0:	faf50ee3          	beq	a0,a5,2aac <_malloc_r+0x8a>
    2af4:	943a                	add	s0,s0,a4
    2af6:	8f89                	sub	a5,a5,a0
    2af8:	c01c                	sw	a5,0(s0)
    2afa:	bf4d                	j	2aac <_malloc_r+0x8a>
    2afc:	c3d8                	sw	a4,4(a5)
    2afe:	bfe9                	j	2ad8 <_malloc_r+0xb6>
    2b00:	4058                	lw	a4,4(s0)
    2b02:	00879563          	bne	a5,s0,2b0c <_malloc_r+0xea>
    2b06:	00e9a023          	sw	a4,0(s3)
    2b0a:	bfd1                	j	2ade <_malloc_r+0xbc>
    2b0c:	c3d8                	sw	a4,4(a5)
    2b0e:	bfc1                	j	2ade <_malloc_r+0xbc>
    2b10:	87a2                	mv	a5,s0
    2b12:	4040                	lw	s0,4(s0)
    2b14:	b781                	j	2a54 <_malloc_r+0x32>
    2b16:	843e                	mv	s0,a5
    2b18:	43dc                	lw	a5,4(a5)
    2b1a:	bf81                	j	2a6a <_malloc_r+0x48>
    2b1c:	873e                	mv	a4,a5
    2b1e:	43dc                	lw	a5,4(a5)
    2b20:	fe879ee3          	bne	a5,s0,2b1c <_malloc_r+0xfa>
    2b24:	00072223          	sw	zero,4(a4)
    2b28:	bf5d                	j	2ade <_malloc_r+0xbc>
    2b2a:	47b1                	li	a5,12
    2b2c:	00f92023          	sw	a5,0(s2)
    2b30:	854a                	mv	a0,s2
    2b32:	2029                	jal	2b3c <__malloc_unlock>
    2b34:	bf9d                	j	2aaa <_malloc_r+0x88>
    2b36:	c104                	sw	s1,0(a0)
    2b38:	b75d                	j	2ade <_malloc_r+0xbc>

00002b3a <__malloc_lock>:
    2b3a:	8082                	ret

00002b3c <__malloc_unlock>:
    2b3c:	8082                	ret

00002b3e <__sflush_r>:
    2b3e:	00c59783          	lh	a5,12(a1)
    2b42:	1101                	addi	sp,sp,-32
    2b44:	cc22                	sw	s0,24(sp)
    2b46:	ca26                	sw	s1,20(sp)
    2b48:	ce06                	sw	ra,28(sp)
    2b4a:	c84a                	sw	s2,16(sp)
    2b4c:	c64e                	sw	s3,12(sp)
    2b4e:	0087f713          	andi	a4,a5,8
    2b52:	84aa                	mv	s1,a0
    2b54:	842e                	mv	s0,a1
    2b56:	e369                	bnez	a4,2c18 <__sflush_r+0xda>
    2b58:	41d8                	lw	a4,4(a1)
    2b5a:	00e04563          	bgtz	a4,2b64 <__sflush_r+0x26>
    2b5e:	41b8                	lw	a4,64(a1)
    2b60:	0ae05a63          	blez	a4,2c14 <__sflush_r+0xd6>
    2b64:	5458                	lw	a4,44(s0)
    2b66:	c75d                	beqz	a4,2c14 <__sflush_r+0xd6>
    2b68:	0004a903          	lw	s2,0(s1)
    2b6c:	01379693          	slli	a3,a5,0x13
    2b70:	0004a023          	sw	zero,0(s1)
    2b74:	0606dd63          	bgez	a3,2bee <__sflush_r+0xb0>
    2b78:	4870                	lw	a2,84(s0)
    2b7a:	00c45783          	lhu	a5,12(s0)
    2b7e:	8b91                	andi	a5,a5,4
    2b80:	c799                	beqz	a5,2b8e <__sflush_r+0x50>
    2b82:	405c                	lw	a5,4(s0)
    2b84:	8e1d                	sub	a2,a2,a5
    2b86:	585c                	lw	a5,52(s0)
    2b88:	c399                	beqz	a5,2b8e <__sflush_r+0x50>
    2b8a:	403c                	lw	a5,64(s0)
    2b8c:	8e1d                	sub	a2,a2,a5
    2b8e:	545c                	lw	a5,44(s0)
    2b90:	500c                	lw	a1,32(s0)
    2b92:	4681                	li	a3,0
    2b94:	8526                	mv	a0,s1
    2b96:	9782                	jalr	a5
    2b98:	577d                	li	a4,-1
    2b9a:	00c41783          	lh	a5,12(s0)
    2b9e:	00e51d63          	bne	a0,a4,2bb8 <__sflush_r+0x7a>
    2ba2:	4094                	lw	a3,0(s1)
    2ba4:	4775                	li	a4,29
    2ba6:	0ad76463          	bltu	a4,a3,2c4e <fips202.c.c9aa224c+0x29>
    2baa:	20400737          	lui	a4,0x20400
    2bae:	0705                	addi	a4,a4,1 # 20400001 <_sp+0x203c13b1>
    2bb0:	00d75733          	srl	a4,a4,a3
    2bb4:	8b05                	andi	a4,a4,1
    2bb6:	cf41                	beqz	a4,2c4e <fips202.c.c9aa224c+0x29>
    2bb8:	4818                	lw	a4,16(s0)
    2bba:	00042223          	sw	zero,4(s0)
    2bbe:	c018                	sw	a4,0(s0)
    2bc0:	01379713          	slli	a4,a5,0x13
    2bc4:	00075863          	bgez	a4,2bd4 <__sflush_r+0x96>
    2bc8:	57fd                	li	a5,-1
    2bca:	00f51463          	bne	a0,a5,2bd2 <__sflush_r+0x94>
    2bce:	409c                	lw	a5,0(s1)
    2bd0:	e391                	bnez	a5,2bd4 <__sflush_r+0x96>
    2bd2:	c868                	sw	a0,84(s0)
    2bd4:	584c                	lw	a1,52(s0)
    2bd6:	0124a023          	sw	s2,0(s1)
    2bda:	cd8d                	beqz	a1,2c14 <__sflush_r+0xd6>
    2bdc:	04440793          	addi	a5,s0,68
    2be0:	00f58463          	beq	a1,a5,2be8 <__sflush_r+0xaa>
    2be4:	8526                	mv	a0,s1
    2be6:	33a9                	jal	2930 <_free_r>
    2be8:	02042a23          	sw	zero,52(s0)
    2bec:	a025                	j	2c14 <__sflush_r+0xd6>
    2bee:	500c                	lw	a1,32(s0)
    2bf0:	4601                	li	a2,0
    2bf2:	4685                	li	a3,1
    2bf4:	8526                	mv	a0,s1
    2bf6:	9702                	jalr	a4
    2bf8:	57fd                	li	a5,-1
    2bfa:	862a                	mv	a2,a0
    2bfc:	f6f51fe3          	bne	a0,a5,2b7a <__sflush_r+0x3c>
    2c00:	409c                	lw	a5,0(s1)
    2c02:	dfa5                	beqz	a5,2b7a <__sflush_r+0x3c>
    2c04:	4775                	li	a4,29
    2c06:	00e78563          	beq	a5,a4,2c10 <__sflush_r+0xd2>
    2c0a:	4759                	li	a4,22
    2c0c:	02e79f63          	bne	a5,a4,2c4a <fips202.c.c9aa224c+0x25>
    2c10:	0124a023          	sw	s2,0(s1)
    2c14:	4501                	li	a0,0
    2c16:	a089                	j	2c58 <fips202.c.c9aa224c+0x33>
    2c18:	0105a983          	lw	s3,16(a1)
    2c1c:	fe098ce3          	beqz	s3,2c14 <__sflush_r+0xd6>
    2c20:	0005a903          	lw	s2,0(a1)
    2c24:	8b8d                	andi	a5,a5,3
    2c26:	0135a023          	sw	s3,0(a1)
    2c2a:	41390933          	sub	s2,s2,s3
    2c2e:	4701                	li	a4,0
    2c30:	e391                	bnez	a5,2c34 <fips202.c.c9aa224c+0xf>
    2c32:	49d8                	lw	a4,20(a1)
    2c34:	c418                	sw	a4,8(s0)
    2c36:	fd205fe3          	blez	s2,2c14 <__sflush_r+0xd6>
    2c3a:	541c                	lw	a5,40(s0)
    2c3c:	500c                	lw	a1,32(s0)
    2c3e:	86ca                	mv	a3,s2
    2c40:	864e                	mv	a2,s3
    2c42:	8526                	mv	a0,s1
    2c44:	9782                	jalr	a5
    2c46:	02a04063          	bgtz	a0,2c66 <fips202.c.c9aa224c+0x41>
    2c4a:	00c41783          	lh	a5,12(s0)
    2c4e:	0407e793          	ori	a5,a5,64
    2c52:	00f41623          	sh	a5,12(s0)
    2c56:	557d                	li	a0,-1
    2c58:	40f2                	lw	ra,28(sp)
    2c5a:	4462                	lw	s0,24(sp)
    2c5c:	44d2                	lw	s1,20(sp)
    2c5e:	4942                	lw	s2,16(sp)
    2c60:	49b2                	lw	s3,12(sp)
    2c62:	6105                	addi	sp,sp,32
    2c64:	8082                	ret
    2c66:	99aa                	add	s3,s3,a0
    2c68:	40a90933          	sub	s2,s2,a0
    2c6c:	b7e9                	j	2c36 <fips202.c.c9aa224c+0x11>

00002c6e <_fflush_r>:
    2c6e:	499c                	lw	a5,16(a1)
    2c70:	cb8d                	beqz	a5,2ca2 <_fflush_r+0x34>
    2c72:	1101                	addi	sp,sp,-32
    2c74:	cc22                	sw	s0,24(sp)
    2c76:	ce06                	sw	ra,28(sp)
    2c78:	842a                	mv	s0,a0
    2c7a:	c519                	beqz	a0,2c88 <_fflush_r+0x1a>
    2c7c:	511c                	lw	a5,32(a0)
    2c7e:	e789                	bnez	a5,2c88 <_fflush_r+0x1a>
    2c80:	c62e                	sw	a1,12(sp)
    2c82:	947ff0ef          	jal	25c8 <__sinit>
    2c86:	45b2                	lw	a1,12(sp)
    2c88:	00c59783          	lh	a5,12(a1)
    2c8c:	c791                	beqz	a5,2c98 <_fflush_r+0x2a>
    2c8e:	8522                	mv	a0,s0
    2c90:	4462                	lw	s0,24(sp)
    2c92:	40f2                	lw	ra,28(sp)
    2c94:	6105                	addi	sp,sp,32
    2c96:	b565                	j	2b3e <__sflush_r>
    2c98:	40f2                	lw	ra,28(sp)
    2c9a:	4462                	lw	s0,24(sp)
    2c9c:	4501                	li	a0,0
    2c9e:	6105                	addi	sp,sp,32
    2ca0:	8082                	ret
    2ca2:	4501                	li	a0,0
    2ca4:	8082                	ret

00002ca6 <_sbrk_r>:
    2ca6:	1141                	addi	sp,sp,-16
    2ca8:	c422                	sw	s0,8(sp)
    2caa:	842a                	mv	s0,a0
    2cac:	852e                	mv	a0,a1
    2cae:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    2cb2:	c606                	sw	ra,12(sp)
    2cb4:	fc2ff0ef          	jal	2476 <_sbrk>
    2cb8:	57fd                	li	a5,-1
    2cba:	00f51663          	bne	a0,a5,2cc6 <_sbrk_r+0x20>
    2cbe:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    2cc2:	c391                	beqz	a5,2cc6 <_sbrk_r+0x20>
    2cc4:	c01c                	sw	a5,0(s0)
    2cc6:	40b2                	lw	ra,12(sp)
    2cc8:	4422                	lw	s0,8(sp)
    2cca:	0141                	addi	sp,sp,16
    2ccc:	8082                	ret

00002cce <iprintf>:
    2cce:	7139                	addi	sp,sp,-64
    2cd0:	da3e                	sw	a5,52(sp)
    2cd2:	9341a783          	lw	a5,-1740(gp) # e934 <_impure_ptr>
    2cd6:	d432                	sw	a2,40(sp)
    2cd8:	d636                	sw	a3,44(sp)
    2cda:	d22e                	sw	a1,36(sp)
    2cdc:	d83a                	sw	a4,48(sp)
    2cde:	dc42                	sw	a6,56(sp)
    2ce0:	de46                	sw	a7,60(sp)
    2ce2:	478c                	lw	a1,8(a5)
    2ce4:	1054                	addi	a3,sp,36
    2ce6:	862a                	mv	a2,a0
    2ce8:	853e                	mv	a0,a5
    2cea:	ce06                	sw	ra,28(sp)
    2cec:	c636                	sw	a3,12(sp)
    2cee:	2c65                	jal	2fa6 <_vfiprintf_r>
    2cf0:	40f2                	lw	ra,28(sp)
    2cf2:	6121                	addi	sp,sp,64
    2cf4:	8082                	ret

00002cf6 <putchar>:
    2cf6:	85aa                	mv	a1,a0
    2cf8:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2cfc:	4510                	lw	a2,8(a0)
    2cfe:	15b0006f          	j	3658 <_putc_r>

00002d02 <_puts_r>:
    2d02:	511c                	lw	a5,32(a0)
    2d04:	1101                	addi	sp,sp,-32
    2d06:	cc22                	sw	s0,24(sp)
    2d08:	ca26                	sw	s1,20(sp)
    2d0a:	c84a                	sw	s2,16(sp)
    2d0c:	ce06                	sw	ra,28(sp)
    2d0e:	c64e                	sw	s3,12(sp)
    2d10:	c452                	sw	s4,8(sp)
    2d12:	4500                	lw	s0,8(a0)
    2d14:	84aa                	mv	s1,a0
    2d16:	892e                	mv	s2,a1
    2d18:	e399                	bnez	a5,2d1e <_puts_r+0x1c>
    2d1a:	8afff0ef          	jal	25c8 <__sinit>
    2d1e:	00c45783          	lhu	a5,12(s0)
    2d22:	8ba1                	andi	a5,a5,8
    2d24:	c399                	beqz	a5,2d2a <_puts_r+0x28>
    2d26:	481c                	lw	a5,16(s0)
    2d28:	e7a5                	bnez	a5,2d90 <_puts_r+0x8e>
    2d2a:	85a2                	mv	a1,s0
    2d2c:	8526                	mv	a0,s1
    2d2e:	2a21                	jal	2e46 <__swsetup_r>
    2d30:	c125                	beqz	a0,2d90 <_puts_r+0x8e>
    2d32:	557d                	li	a0,-1
    2d34:	40f2                	lw	ra,28(sp)
    2d36:	4462                	lw	s0,24(sp)
    2d38:	44d2                	lw	s1,20(sp)
    2d3a:	4942                	lw	s2,16(sp)
    2d3c:	49b2                	lw	s3,12(sp)
    2d3e:	4a22                	lw	s4,8(sp)
    2d40:	6105                	addi	sp,sp,32
    2d42:	8082                	ret
    2d44:	c41c                	sw	a5,8(s0)
    2d46:	0905                	addi	s2,s2,1
    2d48:	0007d763          	bgez	a5,2d56 <_puts_r+0x54>
    2d4c:	4c18                	lw	a4,24(s0)
    2d4e:	02e7cb63          	blt	a5,a4,2d84 <_puts_r+0x82>
    2d52:	03458963          	beq	a1,s4,2d84 <_puts_r+0x82>
    2d56:	401c                	lw	a5,0(s0)
    2d58:	00178713          	addi	a4,a5,1
    2d5c:	c018                	sw	a4,0(s0)
    2d5e:	00b78023          	sb	a1,0(a5)
    2d62:	441c                	lw	a5,8(s0)
    2d64:	00094583          	lbu	a1,0(s2)
    2d68:	17fd                	addi	a5,a5,-1
    2d6a:	fde9                	bnez	a1,2d44 <_puts_r+0x42>
    2d6c:	c41c                	sw	a5,8(s0)
    2d6e:	0207d463          	bgez	a5,2d96 <_puts_r+0x94>
    2d72:	8622                	mv	a2,s0
    2d74:	45a9                	li	a1,10
    2d76:	8526                	mv	a0,s1
    2d78:	281d                	jal	2dae <__swbuf_r>
    2d7a:	57fd                	li	a5,-1
    2d7c:	faf50be3          	beq	a0,a5,2d32 <_puts_r+0x30>
    2d80:	4529                	li	a0,10
    2d82:	bf4d                	j	2d34 <_puts_r+0x32>
    2d84:	8622                	mv	a2,s0
    2d86:	8526                	mv	a0,s1
    2d88:	201d                	jal	2dae <__swbuf_r>
    2d8a:	fd351ce3          	bne	a0,s3,2d62 <_puts_r+0x60>
    2d8e:	b755                	j	2d32 <_puts_r+0x30>
    2d90:	59fd                	li	s3,-1
    2d92:	4a29                	li	s4,10
    2d94:	b7f9                	j	2d62 <_puts_r+0x60>
    2d96:	401c                	lw	a5,0(s0)
    2d98:	00178713          	addi	a4,a5,1
    2d9c:	c018                	sw	a4,0(s0)
    2d9e:	4729                	li	a4,10
    2da0:	00e78023          	sb	a4,0(a5)
    2da4:	bff1                	j	2d80 <_puts_r+0x7e>

00002da6 <puts>:
    2da6:	85aa                	mv	a1,a0
    2da8:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2dac:	bf99                	j	2d02 <_puts_r>

00002dae <__swbuf_r>:
    2dae:	1101                	addi	sp,sp,-32
    2db0:	cc22                	sw	s0,24(sp)
    2db2:	ca26                	sw	s1,20(sp)
    2db4:	c84a                	sw	s2,16(sp)
    2db6:	ce06                	sw	ra,28(sp)
    2db8:	c64e                	sw	s3,12(sp)
    2dba:	892a                	mv	s2,a0
    2dbc:	84ae                	mv	s1,a1
    2dbe:	8432                	mv	s0,a2
    2dc0:	c509                	beqz	a0,2dca <__swbuf_r+0x1c>
    2dc2:	511c                	lw	a5,32(a0)
    2dc4:	e399                	bnez	a5,2dca <__swbuf_r+0x1c>
    2dc6:	803ff0ef          	jal	25c8 <__sinit>
    2dca:	4c1c                	lw	a5,24(s0)
    2dcc:	c41c                	sw	a5,8(s0)
    2dce:	00c45783          	lhu	a5,12(s0)
    2dd2:	8ba1                	andi	a5,a5,8
    2dd4:	c399                	beqz	a5,2dda <__swbuf_r+0x2c>
    2dd6:	481c                	lw	a5,16(s0)
    2dd8:	ef91                	bnez	a5,2df4 <__swbuf_r+0x46>
    2dda:	85a2                	mv	a1,s0
    2ddc:	854a                	mv	a0,s2
    2dde:	20a5                	jal	2e46 <__swsetup_r>
    2de0:	c911                	beqz	a0,2df4 <__swbuf_r+0x46>
    2de2:	54fd                	li	s1,-1
    2de4:	40f2                	lw	ra,28(sp)
    2de6:	4462                	lw	s0,24(sp)
    2de8:	4942                	lw	s2,16(sp)
    2dea:	49b2                	lw	s3,12(sp)
    2dec:	8526                	mv	a0,s1
    2dee:	44d2                	lw	s1,20(sp)
    2df0:	6105                	addi	sp,sp,32
    2df2:	8082                	ret
    2df4:	401c                	lw	a5,0(s0)
    2df6:	4818                	lw	a4,16(s0)
    2df8:	0ff4f993          	zext.b	s3,s1
    2dfc:	0ff4f493          	zext.b	s1,s1
    2e00:	40e78533          	sub	a0,a5,a4
    2e04:	485c                	lw	a5,20(s0)
    2e06:	00f54663          	blt	a0,a5,2e12 <__swbuf_r+0x64>
    2e0a:	85a2                	mv	a1,s0
    2e0c:	854a                	mv	a0,s2
    2e0e:	3585                	jal	2c6e <_fflush_r>
    2e10:	f969                	bnez	a0,2de2 <__swbuf_r+0x34>
    2e12:	441c                	lw	a5,8(s0)
    2e14:	17fd                	addi	a5,a5,-1
    2e16:	c41c                	sw	a5,8(s0)
    2e18:	401c                	lw	a5,0(s0)
    2e1a:	00178713          	addi	a4,a5,1
    2e1e:	c018                	sw	a4,0(s0)
    2e20:	01378023          	sb	s3,0(a5)
    2e24:	4858                	lw	a4,20(s0)
    2e26:	00150793          	addi	a5,a0,1
    2e2a:	00f70963          	beq	a4,a5,2e3c <__swbuf_r+0x8e>
    2e2e:	00c45783          	lhu	a5,12(s0)
    2e32:	8b85                	andi	a5,a5,1
    2e34:	dbc5                	beqz	a5,2de4 <__swbuf_r+0x36>
    2e36:	47a9                	li	a5,10
    2e38:	faf496e3          	bne	s1,a5,2de4 <__swbuf_r+0x36>
    2e3c:	85a2                	mv	a1,s0
    2e3e:	854a                	mv	a0,s2
    2e40:	353d                	jal	2c6e <_fflush_r>
    2e42:	d14d                	beqz	a0,2de4 <__swbuf_r+0x36>
    2e44:	bf79                	j	2de2 <__swbuf_r+0x34>

00002e46 <__swsetup_r>:
    2e46:	1141                	addi	sp,sp,-16
    2e48:	c226                	sw	s1,4(sp)
    2e4a:	84aa                	mv	s1,a0
    2e4c:	9341a503          	lw	a0,-1740(gp) # e934 <_impure_ptr>
    2e50:	c422                	sw	s0,8(sp)
    2e52:	c606                	sw	ra,12(sp)
    2e54:	842e                	mv	s0,a1
    2e56:	c509                	beqz	a0,2e60 <__swsetup_r+0x1a>
    2e58:	511c                	lw	a5,32(a0)
    2e5a:	e399                	bnez	a5,2e60 <__swsetup_r+0x1a>
    2e5c:	f6cff0ef          	jal	25c8 <__sinit>
    2e60:	00c41783          	lh	a5,12(s0)
    2e64:	0087f713          	andi	a4,a5,8
    2e68:	e731                	bnez	a4,2eb4 <__swsetup_r+0x6e>
    2e6a:	0107f713          	andi	a4,a5,16
    2e6e:	eb09                	bnez	a4,2e80 <__swsetup_r+0x3a>
    2e70:	4725                	li	a4,9
    2e72:	c098                	sw	a4,0(s1)
    2e74:	0407e793          	ori	a5,a5,64
    2e78:	00f41623          	sh	a5,12(s0)
    2e7c:	557d                	li	a0,-1
    2e7e:	a0bd                	j	2eec <__swsetup_r+0xa6>
    2e80:	0047f713          	andi	a4,a5,4
    2e84:	c705                	beqz	a4,2eac <__swsetup_r+0x66>
    2e86:	584c                	lw	a1,52(s0)
    2e88:	c991                	beqz	a1,2e9c <__swsetup_r+0x56>
    2e8a:	04440793          	addi	a5,s0,68
    2e8e:	00f58563          	beq	a1,a5,2e98 <__swsetup_r+0x52>
    2e92:	8526                	mv	a0,s1
    2e94:	a9dff0ef          	jal	2930 <_free_r>
    2e98:	02042a23          	sw	zero,52(s0)
    2e9c:	00c41783          	lh	a5,12(s0)
    2ea0:	4818                	lw	a4,16(s0)
    2ea2:	00042223          	sw	zero,4(s0)
    2ea6:	fdb7f793          	andi	a5,a5,-37
    2eaa:	c018                	sw	a4,0(s0)
    2eac:	0087e793          	ori	a5,a5,8
    2eb0:	00f41623          	sh	a5,12(s0)
    2eb4:	4818                	lw	a4,16(s0)
    2eb6:	eb11                	bnez	a4,2eca <__swsetup_r+0x84>
    2eb8:	2807f793          	andi	a5,a5,640
    2ebc:	20000713          	li	a4,512
    2ec0:	00e78563          	beq	a5,a4,2eca <__swsetup_r+0x84>
    2ec4:	85a2                	mv	a1,s0
    2ec6:	8526                	mv	a0,s1
    2ec8:	2731                	jal	35d4 <__smakebuf_r>
    2eca:	00c41783          	lh	a5,12(s0)
    2ece:	0017f713          	andi	a4,a5,1
    2ed2:	c315                	beqz	a4,2ef6 <__swsetup_r+0xb0>
    2ed4:	4858                	lw	a4,20(s0)
    2ed6:	00042423          	sw	zero,8(s0)
    2eda:	40e00733          	neg	a4,a4
    2ede:	cc18                	sw	a4,24(s0)
    2ee0:	4818                	lw	a4,16(s0)
    2ee2:	4501                	li	a0,0
    2ee4:	e701                	bnez	a4,2eec <__swsetup_r+0xa6>
    2ee6:	0807f713          	andi	a4,a5,128
    2eea:	f749                	bnez	a4,2e74 <__swsetup_r+0x2e>
    2eec:	40b2                	lw	ra,12(sp)
    2eee:	4422                	lw	s0,8(sp)
    2ef0:	4492                	lw	s1,4(sp)
    2ef2:	0141                	addi	sp,sp,16
    2ef4:	8082                	ret
    2ef6:	0027f713          	andi	a4,a5,2
    2efa:	4681                	li	a3,0
    2efc:	e311                	bnez	a4,2f00 <__swsetup_r+0xba>
    2efe:	4854                	lw	a3,20(s0)
    2f00:	c414                	sw	a3,8(s0)
    2f02:	bff9                	j	2ee0 <__swsetup_r+0x9a>

00002f04 <memcmp>:
    2f04:	4701                	li	a4,0
    2f06:	00e61463          	bne	a2,a4,2f0e <memcmp+0xa>
    2f0a:	4501                	li	a0,0
    2f0c:	8082                	ret
    2f0e:	00e507b3          	add	a5,a0,a4
    2f12:	0705                	addi	a4,a4,1
    2f14:	00e586b3          	add	a3,a1,a4
    2f18:	0007c783          	lbu	a5,0(a5)
    2f1c:	fff6c683          	lbu	a3,-1(a3) # 7fffffff <_lma_data_end+0x3fff13b7>
    2f20:	fed783e3          	beq	a5,a3,2f06 <memcmp+0x2>
    2f24:	40d78533          	sub	a0,a5,a3
    2f28:	8082                	ret

00002f2a <strlen>:
    2f2a:	87aa                	mv	a5,a0
    2f2c:	0007c703          	lbu	a4,0(a5)
    2f30:	0785                	addi	a5,a5,1
    2f32:	ff6d                	bnez	a4,2f2c <strlen+0x2>
    2f34:	40a78533          	sub	a0,a5,a0
    2f38:	157d                	addi	a0,a0,-1
    2f3a:	8082                	ret

00002f3c <__sfputc_r>:
    2f3c:	461c                	lw	a5,8(a2)
    2f3e:	17fd                	addi	a5,a5,-1
    2f40:	c61c                	sw	a5,8(a2)
    2f42:	0007d963          	bgez	a5,2f54 <__sfputc_r+0x18>
    2f46:	4e18                	lw	a4,24(a2)
    2f48:	00e7c563          	blt	a5,a4,2f52 <__sfputc_r+0x16>
    2f4c:	47a9                	li	a5,10
    2f4e:	00f59363          	bne	a1,a5,2f54 <__sfputc_r+0x18>
    2f52:	bdb1                	j	2dae <__swbuf_r>
    2f54:	421c                	lw	a5,0(a2)
    2f56:	852e                	mv	a0,a1
    2f58:	00178713          	addi	a4,a5,1
    2f5c:	c218                	sw	a4,0(a2)
    2f5e:	00b78023          	sb	a1,0(a5)
    2f62:	8082                	ret

00002f64 <__sfputs_r>:
    2f64:	1101                	addi	sp,sp,-32
    2f66:	cc22                	sw	s0,24(sp)
    2f68:	ca26                	sw	s1,20(sp)
    2f6a:	c84a                	sw	s2,16(sp)
    2f6c:	c64e                	sw	s3,12(sp)
    2f6e:	c452                	sw	s4,8(sp)
    2f70:	ce06                	sw	ra,28(sp)
    2f72:	892a                	mv	s2,a0
    2f74:	89ae                	mv	s3,a1
    2f76:	8432                	mv	s0,a2
    2f78:	00d604b3          	add	s1,a2,a3
    2f7c:	5a7d                	li	s4,-1
    2f7e:	00941463          	bne	s0,s1,2f86 <__sfputs_r+0x22>
    2f82:	4501                	li	a0,0
    2f84:	a809                	j	2f96 <__sfputs_r+0x32>
    2f86:	00044583          	lbu	a1,0(s0)
    2f8a:	864e                	mv	a2,s3
    2f8c:	854a                	mv	a0,s2
    2f8e:	377d                	jal	2f3c <__sfputc_r>
    2f90:	0405                	addi	s0,s0,1
    2f92:	ff4516e3          	bne	a0,s4,2f7e <__sfputs_r+0x1a>
    2f96:	40f2                	lw	ra,28(sp)
    2f98:	4462                	lw	s0,24(sp)
    2f9a:	44d2                	lw	s1,20(sp)
    2f9c:	4942                	lw	s2,16(sp)
    2f9e:	49b2                	lw	s3,12(sp)
    2fa0:	4a22                	lw	s4,8(sp)
    2fa2:	6105                	addi	sp,sp,32
    2fa4:	8082                	ret

00002fa6 <_vfiprintf_r>:
    2fa6:	7135                	addi	sp,sp,-160
    2fa8:	cd22                	sw	s0,152(sp)
    2faa:	cb26                	sw	s1,148(sp)
    2fac:	c94a                	sw	s2,144(sp)
    2fae:	c74e                	sw	s3,140(sp)
    2fb0:	cf06                	sw	ra,156(sp)
    2fb2:	c552                	sw	s4,136(sp)
    2fb4:	c356                	sw	s5,132(sp)
    2fb6:	c15a                	sw	s6,128(sp)
    2fb8:	dede                	sw	s7,124(sp)
    2fba:	dce2                	sw	s8,120(sp)
    2fbc:	dae6                	sw	s9,116(sp)
    2fbe:	89aa                	mv	s3,a0
    2fc0:	892e                	mv	s2,a1
    2fc2:	84b2                	mv	s1,a2
    2fc4:	8436                	mv	s0,a3
    2fc6:	c509                	beqz	a0,2fd0 <_vfiprintf_r+0x2a>
    2fc8:	511c                	lw	a5,32(a0)
    2fca:	e399                	bnez	a5,2fd0 <_vfiprintf_r+0x2a>
    2fcc:	dfcff0ef          	jal	25c8 <__sinit>
    2fd0:	00c95783          	lhu	a5,12(s2)
    2fd4:	8ba1                	andi	a5,a5,8
    2fd6:	c7f9                	beqz	a5,30a4 <_vfiprintf_r+0xfe>
    2fd8:	01092783          	lw	a5,16(s2)
    2fdc:	c7e1                	beqz	a5,30a4 <_vfiprintf_r+0xfe>
    2fde:	02000793          	li	a5,32
    2fe2:	02f104a3          	sb	a5,41(sp)
    2fe6:	03000793          	li	a5,48
    2fea:	d202                	sw	zero,36(sp)
    2fec:	02f10523          	sb	a5,42(sp)
    2ff0:	c622                	sw	s0,12(sp)
    2ff2:	02500b93          	li	s7,37
    2ff6:	5afd                	li	s5,-1
    2ff8:	4c05                	li	s8,1
    2ffa:	4b29                	li	s6,10
    2ffc:	8426                	mv	s0,s1
    2ffe:	00044783          	lbu	a5,0(s0)
    3002:	c399                	beqz	a5,3008 <_vfiprintf_r+0x62>
    3004:	0d779263          	bne	a5,s7,30c8 <_vfiprintf_r+0x122>
    3008:	40940cb3          	sub	s9,s0,s1
    300c:	00940c63          	beq	s0,s1,3024 <_vfiprintf_r+0x7e>
    3010:	86e6                	mv	a3,s9
    3012:	8626                	mv	a2,s1
    3014:	85ca                	mv	a1,s2
    3016:	854e                	mv	a0,s3
    3018:	37b1                	jal	2f64 <__sfputs_r>
    301a:	1d550563          	beq	a0,s5,31e4 <_vfiprintf_r+0x23e>
    301e:	5792                	lw	a5,36(sp)
    3020:	97e6                	add	a5,a5,s9
    3022:	d23e                	sw	a5,36(sp)
    3024:	00044783          	lbu	a5,0(s0)
    3028:	1a078e63          	beqz	a5,31e4 <_vfiprintf_r+0x23e>
    302c:	00140493          	addi	s1,s0,1
    3030:	c802                	sw	zero,16(sp)
    3032:	ce02                	sw	zero,28(sp)
    3034:	ca56                	sw	s5,20(sp)
    3036:	cc02                	sw	zero,24(sp)
    3038:	040109a3          	sb	zero,83(sp)
    303c:	d482                	sw	zero,104(sp)
    303e:	00001c97          	auipc	s9,0x1
    3042:	ee6c8c93          	addi	s9,s9,-282 # 3f24 <main+0x6d6>
    3046:	0004c583          	lbu	a1,0(s1)
    304a:	4615                	li	a2,5
    304c:	00001517          	auipc	a0,0x1
    3050:	ed850513          	addi	a0,a0,-296 # 3f24 <main+0x6d6>
    3054:	2db1                	jal	36b0 <memchr>
    3056:	4742                	lw	a4,16(sp)
    3058:	87aa                	mv	a5,a0
    305a:	00148413          	addi	s0,s1,1
    305e:	e53d                	bnez	a0,30cc <_vfiprintf_r+0x126>
    3060:	01077793          	andi	a5,a4,16
    3064:	c789                	beqz	a5,306e <_vfiprintf_r+0xc8>
    3066:	02000793          	li	a5,32
    306a:	04f109a3          	sb	a5,83(sp)
    306e:	00877793          	andi	a5,a4,8
    3072:	c789                	beqz	a5,307c <_vfiprintf_r+0xd6>
    3074:	02b00793          	li	a5,43
    3078:	04f109a3          	sb	a5,83(sp)
    307c:	0004c683          	lbu	a3,0(s1)
    3080:	02a00793          	li	a5,42
    3084:	04f68c63          	beq	a3,a5,30dc <_vfiprintf_r+0x136>
    3088:	47f2                	lw	a5,28(sp)
    308a:	8426                	mv	s0,s1
    308c:	4681                	li	a3,0
    308e:	4625                	li	a2,9
    3090:	00044703          	lbu	a4,0(s0)
    3094:	00140593          	addi	a1,s0,1
    3098:	fd070713          	addi	a4,a4,-48
    309c:	08e67663          	bgeu	a2,a4,3128 <_vfiprintf_r+0x182>
    30a0:	e6a9                	bnez	a3,30ea <_vfiprintf_r+0x144>
    30a2:	a8a1                	j	30fa <_vfiprintf_r+0x154>
    30a4:	85ca                	mv	a1,s2
    30a6:	854e                	mv	a0,s3
    30a8:	3b79                	jal	2e46 <__swsetup_r>
    30aa:	d915                	beqz	a0,2fde <_vfiprintf_r+0x38>
    30ac:	557d                	li	a0,-1
    30ae:	40fa                	lw	ra,156(sp)
    30b0:	446a                	lw	s0,152(sp)
    30b2:	44da                	lw	s1,148(sp)
    30b4:	494a                	lw	s2,144(sp)
    30b6:	49ba                	lw	s3,140(sp)
    30b8:	4a2a                	lw	s4,136(sp)
    30ba:	4a9a                	lw	s5,132(sp)
    30bc:	4b0a                	lw	s6,128(sp)
    30be:	5bf6                	lw	s7,124(sp)
    30c0:	5c66                	lw	s8,120(sp)
    30c2:	5cd6                	lw	s9,116(sp)
    30c4:	610d                	addi	sp,sp,160
    30c6:	8082                	ret
    30c8:	0405                	addi	s0,s0,1
    30ca:	bf15                	j	2ffe <_vfiprintf_r+0x58>
    30cc:	419787b3          	sub	a5,a5,s9
    30d0:	00fc17b3          	sll	a5,s8,a5
    30d4:	8fd9                	or	a5,a5,a4
    30d6:	c83e                	sw	a5,16(sp)
    30d8:	84a2                	mv	s1,s0
    30da:	b7b5                	j	3046 <_vfiprintf_r+0xa0>
    30dc:	47b2                	lw	a5,12(sp)
    30de:	00478693          	addi	a3,a5,4
    30e2:	439c                	lw	a5,0(a5)
    30e4:	c636                	sw	a3,12(sp)
    30e6:	0007c463          	bltz	a5,30ee <_vfiprintf_r+0x148>
    30ea:	ce3e                	sw	a5,28(sp)
    30ec:	a039                	j	30fa <_vfiprintf_r+0x154>
    30ee:	40f007b3          	neg	a5,a5
    30f2:	00276713          	ori	a4,a4,2
    30f6:	ce3e                	sw	a5,28(sp)
    30f8:	c83a                	sw	a4,16(sp)
    30fa:	00044703          	lbu	a4,0(s0)
    30fe:	02e00793          	li	a5,46
    3102:	04f71763          	bne	a4,a5,3150 <_vfiprintf_r+0x1aa>
    3106:	00144703          	lbu	a4,1(s0)
    310a:	02a00793          	li	a5,42
    310e:	02f71363          	bne	a4,a5,3134 <_vfiprintf_r+0x18e>
    3112:	47b2                	lw	a5,12(sp)
    3114:	0409                	addi	s0,s0,2
    3116:	00478713          	addi	a4,a5,4
    311a:	439c                	lw	a5,0(a5)
    311c:	c63a                	sw	a4,12(sp)
    311e:	0007d363          	bgez	a5,3124 <_vfiprintf_r+0x17e>
    3122:	57fd                	li	a5,-1
    3124:	ca3e                	sw	a5,20(sp)
    3126:	a02d                	j	3150 <_vfiprintf_r+0x1aa>
    3128:	036787b3          	mul	a5,a5,s6
    312c:	842e                	mv	s0,a1
    312e:	4685                	li	a3,1
    3130:	97ba                	add	a5,a5,a4
    3132:	bfb9                	j	3090 <_vfiprintf_r+0xea>
    3134:	0405                	addi	s0,s0,1
    3136:	ca02                	sw	zero,20(sp)
    3138:	4681                	li	a3,0
    313a:	4781                	li	a5,0
    313c:	4625                	li	a2,9
    313e:	00044703          	lbu	a4,0(s0)
    3142:	00140593          	addi	a1,s0,1
    3146:	fd070713          	addi	a4,a4,-48
    314a:	06e67463          	bgeu	a2,a4,31b2 <_vfiprintf_r+0x20c>
    314e:	faf9                	bnez	a3,3124 <_vfiprintf_r+0x17e>
    3150:	00044583          	lbu	a1,0(s0)
    3154:	460d                	li	a2,3
    3156:	00001517          	auipc	a0,0x1
    315a:	dd650513          	addi	a0,a0,-554 # 3f2c <main+0x6de>
    315e:	2b89                	jal	36b0 <memchr>
    3160:	cd11                	beqz	a0,317c <_vfiprintf_r+0x1d6>
    3162:	00001797          	auipc	a5,0x1
    3166:	dca78793          	addi	a5,a5,-566 # 3f2c <main+0x6de>
    316a:	8d1d                	sub	a0,a0,a5
    316c:	47c2                	lw	a5,16(sp)
    316e:	04000713          	li	a4,64
    3172:	00a71733          	sll	a4,a4,a0
    3176:	8fd9                	or	a5,a5,a4
    3178:	0405                	addi	s0,s0,1
    317a:	c83e                	sw	a5,16(sp)
    317c:	00044583          	lbu	a1,0(s0)
    3180:	4619                	li	a2,6
    3182:	00001517          	auipc	a0,0x1
    3186:	dae50513          	addi	a0,a0,-594 # 3f30 <main+0x6e2>
    318a:	00140493          	addi	s1,s0,1
    318e:	02b10423          	sb	a1,40(sp)
    3192:	2b39                	jal	36b0 <memchr>
    3194:	c125                	beqz	a0,31f4 <_vfiprintf_r+0x24e>
    3196:	00000793          	li	a5,0
    319a:	e795                	bnez	a5,31c6 <_vfiprintf_r+0x220>
    319c:	4742                	lw	a4,16(sp)
    319e:	47b2                	lw	a5,12(sp)
    31a0:	10077713          	andi	a4,a4,256
    31a4:	cf09                	beqz	a4,31be <_vfiprintf_r+0x218>
    31a6:	0791                	addi	a5,a5,4
    31a8:	c63e                	sw	a5,12(sp)
    31aa:	5792                	lw	a5,36(sp)
    31ac:	97d2                	add	a5,a5,s4
    31ae:	d23e                	sw	a5,36(sp)
    31b0:	b5b1                	j	2ffc <_vfiprintf_r+0x56>
    31b2:	036787b3          	mul	a5,a5,s6
    31b6:	842e                	mv	s0,a1
    31b8:	4685                	li	a3,1
    31ba:	97ba                	add	a5,a5,a4
    31bc:	b749                	j	313e <_vfiprintf_r+0x198>
    31be:	079d                	addi	a5,a5,7
    31c0:	9be1                	andi	a5,a5,-8
    31c2:	07a1                	addi	a5,a5,8
    31c4:	b7d5                	j	31a8 <_vfiprintf_r+0x202>
    31c6:	0078                	addi	a4,sp,12
    31c8:	00000697          	auipc	a3,0x0
    31cc:	d9c68693          	addi	a3,a3,-612 # 2f64 <__sfputs_r>
    31d0:	864a                	mv	a2,s2
    31d2:	080c                	addi	a1,sp,16
    31d4:	854e                	mv	a0,s3
    31d6:	00000097          	auipc	ra,0x0
    31da:	000000e7          	jalr	zero # 0 <__vector_start>
    31de:	8a2a                	mv	s4,a0
    31e0:	fd5515e3          	bne	a0,s5,31aa <_vfiprintf_r+0x204>
    31e4:	00c95783          	lhu	a5,12(s2)
    31e8:	0407f793          	andi	a5,a5,64
    31ec:	ec0790e3          	bnez	a5,30ac <_vfiprintf_r+0x106>
    31f0:	5512                	lw	a0,36(sp)
    31f2:	bd75                	j	30ae <_vfiprintf_r+0x108>
    31f4:	0078                	addi	a4,sp,12
    31f6:	00000697          	auipc	a3,0x0
    31fa:	d6e68693          	addi	a3,a3,-658 # 2f64 <__sfputs_r>
    31fe:	864a                	mv	a2,s2
    3200:	080c                	addi	a1,sp,16
    3202:	854e                	mv	a0,s3
    3204:	2a19                	jal	331a <_printf_i>
    3206:	bfe1                	j	31de <_vfiprintf_r+0x238>

00003208 <_printf_common>:
    3208:	7179                	addi	sp,sp,-48
    320a:	ca56                	sw	s5,20(sp)
    320c:	499c                	lw	a5,16(a1)
    320e:	8aba                	mv	s5,a4
    3210:	4598                	lw	a4,8(a1)
    3212:	d422                	sw	s0,40(sp)
    3214:	d04a                	sw	s2,32(sp)
    3216:	ce4e                	sw	s3,28(sp)
    3218:	cc52                	sw	s4,24(sp)
    321a:	d606                	sw	ra,44(sp)
    321c:	d226                	sw	s1,36(sp)
    321e:	c85a                	sw	s6,16(sp)
    3220:	c65e                	sw	s7,12(sp)
    3222:	89aa                	mv	s3,a0
    3224:	842e                	mv	s0,a1
    3226:	8932                	mv	s2,a2
    3228:	8a36                	mv	s4,a3
    322a:	00e7d363          	bge	a5,a4,3230 <_printf_common+0x28>
    322e:	87ba                	mv	a5,a4
    3230:	00f92023          	sw	a5,0(s2)
    3234:	04344703          	lbu	a4,67(s0)
    3238:	c701                	beqz	a4,3240 <_printf_common+0x38>
    323a:	0785                	addi	a5,a5,1
    323c:	00f92023          	sw	a5,0(s2)
    3240:	401c                	lw	a5,0(s0)
    3242:	0207f793          	andi	a5,a5,32
    3246:	c791                	beqz	a5,3252 <_printf_common+0x4a>
    3248:	00092783          	lw	a5,0(s2)
    324c:	0789                	addi	a5,a5,2
    324e:	00f92023          	sw	a5,0(s2)
    3252:	4004                	lw	s1,0(s0)
    3254:	8899                	andi	s1,s1,6
    3256:	e891                	bnez	s1,326a <_printf_common+0x62>
    3258:	01940b13          	addi	s6,s0,25
    325c:	5bfd                	li	s7,-1
    325e:	445c                	lw	a5,12(s0)
    3260:	00092703          	lw	a4,0(s2)
    3264:	8f99                	sub	a5,a5,a4
    3266:	04f4cd63          	blt	s1,a5,32c0 <_printf_common+0xb8>
    326a:	04344783          	lbu	a5,67(s0)
    326e:	00f036b3          	snez	a3,a5
    3272:	401c                	lw	a5,0(s0)
    3274:	0207f793          	andi	a5,a5,32
    3278:	ebad                	bnez	a5,32ea <_printf_common+0xe2>
    327a:	04340613          	addi	a2,s0,67
    327e:	85d2                	mv	a1,s4
    3280:	854e                	mv	a0,s3
    3282:	9a82                	jalr	s5
    3284:	57fd                	li	a5,-1
    3286:	04f50463          	beq	a0,a5,32ce <_printf_common+0xc6>
    328a:	401c                	lw	a5,0(s0)
    328c:	4711                	li	a4,4
    328e:	4481                	li	s1,0
    3290:	8b99                	andi	a5,a5,6
    3292:	00e79a63          	bne	a5,a4,32a6 <_printf_common+0x9e>
    3296:	00092783          	lw	a5,0(s2)
    329a:	4444                	lw	s1,12(s0)
    329c:	8c9d                	sub	s1,s1,a5
    329e:	fff4c793          	not	a5,s1
    32a2:	87fd                	srai	a5,a5,0x1f
    32a4:	8cfd                	and	s1,s1,a5
    32a6:	441c                	lw	a5,8(s0)
    32a8:	4818                	lw	a4,16(s0)
    32aa:	00f75463          	bge	a4,a5,32b2 <_printf_common+0xaa>
    32ae:	8f99                	sub	a5,a5,a4
    32b0:	94be                	add	s1,s1,a5
    32b2:	4901                	li	s2,0
    32b4:	0469                	addi	s0,s0,26
    32b6:	5b7d                	li	s6,-1
    32b8:	05249863          	bne	s1,s2,3308 <_printf_common+0x100>
    32bc:	4501                	li	a0,0
    32be:	a809                	j	32d0 <_printf_common+0xc8>
    32c0:	4685                	li	a3,1
    32c2:	865a                	mv	a2,s6
    32c4:	85d2                	mv	a1,s4
    32c6:	854e                	mv	a0,s3
    32c8:	9a82                	jalr	s5
    32ca:	01751e63          	bne	a0,s7,32e6 <_printf_common+0xde>
    32ce:	557d                	li	a0,-1
    32d0:	50b2                	lw	ra,44(sp)
    32d2:	5422                	lw	s0,40(sp)
    32d4:	5492                	lw	s1,36(sp)
    32d6:	5902                	lw	s2,32(sp)
    32d8:	49f2                	lw	s3,28(sp)
    32da:	4a62                	lw	s4,24(sp)
    32dc:	4ad2                	lw	s5,20(sp)
    32de:	4b42                	lw	s6,16(sp)
    32e0:	4bb2                	lw	s7,12(sp)
    32e2:	6145                	addi	sp,sp,48
    32e4:	8082                	ret
    32e6:	0485                	addi	s1,s1,1
    32e8:	bf9d                	j	325e <_printf_common+0x56>
    32ea:	00d40733          	add	a4,s0,a3
    32ee:	03000613          	li	a2,48
    32f2:	04c701a3          	sb	a2,67(a4)
    32f6:	04544703          	lbu	a4,69(s0)
    32fa:	00168793          	addi	a5,a3,1
    32fe:	97a2                	add	a5,a5,s0
    3300:	0689                	addi	a3,a3,2
    3302:	04e781a3          	sb	a4,67(a5)
    3306:	bf95                	j	327a <_printf_common+0x72>
    3308:	4685                	li	a3,1
    330a:	8622                	mv	a2,s0
    330c:	85d2                	mv	a1,s4
    330e:	854e                	mv	a0,s3
    3310:	9a82                	jalr	s5
    3312:	fb650ee3          	beq	a0,s6,32ce <_printf_common+0xc6>
    3316:	0905                	addi	s2,s2,1
    3318:	b745                	j	32b8 <_printf_common+0xb0>

0000331a <_printf_i>:
    331a:	7179                	addi	sp,sp,-48
    331c:	d422                	sw	s0,40(sp)
    331e:	d226                	sw	s1,36(sp)
    3320:	d04a                	sw	s2,32(sp)
    3322:	ce4e                	sw	s3,28(sp)
    3324:	d606                	sw	ra,44(sp)
    3326:	cc52                	sw	s4,24(sp)
    3328:	ca56                	sw	s5,20(sp)
    332a:	c85a                	sw	s6,16(sp)
    332c:	0185c803          	lbu	a6,24(a1)
    3330:	07800793          	li	a5,120
    3334:	84aa                	mv	s1,a0
    3336:	842e                	mv	s0,a1
    3338:	8932                	mv	s2,a2
    333a:	89b6                	mv	s3,a3
    333c:	0307e263          	bltu	a5,a6,3360 <_printf_i+0x46>
    3340:	06200793          	li	a5,98
    3344:	04358693          	addi	a3,a1,67
    3348:	0307e163          	bltu	a5,a6,336a <_printf_i+0x50>
    334c:	1a080e63          	beqz	a6,3508 <w25q.c.a2dff0dd+0x17d>
    3350:	05800793          	li	a5,88
    3354:	00001617          	auipc	a2,0x1
    3358:	be460613          	addi	a2,a2,-1052 # 3f38 <main+0x6ea>
    335c:	14f80163          	beq	a6,a5,349e <w25q.c.a2dff0dd+0x113>
    3360:	04240a93          	addi	s5,s0,66
    3364:	05040123          	sb	a6,66(s0)
    3368:	a815                	j	339c <w25q.c.a2dff0dd+0x11>
    336a:	f9d80793          	addi	a5,a6,-99
    336e:	0ff7f793          	zext.b	a5,a5
    3372:	4655                	li	a2,21
    3374:	fef666e3          	bltu	a2,a5,3360 <_printf_i+0x46>
    3378:	00000617          	auipc	a2,0x0
    337c:	76460613          	addi	a2,a2,1892 # 3adc <main+0x28e>
    3380:	078a                	slli	a5,a5,0x2
    3382:	97b2                	add	a5,a5,a2
    3384:	439c                	lw	a5,0(a5)
    3386:	97b2                	add	a5,a5,a2
    3388:	8782                	jr	a5
    338a:	431c                	lw	a5,0(a4)
    338c:	04258a93          	addi	s5,a1,66
    3390:	00478693          	addi	a3,a5,4
    3394:	439c                	lw	a5,0(a5)
    3396:	c314                	sw	a3,0(a4)
    3398:	04f58123          	sb	a5,66(a1)
    339c:	4785                	li	a5,1
    339e:	aa41                	j	352e <w25q.c.a2dff0dd+0x1a3>
    33a0:	419c                	lw	a5,0(a1)
    33a2:	4308                	lw	a0,0(a4)
    33a4:	0807f613          	andi	a2,a5,128
    33a8:	00450593          	addi	a1,a0,4
    33ac:	c20d                	beqz	a2,33ce <w25q.c.a2dff0dd+0x43>
    33ae:	411c                	lw	a5,0(a0)
    33b0:	c30c                	sw	a1,0(a4)
    33b2:	0007d863          	bgez	a5,33c2 <w25q.c.a2dff0dd+0x37>
    33b6:	02d00713          	li	a4,45
    33ba:	40f007b3          	neg	a5,a5
    33be:	04e401a3          	sb	a4,67(s0)
    33c2:	00001617          	auipc	a2,0x1
    33c6:	b7660613          	addi	a2,a2,-1162 # 3f38 <main+0x6ea>
    33ca:	4829                	li	a6,10
    33cc:	a089                	j	340e <w25q.c.a2dff0dd+0x83>
    33ce:	0407f613          	andi	a2,a5,64
    33d2:	411c                	lw	a5,0(a0)
    33d4:	c30c                	sw	a1,0(a4)
    33d6:	de71                	beqz	a2,33b2 <w25q.c.a2dff0dd+0x27>
    33d8:	07c2                	slli	a5,a5,0x10
    33da:	87c1                	srai	a5,a5,0x10
    33dc:	bfd9                	j	33b2 <w25q.c.a2dff0dd+0x27>
    33de:	418c                	lw	a1,0(a1)
    33e0:	4310                	lw	a2,0(a4)
    33e2:	0805f513          	andi	a0,a1,128
    33e6:	421c                	lw	a5,0(a2)
    33e8:	0611                	addi	a2,a2,4
    33ea:	e511                	bnez	a0,33f6 <w25q.c.a2dff0dd+0x6b>
    33ec:	0405f593          	andi	a1,a1,64
    33f0:	c199                	beqz	a1,33f6 <w25q.c.a2dff0dd+0x6b>
    33f2:	07c2                	slli	a5,a5,0x10
    33f4:	83c1                	srli	a5,a5,0x10
    33f6:	c310                	sw	a2,0(a4)
    33f8:	06f00713          	li	a4,111
    33fc:	00001617          	auipc	a2,0x1
    3400:	b3c60613          	addi	a2,a2,-1220 # 3f38 <main+0x6ea>
    3404:	0ce81c63          	bne	a6,a4,34dc <w25q.c.a2dff0dd+0x151>
    3408:	4821                	li	a6,8
    340a:	040401a3          	sb	zero,67(s0)
    340e:	4058                	lw	a4,4(s0)
    3410:	c418                	sw	a4,8(s0)
    3412:	00074863          	bltz	a4,3422 <w25q.c.a2dff0dd+0x97>
    3416:	400c                	lw	a1,0(s0)
    3418:	8f5d                	or	a4,a4,a5
    341a:	8ab6                	mv	s5,a3
    341c:	99ed                	andi	a1,a1,-5
    341e:	c00c                	sw	a1,0(s0)
    3420:	cf19                	beqz	a4,343e <w25q.c.a2dff0dd+0xb3>
    3422:	8ab6                	mv	s5,a3
    3424:	0307f733          	remu	a4,a5,a6
    3428:	1afd                	addi	s5,s5,-1
    342a:	9732                	add	a4,a4,a2
    342c:	00074703          	lbu	a4,0(a4)
    3430:	00ea8023          	sb	a4,0(s5)
    3434:	873e                	mv	a4,a5
    3436:	0307d7b3          	divu	a5,a5,a6
    343a:	ff0775e3          	bgeu	a4,a6,3424 <w25q.c.a2dff0dd+0x99>
    343e:	47a1                	li	a5,8
    3440:	00f81e63          	bne	a6,a5,345c <w25q.c.a2dff0dd+0xd1>
    3444:	401c                	lw	a5,0(s0)
    3446:	8b85                	andi	a5,a5,1
    3448:	cb91                	beqz	a5,345c <w25q.c.a2dff0dd+0xd1>
    344a:	4058                	lw	a4,4(s0)
    344c:	481c                	lw	a5,16(s0)
    344e:	00e7c763          	blt	a5,a4,345c <w25q.c.a2dff0dd+0xd1>
    3452:	03000793          	li	a5,48
    3456:	fefa8fa3          	sb	a5,-1(s5)
    345a:	1afd                	addi	s5,s5,-1
    345c:	415686b3          	sub	a3,a3,s5
    3460:	c814                	sw	a3,16(s0)
    3462:	874e                	mv	a4,s3
    3464:	86ca                	mv	a3,s2
    3466:	0070                	addi	a2,sp,12
    3468:	85a2                	mv	a1,s0
    346a:	8526                	mv	a0,s1
    346c:	3b71                	jal	3208 <_printf_common>
    346e:	5a7d                	li	s4,-1
    3470:	0d451363          	bne	a0,s4,3536 <w25q.c.a2dff0dd+0x1ab>
    3474:	557d                	li	a0,-1
    3476:	50b2                	lw	ra,44(sp)
    3478:	5422                	lw	s0,40(sp)
    347a:	5492                	lw	s1,36(sp)
    347c:	5902                	lw	s2,32(sp)
    347e:	49f2                	lw	s3,28(sp)
    3480:	4a62                	lw	s4,24(sp)
    3482:	4ad2                	lw	s5,20(sp)
    3484:	4b42                	lw	s6,16(sp)
    3486:	6145                	addi	sp,sp,48
    3488:	8082                	ret
    348a:	419c                	lw	a5,0(a1)
    348c:	0207e793          	ori	a5,a5,32
    3490:	c19c                	sw	a5,0(a1)
    3492:	07800813          	li	a6,120
    3496:	00001617          	auipc	a2,0x1
    349a:	ab660613          	addi	a2,a2,-1354 # 3f4c <main+0x6fe>
    349e:	050402a3          	sb	a6,69(s0)
    34a2:	400c                	lw	a1,0(s0)
    34a4:	4308                	lw	a0,0(a4)
    34a6:	0805f813          	andi	a6,a1,128
    34aa:	411c                	lw	a5,0(a0)
    34ac:	0511                	addi	a0,a0,4
    34ae:	00081863          	bnez	a6,34be <w25q.c.a2dff0dd+0x133>
    34b2:	0405f813          	andi	a6,a1,64
    34b6:	00080463          	beqz	a6,34be <w25q.c.a2dff0dd+0x133>
    34ba:	07c2                	slli	a5,a5,0x10
    34bc:	83c1                	srli	a5,a5,0x10
    34be:	c308                	sw	a0,0(a4)
    34c0:	0015f713          	andi	a4,a1,1
    34c4:	c701                	beqz	a4,34cc <w25q.c.a2dff0dd+0x141>
    34c6:	0205e593          	ori	a1,a1,32
    34ca:	c00c                	sw	a1,0(s0)
    34cc:	c399                	beqz	a5,34d2 <w25q.c.a2dff0dd+0x147>
    34ce:	4841                	li	a6,16
    34d0:	bf2d                	j	340a <w25q.c.a2dff0dd+0x7f>
    34d2:	4018                	lw	a4,0(s0)
    34d4:	fdf77713          	andi	a4,a4,-33
    34d8:	c018                	sw	a4,0(s0)
    34da:	bfd5                	j	34ce <w25q.c.a2dff0dd+0x143>
    34dc:	4829                	li	a6,10
    34de:	b735                	j	340a <w25q.c.a2dff0dd+0x7f>
    34e0:	4190                	lw	a2,0(a1)
    34e2:	431c                	lw	a5,0(a4)
    34e4:	49cc                	lw	a1,20(a1)
    34e6:	08067813          	andi	a6,a2,128
    34ea:	00478513          	addi	a0,a5,4
    34ee:	00080663          	beqz	a6,34fa <w25q.c.a2dff0dd+0x16f>
    34f2:	c308                	sw	a0,0(a4)
    34f4:	439c                	lw	a5,0(a5)
    34f6:	c38c                	sw	a1,0(a5)
    34f8:	a801                	j	3508 <w25q.c.a2dff0dd+0x17d>
    34fa:	c308                	sw	a0,0(a4)
    34fc:	04067613          	andi	a2,a2,64
    3500:	439c                	lw	a5,0(a5)
    3502:	da75                	beqz	a2,34f6 <w25q.c.a2dff0dd+0x16b>
    3504:	00b79023          	sh	a1,0(a5)
    3508:	00042823          	sw	zero,16(s0)
    350c:	8ab6                	mv	s5,a3
    350e:	bf91                	j	3462 <w25q.c.a2dff0dd+0xd7>
    3510:	431c                	lw	a5,0(a4)
    3512:	41d0                	lw	a2,4(a1)
    3514:	4581                	li	a1,0
    3516:	00478693          	addi	a3,a5,4
    351a:	c314                	sw	a3,0(a4)
    351c:	0007aa83          	lw	s5,0(a5)
    3520:	8556                	mv	a0,s5
    3522:	2279                	jal	36b0 <memchr>
    3524:	c501                	beqz	a0,352c <w25q.c.a2dff0dd+0x1a1>
    3526:	41550533          	sub	a0,a0,s5
    352a:	c048                	sw	a0,4(s0)
    352c:	405c                	lw	a5,4(s0)
    352e:	c81c                	sw	a5,16(s0)
    3530:	040401a3          	sb	zero,67(s0)
    3534:	b73d                	j	3462 <w25q.c.a2dff0dd+0xd7>
    3536:	4814                	lw	a3,16(s0)
    3538:	8656                	mv	a2,s5
    353a:	85ca                	mv	a1,s2
    353c:	8526                	mv	a0,s1
    353e:	9982                	jalr	s3
    3540:	f3450ae3          	beq	a0,s4,3474 <w25q.c.a2dff0dd+0xe9>
    3544:	401c                	lw	a5,0(s0)
    3546:	8b89                	andi	a5,a5,2
    3548:	e78d                	bnez	a5,3572 <w25q.c.a2dff0dd+0x1e7>
    354a:	47b2                	lw	a5,12(sp)
    354c:	4448                	lw	a0,12(s0)
    354e:	f2f554e3          	bge	a0,a5,3476 <w25q.c.a2dff0dd+0xeb>
    3552:	853e                	mv	a0,a5
    3554:	b70d                	j	3476 <w25q.c.a2dff0dd+0xeb>
    3556:	4685                	li	a3,1
    3558:	865a                	mv	a2,s6
    355a:	85ca                	mv	a1,s2
    355c:	8526                	mv	a0,s1
    355e:	9982                	jalr	s3
    3560:	f1450ae3          	beq	a0,s4,3474 <w25q.c.a2dff0dd+0xe9>
    3564:	0a85                	addi	s5,s5,1
    3566:	445c                	lw	a5,12(s0)
    3568:	4732                	lw	a4,12(sp)
    356a:	8f99                	sub	a5,a5,a4
    356c:	fefac5e3          	blt	s5,a5,3556 <w25q.c.a2dff0dd+0x1cb>
    3570:	bfe9                	j	354a <w25q.c.a2dff0dd+0x1bf>
    3572:	4a81                	li	s5,0
    3574:	01940b13          	addi	s6,s0,25
    3578:	b7fd                	j	3566 <w25q.c.a2dff0dd+0x1db>

0000357a <__swhatbuf_r>:
    357a:	7159                	addi	sp,sp,-112
    357c:	d4a2                	sw	s0,104(sp)
    357e:	842e                	mv	s0,a1
    3580:	00e59583          	lh	a1,14(a1)
    3584:	d2a6                	sw	s1,100(sp)
    3586:	d0ca                	sw	s2,96(sp)
    3588:	d686                	sw	ra,108(sp)
    358a:	84b2                	mv	s1,a2
    358c:	8936                	mv	s2,a3
    358e:	0205d363          	bgez	a1,35b4 <__swhatbuf_r+0x3a>
    3592:	00c45783          	lhu	a5,12(s0)
    3596:	0807f793          	andi	a5,a5,128
    359a:	eb8d                	bnez	a5,35cc <__swhatbuf_r+0x52>
    359c:	40000713          	li	a4,1024
    35a0:	50b6                	lw	ra,108(sp)
    35a2:	5426                	lw	s0,104(sp)
    35a4:	00f92023          	sw	a5,0(s2)
    35a8:	c098                	sw	a4,0(s1)
    35aa:	5906                	lw	s2,96(sp)
    35ac:	5496                	lw	s1,100(sp)
    35ae:	4501                	li	a0,0
    35b0:	6165                	addi	sp,sp,112
    35b2:	8082                	ret
    35b4:	0030                	addi	a2,sp,8
    35b6:	2a11                	jal	36ca <_fstat_r>
    35b8:	fc054de3          	bltz	a0,3592 <__swhatbuf_r+0x18>
    35bc:	47b2                	lw	a5,12(sp)
    35be:	673d                	lui	a4,0xf
    35c0:	8ff9                	and	a5,a5,a4
    35c2:	7779                	lui	a4,0xffffe
    35c4:	97ba                	add	a5,a5,a4
    35c6:	0017b793          	seqz	a5,a5
    35ca:	bfc9                	j	359c <__swhatbuf_r+0x22>
    35cc:	4781                	li	a5,0
    35ce:	04000713          	li	a4,64
    35d2:	b7f9                	j	35a0 <__swhatbuf_r+0x26>

000035d4 <__smakebuf_r>:
    35d4:	00c5d783          	lhu	a5,12(a1)
    35d8:	1101                	addi	sp,sp,-32
    35da:	cc22                	sw	s0,24(sp)
    35dc:	ce06                	sw	ra,28(sp)
    35de:	ca26                	sw	s1,20(sp)
    35e0:	c84a                	sw	s2,16(sp)
    35e2:	8b89                	andi	a5,a5,2
    35e4:	842e                	mv	s0,a1
    35e6:	cf89                	beqz	a5,3600 <__smakebuf_r+0x2c>
    35e8:	04740793          	addi	a5,s0,71
    35ec:	c01c                	sw	a5,0(s0)
    35ee:	c81c                	sw	a5,16(s0)
    35f0:	4785                	li	a5,1
    35f2:	c85c                	sw	a5,20(s0)
    35f4:	40f2                	lw	ra,28(sp)
    35f6:	4462                	lw	s0,24(sp)
    35f8:	44d2                	lw	s1,20(sp)
    35fa:	4942                	lw	s2,16(sp)
    35fc:	6105                	addi	sp,sp,32
    35fe:	8082                	ret
    3600:	0074                	addi	a3,sp,12
    3602:	0030                	addi	a2,sp,8
    3604:	84aa                	mv	s1,a0
    3606:	3f95                	jal	357a <__swhatbuf_r>
    3608:	4922                	lw	s2,8(sp)
    360a:	8526                	mv	a0,s1
    360c:	85ca                	mv	a1,s2
    360e:	c14ff0ef          	jal	2a22 <_malloc_r>
    3612:	00c41783          	lh	a5,12(s0)
    3616:	e911                	bnez	a0,362a <__smakebuf_r+0x56>
    3618:	2007f713          	andi	a4,a5,512
    361c:	ff61                	bnez	a4,35f4 <__smakebuf_r+0x20>
    361e:	9bf1                	andi	a5,a5,-4
    3620:	0027e793          	ori	a5,a5,2
    3624:	00f41623          	sh	a5,12(s0)
    3628:	b7c1                	j	35e8 <__smakebuf_r+0x14>
    362a:	0807e793          	ori	a5,a5,128
    362e:	00f41623          	sh	a5,12(s0)
    3632:	47b2                	lw	a5,12(sp)
    3634:	c008                	sw	a0,0(s0)
    3636:	c808                	sw	a0,16(s0)
    3638:	01242a23          	sw	s2,20(s0)
    363c:	dfc5                	beqz	a5,35f4 <__smakebuf_r+0x20>
    363e:	00e41583          	lh	a1,14(s0)
    3642:	8526                	mv	a0,s1
    3644:	2845                	jal	36f4 <_isatty_r>
    3646:	d55d                	beqz	a0,35f4 <__smakebuf_r+0x20>
    3648:	00c45783          	lhu	a5,12(s0)
    364c:	9bf1                	andi	a5,a5,-4
    364e:	0017e793          	ori	a5,a5,1
    3652:	00f41623          	sh	a5,12(s0)
    3656:	bf79                	j	35f4 <__smakebuf_r+0x20>

00003658 <_putc_r>:
    3658:	1101                	addi	sp,sp,-32
    365a:	cc22                	sw	s0,24(sp)
    365c:	ce06                	sw	ra,28(sp)
    365e:	842a                	mv	s0,a0
    3660:	c909                	beqz	a0,3672 <_putc_r+0x1a>
    3662:	511c                	lw	a5,32(a0)
    3664:	e799                	bnez	a5,3672 <_putc_r+0x1a>
    3666:	c632                	sw	a2,12(sp)
    3668:	c42e                	sw	a1,8(sp)
    366a:	f5ffe0ef          	jal	25c8 <__sinit>
    366e:	4632                	lw	a2,12(sp)
    3670:	45a2                	lw	a1,8(sp)
    3672:	461c                	lw	a5,8(a2)
    3674:	17fd                	addi	a5,a5,-1
    3676:	c61c                	sw	a5,8(a2)
    3678:	0207d063          	bgez	a5,3698 <_putc_r+0x40>
    367c:	4e18                	lw	a4,24(a2)
    367e:	00e7c763          	blt	a5,a4,368c <_putc_r+0x34>
    3682:	0ff5f793          	zext.b	a5,a1
    3686:	4729                	li	a4,10
    3688:	00e79863          	bne	a5,a4,3698 <_putc_r+0x40>
    368c:	8522                	mv	a0,s0
    368e:	4462                	lw	s0,24(sp)
    3690:	40f2                	lw	ra,28(sp)
    3692:	6105                	addi	sp,sp,32
    3694:	f1aff06f          	j	2dae <__swbuf_r>
    3698:	421c                	lw	a5,0(a2)
    369a:	0ff5f513          	zext.b	a0,a1
    369e:	00178713          	addi	a4,a5,1
    36a2:	c218                	sw	a4,0(a2)
    36a4:	00b78023          	sb	a1,0(a5)
    36a8:	40f2                	lw	ra,28(sp)
    36aa:	4462                	lw	s0,24(sp)
    36ac:	6105                	addi	sp,sp,32
    36ae:	8082                	ret

000036b0 <memchr>:
    36b0:	0ff5f593          	zext.b	a1,a1
    36b4:	962a                	add	a2,a2,a0
    36b6:	00c51463          	bne	a0,a2,36be <memchr+0xe>
    36ba:	4501                	li	a0,0
    36bc:	8082                	ret
    36be:	00054783          	lbu	a5,0(a0)
    36c2:	feb78de3          	beq	a5,a1,36bc <memchr+0xc>
    36c6:	0505                	addi	a0,a0,1
    36c8:	b7fd                	j	36b6 <memchr+0x6>

000036ca <_fstat_r>:
    36ca:	1141                	addi	sp,sp,-16
    36cc:	c422                	sw	s0,8(sp)
    36ce:	842a                	mv	s0,a0
    36d0:	852e                	mv	a0,a1
    36d2:	85b2                	mv	a1,a2
    36d4:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    36d8:	c606                	sw	ra,12(sp)
    36da:	d7bfe0ef          	jal	2454 <_fstat>
    36de:	57fd                	li	a5,-1
    36e0:	00f51663          	bne	a0,a5,36ec <_fstat_r+0x22>
    36e4:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    36e8:	c391                	beqz	a5,36ec <_fstat_r+0x22>
    36ea:	c01c                	sw	a5,0(s0)
    36ec:	40b2                	lw	ra,12(sp)
    36ee:	4422                	lw	s0,8(sp)
    36f0:	0141                	addi	sp,sp,16
    36f2:	8082                	ret

000036f4 <_isatty_r>:
    36f4:	1141                	addi	sp,sp,-16
    36f6:	c422                	sw	s0,8(sp)
    36f8:	842a                	mv	s0,a0
    36fa:	852e                	mv	a0,a1
    36fc:	c201ac23          	sw	zero,-968(gp) # ec38 <errno>
    3700:	c606                	sw	ra,12(sp)
    3702:	d5bfe0ef          	jal	245c <_isatty>
    3706:	57fd                	li	a5,-1
    3708:	00f51663          	bne	a0,a5,3714 <_isatty_r+0x20>
    370c:	c381a783          	lw	a5,-968(gp) # ec38 <errno>
    3710:	c391                	beqz	a5,3714 <_isatty_r+0x20>
    3712:	c01c                	sw	a5,0(s0)
    3714:	40b2                	lw	ra,12(sp)
    3716:	4422                	lw	s0,8(sp)
    3718:	0141                	addi	sp,sp,16
    371a:	8082                	ret

0000371c <test_multi_squeeze>:
    verify_hash(out1, out2, 64, "SHAKE256 consistency");
}

// Test: Multi-block squeeze (large output)
static void test_multi_squeeze(void) {
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
    371c:	6511                	lui	a0,0x4
static void test_multi_squeeze(void) {
    371e:	dc010113          	addi	sp,sp,-576
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
    3722:	b3450513          	addi	a0,a0,-1228 # 3b34 <main+0x2e6>
static void test_multi_squeeze(void) {
    3726:	22112e23          	sw	ra,572(sp)
    printf("Test: SHAKE128 multi-squeeze (500B output)\n");
    372a:	e7cff0ef          	jal	2da6 <puts>
    
    uint8_t msg[50];
    for(int i = 0; i < 50; i++) msg[i] = i & 0xFF;
    372e:	003c                	addi	a5,sp,8
    3730:	4681                	li	a3,0
    3732:	03200713          	li	a4,50
    3736:	00d78023          	sb	a3,0(a5)
    373a:	0685                	addi	a3,a3,1
    373c:	0785                	addi	a5,a5,1
    373e:	fee69ce3          	bne	a3,a4,3736 <test_multi_squeeze+0x1a>
    
    uint8_t output[500];
    uint32_t cycles = 0;
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    3742:	4781                	li	a5,0
    3744:	b0079073          	csrw	mcycle,a5
    shake128(output, 500, msg, 50);
    3748:	1f400593          	li	a1,500
    374c:	0030                	addi	a2,sp,8
    374e:	1868                	addi	a0,sp,60
    3750:	ccafd0ef          	jal	c1a <pqcrystals_kyber_fips202_ref_shake128>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    3754:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    3758:	6511                	lui	a0,0x4
    375a:	b6050513          	addi	a0,a0,-1184 # 3b60 <main+0x312>
    375e:	d70ff0ef          	jal	2cce <iprintf>
    
    // Verify non-zero output
    int non_zero = 0;
    for(int i = 0; i < 500; i++) {
    3762:	187c                	addi	a5,sp,60
    int non_zero = 0;
    3764:	4681                	li	a3,0
        if(output[i] != 0) non_zero = 1;
    3766:	0007c703          	lbu	a4,0(a5)
    for(int i = 0; i < 500; i++) {
    376a:	0785                	addi	a5,a5,1
        if(output[i] != 0) non_zero = 1;
    376c:	00e03733          	snez	a4,a4
    3770:	8ed9                	or	a3,a3,a4
    for(int i = 0; i < 500; i++) {
    3772:	1c18                	addi	a4,sp,560
    3774:	fee799e3          	bne	a5,a4,3766 <test_multi_squeeze+0x4a>
    }
    
    total_tests++;
    3778:	c301a783          	lw	a5,-976(gp) # ec30 <total_tests>
    377c:	0785                	addi	a5,a5,1
    377e:	c2f1a823          	sw	a5,-976(gp) # ec30 <total_tests>
    if(non_zero) {
    3782:	ca99                	beqz	a3,3798 <test_multi_squeeze+0x7c>
        passed_tests++;
    3784:	c2c1a783          	lw	a5,-980(gp) # ec2c <passed_tests>
    3788:	0785                	addi	a5,a5,1
    378a:	c2f1a623          	sw	a5,-980(gp) # ec2c <passed_tests>
    } else {
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
    }
}
    378e:	23c12083          	lw	ra,572(sp)
    3792:	24010113          	addi	sp,sp,576
    3796:	8082                	ret
        printf("[FAIL] SHAKE128 multi-squeeze - all zeros output\n");
    3798:	6511                	lui	a0,0x4
    379a:	b7050513          	addi	a0,a0,-1168 # 3b70 <main+0x322>
    379e:	e08ff0ef          	jal	2da6 <puts>
}
    37a2:	b7f5                	j	378e <test_multi_squeeze+0x72>

000037a4 <verify_hash.isra.0>:
    total_tests++;
    37a4:	c301a783          	lw	a5,-976(gp) # ec30 <total_tests>
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
    37a8:	1101                	addi	sp,sp,-32
    37aa:	cc22                	sw	s0,24(sp)
    total_tests++;
    37ac:	0785                	addi	a5,a5,1
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
    37ae:	ca26                	sw	s1,20(sp)
    37b0:	c84a                	sw	s2,16(sp)
    37b2:	ce06                	sw	ra,28(sp)
    37b4:	8936                	mv	s2,a3
    total_tests++;
    37b6:	c2f1a823          	sw	a5,-976(gp) # ec30 <total_tests>
static int verify_hash(const uint8_t* result, const uint8_t* expected, 
    37ba:	842a                	mv	s0,a0
    37bc:	84ae                	mv	s1,a1
    if(memcmp(result, expected, len) == 0) {
    37be:	f46ff0ef          	jal	2f04 <memcmp>
    37c2:	ed01                	bnez	a0,37da <verify_hash.isra.0+0x36>
        passed_tests++;
    37c4:	c2c1a783          	lw	a5,-980(gp) # ec2c <passed_tests>
}
    37c8:	40f2                	lw	ra,28(sp)
    37ca:	4462                	lw	s0,24(sp)
        passed_tests++;
    37cc:	0785                	addi	a5,a5,1
    37ce:	c2f1a623          	sw	a5,-980(gp) # ec2c <passed_tests>
}
    37d2:	44d2                	lw	s1,20(sp)
    37d4:	4942                	lw	s2,16(sp)
    37d6:	6105                	addi	sp,sp,32
    37d8:	8082                	ret
        printf("[FAIL] %s\n", test_name);
    37da:	6511                	lui	a0,0x4
    37dc:	85ca                	mv	a1,s2
    37de:	ba450513          	addi	a0,a0,-1116 # 3ba4 <main+0x356>
    37e2:	c64e                	sw	s3,12(sp)
    37e4:	ceaff0ef          	jal	2cce <iprintf>
        printf("  Expected: ");
    37e8:	6511                	lui	a0,0x4
    37ea:	bb050513          	addi	a0,a0,-1104 # 3bb0 <main+0x362>
    37ee:	ce0ff0ef          	jal	2cce <iprintf>
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", expected[i]);
    37f2:	01048993          	addi	s3,s1,16
    37f6:	6911                	lui	s2,0x4
    37f8:	0004c583          	lbu	a1,0(s1)
    37fc:	bc090513          	addi	a0,s2,-1088 # 3bc0 <main+0x372>
    3800:	0485                	addi	s1,s1,1
    3802:	cccff0ef          	jal	2cce <iprintf>
    3806:	ff3499e3          	bne	s1,s3,37f8 <verify_hash.isra.0+0x54>
        if(len > 16) printf("...");
    380a:	6991                	lui	s3,0x4
    380c:	bc898513          	addi	a0,s3,-1080 # 3bc8 <main+0x37a>
    3810:	cbeff0ef          	jal	2cce <iprintf>
        printf("\n  Got:      ");
    3814:	6511                	lui	a0,0x4
    3816:	bcc50513          	addi	a0,a0,-1076 # 3bcc <main+0x37e>
    381a:	cb4ff0ef          	jal	2cce <iprintf>
        for(size_t i = 0; i < (len < 16 ? len : 16); i++) printf("%02x", result[i]);
    381e:	01040493          	addi	s1,s0,16
    3822:	00044583          	lbu	a1,0(s0)
    3826:	bc090513          	addi	a0,s2,-1088
    382a:	0405                	addi	s0,s0,1
    382c:	ca2ff0ef          	jal	2cce <iprintf>
    3830:	fe9419e3          	bne	s0,s1,3822 <verify_hash.isra.0+0x7e>
        if(len > 16) printf("...");
    3834:	bc898513          	addi	a0,s3,-1080
    3838:	c96ff0ef          	jal	2cce <iprintf>
}
    383c:	4462                	lw	s0,24(sp)
        printf("\n");
    383e:	49b2                	lw	s3,12(sp)
}
    3840:	40f2                	lw	ra,28(sp)
    3842:	44d2                	lw	s1,20(sp)
    3844:	4942                	lw	s2,16(sp)
        printf("\n");
    3846:	4529                	li	a0,10
}
    3848:	6105                	addi	sp,sp,32
        printf("\n");
    384a:	cacff06f          	j	2cf6 <putchar>

0000384e <main>:

int main(void) {
    384e:	7149                	addi	sp,sp,-368
    3850:	16112623          	sw	ra,364(sp)
    3854:	16812423          	sw	s0,360(sp)
    3858:	16912223          	sw	s1,356(sp)
    385c:	17212023          	sw	s2,352(sp)
    3860:	15312e23          	sw	s3,348(sp)
    // Initialize cycle counter
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1);
    3864:	4785                	li	a5,1
    3866:	3207b073          	csrc	mcountinhibit,a5
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    386a:	4481                	li	s1,0
    386c:	b0049073          	csrw	mcycle,s1

    printf("   KECCAK ABSORPTION TEST            \n");
    3870:	6511                	lui	a0,0x4
    3872:	bdc50513          	addi	a0,a0,-1060 # 3bdc <main+0x38e>
    3876:	d30ff0ef          	jal	2da6 <puts>
    printf("Testing SHA3/SHAKE with HW acceleration\n\n");
    387a:	6511                	lui	a0,0x4
    387c:	c0450513          	addi	a0,a0,-1020 # 3c04 <main+0x3b6>
    3880:	d26ff0ef          	jal	2da6 <puts>
    printf("Test: SHA3-256 single block\n");
    3884:	6511                	lui	a0,0x4
    3886:	c3050513          	addi	a0,a0,-976 # 3c30 <main+0x3e2>
    388a:	d1cff0ef          	jal	2da6 <puts>
    const uint8_t expected[32] = {
    388e:	6791                	lui	a5,0x4
    3890:	d7478793          	addi	a5,a5,-652 # 3d74 <main+0x526>
    3894:	0007a883          	lw	a7,0(a5)
    3898:	0047a803          	lw	a6,4(a5)
    389c:	4788                	lw	a0,8(a5)
    389e:	47cc                	lw	a1,12(a5)
    38a0:	4b90                	lw	a2,16(a5)
    38a2:	4bd4                	lw	a3,20(a5)
    38a4:	4f98                	lw	a4,24(a5)
    38a6:	4fdc                	lw	a5,28(a5)
    const uint8_t msg[] = "abc";
    38a8:	00636437          	lui	s0,0x636
    38ac:	26140413          	addi	s0,s0,609 # 636261 <_sp+0x5f7611>
    const uint8_t expected[32] = {
    38b0:	c546                	sw	a7,136(sp)
    38b2:	c742                	sw	a6,140(sp)
    38b4:	c92a                	sw	a0,144(sp)
    38b6:	cb2e                	sw	a1,148(sp)
    38b8:	cd32                	sw	a2,152(sp)
    38ba:	cf36                	sw	a3,156(sp)
    38bc:	d13a                	sw	a4,160(sp)
    38be:	d33e                	sw	a5,164(sp)
    const uint8_t msg[] = "abc";
    38c0:	c422                	sw	s0,8(sp)
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    38c2:	b0049073          	csrw	mcycle,s1
    sha3_256(hash, msg, sizeof(msg)-1);
    38c6:	460d                	li	a2,3
    38c8:	002c                	addi	a1,sp,8
    38ca:	00a8                	addi	a0,sp,72
    38cc:	c72fd0ef          	jal	d3e <pqcrystals_kyber_fips202_ref_sha3_256>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    38d0:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    38d4:	6491                	lui	s1,0x4
    38d6:	b6048513          	addi	a0,s1,-1184 # 3b60 <main+0x312>
    38da:	bf4ff0ef          	jal	2cce <iprintf>
    verify_hash(hash, expected, 32, "SHA3-256 single block");
    38de:	6691                	lui	a3,0x4
    38e0:	c4c68693          	addi	a3,a3,-948 # 3c4c <main+0x3fe>
    38e4:	012c                	addi	a1,sp,136
    38e6:	00a8                	addi	a0,sp,72
    38e8:	02000613          	li	a2,32
    38ec:	3d65                	jal	37a4 <verify_hash.isra.0>
    printf("Test: SHA3-512 single block\n");
    38ee:	6511                	lui	a0,0x4
    38f0:	c6450513          	addi	a0,a0,-924 # 3c64 <main+0x416>
    38f4:	cb2ff0ef          	jal	2da6 <puts>
    const uint8_t expected[64] = {
    38f8:	6791                	lui	a5,0x4
    38fa:	d9878793          	addi	a5,a5,-616 # 3d98 <main+0x54a>
    const uint8_t msg[] = "abc";
    38fe:	c422                	sw	s0,8(sp)
    const uint8_t expected[64] = {
    3900:	0138                	addi	a4,sp,136
    3902:	04078693          	addi	a3,a5,64
    3906:	0007a803          	lw	a6,0(a5)
    390a:	43c8                	lw	a0,4(a5)
    390c:	478c                	lw	a1,8(a5)
    390e:	47d0                	lw	a2,12(a5)
    3910:	01072023          	sw	a6,0(a4) # ffffe000 <_lma_data_end+0xbffef3b8>
    3914:	c348                	sw	a0,4(a4)
    3916:	c70c                	sw	a1,8(a4)
    3918:	c750                	sw	a2,12(a4)
    391a:	07c1                	addi	a5,a5,16
    391c:	0741                	addi	a4,a4,16
    391e:	fed794e3          	bne	a5,a3,3906 <main+0xb8>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    3922:	4781                	li	a5,0
    3924:	b0079073          	csrw	mcycle,a5
    sha3_512(hash, msg, sizeof(msg)-1);
    3928:	460d                	li	a2,3
    392a:	002c                	addi	a1,sp,8
    392c:	00a8                	addi	a0,sp,72
    392e:	c62fd0ef          	jal	d90 <pqcrystals_kyber_fips202_ref_sha3_512>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    3932:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    3936:	b6048513          	addi	a0,s1,-1184
    393a:	b94ff0ef          	jal	2cce <iprintf>
    verify_hash(hash, expected, 64, "SHA3-512 single block");
    393e:	6691                	lui	a3,0x4
    3940:	04000613          	li	a2,64
    3944:	012c                	addi	a1,sp,136
    3946:	00a8                	addi	a0,sp,72
    3948:	c8068693          	addi	a3,a3,-896 # 3c80 <main+0x432>
    394c:	3da1                	jal	37a4 <verify_hash.isra.0>
    printf("Test: SHA3-256 multi-block (200B input)\n");
    394e:	6511                	lui	a0,0x4
    3950:	c9850513          	addi	a0,a0,-872 # 3c98 <main+0x44a>
    3954:	c52ff0ef          	jal	2da6 <puts>
    for(int i = 0; i < 200; i++) msg[i] = i & 0xFF;
    3958:	013c                	addi	a5,sp,136
    395a:	4601                	li	a2,0
    395c:	0c800713          	li	a4,200
    3960:	00c78023          	sb	a2,0(a5)
    3964:	0605                	addi	a2,a2,1
    3966:	0785                	addi	a5,a5,1
    3968:	fee61ce3          	bne	a2,a4,3960 <main+0x112>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    396c:	4401                	li	s0,0
    396e:	b0041073          	csrw	mcycle,s0
    sha3_256(hash, msg, 200);
    3972:	012c                	addi	a1,sp,136
    3974:	00a8                	addi	a0,sp,72
    3976:	bc8fd0ef          	jal	d3e <pqcrystals_kyber_fips202_ref_sha3_256>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    397a:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    397e:	b6048513          	addi	a0,s1,-1184
    3982:	b4cff0ef          	jal	2cce <iprintf>
    total_tests++;
    3986:	c301a703          	lw	a4,-976(gp) # ec30 <total_tests>
    passed_tests++;
    398a:	c2c1a783          	lw	a5,-980(gp) # ec2c <passed_tests>
    printf("Test: SHAKE128 XOF\n");
    398e:	6511                	lui	a0,0x4
    total_tests++;
    3990:	0705                	addi	a4,a4,1
    passed_tests++;
    3992:	0785                	addi	a5,a5,1
    printf("Test: SHAKE128 XOF\n");
    3994:	cc050513          	addi	a0,a0,-832 # 3cc0 <main+0x472>
    total_tests++;
    3998:	c2e1a823          	sw	a4,-976(gp) # ec30 <total_tests>
    passed_tests++;
    399c:	c2f1a623          	sw	a5,-980(gp) # ec2c <passed_tests>
    printf("Test: SHAKE128 XOF\n");
    39a0:	c06ff0ef          	jal	2da6 <puts>
    uint8_t msg[50] = {0};
    39a4:	c502                	sw	zero,136(sp)
    39a6:	c702                	sw	zero,140(sp)
    39a8:	c902                	sw	zero,144(sp)
    39aa:	cb02                	sw	zero,148(sp)
    39ac:	cd02                	sw	zero,152(sp)
    39ae:	cf02                	sw	zero,156(sp)
    39b0:	d102                	sw	zero,160(sp)
    39b2:	d302                	sw	zero,164(sp)
    39b4:	d502                	sw	zero,168(sp)
    39b6:	d702                	sw	zero,172(sp)
    39b8:	d902                	sw	zero,176(sp)
    39ba:	db02                	sw	zero,180(sp)
    39bc:	0a011c23          	sh	zero,184(sp)
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    39c0:	b0041073          	csrw	mcycle,s0
    shake128(out1, 32, msg, 50);
    39c4:	03200693          	li	a3,50
    39c8:	0130                	addi	a2,sp,136
    39ca:	0028                	addi	a0,sp,8
    39cc:	02000593          	li	a1,32
    39d0:	a4afd0ef          	jal	c1a <pqcrystals_kyber_fips202_ref_shake128>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    39d4:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    39d8:	b6048513          	addi	a0,s1,-1184
    39dc:	af2ff0ef          	jal	2cce <iprintf>
    shake128(out2, 32, msg, 50);
    39e0:	0130                	addi	a2,sp,136
    39e2:	00a8                	addi	a0,sp,72
    39e4:	03200693          	li	a3,50
    39e8:	02000593          	li	a1,32
    39ec:	a2efd0ef          	jal	c1a <pqcrystals_kyber_fips202_ref_shake128>
    verify_hash(out1, out2, 32, "SHAKE128 consistency");
    39f0:	6691                	lui	a3,0x4
    39f2:	00ac                	addi	a1,sp,72
    39f4:	0028                	addi	a0,sp,8
    39f6:	cd468693          	addi	a3,a3,-812 # 3cd4 <main+0x486>
    39fa:	02000613          	li	a2,32
    39fe:	335d                	jal	37a4 <verify_hash.isra.0>
    printf("Test: SHAKE256 XOF\n");
    3a00:	6511                	lui	a0,0x4
    3a02:	cec50513          	addi	a0,a0,-788 # 3cec <main+0x49e>
    3a06:	ba0ff0ef          	jal	2da6 <puts>
    for(int i = 0; i < 100; i++) msg[i] = i & 0xFF;
    3a0a:	013c                	addi	a5,sp,136
    3a0c:	06400713          	li	a4,100
    3a10:	00878023          	sb	s0,0(a5)
    3a14:	0405                	addi	s0,s0,1
    3a16:	0785                	addi	a5,a5,1
    3a18:	fee41ce3          	bne	s0,a4,3a10 <main+0x1c2>
    CSR_WRITE(CSR_REG_MCYCLE, 0);
    3a1c:	4781                	li	a5,0
    3a1e:	b0079073          	csrw	mcycle,a5
    shake256(out1, 64, msg, 100);
    3a22:	04000593          	li	a1,64
    3a26:	86a2                	mv	a3,s0
    3a28:	0130                	addi	a2,sp,136
    3a2a:	0028                	addi	a0,sp,8
    3a2c:	a7efd0ef          	jal	caa <pqcrystals_kyber_fips202_ref_shake256>
    CSR_READ(CSR_REG_MCYCLE, &cycles);
    3a30:	b00025f3          	csrr	a1,mcycle
    printf("  Cycles: %u\n", cycles);
    3a34:	b6048513          	addi	a0,s1,-1184
    3a38:	a96ff0ef          	jal	2cce <iprintf>
    shake256(out2, 64, msg, 100);
    3a3c:	86a2                	mv	a3,s0
    3a3e:	0130                	addi	a2,sp,136
    3a40:	00a8                	addi	a0,sp,72
    3a42:	04000593          	li	a1,64
    3a46:	a64fd0ef          	jal	caa <pqcrystals_kyber_fips202_ref_shake256>
    verify_hash(out1, out2, 64, "SHAKE256 consistency");
    3a4a:	6691                	lui	a3,0x4
    3a4c:	00ac                	addi	a1,sp,72
    3a4e:	0028                	addi	a0,sp,8
    3a50:	d0068693          	addi	a3,a3,-768 # 3d00 <main+0x4b2>
    3a54:	04000613          	li	a2,64
    3a58:	33b1                	jal	37a4 <verify_hash.isra.0>
    test_sha3_256_single_block();
    test_sha3_512_single_block();
    test_sha3_256_multi_block();
    test_shake128();
    test_shake256();
    test_multi_squeeze();
    3a5a:	31c9                	jal	371c <test_multi_squeeze>

    printf("  Tests: %d/%d passed\n", passed_tests, total_tests);
    3a5c:	c301a603          	lw	a2,-976(gp) # ec30 <total_tests>
    3a60:	c2c1a583          	lw	a1,-980(gp) # ec2c <passed_tests>
    3a64:	6511                	lui	a0,0x4
    3a66:	d1850513          	addi	a0,a0,-744 # 3d18 <main+0x4ca>
    3a6a:	a64ff0ef          	jal	2cce <iprintf>

    if (passed_tests == total_tests) {
    3a6e:	c2c1a703          	lw	a4,-980(gp) # ec2c <passed_tests>
    3a72:	c301a783          	lw	a5,-976(gp) # ec30 <total_tests>
    3a76:	02f70463          	beq	a4,a5,3a9e <main+0x250>
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    } else {
        printf("FINAL STATUS: TEST FAILURE DETECTED\n");
    3a7a:	6511                	lui	a0,0x4
    3a7c:	d5050513          	addi	a0,a0,-688 # 3d50 <main+0x502>
    3a80:	b26ff0ef          	jal	2da6 <puts>
    }

    return EXIT_SUCCESS;
}
    3a84:	16c12083          	lw	ra,364(sp)
    3a88:	16812403          	lw	s0,360(sp)
    3a8c:	16412483          	lw	s1,356(sp)
    3a90:	16012903          	lw	s2,352(sp)
    3a94:	15c12983          	lw	s3,348(sp)
    3a98:	4501                	li	a0,0
    3a9a:	6175                	addi	sp,sp,368
    3a9c:	8082                	ret
        printf("FINAL STATUS: ALL TESTS PASSED\n");
    3a9e:	6511                	lui	a0,0x4
    3aa0:	d3050513          	addi	a0,a0,-720 # 3d30 <main+0x4e2>
    3aa4:	b02ff0ef          	jal	2da6 <puts>
    3aa8:	bff1                	j	3a84 <main+0x236>
    3aaa:	0000                	unimp
    3aac:	22e0                	fld	fs0,192(a3)
    3aae:	0000                	unimp
    3ab0:	22e0                	fld	fs0,192(a3)
    3ab2:	0000                	unimp
    3ab4:	22ea                	fld	ft5,152(sp)
    3ab6:	0000                	unimp
    3ab8:	22f4                	fld	fa3,192(a3)
    3aba:	0000                	unimp
    3abc:	22d4                	fld	fa3,128(a3)
    3abe:	0000                	unimp
    3ac0:	22d6                	fld	ft5,336(sp)
    3ac2:	0000                	unimp
    3ac4:	22d4                	fld	fa3,128(a3)
    3ac6:	0000                	unimp
    3ac8:	22d6                	fld	ft5,336(sp)
    3aca:	0000                	unimp
    3acc:	22d4                	fld	fa3,128(a3)
    3ace:	0000                	unimp
    3ad0:	22d4                	fld	fa3,128(a3)
    3ad2:	0000                	unimp
    3ad4:	22d4                	fld	fa3,128(a3)
    3ad6:	0000                	unimp
    3ad8:	22fe                	fld	ft5,472(sp)
    3ada:	0000                	unimp
    3adc:	f8ae                	fsw	fa1,112(sp)
    3ade:	ffff                	.insn	2, 0xffff
    3ae0:	f8c4                	fsw	fs1,52(s1)
    3ae2:	ffff                	.insn	2, 0xffff
    3ae4:	f884                	fsw	fs1,48(s1)
    3ae6:	ffff                	.insn	2, 0xffff
    3ae8:	f884                	fsw	fs1,48(s1)
    3aea:	ffff                	.insn	2, 0xffff
    3aec:	f884                	fsw	fs1,48(s1)
    3aee:	ffff                	.insn	2, 0xffff
    3af0:	f884                	fsw	fs1,48(s1)
    3af2:	ffff                	.insn	2, 0xffff
    3af4:	f8c4                	fsw	fs1,52(s1)
    3af6:	ffff                	.insn	2, 0xffff
    3af8:	f884                	fsw	fs1,48(s1)
    3afa:	ffff                	.insn	2, 0xffff
    3afc:	f884                	fsw	fs1,48(s1)
    3afe:	ffff                	.insn	2, 0xffff
    3b00:	f884                	fsw	fs1,48(s1)
    3b02:	ffff                	.insn	2, 0xffff
    3b04:	f884                	fsw	fs1,48(s1)
    3b06:	ffff                	.insn	2, 0xffff
    3b08:	fa04                	fsw	fs1,48(a2)
    3b0a:	ffff                	.insn	2, 0xffff
    3b0c:	f902                	fsw	ft0,176(sp)
    3b0e:	ffff                	.insn	2, 0xffff
    3b10:	f9ae                	fsw	fa1,240(sp)
    3b12:	ffff                	.insn	2, 0xffff
    3b14:	f884                	fsw	fs1,48(s1)
    3b16:	ffff                	.insn	2, 0xffff
    3b18:	f884                	fsw	fs1,48(s1)
    3b1a:	ffff                	.insn	2, 0xffff
    3b1c:	fa34                	fsw	fa3,112(a2)
    3b1e:	ffff                	.insn	2, 0xffff
    3b20:	f884                	fsw	fs1,48(s1)
    3b22:	ffff                	.insn	2, 0xffff
    3b24:	f902                	fsw	ft0,176(sp)
    3b26:	ffff                	.insn	2, 0xffff
    3b28:	f884                	fsw	fs1,48(s1)
    3b2a:	ffff                	.insn	2, 0xffff
    3b2c:	f884                	fsw	fs1,48(s1)
    3b2e:	ffff                	.insn	2, 0xffff
    3b30:	f9b6                	fsw	fa3,240(sp)
    3b32:	ffff                	.insn	2, 0xffff
    3b34:	6554                	flw	fa3,12(a0)
    3b36:	203a7473          	csrrci	s0,0x203,20
    3b3a:	4b414853          	.insn	4, 0x4b414853
    3b3e:	3145                	jal	37de <verify_hash.isra.0+0x3a>
    3b40:	3832                	fld	fa6,296(sp)
    3b42:	6d20                	flw	fs0,88(a0)
    3b44:	6c75                	lui	s8,0x1d
    3b46:	6974                	flw	fa3,84(a0)
    3b48:	732d                	lui	t1,0xfffeb
    3b4a:	7571                	lui	a0,0xffffc
    3b4c:	6565                	lui	a0,0x19
    3b4e:	657a                	flw	fa0,156(sp)
    3b50:	2820                	fld	fs0,80(s0)
    3b52:	3035                	jal	337e <_printf_i+0x64>
    3b54:	4230                	lw	a2,64(a2)
    3b56:	6f20                	flw	fs0,88(a4)
    3b58:	7475                	lui	s0,0xffffd
    3b5a:	7570                	flw	fa2,108(a0)
    3b5c:	2974                	fld	fa3,208(a0)
    3b5e:	0000                	unimp
    3b60:	2020                	fld	fs0,64(s0)
    3b62:	6c637943          	.insn	4, 0x6c637943
    3b66:	7365                	lui	t1,0xffff9
    3b68:	203a                	fld	ft0,392(sp)
    3b6a:	7525                	lui	a0,0xfffe9
    3b6c:	000a                	c.slli	zero,0x2
    3b6e:	0000                	unimp
    3b70:	4941465b          	.insn	4, 0x4941465b
    3b74:	5d4c                	lw	a1,60(a0)
    3b76:	5320                	lw	s0,96(a4)
    3b78:	4148                	lw	a0,4(a0)
    3b7a:	3231454b          	fnmsub.d	fa0,ft2,ft3,ft6,rmm
    3b7e:	2038                	fld	fa4,64(s0)
    3b80:	756d                	lui	a0,0xffffb
    3b82:	746c                	flw	fa1,108(s0)
    3b84:	2d69                	jal	421e <_etext+0x2be>
    3b86:	65757173          	csrrci	sp,hviprio2h,10
    3b8a:	7a65                	lui	s4,0xffff9
    3b8c:	2065                	jal	3c34 <main+0x3e6>
    3b8e:	202d                	jal	3bb8 <main+0x36a>
    3b90:	6c61                	lui	s8,0x18
    3b92:	206c                	fld	fa1,192(s0)
    3b94:	657a                	flw	fa0,156(sp)
    3b96:	6f72                	flw	ft10,28(sp)
    3b98:	756f2073          	csrs	0x756,t5
    3b9c:	7074                	flw	fa3,100(s0)
    3b9e:	7475                	lui	s0,0xffffd
    3ba0:	0000                	unimp
    3ba2:	0000                	unimp
    3ba4:	4941465b          	.insn	4, 0x4941465b
    3ba8:	5d4c                	lw	a1,60(a0)
    3baa:	2520                	fld	fs0,72(a0)
    3bac:	00000a73          	.insn	4, 0x0a73
    3bb0:	2020                	fld	fs0,64(s0)
    3bb2:	7845                	lui	a6,0xffff1
    3bb4:	6570                	flw	fa2,76(a0)
    3bb6:	64657463          	bgeu	a0,t1,41fe <_etext+0x29e>
    3bba:	203a                	fld	ft0,392(sp)
    3bbc:	0000                	unimp
    3bbe:	0000                	unimp
    3bc0:	3025                	jal	33e8 <w25q.c.a2dff0dd+0x5d>
    3bc2:	7832                	flw	fa6,44(sp)
    3bc4:	0000                	unimp
    3bc6:	0000                	unimp
    3bc8:	2e2e                	fld	ft8,200(sp)
    3bca:	002e                	c.slli	zero,0xb
    3bcc:	200a                	fld	ft0,128(sp)
    3bce:	4720                	lw	s0,72(a4)
    3bd0:	203a746f          	jal	s0,ab5d2 <_sp+0x6c982>
    3bd4:	2020                	fld	fs0,64(s0)
    3bd6:	2020                	fld	fs0,64(s0)
    3bd8:	0020                	addi	s0,sp,8
    3bda:	0000                	unimp
    3bdc:	2020                	fld	fs0,64(s0)
    3bde:	4b20                	lw	s0,80(a4)
    3be0:	4345                	li	t1,17
    3be2:	204b4143          	fmadd.s	ft2,fs6,ft4,ft4,rmm
    3be6:	4241                	li	tp,16
    3be8:	50524f53          	.insn	4, 0x50524f53
    3bec:	4954                	lw	a3,20(a0)
    3bee:	54204e4f          	.insn	4, 0x54204e4f
    3bf2:	5345                	li	t1,-15
    3bf4:	2054                	fld	fa3,128(s0)
    3bf6:	2020                	fld	fs0,64(s0)
    3bf8:	2020                	fld	fs0,64(s0)
    3bfa:	2020                	fld	fs0,64(s0)
    3bfc:	2020                	fld	fs0,64(s0)
    3bfe:	2020                	fld	fs0,64(s0)
    3c00:	0020                	addi	s0,sp,8
    3c02:	0000                	unimp
    3c04:	6554                	flw	fa3,12(a0)
    3c06:	6e697473          	csrrci	s0,0x6e6,18
    3c0a:	48532067          	.insn	4, 0x48532067
    3c0e:	3341                	jal	398e <main+0x140>
    3c10:	4148532f          	.insn	4, 0x4148532f
    3c14:	7720454b          	.insn	4, 0x7720454b
    3c18:	7469                	lui	s0,0xffffa
    3c1a:	2068                	fld	fa0,192(s0)
    3c1c:	5748                	lw	a0,44(a4)
    3c1e:	6120                	flw	fs0,64(a0)
    3c20:	6c656363          	bltu	a0,t1,42e6 <_etext+0x386>
    3c24:	7265                	lui	tp,0xffff9
    3c26:	7461                	lui	s0,0xffff8
    3c28:	6f69                	lui	t5,0x1a
    3c2a:	0a6e                	slli	s4,s4,0x1b
    3c2c:	0000                	unimp
    3c2e:	0000                	unimp
    3c30:	6554                	flw	fa3,12(a0)
    3c32:	203a7473          	csrrci	s0,0x203,20
    3c36:	33414853          	.insn	4, 0x33414853
    3c3a:	322d                	jal	3564 <w25q.c.a2dff0dd+0x1d9>
    3c3c:	3635                	jal	3768 <test_multi_squeeze+0x4c>
    3c3e:	7320                	flw	fs0,96(a4)
    3c40:	6e69                	lui	t3,0x1a
    3c42:	20656c67          	.insn	4, 0x20656c67
    3c46:	6c62                	flw	fs8,24(sp)
    3c48:	006b636f          	jal	t1,b9c4e <_sp+0x7affe>
    3c4c:	33414853          	.insn	4, 0x33414853
    3c50:	322d                	jal	357a <__swhatbuf_r>
    3c52:	3635                	jal	377e <test_multi_squeeze+0x62>
    3c54:	7320                	flw	fs0,96(a4)
    3c56:	6e69                	lui	t3,0x1a
    3c58:	20656c67          	.insn	4, 0x20656c67
    3c5c:	6c62                	flw	fs8,24(sp)
    3c5e:	006b636f          	jal	t1,b9c64 <_sp+0x7b014>
    3c62:	0000                	unimp
    3c64:	6554                	flw	fa3,12(a0)
    3c66:	203a7473          	csrrci	s0,0x203,20
    3c6a:	33414853          	.insn	4, 0x33414853
    3c6e:	352d                	jal	3a98 <main+0x24a>
    3c70:	3231                	jal	357c <__swhatbuf_r+0x2>
    3c72:	7320                	flw	fs0,96(a4)
    3c74:	6e69                	lui	t3,0x1a
    3c76:	20656c67          	.insn	4, 0x20656c67
    3c7a:	6c62                	flw	fs8,24(sp)
    3c7c:	006b636f          	jal	t1,b9c82 <_sp+0x7b032>
    3c80:	33414853          	.insn	4, 0x33414853
    3c84:	352d                	jal	3aae <main+0x260>
    3c86:	3231                	jal	3592 <__swhatbuf_r+0x18>
    3c88:	7320                	flw	fs0,96(a4)
    3c8a:	6e69                	lui	t3,0x1a
    3c8c:	20656c67          	.insn	4, 0x20656c67
    3c90:	6c62                	flw	fs8,24(sp)
    3c92:	006b636f          	jal	t1,b9c98 <_sp+0x7b048>
    3c96:	0000                	unimp
    3c98:	6554                	flw	fa3,12(a0)
    3c9a:	203a7473          	csrrci	s0,0x203,20
    3c9e:	33414853          	.insn	4, 0x33414853
    3ca2:	322d                	jal	35cc <__swhatbuf_r+0x52>
    3ca4:	3635                	jal	37d0 <verify_hash.isra.0+0x2c>
    3ca6:	6d20                	flw	fs0,88(a0)
    3ca8:	6c75                	lui	s8,0x1d
    3caa:	6974                	flw	fa3,84(a0)
    3cac:	622d                	lui	tp,0xb
    3cae:	6f6c                	flw	fa1,92(a4)
    3cb0:	28206b63          	bltu	zero,sp,3f46 <main+0x6f8>
    3cb4:	3032                	fld	ft0,296(sp)
    3cb6:	4230                	lw	a2,64(a2)
    3cb8:	6920                	flw	fs0,80(a0)
    3cba:	706e                	flw	ft0,248(sp)
    3cbc:	7475                	lui	s0,0xffffd
    3cbe:	0029                	c.nop	10
    3cc0:	6554                	flw	fa3,12(a0)
    3cc2:	203a7473          	csrrci	s0,0x203,20
    3cc6:	4b414853          	.insn	4, 0x4b414853
    3cca:	3145                	jal	396a <main+0x11c>
    3ccc:	3832                	fld	fa6,296(sp)
    3cce:	5820                	lw	s0,112(s0)
    3cd0:	0000464f          	fnmadd.s	fa2,ft0,ft0,ft0,rmm
    3cd4:	4b414853          	.insn	4, 0x4b414853
    3cd8:	3145                	jal	3978 <main+0x12a>
    3cda:	3832                	fld	fa6,296(sp)
    3cdc:	6320                	flw	fs0,64(a4)
    3cde:	69736e6f          	jal	t3,3ab74 <__heap_end+0x13f2c>
    3ce2:	6e657473          	csrrci	s0,0x6e6,10
    3ce6:	00007963          	bgeu	zero,zero,3cf8 <main+0x4aa>
    3cea:	0000                	unimp
    3cec:	6554                	flw	fa3,12(a0)
    3cee:	203a7473          	csrrci	s0,0x203,20
    3cf2:	4b414853          	.insn	4, 0x4b414853
    3cf6:	3245                	jal	3696 <_putc_r+0x3e>
    3cf8:	3635                	jal	3824 <verify_hash.isra.0+0x80>
    3cfa:	5820                	lw	s0,112(s0)
    3cfc:	0000464f          	fnmadd.s	fa2,ft0,ft0,ft0,rmm
    3d00:	4b414853          	.insn	4, 0x4b414853
    3d04:	3245                	jal	36a4 <_putc_r+0x4c>
    3d06:	3635                	jal	3832 <verify_hash.isra.0+0x8e>
    3d08:	6320                	flw	fs0,64(a4)
    3d0a:	69736e6f          	jal	t3,3aba0 <__heap_end+0x13f58>
    3d0e:	6e657473          	csrrci	s0,0x6e6,10
    3d12:	00007963          	bgeu	zero,zero,3d24 <main+0x4d6>
    3d16:	0000                	unimp
    3d18:	2020                	fld	fs0,64(s0)
    3d1a:	6554                	flw	fa3,12(a0)
    3d1c:	3a737473          	csrrci	s0,0x3a7,6
    3d20:	2520                	fld	fs0,72(a0)
    3d22:	2f64                	fld	fs1,216(a4)
    3d24:	6425                	lui	s0,0x9
    3d26:	7020                	flw	fs0,96(s0)
    3d28:	7361                	lui	t1,0xffff8
    3d2a:	0a646573          	csrrsi	a0,0xa6,8
    3d2e:	0000                	unimp
    3d30:	4946                	lw	s2,80(sp)
    3d32:	414e                	lw	sp,208(sp)
    3d34:	204c                	fld	fa1,128(s0)
    3d36:	54415453          	.insn	4, 0x54415453
    3d3a:	5355                	li	t1,-11
    3d3c:	203a                	fld	ft0,392(sp)
    3d3e:	4c41                	li	s8,16
    3d40:	204c                	fld	fa1,128(s0)
    3d42:	4554                	lw	a3,12(a0)
    3d44:	20535453          	.insn	4, 0x20535453
    3d48:	4150                	lw	a2,4(a0)
    3d4a:	44455353          	.insn	4, 0x44455353
    3d4e:	0000                	unimp
    3d50:	4946                	lw	s2,80(sp)
    3d52:	414e                	lw	sp,208(sp)
    3d54:	204c                	fld	fa1,128(s0)
    3d56:	54415453          	.insn	4, 0x54415453
    3d5a:	5355                	li	t1,-11
    3d5c:	203a                	fld	ft0,392(sp)
    3d5e:	4554                	lw	a3,12(a0)
    3d60:	46205453          	.insn	4, 0x46205453
    3d64:	4941                	li	s2,16
    3d66:	554c                	lw	a1,44(a0)
    3d68:	4552                	lw	a0,20(sp)
    3d6a:	4420                	lw	s0,72(s0)
    3d6c:	5445                	li	s0,-15
    3d6e:	4345                	li	t1,17
    3d70:	4554                	lw	a3,12(a0)
    3d72:	0044                	addi	s1,sp,4
    3d74:	983a                	add	a6,a6,a4
    3d76:	a75d                	j	451c <_etext+0x5bc>
    3d78:	b225e24f          	fnmadd.d	ft4,fa1,ft2,fs6,unknown
    3d7c:	5c04                	lw	s1,56(s0)
    3d7e:	d36b2d17          	auipc	s10,0xd36b2
    3d82:	bd90                	fsd	fa2,56(a1)
    3d84:	5f85                	li	t6,-31
    3d86:	6e08                	flw	fa0,24(a2)
    3d88:	9d3e                	add	s10,s10,a5
    3d8a:	5b52                	lw	s6,52(sp)
    3d8c:	bf46                	fsd	fa7,440(sp)
    3d8e:	45e2                	lw	a1,24(sp)
    3d90:	4311                	li	t1,4
    3d92:	3215                	jal	36b6 <memchr+0x6>
    3d94:	0000                	unimp
    3d96:	0000                	unimp
    3d98:	0b8551b7          	lui	gp,0xb855
    3d9c:	571a                	lw	a4,164(sp)
    3d9e:	8a16                	mv	s4,t0
    3da0:	9356                	add	t1,t1,s5
    3da2:	92cd                	srli	a3,a3,0x33
    3da4:	6e096b4b          	.insn	4, 0x6e096b4b
    3da8:	f608                	fsw	fa0,40(a2)
    3daa:	8221                	srli	a2,a2,0x8
    3dac:	4474                	lw	a3,76(s0)
    3dae:	4f880df7          	.insn	4, 0x4f880df7
    3db2:	025d                	addi	tp,tp,23 # b017 <spi_sdk.c.e26edb40+0x66a>
    3db4:	d240                	sw	s0,36(a2)
    3db6:	2e71                	jal	4152 <_etext+0x1f2>
    3db8:	e110                	fsw	fa2,0(a0)
    3dba:	e916                	fsw	ft5,144(sp)
    3dbc:	2a19                	jal	3ed2 <main+0x684>
    3dbe:	7e1ac9f3          	.insn	4, 0x7e1ac9f3
    3dc2:	76c5                	lui	a3,0xffff1
    3dc4:	4093e347          	fmsub.s	ft6,ft7,fs1,fs0,unknown
    3dc8:	4c0b3457          	.insn	4, 0x4c0b3457
    3dcc:	08f4                	addi	a3,sp,92
    3dce:	a5d5                	j	44b2 <_etext+0x552>
    3dd0:	9265                	srli	a2,a2,0x39
    3dd2:	27f8                	fld	fa4,200(a5)
    3dd4:	ec4e                	fsw	fs3,24(sp)
    3dd6:	0000f053          	fadd.s	ft0,ft1,ft0
    3dda:	0000                	unimp
    3ddc:	544d                	li	s0,-13
    3dde:	4156                	lw	sp,84(sp)
    3de0:	204c                	fld	fa1,128(s0)
    3de2:	6176                	flw	ft2,92(sp)
    3de4:	756c                	flw	fa1,108(a0)
    3de6:	2065                	jal	3e8e <main+0x640>
    3de8:	7369                	lui	t1,0xffffa
    3dea:	0020                	addi	s0,sp,8
    3dec:	6e49                	lui	t3,0x12
    3dee:	75727473          	csrrci	s0,0x757,4
    3df2:	6f697463          	bgeu	s2,s6,44da <_etext+0x57a>
    3df6:	206e                	fld	ft0,216(sp)
    3df8:	6361                	lui	t1,0x18
    3dfa:	73736563          	bltu	t1,s7,4524 <_etext+0x5c4>
    3dfe:	6620                	flw	fs0,72(a2)
    3e00:	7561                	lui	a0,0xffff8
    3e02:	746c                	flw	fa1,108(s0)
    3e04:	202c                	fld	fa1,64(s0)
    3e06:	746d                	lui	s0,0xffffb
    3e08:	6176                	flw	ft2,92(sp)
    3e0a:	206c                	fld	fa1,192(s0)
    3e0c:	776f6873          	csrrsi	a6,0x776,30
    3e10:	61662073          	csrs	0x616,a2
    3e14:	6c75                	lui	s8,0x1d
    3e16:	2074                	fld	fa3,192(s0)
    3e18:	6461                	lui	s0,0x18
    3e1a:	7264                	flw	fs1,100(a2)
    3e1c:	7365                	lui	t1,0xffff9
    3e1e:	00000a73          	.insn	4, 0x0a73
    3e22:	0000                	unimp
    3e24:	6c49                	lui	s8,0x12
    3e26:	656c                	flw	fa1,76(a0)
    3e28:	206c6167          	.insn	4, 0x206c6167
    3e2c:	6e49                	lui	t3,0x12
    3e2e:	75727473          	csrrci	s0,0x757,4
    3e32:	6f697463          	bgeu	s2,s6,451a <_etext+0x5ba>
    3e36:	206e                	fld	ft0,216(sp)
    3e38:	6166                	flw	ft2,88(sp)
    3e3a:	6c75                	lui	s8,0x1d
    3e3c:	2c74                	fld	fa3,216(s0)
    3e3e:	6d20                	flw	fs0,88(a0)
    3e40:	7674                	flw	fa3,108(a2)
    3e42:	6c61                	lui	s8,0x18
    3e44:	7320                	flw	fs0,96(a4)
    3e46:	6f68                	flw	fa0,92(a4)
    3e48:	69207377          	.insn	4, 0x69207377
    3e4c:	736e                	flw	ft6,248(sp)
    3e4e:	7274                	flw	fa3,100(a2)
    3e50:	6375                	lui	t1,0x1d
    3e52:	6974                	flw	fa3,84(a0)
    3e54:	63206e6f          	jal	t3,a486 <syscalls.c.b6d2745e+0x11ad>
    3e58:	65746e6f          	jal	t3,4acae <_sp+0xc05e>
    3e5c:	746e                	flw	fs0,248(sp)
    3e5e:	000a                	c.slli	zero,0x2
    3e60:	7242                	flw	ft4,48(sp)
    3e62:	6165                	addi	sp,sp,112
    3e64:	696f706b          	.insn	4, 0x696f706b
    3e68:	746e                	flw	fs0,248(sp)
    3e6a:	7420                	flw	fs0,104(s0)
    3e6c:	6972                	flw	fs2,28(sp)
    3e6e:	72656767          	.insn	4, 0x72656767
    3e72:	2c64                	fld	fs1,216(s0)
    3e74:	6d20                	flw	fs0,88(a0)
    3e76:	7674                	flw	fa3,108(a2)
    3e78:	6c61                	lui	s8,0x18
    3e7a:	7320                	flw	fs0,96(a4)
    3e7c:	6f68                	flw	fa0,92(a4)
    3e7e:	74207377          	.insn	4, 0x74207377
    3e82:	6568                	flw	fa0,76(a0)
    3e84:	6220                	flw	fs0,64(a2)
    3e86:	6572                	flw	fa0,28(sp)
    3e88:	6b61                	lui	s6,0x18
    3e8a:	6f70                	flw	fa2,92(a4)
    3e8c:	6e69                	lui	t3,0x1a
    3e8e:	2074                	fld	fa3,192(s0)
    3e90:	6461                	lui	s0,0x18
    3e92:	7264                	flw	fs1,100(a2)
    3e94:	7365                	lui	t1,0xffff9
    3e96:	00000a73          	.insn	4, 0x0a73
    3e9a:	0000                	unimp
    3e9c:	6f4c                	flw	fa1,28(a4)
    3e9e:	6461                	lui	s0,0x18
    3ea0:	6f74532f          	.insn	4, 0x6f74532f
    3ea4:	6572                	flw	fa0,28(sp)
    3ea6:	6620                	flw	fs0,72(a2)
    3ea8:	7561                	lui	a0,0xffff8
    3eaa:	746c                	flw	fa1,108(s0)
    3eac:	202c                	fld	fa1,64(s0)
    3eae:	746d                	lui	s0,0xffffb
    3eb0:	6176                	flw	ft2,92(sp)
    3eb2:	206c                	fld	fa1,192(s0)
    3eb4:	776f6873          	csrrsi	a6,0x776,30
    3eb8:	68742073          	csrs	0x687,s0
    3ebc:	2065                	jal	3f64 <_etext+0x4>
    3ebe:	6166                	flw	ft2,88(sp)
    3ec0:	6c75                	lui	s8,0x1d
    3ec2:	2074                	fld	fa3,192(s0)
    3ec4:	6461                	lui	s0,0x18
    3ec6:	7264                	flw	fs1,100(a2)
    3ec8:	7365                	lui	t1,0xffff9
    3eca:	00000a73          	.insn	4, 0x0a73
    3ece:	0000                	unimp
    3ed0:	6e45                	lui	t3,0x11
    3ed2:	6976                	flw	fs2,92(sp)
    3ed4:	6f72                	flw	ft10,28(sp)
    3ed6:	6d6e                	flw	fs10,216(sp)
    3ed8:	6e65                	lui	t3,0x19
    3eda:	2074                	fld	fa3,192(s0)
    3edc:	6c6c6163          	bltu	s8,t1,459e <_etext+0x63e>
    3ee0:	6520                	flw	fs0,72(a0)
    3ee2:	636e                	flw	ft6,216(sp)
    3ee4:	746e756f          	jal	a0,eb62a <_sp+0xac9da>
    3ee8:	7265                	lui	tp,0xffff9
    3eea:	6465                	lui	s0,0x19
    3eec:	000a                	c.slli	zero,0x2
    3eee:	0000                	unimp
    3ef0:	74666f53          	.insn	4, 0x74666f53
    3ef4:	65726177          	.insn	4, 0x65726177
    3ef8:	4920                	lw	s0,80(a0)
    3efa:	5152                	lw	sp,52(sp)
    3efc:	7420                	flw	fs0,104(s0)
    3efe:	6972                	flw	fs2,28(sp)
    3f00:	72656767          	.insn	4, 0x72656767
    3f04:	6465                	lui	s0,0x19
    3f06:	0a21                	addi	s4,s4,8 # ffff9008 <_lma_data_end+0xbffea3c0>
    3f08:	0000                	unimp
    3f0a:	0000                	unimp
    3f0c:	6954                	flw	fa3,20(a0)
    3f0e:	656d                	lui	a0,0x1b
    3f10:	2072                	fld	ft0,280(sp)
    3f12:	5249                	li	tp,-14
    3f14:	2051                	jal	3f98 <_etext+0x38>
    3f16:	7274                	flw	fa3,100(a2)
    3f18:	6769                	lui	a4,0x1a
    3f1a:	65726567          	.insn	4, 0x65726567
    3f1e:	2164                	fld	fs1,192(a0)
    3f20:	000a                	c.slli	zero,0x2
    3f22:	0000                	unimp
    3f24:	2b302d23          	sw	s3,698(zero) # 2ba <w25q128jw_read_standard+0x84>
    3f28:	0020                	addi	s0,sp,8
    3f2a:	0000                	unimp
    3f2c:	6c68                	flw	fa0,92(s0)
    3f2e:	004c                	addi	a1,sp,4
    3f30:	6665                	lui	a2,0x19
    3f32:	47464567          	.insn	4, 0x47464567
    3f36:	0000                	unimp
    3f38:	3130                	fld	fa2,96(a0)
    3f3a:	3332                	fld	ft6,296(sp)
    3f3c:	3534                	fld	fa3,104(a0)
    3f3e:	3736                	fld	fa4,360(sp)
    3f40:	3938                	fld	fa4,112(a0)
    3f42:	4241                	li	tp,16
    3f44:	46454443          	.insn	4, 0x46454443
    3f48:	0000                	unimp
    3f4a:	0000                	unimp
    3f4c:	3130                	fld	fa2,96(a0)
    3f4e:	3332                	fld	ft6,296(sp)
    3f50:	3534                	fld	fa3,104(a0)
    3f52:	3736                	fld	fa4,360(sp)
    3f54:	3938                	fld	fa4,112(a0)
    3f56:	6261                	lui	tp,0x18
    3f58:	66656463          	bltu	a0,t1,45c0 <_etext+0x660>
    3f5c:	0000                	unimp
	...
