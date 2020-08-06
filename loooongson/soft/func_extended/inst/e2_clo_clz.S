// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e2_clo_clz_test)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x09
    li    t0, 0x800d0000
    sw s2, 0(t0)
    .set mips32
###test inst
    li t0, 0xE2345678
    clo t1, t0
    clz t1, t0
    li t0, 0x80000000
    clo t1, t0
    clz t1, t0
    li t0, 0x19260817
    clo t1, t0
    clz t1, t0
    li t0, 0xE
    clo t1, t0
    clz t1, t0
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
END(e2_clo_clz_test)
