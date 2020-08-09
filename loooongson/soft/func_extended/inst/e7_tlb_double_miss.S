#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

LEAF(e7_tlb_double_miss)
    .set noreorder
    addiu s0, s0 ,1
    li  a0, 0x5d
###test inst
    lui v0, 0x8888
    ori v0, 0xdc03
    lui s6, 0x0011
    ori s6, 0xe124
    lui s5, 0x0011
    ori s5, 0xe000 ##entry hi
    lui a3, 0x1234
    ori a3, 0x5867
    li k0, 0x0001  ##label tlbwr_allbit
    li t0, 0x4000 ##entry lo0
    li t1, 0x4000 ##entry lo1
    sw a3, 0(s6)
    lui t0, 0x3333
    ori t0, 0xdc15
    bne v1, t0, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(e7_tlb_double_miss)
