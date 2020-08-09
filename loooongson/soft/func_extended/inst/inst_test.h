// file name: inst_test.h
#include <cpu_cde.h>

#define TEST_TRAP(instr, imm1, imm2) \
    LI (t7, imm1); \
    LI (t8, imm2); \
    la s4, 1f; \
1:  instr t7, t8; \


#define TEST_TRAP_I(instr, imm1, imm2) \
    LI (t7, imm1); \
    la s4, 1f; \
1:  instr t7, imm2;

#define LIKELY_TEST(instr, imm1, imm2) \
    move v0, ra; \
    LI (t7, imm1); \
    LI (t8, imm2); \
    instr t7, t8, 1f; \
    addiu t7, 1; \
    addiu t7, 10; \
1:  addiu t8, 100; \
    move ra, v0;

#define LIKELYZ_TEST(instr, imm1) \
    move v0, ra; \
    LI (t7, imm1); \
    instr t7, 1f; \
    addiu t7, 1; \
    addiu t7, 20; \
1:  addiu t7, 10; \
    move ra, v0;

