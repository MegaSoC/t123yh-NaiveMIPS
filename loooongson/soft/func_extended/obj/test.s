
main.elf:     file format elf32-tradlittlemips
main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/lxb/project/loooongson/soft/func_extended/start.S:19
bfc00000:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:20
bfc00004:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:21
bfc00008:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:22
bfc0000c:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:23
bfc00010:	100001bd 	b	bfc00708 <locate>
/home/lxb/project/loooongson/soft/func_extended/start.S:24
bfc00014:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:27
bfc00018:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:28
bfc0001c:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:29
bfc00020:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:30
bfc00024:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:31
bfc00028:	8d0c0000 	lw	t4,0(t0)
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:36
bfc000ec:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:37
bfc000f0:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:38
bfc000f4:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:39
bfc000f8:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:40
bfc000fc:	8d0c0000 	lw	t4,0(t0)

bfc00100 <test_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:43
bfc00100:	25080001 	addiu	t0,t0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:44
bfc00104:	240900ff 	li	t1,255
/home/lxb/project/loooongson/soft/func_extended/start.S:45
bfc00108:	3c0abfaf 	lui	t2,0xbfaf
bfc0010c:	354afff0 	ori	t2,t2,0xfff0
/home/lxb/project/loooongson/soft/func_extended/start.S:46
bfc00110:	ad490000 	sw	t1,0(t2)
/home/lxb/project/loooongson/soft/func_extended/start.S:47
bfc00114:	1000fffa 	b	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:48
bfc00118:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:50
bfc0011c:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:51
bfc00120:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:52
bfc00124:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:53
bfc00128:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:54
bfc0012c:	8d0c0000 	lw	t4,0(t0)
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:60
bfc00380:	0000d010 	mfhi	k0
/home/lxb/project/loooongson/soft/func_extended/start.S:61
bfc00384:	0000d812 	mflo	k1
/home/lxb/project/loooongson/soft/func_extended/start.S:62
bfc00388:	3c1a800d 	lui	k0,0x800d
/home/lxb/project/loooongson/soft/func_extended/start.S:63
bfc0038c:	8f5b0000 	lw	k1,0(k0)
/home/lxb/project/loooongson/soft/func_extended/start.S:64
bfc00390:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:65
bfc00394:	137a0019 	beq	k1,k0,bfc003fc <syscall_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:66
bfc00398:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:67
bfc0039c:	241a0002 	li	k0,2
/home/lxb/project/loooongson/soft/func_extended/start.S:68
bfc003a0:	137a0027 	beq	k1,k0,bfc00440 <break_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:69
bfc003a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:70
bfc003a8:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/start.S:71
bfc003ac:	137a0046 	beq	k1,k0,bfc004c8 <overflow_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:72
bfc003b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:73
bfc003b4:	241a0004 	li	k0,4
/home/lxb/project/loooongson/soft/func_extended/start.S:74
bfc003b8:	137a0053 	beq	k1,k0,bfc00508 <adel_load_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:75
bfc003bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:76
bfc003c0:	241a0005 	li	k0,5
/home/lxb/project/loooongson/soft/func_extended/start.S:77
bfc003c4:	137a0061 	beq	k1,k0,bfc0054c <ades_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:78
bfc003c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:79
bfc003cc:	241a0006 	li	k0,6
/home/lxb/project/loooongson/soft/func_extended/start.S:80
bfc003d0:	137a006f 	beq	k1,k0,bfc00590 <adel_if_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:81
bfc003d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:82
bfc003d8:	241a0007 	li	k0,7
/home/lxb/project/loooongson/soft/func_extended/start.S:83
bfc003dc:	137a007e 	beq	k1,k0,bfc005d8 <reserved_inst_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:84
bfc003e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:85
bfc003e4:	241a0008 	li	k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:86
bfc003e8:	137a008c 	beq	k1,k0,bfc0061c <int_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:87
bfc003ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:88
bfc003f0:	241a0009 	li	k0,9
/home/lxb/project/loooongson/soft/func_extended/start.S:89
bfc003f4:	137a0023 	beq	k1,k0,bfc00484 <trap_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:90
bfc003f8:	00000000 	nop

bfc003fc <syscall_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:93
bfc003fc:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:94
bfc00400:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:95
bfc00404:	175400b0 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:96
bfc00408:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:97
bfc0040c:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:98
bfc00410:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:99
bfc00414:	241b0020 	li	k1,32
/home/lxb/project/loooongson/soft/func_extended/start.S:100
bfc00418:	175b00ab 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:101
bfc0041c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:102
bfc00420:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:103
bfc00424:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:104
bfc00428:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:105
bfc0042c:	175b00a6 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:106
bfc00430:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:107
bfc00434:	3c120001 	lui	s2,0x1
/home/lxb/project/loooongson/soft/func_extended/start.S:108
bfc00438:	100000a3 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:109
bfc0043c:	00000000 	nop

bfc00440 <break_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:112
bfc00440:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:113
bfc00444:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:114
bfc00448:	1754009f 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:115
bfc0044c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:116
bfc00450:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:117
bfc00454:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:118
bfc00458:	241b0024 	li	k1,36
/home/lxb/project/loooongson/soft/func_extended/start.S:119
bfc0045c:	175b009a 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:120
bfc00460:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:121
bfc00464:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:122
bfc00468:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:123
bfc0046c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:124
bfc00470:	175b0095 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:125
bfc00474:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:126
bfc00478:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:127
bfc0047c:	10000092 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:128
bfc00480:	00000000 	nop

bfc00484 <trap_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:133
bfc00484:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:134
bfc00488:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:135
bfc0048c:	1754008e 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:136
bfc00490:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:137
bfc00494:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:138
bfc00498:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:139
bfc0049c:	241b0034 	li	k1,52
/home/lxb/project/loooongson/soft/func_extended/start.S:140
bfc004a0:	175b0089 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:141
bfc004a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:142
bfc004a8:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:143
bfc004ac:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:144
bfc004b0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:145
bfc004b4:	175b0084 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:146
bfc004b8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:147
bfc004bc:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:148
bfc004c0:	10000081 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:149
bfc004c4:	00000000 	nop

bfc004c8 <overflow_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:152
bfc004c8:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:153
bfc004cc:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:154
bfc004d0:	1754007d 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:155
bfc004d4:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:156
bfc004d8:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:157
bfc004dc:	241b0030 	li	k1,48
/home/lxb/project/loooongson/soft/func_extended/start.S:158
bfc004e0:	175b0079 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:159
bfc004e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:160
bfc004e8:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:161
bfc004ec:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:162
bfc004f0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:163
bfc004f4:	175b0074 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:164
bfc004f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:165
bfc004fc:	3c120003 	lui	s2,0x3
/home/lxb/project/loooongson/soft/func_extended/start.S:166
bfc00500:	10000071 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:167
bfc00504:	00000000 	nop

bfc00508 <adel_load_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:170
bfc00508:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:171
bfc0050c:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:172
bfc00510:	1754006d 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:173
bfc00514:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:174
bfc00518:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:175
bfc0051c:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:176
bfc00520:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:177
bfc00524:	175b0068 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:178
bfc00528:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:179
bfc0052c:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:180
bfc00530:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:181
bfc00534:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:182
bfc00538:	175b0063 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:183
bfc0053c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:184
bfc00540:	3c120004 	lui	s2,0x4
/home/lxb/project/loooongson/soft/func_extended/start.S:185
bfc00544:	10000060 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:186
bfc00548:	00000000 	nop

bfc0054c <ades_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:189
bfc0054c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:190
bfc00550:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:191
bfc00554:	1754005c 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:192
bfc00558:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:193
bfc0055c:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:194
bfc00560:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:195
bfc00564:	241b0014 	li	k1,20
/home/lxb/project/loooongson/soft/func_extended/start.S:196
bfc00568:	175b0057 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:197
bfc0056c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:198
bfc00570:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:199
bfc00574:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:200
bfc00578:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:201
bfc0057c:	175b0052 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:202
bfc00580:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:203
bfc00584:	3c120005 	lui	s2,0x5
/home/lxb/project/loooongson/soft/func_extended/start.S:204
bfc00588:	1000004f 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:205
bfc0058c:	00000000 	nop

bfc00590 <adel_if_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:208
bfc00590:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:209
bfc00594:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:210
bfc00598:	1754004b 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:211
bfc0059c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:212
bfc005a0:	40957000 	mtc0	s5,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:213
bfc005a4:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:214
bfc005a8:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:215
bfc005ac:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:216
bfc005b0:	175b0045 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:217
bfc005b4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:218
bfc005b8:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:219
bfc005bc:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:220
bfc005c0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:221
bfc005c4:	175b0040 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:222
bfc005c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:223
bfc005cc:	3c120006 	lui	s2,0x6
/home/lxb/project/loooongson/soft/func_extended/start.S:224
bfc005d0:	1000003d 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:225
bfc005d4:	00000000 	nop

bfc005d8 <reserved_inst_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:228
bfc005d8:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:229
bfc005dc:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:230
bfc005e0:	17540039 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:231
bfc005e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:232
bfc005e8:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:233
bfc005ec:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:234
bfc005f0:	241b0028 	li	k1,40
/home/lxb/project/loooongson/soft/func_extended/start.S:235
bfc005f4:	175b0034 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:236
bfc005f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:237
bfc005fc:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:238
bfc00600:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:239
bfc00604:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:240
bfc00608:	175b002f 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:241
bfc0060c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:242
bfc00610:	3c120007 	lui	s2,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:243
bfc00614:	1000002c 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:244
bfc00618:	00000000 	nop

bfc0061c <int_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:247
bfc0061c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:248
bfc00620:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:249
bfc00624:	17540028 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:250
bfc00628:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:251
bfc0062c:	275a0008 	addiu	k0,k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:252
bfc00630:	409a7000 	mtc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:253
bfc00634:	3c1bbfb0 	lui	k1,0xbfb0
bfc00638:	af608ffc 	sw	zero,-28676(k1)
bfc0063c:	af608ffc 	sw	zero,-28676(k1)
bfc00640:	af60fff8 	sw	zero,-8(k1)
bfc00644:	af608ffc 	sw	zero,-28676(k1)
bfc00648:	af608ffc 	sw	zero,-28676(k1)
bfc0064c:	8f608ffc 	lw	zero,-28676(k1)
bfc00650:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:254
bfc00654:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:255
bfc00658:	3c1bbfb0 	lui	k1,0xbfb0
bfc0065c:	af608ffc 	sw	zero,-28676(k1)
bfc00660:	af608ffc 	sw	zero,-28676(k1)
bfc00664:	af7bfff8 	sw	k1,-8(k1)
bfc00668:	af608ffc 	sw	zero,-28676(k1)
bfc0066c:	af608ffc 	sw	zero,-28676(k1)
bfc00670:	8f608ffc 	lw	zero,-28676(k1)
bfc00674:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:256
bfc00678:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:257
bfc0067c:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:258
bfc00680:	175b0011 	bne	k0,k1,bfc006c8 <ex_finish>
bfc00684:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:259
bfc00688:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:260
bfc0068c:	401a6000 	mfc0	k0,$12
bfc00690:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:261
bfc00694:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:262
bfc00698:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:263
bfc0069c:	175b000a 	bne	k0,k1,bfc006c8 <ex_finish>
bfc006a0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:264
bfc006a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:265
bfc006a8:	241affff 	li	k0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:266
bfc006ac:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:267
bfc006b0:	409a5800 	mtc0	k0,$11
bfc006b4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:268
bfc006b8:	409b6800 	mtc0	k1,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:269
bfc006bc:	10000010 	b	bfc00700 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:270
bfc006c0:	3c120008 	lui	s2,0x8
/home/lxb/project/loooongson/soft/func_extended/start.S:271
bfc006c4:	00000000 	nop

bfc006c8 <ex_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:274
bfc006c8:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:275
bfc006cc:	3c1b8000 	lui	k1,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:276
bfc006d0:	035bd024 	and	k0,k0,k1
/home/lxb/project/loooongson/soft/func_extended/start.S:277
bfc006d4:	401b7000 	mfc0	k1,$14
bfc006d8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:278
bfc006dc:	13400003 	beqz	k0,bfc006ec <ex_finish+0x24>
/home/lxb/project/loooongson/soft/func_extended/start.S:279
bfc006e0:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:280
bfc006e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:281
bfc006e8:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:283
bfc006ec:	409b7000 	mtc0	k1,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:284
bfc006f0:	16400003 	bnez	s2,bfc00700 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:285
bfc006f4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:286
bfc006f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:287
bfc006fc:	3c12ffff 	lui	s2,0xffff

bfc00700 <ex_ret>:
/home/lxb/project/loooongson/soft/func_extended/start.S:290
bfc00700:	42000018 	c0	0x18
/home/lxb/project/loooongson/soft/func_extended/start.S:292
bfc00704:	00000000 	nop

bfc00708 <locate>:
/home/lxb/project/loooongson/soft/func_extended/start.S:297
bfc00708:	3c04bfaf 	lui	a0,0xbfaf
bfc0070c:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:298
bfc00710:	3c05bfaf 	lui	a1,0xbfaf
bfc00714:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:299
bfc00718:	3c11bfaf 	lui	s1,0xbfaf
bfc0071c:	3631f010 	ori	s1,s1,0xf010
/home/lxb/project/loooongson/soft/func_extended/start.S:301
bfc00720:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:302
bfc00724:	240a0001 	li	t2,1
/home/lxb/project/loooongson/soft/func_extended/start.S:303
bfc00728:	3c130000 	lui	s3,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:305
bfc0072c:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:306
bfc00730:	acaa0000 	sw	t2,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:307
bfc00734:	ae330000 	sw	s3,0(s1)
/home/lxb/project/loooongson/soft/func_extended/start.S:309
bfc00738:	3c100000 	lui	s0,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:311
bfc0073c:	3c09bfc0 	lui	t1,0xbfc0
bfc00740:	25290754 	addiu	t1,t1,1876
/home/lxb/project/loooongson/soft/func_extended/start.S:312
bfc00744:	3c0a2000 	lui	t2,0x2000
/home/lxb/project/loooongson/soft/func_extended/start.S:313
bfc00748:	012ac823 	subu	t9,t1,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:314
bfc0074c:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:315
bfc00750:	00000000 	nop

bfc00754 <inst_test>:
/home/lxb/project/loooongson/soft/func_extended/start.S:318
bfc00754:	0ff00220 	jal	bfc00880 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:319
bfc00758:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:320
bfc0075c:	0ff0020b 	jal	bfc0082c <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:321
bfc00760:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:323
bfc00764:	3c19bfc0 	lui	t9,0xbfc0
bfc00768:	27390774 	addiu	t9,t9,1908
/home/lxb/project/loooongson/soft/func_extended/start.S:324
bfc0076c:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:325
bfc00770:	00000000 	nop

bfc00774 <kseg0_kseg1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:328
bfc00774:	0ff00220 	jal	bfc00880 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:329
bfc00778:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:330
bfc0077c:	0ff0020b 	jal	bfc0082c <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:331
bfc00780:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:334
bfc00784:	3c04bfaf 	lui	a0,0xbfaf
bfc00788:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:335
bfc0078c:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:336
bfc00790:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:337
bfc00794:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:338
bfc00798:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:339
bfc0079c:	15090009 	bne	t0,t1,bfc007c4 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:340
bfc007a0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:342
bfc007a4:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:343
bfc007a8:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:344
bfc007ac:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:345
bfc007b0:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:346
bfc007b4:	15090003 	bne	t0,t1,bfc007c4 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:347
bfc007b8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:348
bfc007bc:	10000003 	b	bfc007cc <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:349
bfc007c0:	00000000 	nop

bfc007c4 <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:351
bfc007c4:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:352
bfc007c8:	ae300000 	sw	s0,0(s1)

bfc007cc <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:355
bfc007cc:	24100002 	li	s0,2
/home/lxb/project/loooongson/soft/func_extended/start.S:356
bfc007d0:	1213000d 	beq	s0,s3,bfc00808 <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:357
bfc007d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:359
bfc007d8:	3c04bfaf 	lui	a0,0xbfaf
bfc007dc:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:360
bfc007e0:	3c05bfaf 	lui	a1,0xbfaf
bfc007e4:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:361
bfc007e8:	3c06bfaf 	lui	a2,0xbfaf
bfc007ec:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:363
bfc007f0:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:365
bfc007f4:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:366
bfc007f8:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:367
bfc007fc:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:368
bfc00800:	10000008 	b	bfc00824 <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:369
bfc00804:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:371
bfc00808:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:372
bfc0080c:	3c04bfaf 	lui	a0,0xbfaf
bfc00810:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:373
bfc00814:	3c05bfaf 	lui	a1,0xbfaf
bfc00818:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:374
bfc0081c:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:375
bfc00820:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:378
bfc00824:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:379
bfc00828:	00000000 	nop

bfc0082c <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:382
bfc0082c:	3c08bfaf 	lui	t0,0xbfaf
bfc00830:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:383
bfc00834:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:386
bfc00838:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc0083c:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc00840:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc00844:	256b0001 	addiu	t3,t3,1

bfc00848 <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:392
bfc00848:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc0084c:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:396
bfc00850:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:397
bfc00854:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:398
bfc00858:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:399
bfc0085c:	15800002 	bnez	t4,bfc00868 <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:400
bfc00860:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:401
bfc00864:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:403
bfc00868:	1560fff7 	bnez	t3,bfc00848 <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:404
bfc0086c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:405
bfc00870:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:406
bfc00874:	00000000 	nop
	...

bfc00880 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00880:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00884:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00888:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc0088c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00890:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00894:	240f1926 	li	t7,6438
bfc00898:	24181926 	li	t8,6438
bfc0089c:	3c14bfc0 	lui	s4,0xbfc0
bfc008a0:	269408a4 	addiu	s4,s4,2212
bfc008a4:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc008a8:	240f1926 	li	t7,6438
bfc008ac:	24180817 	li	t8,2071
bfc008b0:	3c14bfc0 	lui	s4,0xbfc0
bfc008b4:	269408b8 	addiu	s4,s4,2232
bfc008b8:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc008bc:	240f1926 	li	t7,6438
bfc008c0:	3c14bfc0 	lui	s4,0xbfc0
bfc008c4:	269408c8 	addiu	s4,s4,2248
bfc008c8:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc008cc:	240f1926 	li	t7,6438
bfc008d0:	3c14bfc0 	lui	s4,0xbfc0
bfc008d4:	269408d8 	addiu	s4,s4,2264
bfc008d8:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc008dc:	240f1926 	li	t7,6438
bfc008e0:	24181926 	li	t8,6438
bfc008e4:	3c14bfc0 	lui	s4,0xbfc0
bfc008e8:	269408ec 	addiu	s4,s4,2284
bfc008ec:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc008f0:	240f1926 	li	t7,6438
bfc008f4:	24180817 	li	t8,2071
bfc008f8:	3c14bfc0 	lui	s4,0xbfc0
bfc008fc:	26940900 	addiu	s4,s4,2304
bfc00900:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00904:	240f1926 	li	t7,6438
bfc00908:	3c14bfc0 	lui	s4,0xbfc0
bfc0090c:	26940910 	addiu	s4,s4,2320
bfc00910:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00914:	240f1926 	li	t7,6438
bfc00918:	3c14bfc0 	lui	s4,0xbfc0
bfc0091c:	26940920 	addiu	s4,s4,2336
bfc00920:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00924:	240f04d2 	li	t7,1234
bfc00928:	2418fb2e 	li	t8,-1234
bfc0092c:	3c14bfc0 	lui	s4,0xbfc0
bfc00930:	26940934 	addiu	s4,s4,2356
bfc00934:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00938:	240ffb2e 	li	t7,-1234
bfc0093c:	241804d2 	li	t8,1234
bfc00940:	3c14bfc0 	lui	s4,0xbfc0
bfc00944:	26940948 	addiu	s4,s4,2376
bfc00948:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc0094c:	240f04d2 	li	t7,1234
bfc00950:	3c14bfc0 	lui	s4,0xbfc0
bfc00954:	26940958 	addiu	s4,s4,2392
bfc00958:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc0095c:	240ffb2e 	li	t7,-1234
bfc00960:	3c14bfc0 	lui	s4,0xbfc0
bfc00964:	26940968 	addiu	s4,s4,2408
bfc00968:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc0096c:	240f04d2 	li	t7,1234
bfc00970:	2418fb2e 	li	t8,-1234
bfc00974:	3c14bfc0 	lui	s4,0xbfc0
bfc00978:	2694097c 	addiu	s4,s4,2428
bfc0097c:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00980:	240ffb2e 	li	t7,-1234
bfc00984:	241804d2 	li	t8,1234
bfc00988:	3c14bfc0 	lui	s4,0xbfc0
bfc0098c:	26940990 	addiu	s4,s4,2448
bfc00990:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00994:	240f04d2 	li	t7,1234
bfc00998:	3c14bfc0 	lui	s4,0xbfc0
bfc0099c:	269409a0 	addiu	s4,s4,2464
bfc009a0:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc009a4:	240ffb2e 	li	t7,-1234
bfc009a8:	3c14bfc0 	lui	s4,0xbfc0
bfc009ac:	269409b0 	addiu	s4,s4,2480
bfc009b0:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc009b4:	240f04d2 	li	t7,1234
bfc009b8:	2418fb2e 	li	t8,-1234
bfc009bc:	3c14bfc0 	lui	s4,0xbfc0
bfc009c0:	269409c4 	addiu	s4,s4,2500
bfc009c4:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc009c8:	240ffb2e 	li	t7,-1234
bfc009cc:	241804d2 	li	t8,1234
bfc009d0:	3c14bfc0 	lui	s4,0xbfc0
bfc009d4:	269409d8 	addiu	s4,s4,2520
bfc009d8:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc009dc:	240f04d2 	li	t7,1234
bfc009e0:	3c14bfc0 	lui	s4,0xbfc0
bfc009e4:	269409e8 	addiu	s4,s4,2536
bfc009e8:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc009ec:	240ffb2e 	li	t7,-1234
bfc009f0:	3c14bfc0 	lui	s4,0xbfc0
bfc009f4:	269409f8 	addiu	s4,s4,2552
bfc009f8:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc009fc:	240f04d2 	li	t7,1234
bfc00a00:	2418fb2e 	li	t8,-1234
bfc00a04:	3c14bfc0 	lui	s4,0xbfc0
bfc00a08:	26940a0c 	addiu	s4,s4,2572
bfc00a0c:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00a10:	240ffb2e 	li	t7,-1234
bfc00a14:	241804d2 	li	t8,1234
bfc00a18:	3c14bfc0 	lui	s4,0xbfc0
bfc00a1c:	26940a20 	addiu	s4,s4,2592
bfc00a20:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00a24:	240f04d2 	li	t7,1234
bfc00a28:	3c14bfc0 	lui	s4,0xbfc0
bfc00a2c:	26940a30 	addiu	s4,s4,2608
bfc00a30:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00a34:	240ffb2e 	li	t7,-1234
bfc00a38:	3c14bfc0 	lui	s4,0xbfc0
bfc00a3c:	26940a40 	addiu	s4,s4,2624
bfc00a40:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00a44:	03e01021 	move	v0,ra
bfc00a48:	240f04d2 	li	t7,1234
bfc00a4c:	241804d2 	li	t8,1234
bfc00a50:	51f80002 	beql	t7,t8,bfc00a5c <e1_trap_test+0x1dc>
bfc00a54:	25ef0001 	addiu	t7,t7,1
bfc00a58:	25ef000a 	addiu	t7,t7,10
bfc00a5c:	27180064 	addiu	t8,t8,100
bfc00a60:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00a64:	03e01021 	move	v0,ra
bfc00a68:	240f04d2 	li	t7,1234
bfc00a6c:	2418162e 	li	t8,5678
bfc00a70:	51f80002 	beql	t7,t8,bfc00a7c <e1_trap_test+0x1fc>
bfc00a74:	25ef0001 	addiu	t7,t7,1
bfc00a78:	25ef000a 	addiu	t7,t7,10
bfc00a7c:	27180064 	addiu	t8,t8,100
bfc00a80:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00a84:	03e01021 	move	v0,ra
bfc00a88:	240f162e 	li	t7,5678
bfc00a8c:	241804d2 	li	t8,1234
bfc00a90:	51f80002 	beql	t7,t8,bfc00a9c <e1_trap_test+0x21c>
bfc00a94:	25ef0001 	addiu	t7,t7,1
bfc00a98:	25ef000a 	addiu	t7,t7,10
bfc00a9c:	27180064 	addiu	t8,t8,100
bfc00aa0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00aa4:	03e01021 	move	v0,ra
bfc00aa8:	240f04d2 	li	t7,1234
bfc00aac:	241804d2 	li	t8,1234
bfc00ab0:	55f80002 	bnel	t7,t8,bfc00abc <e1_trap_test+0x23c>
bfc00ab4:	25ef0001 	addiu	t7,t7,1
bfc00ab8:	25ef000a 	addiu	t7,t7,10
bfc00abc:	27180064 	addiu	t8,t8,100
bfc00ac0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00ac4:	03e01021 	move	v0,ra
bfc00ac8:	240f04d2 	li	t7,1234
bfc00acc:	2418162e 	li	t8,5678
bfc00ad0:	55f80002 	bnel	t7,t8,bfc00adc <e1_trap_test+0x25c>
bfc00ad4:	25ef0001 	addiu	t7,t7,1
bfc00ad8:	25ef000a 	addiu	t7,t7,10
bfc00adc:	27180064 	addiu	t8,t8,100
bfc00ae0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00ae4:	03e01021 	move	v0,ra
bfc00ae8:	240f162e 	li	t7,5678
bfc00aec:	241804d2 	li	t8,1234
bfc00af0:	55f80002 	bnel	t7,t8,bfc00afc <e1_trap_test+0x27c>
bfc00af4:	25ef0001 	addiu	t7,t7,1
bfc00af8:	25ef000a 	addiu	t7,t7,10
bfc00afc:	27180064 	addiu	t8,t8,100
bfc00b00:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00b04:	03e01021 	move	v0,ra
bfc00b08:	240f04d2 	li	t7,1234
bfc00b0c:	05e30002 	bgezl	t7,bfc00b18 <e1_trap_test+0x298>
bfc00b10:	25ef0001 	addiu	t7,t7,1
bfc00b14:	25ef0014 	addiu	t7,t7,20
bfc00b18:	25ef000a 	addiu	t7,t7,10
bfc00b1c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00b20:	03e01021 	move	v0,ra
bfc00b24:	240f0000 	li	t7,0
bfc00b28:	05e30002 	bgezl	t7,bfc00b34 <e1_trap_test+0x2b4>
bfc00b2c:	25ef0001 	addiu	t7,t7,1
bfc00b30:	25ef0014 	addiu	t7,t7,20
bfc00b34:	25ef000a 	addiu	t7,t7,10
bfc00b38:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00b3c:	03e01021 	move	v0,ra
bfc00b40:	240ffb2e 	li	t7,-1234
bfc00b44:	05e30002 	bgezl	t7,bfc00b50 <e1_trap_test+0x2d0>
bfc00b48:	25ef0001 	addiu	t7,t7,1
bfc00b4c:	25ef0014 	addiu	t7,t7,20
bfc00b50:	25ef000a 	addiu	t7,t7,10
bfc00b54:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00b58:	03e01021 	move	v0,ra
bfc00b5c:	240f04d2 	li	t7,1234
bfc00b60:	5de00002 	bgtzl	t7,bfc00b6c <e1_trap_test+0x2ec>
bfc00b64:	25ef0001 	addiu	t7,t7,1
bfc00b68:	25ef0014 	addiu	t7,t7,20
bfc00b6c:	25ef000a 	addiu	t7,t7,10
bfc00b70:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00b74:	03e01021 	move	v0,ra
bfc00b78:	240f0000 	li	t7,0
bfc00b7c:	5de00002 	bgtzl	t7,bfc00b88 <e1_trap_test+0x308>
bfc00b80:	25ef0001 	addiu	t7,t7,1
bfc00b84:	25ef0014 	addiu	t7,t7,20
bfc00b88:	25ef000a 	addiu	t7,t7,10
bfc00b8c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00b90:	03e01021 	move	v0,ra
bfc00b94:	240ffb2e 	li	t7,-1234
bfc00b98:	5de00002 	bgtzl	t7,bfc00ba4 <e1_trap_test+0x324>
bfc00b9c:	25ef0001 	addiu	t7,t7,1
bfc00ba0:	25ef0014 	addiu	t7,t7,20
bfc00ba4:	25ef000a 	addiu	t7,t7,10
bfc00ba8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00bac:	03e01021 	move	v0,ra
bfc00bb0:	240f04d2 	li	t7,1234
bfc00bb4:	05e20002 	bltzl	t7,bfc00bc0 <e1_trap_test+0x340>
bfc00bb8:	25ef0001 	addiu	t7,t7,1
bfc00bbc:	25ef0014 	addiu	t7,t7,20
bfc00bc0:	25ef000a 	addiu	t7,t7,10
bfc00bc4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00bc8:	03e01021 	move	v0,ra
bfc00bcc:	240f0000 	li	t7,0
bfc00bd0:	05e20002 	bltzl	t7,bfc00bdc <e1_trap_test+0x35c>
bfc00bd4:	25ef0001 	addiu	t7,t7,1
bfc00bd8:	25ef0014 	addiu	t7,t7,20
bfc00bdc:	25ef000a 	addiu	t7,t7,10
bfc00be0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00be4:	03e01021 	move	v0,ra
bfc00be8:	240ffb2e 	li	t7,-1234
bfc00bec:	05e20002 	bltzl	t7,bfc00bf8 <e1_trap_test+0x378>
bfc00bf0:	25ef0001 	addiu	t7,t7,1
bfc00bf4:	25ef0014 	addiu	t7,t7,20
bfc00bf8:	25ef000a 	addiu	t7,t7,10
bfc00bfc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00c00:	03e01021 	move	v0,ra
bfc00c04:	240f04d2 	li	t7,1234
bfc00c08:	59e00002 	blezl	t7,bfc00c14 <e1_trap_test+0x394>
bfc00c0c:	25ef0001 	addiu	t7,t7,1
bfc00c10:	25ef0014 	addiu	t7,t7,20
bfc00c14:	25ef000a 	addiu	t7,t7,10
bfc00c18:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00c1c:	03e01021 	move	v0,ra
bfc00c20:	240f0000 	li	t7,0
bfc00c24:	59e00002 	blezl	t7,bfc00c30 <e1_trap_test+0x3b0>
bfc00c28:	25ef0001 	addiu	t7,t7,1
bfc00c2c:	25ef0014 	addiu	t7,t7,20
bfc00c30:	25ef000a 	addiu	t7,t7,10
bfc00c34:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00c38:	03e01021 	move	v0,ra
bfc00c3c:	240ffb2e 	li	t7,-1234
bfc00c40:	59e00002 	blezl	t7,bfc00c4c <e1_trap_test+0x3cc>
bfc00c44:	25ef0001 	addiu	t7,t7,1
bfc00c48:	25ef0014 	addiu	t7,t7,20
bfc00c4c:	25ef000a 	addiu	t7,t7,10
bfc00c50:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00c54:	03e01021 	move	v0,ra
bfc00c58:	240f04d2 	li	t7,1234
bfc00c5c:	05f30002 	bgezall	t7,bfc00c68 <e1_trap_test+0x3e8>
bfc00c60:	25ef0001 	addiu	t7,t7,1
bfc00c64:	25ef0014 	addiu	t7,t7,20
bfc00c68:	25ef000a 	addiu	t7,t7,10
bfc00c6c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00c70:	03e01021 	move	v0,ra
bfc00c74:	240f0000 	li	t7,0
bfc00c78:	05f30002 	bgezall	t7,bfc00c84 <e1_trap_test+0x404>
bfc00c7c:	25ef0001 	addiu	t7,t7,1
bfc00c80:	25ef0014 	addiu	t7,t7,20
bfc00c84:	25ef000a 	addiu	t7,t7,10
bfc00c88:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00c8c:	03e01021 	move	v0,ra
bfc00c90:	240ffb2e 	li	t7,-1234
bfc00c94:	05f30002 	bgezall	t7,bfc00ca0 <e1_trap_test+0x420>
bfc00c98:	25ef0001 	addiu	t7,t7,1
bfc00c9c:	25ef0014 	addiu	t7,t7,20
bfc00ca0:	25ef000a 	addiu	t7,t7,10
bfc00ca4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00ca8:	26730001 	addiu	s3,s3,1

bfc00cac <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00cac:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00cb0:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00cb4:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00cb8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00cbc:	00000000 	nop
inst_error():
bfc00cc0:	9e3f7f70 	0x9e3f7f70
	...

Disassembly of section .data:

80000000 <__CTOR_LIST__>:
	...

80000008 <__CTOR_END__>:
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	0x1c
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	00000878 	0x878
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc00880 	0xbfc00880
  34:	00000440 	sll	zero,zero,0x11
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00880 	0xbfc00880
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000175 	0x175
   4:	001e0002 	srl	zero,s8,0x0
   8:	01010000 	0x1010000
   c:	000d0efb 	0xd0efb
  10:	01010101 	0x1010101
  14:	01000000 	0x1000000
  18:	00010000 	sll	zero,at,0x0
  1c:	72617473 	0x72617473
  20:	00532e74 	teq	v0,s3,0xb9
  24:	00000000 	nop
  28:	00020500 	sll	zero,v0,0x14
  2c:	03bfc000 	0x3bfc000
  30:	4b4b0112 	c2	0x14b0112
  34:	4d4b4b4b 	0x4d4b4b4b
  38:	4b4b4b4b 	c2	0x14b4b4b
  3c:	01c0024b 	0x1c0024b
  40:	4b4b4b16 	c2	0x14b4b16
  44:	4b4b4d4b 	c2	0x14b4d4b
  48:	4c4b4b83 	0x4c4b4b83
  4c:	4b4b4b4b 	c2	0x14b4b4b
  50:	1804d402 	0x1804d402
  54:	4b4b4b4b 	c2	0x14b4b4b
  58:	4b4b4b4b 	c2	0x14b4b4b
  5c:	4b4b4b4b 	c2	0x14b4b4b
  60:	4b4b4b4b 	c2	0x14b4b4b
  64:	4b4b4b4b 	c2	0x14b4b4b
  68:	4b4b4b4b 	c2	0x14b4b4b
  6c:	4b4b4b4b 	c2	0x14b4b4b
  70:	4b4d4b4b 	c2	0x14d4b4b
  74:	4b4b4b4b 	c2	0x14b4b4b
  78:	4b4b4b4b 	c2	0x14b4b4b
  7c:	4b4b4b4b 	c2	0x14b4b4b
  80:	4d4b4b4b 	0x4d4b4b4b
  84:	4b4b4b4b 	c2	0x14b4b4b
  88:	4b4b4b4b 	c2	0x14b4b4b
  8c:	4b4b4b4b 	c2	0x14b4b4b
  90:	4b4b4b4b 	c2	0x14b4b4b
  94:	4b4b4b4f 	c2	0x14b4b4f
  98:	4b4b4b4b 	c2	0x14b4b4b
  9c:	4b4b4b4b 	c2	0x14b4b4b
  a0:	4b4b4b4b 	c2	0x14b4b4b
  a4:	4b4b4d4b 	c2	0x14b4d4b
  a8:	4b4b4b4b 	c2	0x14b4b4b
  ac:	4b4b4b4b 	c2	0x14b4b4b
  b0:	4b4b4b4b 	c2	0x14b4b4b
  b4:	4b4b4d4b 	c2	0x14b4d4b
  b8:	4b4b4b4b 	c2	0x14b4b4b
  bc:	4b4b4b4b 	c2	0x14b4b4b
  c0:	4b4b4b4b 	c2	0x14b4b4b
  c4:	4b4d4b4b 	c2	0x14d4b4b
  c8:	4b4b4b4b 	c2	0x14b4b4b
  cc:	4b4b4b4b 	c2	0x14b4b4b
  d0:	4b4b4b4b 	c2	0x14b4b4b
  d4:	4d4b4b4b 	0x4d4b4b4b
  d8:	4b4b4b4b 	c2	0x14b4b4b
  dc:	4b4b4b4b 	c2	0x14b4b4b
  e0:	4b4b4b4b 	c2	0x14b4b4b
  e4:	4b4b4b4b 	c2	0x14b4b4b
  e8:	4b4b4d4b 	c2	0x14b4d4b
  ec:	4b4b4b4b 	c2	0x14b4b4b
  f0:	4b4b4b4b 	c2	0x14b4b4b
  f4:	4b4b4b4b 	c2	0x14b4b4b
  f8:	4b4d4b4b 	c2	0x14d4b4b
  fc:	4b4b4b4b 	c2	0x14b4b4b
 100:	4be5084b 	c2	0x1e5084b
 104:	4b4be508 	c2	0x14be508
 108:	4b834b83 	c2	0x1834b83
 10c:	4b4b834b 	c2	0x14b834b
 110:	4b4b834b 	c2	0x14b834b
 114:	4b4b4d4b 	c2	0x14b4d4b
 118:	4b4b834b 	c2	0x14b834b
 11c:	4b4b4c4b 	c2	0x14b4c4b
 120:	4c4d4b4b 	0x4c4d4b4b
 124:	8483834f 	lh	v1,-31921(a0)
 128:	4b4c4b4b 	c2	0x14c4b4b
 12c:	834c4c4b 	lb	t4,19531(k0)
 130:	4d4b4b4b 	0x4d4b4b4b
 134:	4c4b4b4b 	0x4c4b4b4b
 138:	4b4d4b83 	c2	0x14d4b83
 13c:	834d4b4b 	lb	t5,19275(k0)
 140:	4b4b4b4b 	c2	0x14b4b4b
 144:	4b4b4c4b 	c2	0x14b4c4b
 148:	4b4b4b4b 	c2	0x14b4b4b
 14c:	4d4b4c4b 	0x4d4b4c4b
 150:	834c4b4b 	lb	t4,19275(k0)
 154:	4b4c8483 	c2	0x14c8483
 158:	4c4b4b4b 	0x4c4b4b4b
 15c:	4b83834b 	c2	0x183834b
 160:	834d4b4d 	lb	t5,19277(k0)
 164:	4b4b4b4d 	c2	0x14b4b4d
 168:	4b4b4d4d 	c2	0x14b4d4d
 16c:	4b4b4b4b 	c2	0x14b4b4b
 170:	4b4b4b4c 	c2	0x14b4b4c
 174:	01000402 	0x1000402
 178:	00009001 	0x9001
 17c:	25000200 	addiu	zero,t0,512
 180:	01000000 	0x1000000
 184:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 188:	01010100 	0x1010100
 18c:	00000001 	0x1
 190:	01000001 	0x1000001
 194:	5f316500 	0x5f316500
 198:	70617274 	0x70617274
 19c:	7365745f 	0x7365745f
 1a0:	00532e74 	teq	v0,s3,0xb9
 1a4:	00000000 	nop
 1a8:	80020500 	lb	v0,1280(zero)
 1ac:	19bfc008 	0x19bfc008
 1b0:	4b4b4b4b 	c2	0x14b4b4b
 1b4:	083d084d 	j	f42134 <data_size+0xf42124>
 1b8:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 1bc:	f33d083d 	0xf33d083d
 1c0:	083d08f4 	j	f423d0 <data_size+0xf423c0>
 1c4:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 1c8:	f33d083d 	0xf33d083d
 1cc:	083d08f3 	j	f423cc <data_size+0xf423bc>
 1d0:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 1d4:	f33d083d 	0xf33d083d
 1d8:	08e508f4 	j	39423d0 <data_size+0x39423c0>
 1dc:	08e508e5 	j	3942394 <data_size+0x3942384>
 1e0:	08e508e5 	j	3942394 <data_size+0x3942384>
 1e4:	08ad08e5 	j	2b42394 <data_size+0x2b42384>
 1e8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 1ec:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 1f0:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 1f4:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 1f8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 1fc:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 200:	4db008ad 	0x4db008ad
 204:	4b4b4b4b 	c2	0x14b4b4b
 208:	01000402 	0x1000402
 20c:	Address 0x000000000000020c is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc00878 	0xbfc00878
  18:	72617473 	0x72617473
  1c:	00532e74 	teq	v0,s3,0xb9
  20:	6d6f682f 	0x6d6f682f
  24:	786c2f65 	0x786c2f65
  28:	72702f62 	0x72702f62
  2c:	63656a6f 	0x63656a6f
  30:	6f6c2f74 	0x6f6c2f74
  34:	6e6f6f6f 	0x6e6f6f6f
  38:	6e6f7367 	0x6e6f7367
  3c:	666f732f 	0x666f732f
  40:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
  44:	655f636e 	0x655f636e
  48:	6e657478 	0x6e657478
  4c:	00646564 	0x646564
  50:	20554e47 	addi	s5,v0,20039
  54:	32205341 	andi	zero,s1,0x5341
  58:	2e38312e 	sltiu	t8,s1,12590
  5c:	01003035 	0x1003035
  60:	00006980 	sll	t5,zero,0x6
  64:	14000200 	bnez	zero,868 <data_size+0x858>
  68:	04000000 	bltz	zero,6c <data_size+0x5c>
  6c:	00017901 	0x17901
  70:	c0088000 	ll	t0,-32768(zero)
  74:	c00cc0bf 	ll	t4,-16193(zero)
  78:	5f3165bf 	0x5f3165bf
  7c:	70617274 	0x70617274
  80:	7365745f 	0x7365745f
  84:	00532e74 	teq	v0,s3,0xb9
  88:	6d6f682f 	0x6d6f682f
  8c:	786c2f65 	0x786c2f65
  90:	72702f62 	0x72702f62
  94:	63656a6f 	0x63656a6f
  98:	6f6c2f74 	0x6f6c2f74
  9c:	6e6f6f6f 	0x6e6f6f6f
  a0:	6e6f7367 	0x6e6f7367
  a4:	666f732f 	0x666f732f
  a8:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
  ac:	655f636e 	0x655f636e
  b0:	6e657478 	0x6e657478
  b4:	2f646564 	sltiu	a0,k1,25956
  b8:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
  bc:	554e4700 	bnel	t2,t6,11cc0 <data_size+0x11cb0>
  c0:	20534120 	addi	s3,v0,16672
  c4:	38312e32 	xori	s1,at,0x2e32
  c8:	0030352e 	0x30352e
  cc:	Address 0x00000000000000cc is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	b	4408 <data_size+0x43f8>
   4:	12011106 	beq	s0,at,4420 <data_size+0x4410>
   8:	1b080301 	0x1b080301
   c:	13082508 	beq	t8,t0,9430 <data_size+0x9420>
  10:	00000005 	0x5
  14:	10001101 	b	441c <data_size+0x440c>
  18:	12011106 	beq	s0,at,4434 <data_size+0x4424>
  1c:	1b080301 	0x1b080301
  20:	13082508 	beq	t8,t0,9444 <data_size+0x9434>
  24:	00000005 	0x5
