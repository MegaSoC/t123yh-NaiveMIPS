#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

#define TEST_NUM 16


##s0, number
##s1, number adress 
##s2, exception use
##s3, score
##s4, exception pc
	.set	noreorder
	.globl	_start
	.globl	start
	.globl	__main
_start:
start:
li t0, 0x1800
mtc0 t0, c0_pagemask
    mtlo zero
    mthi zero
    li    t0, 0xffffffff
    addiu t0, zero, 0xffff
	b	locate
	nop

##avoid "j locate" not taken
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)
    nop

##avoid cpu run error
.org 0x0ec
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)
.org 0x100
test_finish:
    addiu t0, t0, 1
    li t1, 0xff
    LI (t2, UART_ADDR)
    sw t1, 0x0(t2)
    b test_finish
    nop
##avoid cpu run error
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)
    
/* tlb */    

    ebase_entry:
.org 0x200
    lui v1, 0xffe8
    ori v1, 0xdc03
    beq v0, v1, tlbwr_ex
    nop
    lui v1, 0xefe8
    ori v1, 0xdc03
    beq v0, v1, tlbwi_ex
    nop   
    lui v1, 0x8888
    ori v1, 0xdc03
    beq v0, v1, tlb_double_fill
    nop   
    
/*
 *  exception handle
 */
.org 0x380
1:  
    mfhi k0
    mflo k1
    li  k0, 0x800d0000
    lw  k1, 0x0(k0)
    li  k0, 0x01 # syscall
    beq k1, k0, syscall_ex
    nop
    li  k0, 0x02 # break
    beq k1, k0, break_ex
    nop
    li  k0, 0x03 # overflow
    beq k1, k0, overflow_ex
    nop
    li  k0, 0x04 # adel(load)
    beq k1, k0, adel_load_ex
    nop
    li  k0, 0x05 # ades
    beq k1, k0, ades_ex
    nop
    li  k0, 0x06 # adel(inst fetch)
    beq k1, k0, adel_if_ex
    nop
    li  k0, 0x07 # reserved inst
    beq k1, k0, reserved_inst_ex
    nop
    li  k0, 0x08 # int
    beq k1, k0, int_ex
    nop
    li  k0, 0x09 # trap
    beq k1, k0, trap_ex
    nop
    li k0, 0x10
    beq k1, k0, tlb_double_ex

syscall_ex:
    addu  s2, zero, zero
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2
    li   k1, 0x20 # 010_0000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02
    li   k1, 0x02
    bne  k0, k1, ex_finish
    nop
    lui  s2, 0x1
    b ex_finish
    nop

break_ex:
    addu  s2, zero, zero
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2
    li   k1, 0x24 # 010_0100
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li   k1, 0x02 # exl = 1
    bne  k0, k1, ex_finish
    nop
    lui  s2, 0x2
    b ex_finish
    nop


    
trap_ex:
    addu  s2, zero, zero
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2
    li   k1, 0x34 # 010_0100
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li   k1, 0x02 # exl = 1
    bne  k0, k1, ex_finish
    nop
    lui  s2, 0x2
    b ex_finish
    nop

overflow_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x30 # 011_0000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    lui s2, 0x3
    b ex_finish
    nop

adel_load_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x10 # 001_0000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    lui s2, 0x4
    b ex_finish
    nop

ades_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x14 # 001_0100
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    lui s2, 0x5
    b ex_finish
    nop

adel_if_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mtc0 s5, c0_epc
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x10 # 001_0000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    lui s2, 0x6
    b ex_finish
    nop

reserved_inst_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x28 # 010_1000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    lui s2, 0x7
    b ex_finish
    nop

int_ex:
    addu s2, zero, zero 
    mfc0 k0, c0_epc
    bne  k0, s4, ex_finish
    nop
    addiu k0, k0, 8
    mtc0  k0, c0_epc   //epc+8
    disable_trace_cmp_s
    mfc0 k0, c0_cause  //don't compare cause.bd
    enable_trace_cmp_s
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x00 # 000_0000
    bne  k0, k1, ex_finish
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, ex_finish
    nop
    li   k0, 0xffffffff
    li   k1, 0x00000000
    mtc0 k0, c0_compare //clear compare
    mtc0 k1, c0_cause
    lui s2, 0x8
    b ex_ret
    nop

ex_finish:
    mfc0 k0,c0_cause
    lui k1,0x8000
    and k0,k0,k1
    mfc0 k1,c0_epc
    addiu k1,k1,0x4
    beq k0,zero, 1f
    nop
    addiu k1,k1,0x4
1:  
    mtc0  k1,c0_epc
    nop
    bne s2, zero, ex_ret
    nop
    lui s2, 0xffff
ex_ret:
    .set mips32
    eret
    .set mips1
    nop

tlbwr_ex:
    li v1, 0x1
    beq k0, v1, tlbwr_allbit
    nop
    li v1, 0x3
    beq k0, v1, tlbwr_asid
    nop
    addiu t0, 0x0001
    addiu t1, 0x0001
    addiu k0, 0x0001
    j tlbwr_return
    nop
tlbwr_allbit:
    ori t0, 0x7
    ori t1, 0x7
    j tlbwr_return
    nop
tlbwr_asid:
    j tlbwr_return
    nop
tlbwr_return:
    mtc0 s5, c0_entryhi
    mtc0 t0, c0_entrylo0
    mtc0 t1, c0_entrylo1
    tlbwr
    lui v1, 0xed08
    ori v1, 0xdc15
    add v1, v1, k0
    .set mips32
    eret
    .set mips1
tlbwi_ex:
    mfc0 v1, c0_badvaddr
    lui a1, 0xffff
    ori a1, 0xe000
    and v1, a1, v1
    mtc0 v1, c0_entryhi
    li v1, 0x4007
    mtc0 v1, c0_entrylo0
    li v1, 0x4007
    mtc0 v1, c0_entrylo1
    tlbwi
    lui v1, 0xed12
    ori v1, 0x5678
    .set mips32
    eret
    .set mips1
    nop

tlb_double_ex:
.set noreorder
    mfc0 t9, c0_entryhi
    li t9, 0x8000d007
    mtc0 t9, c0_entrylo0
    mtc0 t9, c0_entrylo1
    tlbwr
    mfc0 t9, c0_epc
        .set mips32
    eret
        .set mips1

tlb_double_fill: # t7=epc
    li    t8, 0x800d0000
    li    s2, 0x10
    sw    s2, 0(t8)
    li    t8, 0x000c0000
    lw    s2, 0(t8)
    subu s2, s2, 0x9
    or t0, s2, t0 # s2 should be 0x7
    or t1, s2, t1
    mtc0 t0, c0_entrylo0
    mtc0 t1, c0_entrylo1
    tlbwr
        lui v1, 0x3333
    ori v1, 0xdc15

        .set mips32
    eret
        .set mips1
        nop

locate:
	.set noreorder

    LI (a0, LED_RG1_ADDR)
    LI (a1, LED_RG0_ADDR)
    LI (s1, NUM_ADDR)

    LI (t1, 0x0002)
    LI (t2, 0x0001)
    lui s3, 0

    sw t1, 0(a0)
    sw t2, 0(a1)
    sw s3, 0(s1)

    lui s0, 0          ## initial run number

    la t1, kseg1_kseg0 #####
    li t2, 0x20000000  ###
    subu t9, t1, t2    #kseg1 -> kseg0
    jr t9              ###
    nop                #####
kseg1_kseg0:
inst_test:
    jal e1_trap_test    #lui
    nop
    jal wait_1s
    nop
    jal e2_clo_clz_test    #lui
    nop
    jal e3_madd_msub_test    #lui
    nop
    jal e9_swl_swr   #addu
    nop
    jal e8_lwl_lwr   #addu
    nop
    jal e4_ll_sc    #lui
    nop
    jal e5_movz_movn    #lui
    nop
    jal n92_tlbwi_test    #lui
    nop
    jal n93_tlbwr_test    #lui
    nop
    
    la t9, kseg0_kseg1 #####
    jr t9              #kseg0 -> kseg1
    nop                #####

kseg0_kseg1:
    jal e1_trap_test   #addu
    nop
    jal wait_1s
    nop
    jal e2_clo_clz_test    #lui
    nop
    jal e3_madd_msub_test    #lui
    nop
    jal e9_swl_swr   #addu
    nop
    jal e8_lwl_lwr   #addu
    nop
    jal e4_ll_sc    #lui
    nop
    jal e5_movz_movn    #lui
    nop
    jal e6_mapped_instr
    nop
    jal e7_tlb_double_miss
    nop
    
###check io access
    LI  (a0, IO_SIMU_ADDR)
    LI  (t0, 0x1234)
    sw   t0, 0(a0)
    lw   t1, 0(a0)   //t1=0x12340000
    sll  t0, t0, 16
    bne  t0, t1, io_err
    nop

    LI  (t0, 0x56780000)
    sw   t0, 0(a0)
    srl  t0, t0, 16
    lw   t1, 0(a0)   //t1=0x5678
    bne  t0, t1, io_err
    nop
    b    test_end
    nop
io_err:
    addiu s0, s0, 1
    sw    s0, 0(s1)

test_end:
    LI  (s0, TEST_NUM)
    beq s0, s3, 1f
    nop

    LI (a0, LED_ADDR)
	LI (a1, LED_RG1_ADDR)
    LI (a2, LED_RG0_ADDR)
	
    LI (t1, 0x0002)
    
	sw zero, 0(a0)
    sw t1, 0(a1)
    sw t1, 0(a2)
    b  2f
    nop
1:
    LI (t1, 0x0001)
    LI (a0, LED_RG1_ADDR)
	LI (a1, LED_RG0_ADDR)
    sw t1, 0(a0)
    sw t1, 0(a1)

2:
	jal test_finish
    nop

wait_1s:
    LI (t0,SW_INTER_ADDR)
    LI (t1, 0xaaaa)

    #initial t3
    lw    t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    xor   t2, t2, t1
    sll   t3, t2, 9     #t3 = switch interleave << 9
    addiu t3, t3, 1

sub1:  
    addiu t3, t3, -1

    #select min{t3, switch_interleave}
    lw    t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    xor   t2, t2, t1
    sll   t2, t2, 9     #switch interleave << 9
    sltu  t4, t3, t2
    bnez  t4, 1f 
    nop
    addu  t3, t2, 0
1:
    bne   t3,zero, sub1
    nop
    jr ra
    nop
