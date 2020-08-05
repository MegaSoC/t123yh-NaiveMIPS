// vim: set ft=mips:
#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(e1_trap_test)
    .set noreorder
    addiu s0, s0 ,1
    mtc0  zero, c0_compare
    li    s2, 0x09
    li    t0, 0x800d0000
    sw s2, 0(t0)
    
###test inst
    TEST_TRAP(teq, 0x1926, 0x1926)
    TEST_TRAP(teq, 0x1926, 0x0817)
    TEST_TRAP_I(teqi, 0x1926, 0x1926)
    TEST_TRAP_I(teqi, 0x1926, 0x0817)
    TEST_TRAP(tne, 0x1926, 0x1926)
    TEST_TRAP(tne, 0x1926, 0x0817)
    TEST_TRAP_I(tnei, 0x1926, 0x1926)
    TEST_TRAP_I(tnei, 0x1926, 0x0817)

    TEST_TRAP(tge, 1234, -1234)
    TEST_TRAP(tge, -1234, 1234)
    TEST_TRAP_I(tgei, 1234, -1234)
    TEST_TRAP_I(tgei, -1234, 1234)
    TEST_TRAP(tgeu, 1234, -1234)
    TEST_TRAP(tgeu, -1234, 1234)
    TEST_TRAP_I(tgeiu, 1234, -1234)
    TEST_TRAP_I(tgeiu, -1234, 1234)
    TEST_TRAP(tlt, 1234, -1234)
    TEST_TRAP(tlt, -1234, 1234)
    TEST_TRAP_I(tlti, 1234, -1234)
    TEST_TRAP_I(tlti, -1234, 1234)
    TEST_TRAP(tltu, 1234, -1234)
    TEST_TRAP(tltu, -1234, 1234)
    TEST_TRAP_I(tltiu, 1234, -1234)
    TEST_TRAP_I(tltiu, -1234, 1234)
    
    LIKELY_TEST(BEQL, 1234, 1234)
    LIKELY_TEST(BEQL, 1234, 5678)
    LIKELY_TEST(BEQL, 5678, 1234)
    LIKELY_TEST(BNEL, 1234, 1234)
    LIKELY_TEST(BNEL, 1234, 5678)
    LIKELY_TEST(BNEL, 5678, 1234)
    LIKELYZ_TEST(BGEZL, 1234)
    LIKELYZ_TEST(BGEZL, 0)
    LIKELYZ_TEST(BGEZL, -1234)
    LIKELYZ_TEST(BGTZL, 1234)
    LIKELYZ_TEST(BGTZL, 0)
    LIKELYZ_TEST(BGTZL, -1234)
    LIKELYZ_TEST(BLTZL, 1234)
    LIKELYZ_TEST(BLTZL, 0)
    LIKELYZ_TEST(BLTZL, -1234)
    LIKELYZ_TEST(BLEZL, 1234)
    LIKELYZ_TEST(BLEZL, 0)
    LIKELYZ_TEST(BLEZL, -1234)
    LIKELYZ_TEST(BGEZALL, 1234)
    LIKELYZ_TEST(BGEZALL, 0)
    LIKELYZ_TEST(BGEZALL, -1234)

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
END(e1_trap_test)
