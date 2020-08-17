// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e8_lwl_lwr)
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
    li t3, 0x22334455
    lwl t3, 8(t0)
    li t6, 0xEF334455
    bne t3, t6, inst_error
    nop
    lwr t3, 5(t0)
    li t6, 0xEF123456
    bne t3, t6, inst_error
    nop
    li t3, 0x22334455
    lwl t3, 9(t0)
    li t6, 0xCDEF4455
    bne t3, t6, inst_error
    nop
    lwr t3, 6(t0)
    li t6, 0xCDEF1234
    bne t3, t6, inst_error
    nop
    li t3, 0x22334455
    lwl t3, 10(t0)
    li t6, 0xABCDEF55
    bne t3, t6, inst_error
    nop
    lwr t3, 7(t0)
    li t6, 0xABCDEF12
    bne t3, t6, inst_error
    nop
    li t3, 0x22334455
    lwl t3, 11(t0)
    li t6, 0x90ABCDEF
    bne t3, t6, inst_error
    nop
    li t3, 0x22334455
    lwr t3, 4(t0)
    li t6, 0x12345678
    bne t3, t6, inst_error
    nop
    
    li t3, 0x22334455
    lwl t3, 9(t0)
    nop
    lwr t3, 6(t0)
    li t6, 0xCDEF1234
    bne t3, t6, inst_error
    nop
    li t3, 0x22334455
    lwl t3, 9(t0)
    lwr t3, 6(t0)
    li t6, 0xCDEF1234
    bne t3, t6, inst_error
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
END(e8_lwl_lwr)
