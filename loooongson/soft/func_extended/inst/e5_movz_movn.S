// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e5_movz_movn)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x01
    li    t0, 0x800d0000
    sw s2, 0(t0)
    .set mips32
        
        

###test inst
    li t1, 1234
    li t3, 0
    movn t2, t1, t3
    li t1, 1238
    li t3, 1
    movn t2, t1, t3
    li t1, 2345
    li t3, 0
    movz t2, t1, t3
    li t1, 76767
    li t3, 1
    movz t2, t1, t3
    
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
END(e5_movz_movn)
