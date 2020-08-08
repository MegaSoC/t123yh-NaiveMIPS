// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e4_ll_sc)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x01
    li    t0, 0x800d0000
    sw s2, 0(t0)
    .set mips32
        
        

###test inst
    li t0, 0x8000d000
    li t1, 1234
    sw t1, 4(t0)
    ll t2, 4(t0)
    addiu t2, t2, 4
    sc t2, 4(t0)
    
    ll t2, 4(t0)
    addiu t2, t2, 4
    syscall
    sc t2, 4(t0)
    
    lw t3, 4(t0)
    li t4, 1238
    bne t3, t4, inst_error
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
END(e4_ll_sc)
