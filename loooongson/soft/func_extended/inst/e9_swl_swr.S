// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e9_swl_swr)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x01
    li    t0, 0x800d0000
    sw s2, 0(t0)
    .set mips32
        
        

###test inst
    li t0, 0xE0000000
    and t0, ra, t0
    ori t0, t0, 0xd000
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    li t3, 0x19260817
    swl t3, 8(t0)
    lw t4, 8(t0)
    li t5, 0x90ABCD19
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swl t3, 5(t0)
    lw t4, 4(t0)
    li t5, 0x12341926
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swl t3, 6(t0)
    lw t4, 4(t0)
    li t5, 0x12192608
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swl t3, 7(t0)
    lw t4, 4(t0)
    lw t6, 8(t0)
    li t5, 0x90ABCDEF
    bne t6, t5, inst_error
    nop
    bne t4, t3, inst_error
    nop


    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    li t3, 0x19260817
    swr t3, 5(t0)
    lw t4, 4(t0)
    li t5, 0x26081778
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swr t3, 6(t0)
    lw t4, 4(t0)
    li t5, 0x08175678
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swr t3, 7(t0)
    lw t4, 4(t0)
    li t5, 0x17345678
    bne t4, t5, inst_error
    nop
    li t1, 0x12345678
    sw t1, 4(t0)
    li t2, 0x90ABCDEF
    sw t2, 8(t0)
    swr t3, 8(t0)
    lw t4, 4(t0)
    lw t6, 8(t0)
    li t5, 0x12345678
    bne t6, t3, inst_error
    nop
    bne t4, t5, inst_error
    nop
    
    
    .set mips2
###detect exception
###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(e9_swl_swr)
