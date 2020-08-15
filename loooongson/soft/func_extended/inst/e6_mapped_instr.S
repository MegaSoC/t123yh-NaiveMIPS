#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

### refers to testcase No.55

instr_tlb:
li t2, 0
li t4, 0
li t3, 10
1:
addiu t2, t2, 1
addiu t4, t4, 10
bne t2, t3, 1b
nop
jr ra
nop

LEAF(e6_mapped_instr)
    .set noreorder
    addiu s0, s0 ,1
    move t9, ra
    li  a0, 0x5d
###test inst
    li k0, 0x0001  ##label tlbwr_allbit
    lui v0, 0xffe8
    ori v0, 0xdc03
    la t0, instr_tlb
    li t5, 0xFFFFE000
    li s5, 0x6000
    and t0, t0, t5
    srl t0, t0, 6
    move t1, t0
    la t6, instr_tlb
    andi t6, t6, 0xFFF
    ori t6, t6, 0x6000
    jalr t6
    nop
    bne t4, 100, inst_error
    nop

###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    move ra,t9
    jr ra
    nop
END(e6_mapped_instr)
