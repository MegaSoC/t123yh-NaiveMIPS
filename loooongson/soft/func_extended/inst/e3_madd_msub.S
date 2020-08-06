// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e3_madd_msub_test)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x09
    li    t0, 0x800d0000
    sw s2, 0(t0)
        .set mips32
###test inst
    mtlo zero
    mthi zero
    li t1, 0x1234
    li t2, 0x5678
    madd t1, t2
    madd t1, t2
    mflo t1
    mfhi t2
    msub t1, t2
    mflo t1
    mfhi t2
    li t1, -12
    li t2, 34
    mtlo t1
    mthi t2
    maddu t1, t2
    mflo t1
    mfhi t2
    li t1, -12
    li t2, 34
    mtlo t1
    mthi t2
    madd t1, t2
    mflo t1
    mfhi t2
    li t1, -12
    li t2, 34
    mtlo t1
    mthi t2
    msubu t1, t2
    mflo t1
    mfhi t2
    li t1, -12
    li t2, 34
    mtlo t1
    mthi t2
    msub t1, t2
    mflo t1
    mfhi t2
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
END(e3_madd_msub_test)
