
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
bfc00754:	0ff00248 	jal	bfc00920 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:319
bfc00758:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:320
bfc0075c:	0ff0021b 	jal	bfc0086c <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:321
bfc00760:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:322
bfc00764:	0ff00358 	jal	bfc00d60 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:323
bfc00768:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:324
bfc0076c:	0ff00374 	jal	bfc00dd0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:325
bfc00770:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:326
bfc00774:	0ff003a8 	jal	bfc00ea0 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:327
bfc00778:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:328
bfc0077c:	0ff00230 	jal	bfc008c0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:329
bfc00780:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:331
bfc00784:	3c19bfc0 	lui	t9,0xbfc0
bfc00788:	27390794 	addiu	t9,t9,1940
/home/lxb/project/loooongson/soft/func_extended/start.S:332
bfc0078c:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:333
bfc00790:	00000000 	nop

bfc00794 <kseg0_kseg1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:336
bfc00794:	0ff00248 	jal	bfc00920 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:337
bfc00798:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:338
bfc0079c:	0ff0021b 	jal	bfc0086c <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:339
bfc007a0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:340
bfc007a4:	0ff00358 	jal	bfc00d60 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:341
bfc007a8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:342
bfc007ac:	0ff00374 	jal	bfc00dd0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:343
bfc007b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:344
bfc007b4:	0ff003a8 	jal	bfc00ea0 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:345
bfc007b8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:346
bfc007bc:	0ff00230 	jal	bfc008c0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:347
bfc007c0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:350
bfc007c4:	3c04bfaf 	lui	a0,0xbfaf
bfc007c8:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:351
bfc007cc:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:352
bfc007d0:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:353
bfc007d4:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:354
bfc007d8:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:355
bfc007dc:	15090009 	bne	t0,t1,bfc00804 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:356
bfc007e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:358
bfc007e4:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:359
bfc007e8:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:360
bfc007ec:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:361
bfc007f0:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:362
bfc007f4:	15090003 	bne	t0,t1,bfc00804 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:363
bfc007f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:364
bfc007fc:	10000003 	b	bfc0080c <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:365
bfc00800:	00000000 	nop

bfc00804 <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:367
bfc00804:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:368
bfc00808:	ae300000 	sw	s0,0(s1)

bfc0080c <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:371
bfc0080c:	2410000a 	li	s0,10
/home/lxb/project/loooongson/soft/func_extended/start.S:372
bfc00810:	1213000d 	beq	s0,s3,bfc00848 <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:373
bfc00814:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:375
bfc00818:	3c04bfaf 	lui	a0,0xbfaf
bfc0081c:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:376
bfc00820:	3c05bfaf 	lui	a1,0xbfaf
bfc00824:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:377
bfc00828:	3c06bfaf 	lui	a2,0xbfaf
bfc0082c:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:379
bfc00830:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:381
bfc00834:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:382
bfc00838:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:383
bfc0083c:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:384
bfc00840:	10000008 	b	bfc00864 <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:385
bfc00844:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc00848:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc0084c:	3c04bfaf 	lui	a0,0xbfaf
bfc00850:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc00854:	3c05bfaf 	lui	a1,0xbfaf
bfc00858:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:390
bfc0085c:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:391
bfc00860:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:394
bfc00864:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc00868:	00000000 	nop

bfc0086c <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:398
bfc0086c:	3c08bfaf 	lui	t0,0xbfaf
bfc00870:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:399
bfc00874:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:402
bfc00878:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:403
bfc0087c:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:404
bfc00880:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:405
bfc00884:	256b0001 	addiu	t3,t3,1

bfc00888 <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:408
bfc00888:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:411
bfc0088c:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:412
bfc00890:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:413
bfc00894:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:414
bfc00898:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:415
bfc0089c:	15800002 	bnez	t4,bfc008a8 <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:416
bfc008a0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:417
bfc008a4:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:419
bfc008a8:	1560fff7 	bnez	t3,bfc00888 <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:420
bfc008ac:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:421
bfc008b0:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:422
bfc008b4:	00000000 	nop
	...

bfc008c0 <e5_movz_movn>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc008c0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc008c4:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc008c8:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc008cc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc008d0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc008d4:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc008d8:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc008dc:	012b500b 	0x12b500b
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc008e0:	240904d6 	li	t1,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc008e4:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc008e8:	012b500b 	0x12b500b
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc008ec:	24090929 	li	t1,2345
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc008f0:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc008f4:	012b500a 	0x12b500a
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc008f8:	3c090001 	lui	t1,0x1
bfc008fc:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc00900:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc00904:	012b500a 	0x12b500a
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc00908:	26730001 	addiu	s3,s3,1

bfc0090c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc0090c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc00910:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc00914:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc00918:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc0091c:	00000000 	nop

bfc00920 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00920:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00924:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00928:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc0092c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00930:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00934:	240f1926 	li	t7,6438
bfc00938:	24181926 	li	t8,6438
bfc0093c:	3c14bfc0 	lui	s4,0xbfc0
bfc00940:	26940944 	addiu	s4,s4,2372
bfc00944:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc00948:	240f1926 	li	t7,6438
bfc0094c:	24180817 	li	t8,2071
bfc00950:	3c14bfc0 	lui	s4,0xbfc0
bfc00954:	26940958 	addiu	s4,s4,2392
bfc00958:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc0095c:	240f1926 	li	t7,6438
bfc00960:	3c14bfc0 	lui	s4,0xbfc0
bfc00964:	26940968 	addiu	s4,s4,2408
bfc00968:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc0096c:	240f1926 	li	t7,6438
bfc00970:	3c14bfc0 	lui	s4,0xbfc0
bfc00974:	26940978 	addiu	s4,s4,2424
bfc00978:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc0097c:	240f1926 	li	t7,6438
bfc00980:	24181926 	li	t8,6438
bfc00984:	3c14bfc0 	lui	s4,0xbfc0
bfc00988:	2694098c 	addiu	s4,s4,2444
bfc0098c:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00990:	240f1926 	li	t7,6438
bfc00994:	24180817 	li	t8,2071
bfc00998:	3c14bfc0 	lui	s4,0xbfc0
bfc0099c:	269409a0 	addiu	s4,s4,2464
bfc009a0:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc009a4:	240f1926 	li	t7,6438
bfc009a8:	3c14bfc0 	lui	s4,0xbfc0
bfc009ac:	269409b0 	addiu	s4,s4,2480
bfc009b0:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc009b4:	240f1926 	li	t7,6438
bfc009b8:	3c14bfc0 	lui	s4,0xbfc0
bfc009bc:	269409c0 	addiu	s4,s4,2496
bfc009c0:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc009c4:	240f04d2 	li	t7,1234
bfc009c8:	2418fb2e 	li	t8,-1234
bfc009cc:	3c14bfc0 	lui	s4,0xbfc0
bfc009d0:	269409d4 	addiu	s4,s4,2516
bfc009d4:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc009d8:	240ffb2e 	li	t7,-1234
bfc009dc:	241804d2 	li	t8,1234
bfc009e0:	3c14bfc0 	lui	s4,0xbfc0
bfc009e4:	269409e8 	addiu	s4,s4,2536
bfc009e8:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc009ec:	240f04d2 	li	t7,1234
bfc009f0:	3c14bfc0 	lui	s4,0xbfc0
bfc009f4:	269409f8 	addiu	s4,s4,2552
bfc009f8:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc009fc:	240ffb2e 	li	t7,-1234
bfc00a00:	3c14bfc0 	lui	s4,0xbfc0
bfc00a04:	26940a08 	addiu	s4,s4,2568
bfc00a08:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00a0c:	240f04d2 	li	t7,1234
bfc00a10:	2418fb2e 	li	t8,-1234
bfc00a14:	3c14bfc0 	lui	s4,0xbfc0
bfc00a18:	26940a1c 	addiu	s4,s4,2588
bfc00a1c:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00a20:	240ffb2e 	li	t7,-1234
bfc00a24:	241804d2 	li	t8,1234
bfc00a28:	3c14bfc0 	lui	s4,0xbfc0
bfc00a2c:	26940a30 	addiu	s4,s4,2608
bfc00a30:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00a34:	240f04d2 	li	t7,1234
bfc00a38:	3c14bfc0 	lui	s4,0xbfc0
bfc00a3c:	26940a40 	addiu	s4,s4,2624
bfc00a40:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00a44:	240ffb2e 	li	t7,-1234
bfc00a48:	3c14bfc0 	lui	s4,0xbfc0
bfc00a4c:	26940a50 	addiu	s4,s4,2640
bfc00a50:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00a54:	240f04d2 	li	t7,1234
bfc00a58:	2418fb2e 	li	t8,-1234
bfc00a5c:	3c14bfc0 	lui	s4,0xbfc0
bfc00a60:	26940a64 	addiu	s4,s4,2660
bfc00a64:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00a68:	240ffb2e 	li	t7,-1234
bfc00a6c:	241804d2 	li	t8,1234
bfc00a70:	3c14bfc0 	lui	s4,0xbfc0
bfc00a74:	26940a78 	addiu	s4,s4,2680
bfc00a78:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00a7c:	240f04d2 	li	t7,1234
bfc00a80:	3c14bfc0 	lui	s4,0xbfc0
bfc00a84:	26940a88 	addiu	s4,s4,2696
bfc00a88:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00a8c:	240ffb2e 	li	t7,-1234
bfc00a90:	3c14bfc0 	lui	s4,0xbfc0
bfc00a94:	26940a98 	addiu	s4,s4,2712
bfc00a98:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00a9c:	240f04d2 	li	t7,1234
bfc00aa0:	2418fb2e 	li	t8,-1234
bfc00aa4:	3c14bfc0 	lui	s4,0xbfc0
bfc00aa8:	26940aac 	addiu	s4,s4,2732
bfc00aac:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00ab0:	240ffb2e 	li	t7,-1234
bfc00ab4:	241804d2 	li	t8,1234
bfc00ab8:	3c14bfc0 	lui	s4,0xbfc0
bfc00abc:	26940ac0 	addiu	s4,s4,2752
bfc00ac0:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00ac4:	240f04d2 	li	t7,1234
bfc00ac8:	3c14bfc0 	lui	s4,0xbfc0
bfc00acc:	26940ad0 	addiu	s4,s4,2768
bfc00ad0:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00ad4:	240ffb2e 	li	t7,-1234
bfc00ad8:	3c14bfc0 	lui	s4,0xbfc0
bfc00adc:	26940ae0 	addiu	s4,s4,2784
bfc00ae0:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00ae4:	03e01021 	move	v0,ra
bfc00ae8:	240f04d2 	li	t7,1234
bfc00aec:	241804d2 	li	t8,1234
bfc00af0:	51f80002 	beql	t7,t8,bfc00afc <e1_trap_test+0x1dc>
bfc00af4:	25ef0001 	addiu	t7,t7,1
bfc00af8:	25ef000a 	addiu	t7,t7,10
bfc00afc:	27180064 	addiu	t8,t8,100
bfc00b00:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00b04:	03e01021 	move	v0,ra
bfc00b08:	240f04d2 	li	t7,1234
bfc00b0c:	2418162e 	li	t8,5678
bfc00b10:	51f80002 	beql	t7,t8,bfc00b1c <e1_trap_test+0x1fc>
bfc00b14:	25ef0001 	addiu	t7,t7,1
bfc00b18:	25ef000a 	addiu	t7,t7,10
bfc00b1c:	27180064 	addiu	t8,t8,100
bfc00b20:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00b24:	03e01021 	move	v0,ra
bfc00b28:	240f162e 	li	t7,5678
bfc00b2c:	241804d2 	li	t8,1234
bfc00b30:	51f80002 	beql	t7,t8,bfc00b3c <e1_trap_test+0x21c>
bfc00b34:	25ef0001 	addiu	t7,t7,1
bfc00b38:	25ef000a 	addiu	t7,t7,10
bfc00b3c:	27180064 	addiu	t8,t8,100
bfc00b40:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00b44:	03e01021 	move	v0,ra
bfc00b48:	240f04d2 	li	t7,1234
bfc00b4c:	241804d2 	li	t8,1234
bfc00b50:	55f80002 	bnel	t7,t8,bfc00b5c <e1_trap_test+0x23c>
bfc00b54:	25ef0001 	addiu	t7,t7,1
bfc00b58:	25ef000a 	addiu	t7,t7,10
bfc00b5c:	27180064 	addiu	t8,t8,100
bfc00b60:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00b64:	03e01021 	move	v0,ra
bfc00b68:	240f04d2 	li	t7,1234
bfc00b6c:	2418162e 	li	t8,5678
bfc00b70:	55f80002 	bnel	t7,t8,bfc00b7c <e1_trap_test+0x25c>
bfc00b74:	25ef0001 	addiu	t7,t7,1
bfc00b78:	25ef000a 	addiu	t7,t7,10
bfc00b7c:	27180064 	addiu	t8,t8,100
bfc00b80:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00b84:	03e01021 	move	v0,ra
bfc00b88:	240f162e 	li	t7,5678
bfc00b8c:	241804d2 	li	t8,1234
bfc00b90:	55f80002 	bnel	t7,t8,bfc00b9c <e1_trap_test+0x27c>
bfc00b94:	25ef0001 	addiu	t7,t7,1
bfc00b98:	25ef000a 	addiu	t7,t7,10
bfc00b9c:	27180064 	addiu	t8,t8,100
bfc00ba0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00ba4:	03e01021 	move	v0,ra
bfc00ba8:	240f04d2 	li	t7,1234
bfc00bac:	05e30002 	bgezl	t7,bfc00bb8 <e1_trap_test+0x298>
bfc00bb0:	25ef0001 	addiu	t7,t7,1
bfc00bb4:	25ef0014 	addiu	t7,t7,20
bfc00bb8:	25ef000a 	addiu	t7,t7,10
bfc00bbc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00bc0:	03e01021 	move	v0,ra
bfc00bc4:	240f0000 	li	t7,0
bfc00bc8:	05e30002 	bgezl	t7,bfc00bd4 <e1_trap_test+0x2b4>
bfc00bcc:	25ef0001 	addiu	t7,t7,1
bfc00bd0:	25ef0014 	addiu	t7,t7,20
bfc00bd4:	25ef000a 	addiu	t7,t7,10
bfc00bd8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00bdc:	03e01021 	move	v0,ra
bfc00be0:	240ffb2e 	li	t7,-1234
bfc00be4:	05e30002 	bgezl	t7,bfc00bf0 <e1_trap_test+0x2d0>
bfc00be8:	25ef0001 	addiu	t7,t7,1
bfc00bec:	25ef0014 	addiu	t7,t7,20
bfc00bf0:	25ef000a 	addiu	t7,t7,10
bfc00bf4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00bf8:	03e01021 	move	v0,ra
bfc00bfc:	240f04d2 	li	t7,1234
bfc00c00:	5de00002 	bgtzl	t7,bfc00c0c <e1_trap_test+0x2ec>
bfc00c04:	25ef0001 	addiu	t7,t7,1
bfc00c08:	25ef0014 	addiu	t7,t7,20
bfc00c0c:	25ef000a 	addiu	t7,t7,10
bfc00c10:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00c14:	03e01021 	move	v0,ra
bfc00c18:	240f0000 	li	t7,0
bfc00c1c:	5de00002 	bgtzl	t7,bfc00c28 <e1_trap_test+0x308>
bfc00c20:	25ef0001 	addiu	t7,t7,1
bfc00c24:	25ef0014 	addiu	t7,t7,20
bfc00c28:	25ef000a 	addiu	t7,t7,10
bfc00c2c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00c30:	03e01021 	move	v0,ra
bfc00c34:	240ffb2e 	li	t7,-1234
bfc00c38:	5de00002 	bgtzl	t7,bfc00c44 <e1_trap_test+0x324>
bfc00c3c:	25ef0001 	addiu	t7,t7,1
bfc00c40:	25ef0014 	addiu	t7,t7,20
bfc00c44:	25ef000a 	addiu	t7,t7,10
bfc00c48:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00c4c:	03e01021 	move	v0,ra
bfc00c50:	240f04d2 	li	t7,1234
bfc00c54:	05e20002 	bltzl	t7,bfc00c60 <e1_trap_test+0x340>
bfc00c58:	25ef0001 	addiu	t7,t7,1
bfc00c5c:	25ef0014 	addiu	t7,t7,20
bfc00c60:	25ef000a 	addiu	t7,t7,10
bfc00c64:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00c68:	03e01021 	move	v0,ra
bfc00c6c:	240f0000 	li	t7,0
bfc00c70:	05e20002 	bltzl	t7,bfc00c7c <e1_trap_test+0x35c>
bfc00c74:	25ef0001 	addiu	t7,t7,1
bfc00c78:	25ef0014 	addiu	t7,t7,20
bfc00c7c:	25ef000a 	addiu	t7,t7,10
bfc00c80:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00c84:	03e01021 	move	v0,ra
bfc00c88:	240ffb2e 	li	t7,-1234
bfc00c8c:	05e20002 	bltzl	t7,bfc00c98 <e1_trap_test+0x378>
bfc00c90:	25ef0001 	addiu	t7,t7,1
bfc00c94:	25ef0014 	addiu	t7,t7,20
bfc00c98:	25ef000a 	addiu	t7,t7,10
bfc00c9c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00ca0:	03e01021 	move	v0,ra
bfc00ca4:	240f04d2 	li	t7,1234
bfc00ca8:	59e00002 	blezl	t7,bfc00cb4 <e1_trap_test+0x394>
bfc00cac:	25ef0001 	addiu	t7,t7,1
bfc00cb0:	25ef0014 	addiu	t7,t7,20
bfc00cb4:	25ef000a 	addiu	t7,t7,10
bfc00cb8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00cbc:	03e01021 	move	v0,ra
bfc00cc0:	240f0000 	li	t7,0
bfc00cc4:	59e00002 	blezl	t7,bfc00cd0 <e1_trap_test+0x3b0>
bfc00cc8:	25ef0001 	addiu	t7,t7,1
bfc00ccc:	25ef0014 	addiu	t7,t7,20
bfc00cd0:	25ef000a 	addiu	t7,t7,10
bfc00cd4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00cd8:	03e01021 	move	v0,ra
bfc00cdc:	240ffb2e 	li	t7,-1234
bfc00ce0:	59e00002 	blezl	t7,bfc00cec <e1_trap_test+0x3cc>
bfc00ce4:	25ef0001 	addiu	t7,t7,1
bfc00ce8:	25ef0014 	addiu	t7,t7,20
bfc00cec:	25ef000a 	addiu	t7,t7,10
bfc00cf0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00cf4:	03e01021 	move	v0,ra
bfc00cf8:	240f04d2 	li	t7,1234
bfc00cfc:	05f30002 	bgezall	t7,bfc00d08 <e1_trap_test+0x3e8>
bfc00d00:	25ef0001 	addiu	t7,t7,1
bfc00d04:	25ef0014 	addiu	t7,t7,20
bfc00d08:	25ef000a 	addiu	t7,t7,10
bfc00d0c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00d10:	03e01021 	move	v0,ra
bfc00d14:	240f0000 	li	t7,0
bfc00d18:	05f30002 	bgezall	t7,bfc00d24 <e1_trap_test+0x404>
bfc00d1c:	25ef0001 	addiu	t7,t7,1
bfc00d20:	25ef0014 	addiu	t7,t7,20
bfc00d24:	25ef000a 	addiu	t7,t7,10
bfc00d28:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00d2c:	03e01021 	move	v0,ra
bfc00d30:	240ffb2e 	li	t7,-1234
bfc00d34:	05f30002 	bgezall	t7,bfc00d40 <e1_trap_test+0x420>
bfc00d38:	25ef0001 	addiu	t7,t7,1
bfc00d3c:	25ef0014 	addiu	t7,t7,20
bfc00d40:	25ef000a 	addiu	t7,t7,10
bfc00d44:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00d48:	26730001 	addiu	s3,s3,1

bfc00d4c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00d4c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00d50:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00d54:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00d58:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00d5c:	00000000 	nop

bfc00d60 <e2_clo_clz_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc00d60:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc00d64:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc00d68:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc00d6c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc00d70:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc00d74:	3c08e234 	lui	t0,0xe234
bfc00d78:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc00d7c:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc00d80:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc00d84:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc00d88:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc00d8c:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc00d90:	3c081926 	lui	t0,0x1926
bfc00d94:	35080817 	ori	t0,t0,0x817
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc00d98:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc00d9c:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc00da0:	2408000e 	li	t0,14
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc00da4:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc00da8:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc00dac:	26730001 	addiu	s3,s3,1

bfc00db0 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc00db0:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc00db4:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc00db8:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc00dbc:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc00dc0:	00000000 	nop
	...

bfc00dd0 <e3_madd_msub_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc00dd0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc00dd4:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc00dd8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc00ddc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc00de0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc00de4:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc00de8:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc00dec:	24091234 	li	t1,4660
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc00df0:	240a5678 	li	t2,22136
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc00df4:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc00df8:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc00dfc:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc00e00:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc00e04:	712a0004 	0x712a0004
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc00e08:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc00e0c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc00e10:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc00e14:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc00e18:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc00e1c:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc00e20:	712a0001 	0x712a0001
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc00e24:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc00e28:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc00e2c:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc00e30:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc00e34:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc00e38:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc00e3c:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc00e40:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc00e44:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc00e48:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc00e4c:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc00e50:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc00e54:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc00e58:	712a0005 	0x712a0005
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc00e5c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc00e60:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc00e64:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc00e68:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc00e6c:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc00e70:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc00e74:	712a0004 	0x712a0004
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc00e78:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc00e7c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc00e80:	26730001 	addiu	s3,s3,1

bfc00e84 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc00e84:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc00e88:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc00e8c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc00e90:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc00e94:	00000000 	nop
	...

bfc00ea0 <e4_ll_sc>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc00ea0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc00ea4:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc00ea8:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc00eac:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc00eb0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc00eb4:	3c088000 	lui	t0,0x8000
bfc00eb8:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc00ebc:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc00ec0:	ad090004 	sw	t1,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc00ec4:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc00ec8:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc00ecc:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc00ed0:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc00ed4:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc00ed8:	0000000c 	syscall
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc00edc:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc00ee0:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc00ee4:	240c04d6 	li	t4,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc00ee8:	156c0002 	bne	t3,t4,bfc00ef4 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc00eec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc00ef0:	26730001 	addiu	s3,s3,1

bfc00ef4 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc00ef4:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc00ef8:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc00efc:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc00f00:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc00f04:	00000000 	nop
	...
inst_error():
bfc00f10:	9e3f7f70 	0x9e3f7f70
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
  14:	000008b8 	0x8b8
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc008c0 	0xbfc008c0
  34:	00000060 	0x60
	...
  40:	0000001c 	0x1c
  44:	00ce0002 	0xce0002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc00920 	0xbfc00920
  54:	00000440 	sll	zero,zero,0x11
	...
  60:	0000001c 	0x1c
  64:	013b0002 	0x13b0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00d60 	0xbfc00d60
  74:	00000064 	0x64
	...
  80:	0000001c 	0x1c
  84:	01a60002 	0x1a60002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00dd0 	0xbfc00dd0
  94:	000000c8 	0xc8
	...
  a0:	0000001c 	0x1c
  a4:	02130002 	0x2130002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00ea0 	0xbfc00ea0
  b4:	00000068 	0x68
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc008c0 	0xbfc008c0
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00920 	0xbfc00920
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00d60 	0xbfc00d60
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00dd0 	0xbfc00dd0
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00ea0 	0xbfc00ea0
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000185 	0x185
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
 134:	4b4b4b4b 	c2	0x14b4b4b
 138:	4b4b4b4b 	c2	0x14b4b4b
 13c:	4c4b4b4b 	0x4c4b4b4b
 140:	4b4d4b83 	c2	0x14d4b83
 144:	4b4b4b4b 	c2	0x14b4b4b
 148:	4b4b4b4b 	c2	0x14b4b4b
 14c:	834d4b4b 	lb	t5,19275(k0)
 150:	4b4b4b4b 	c2	0x14b4b4b
 154:	4b4b4c4b 	c2	0x14b4c4b
 158:	4b4b4b4b 	c2	0x14b4b4b
 15c:	4d4b4c4b 	0x4d4b4c4b
 160:	834c4b4b 	lb	t4,19275(k0)
 164:	4b4c8483 	c2	0x14c8483
 168:	4c4b4b4b 	0x4c4b4b4b
 16c:	4b83834b 	c2	0x183834b
 170:	834d4b4d 	lb	t5,19277(k0)
 174:	4b4b4b4d 	c2	0x14b4b4d
 178:	4b4b4d4d 	c2	0x14b4d4d
 17c:	4b4b4b4b 	c2	0x14b4b4b
 180:	4b4b4b4c 	c2	0x14b4b4c
 184:	01000402 	0x1000402
 188:	00004e01 	0x4e01
 18c:	25000200 	addiu	zero,t0,512
 190:	01000000 	0x1000000
 194:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 198:	01010100 	0x1010100
 19c:	00000001 	0x1
 1a0:	01000001 	0x1000001
 1a4:	5f356500 	0x5f356500
 1a8:	7a766f6d 	0x7a766f6d
 1ac:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
 1b0:	00532e6e 	0x532e6e
 1b4:	00000000 	nop
 1b8:	c0020500 	ll	v0,1280(zero)
 1bc:	19bfc008 	0x19bfc008
 1c0:	4b4b4b4b 	c2	0x14b4b4b
 1c4:	4b4b4b50 	c2	0x14b4b50
 1c8:	4b4b4b4b 	c2	0x14b4b4b
 1cc:	4b834b4b 	c2	0x1834b4b
 1d0:	4b4b4d4f 	c2	0x14b4d4f
 1d4:	04024b4b 	bltzl	zero,12f04 <data_size+0x12ef4>
 1d8:	90010100 	lbu	at,256(zero)
 1dc:	02000000 	0x2000000
 1e0:	00002500 	sll	a0,zero,0x14
 1e4:	fb010100 	sdc2	$1,256(t8)
 1e8:	01000d0e 	0x1000d0e
 1ec:	00010101 	0x10101
 1f0:	00010000 	sll	zero,at,0x0
 1f4:	65000100 	0x65000100
 1f8:	72745f31 	0x72745f31
 1fc:	745f7061 	jalx	17dc184 <data_size+0x17dc174>
 200:	2e747365 	sltiu	s4,s3,29541
 204:	00000053 	0x53
 208:	05000000 	bltz	t0,20c <data_size+0x1fc>
 20c:	c0092002 	ll	t1,8194(zero)
 210:	4b4b19bf 	c2	0x14b19bf
 214:	084d4b4b 	j	1352d2c <data_size+0x1352d1c>
 218:	f33d083d 	0xf33d083d
 21c:	083d08f3 	j	f423cc <data_size+0xf423bc>
 220:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 224:	f33d083d 	0xf33d083d
 228:	083d08f3 	j	f423cc <data_size+0xf423bc>
 22c:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 230:	f33d083d 	0xf33d083d
 234:	083d08f3 	j	f423cc <data_size+0xf423bc>
 238:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 23c:	08e508e5 	j	3942394 <data_size+0x3942384>
 240:	08e508e5 	j	3942394 <data_size+0x3942384>
 244:	08e508e5 	j	3942394 <data_size+0x3942384>
 248:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 24c:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 250:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 254:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 258:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 25c:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 260:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 264:	4b4b4db0 	c2	0x14b4db0
 268:	04024b4b 	bltzl	zero,12f98 <data_size+0x12f88>
 26c:	4c010100 	0x4c010100
 270:	02000000 	0x2000000
 274:	00002300 	sll	a0,zero,0xc
 278:	fb010100 	sdc2	$1,256(t8)
 27c:	01000d0e 	0x1000d0e
 280:	00010101 	0x10101
 284:	00010000 	sll	zero,at,0x0
 288:	65000100 	0x65000100
 28c:	6c635f32 	0x6c635f32
 290:	6c635f6f 	0x6c635f6f
 294:	00532e7a 	0x532e7a
 298:	00000000 	nop
 29c:	60020500 	0x60020500
 2a0:	19bfc00d 	0x19bfc00d
 2a4:	4b4b4b4b 	c2	0x14b4b4b
 2a8:	4b4b834d 	c2	0x14b834d
 2ac:	834b4b4b 	lb	t3,19275(k0)
 2b0:	4b4b4b4b 	c2	0x14b4b4b
 2b4:	4b4b4d4e 	c2	0x14b4d4e
 2b8:	04024b4b 	bltzl	zero,12fe8 <data_size+0x12fd8>
 2bc:	69010100 	0x69010100
 2c0:	02000000 	0x2000000
 2c4:	00002500 	sll	a0,zero,0x14
 2c8:	fb010100 	sdc2	$1,256(t8)
 2cc:	01000d0e 	0x1000d0e
 2d0:	00010101 	0x10101
 2d4:	00010000 	sll	zero,at,0x0
 2d8:	65000100 	0x65000100
 2dc:	616d5f33 	0x616d5f33
 2e0:	6d5f6464 	0x6d5f6464
 2e4:	2e627573 	sltiu	v0,s3,30067
 2e8:	00000053 	0x53
 2ec:	05000000 	bltz	t0,2f0 <data_size+0x2e0>
 2f0:	c00dd002 	ll	t5,-12286(zero)
 2f4:	4b4b19bf 	c2	0x14b19bf
 2f8:	4b4d4b4b 	c2	0x14d4b4b
 2fc:	4b4b4b4b 	c2	0x14b4b4b
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	4b4b4b4b 	c2	0x14b4b4b
 308:	4b4b4b4b 	c2	0x14b4b4b
 30c:	4b4b4b4b 	c2	0x14b4b4b
 310:	4b4b4b4b 	c2	0x14b4b4b
 314:	4b4b4b4b 	c2	0x14b4b4b
 318:	4b4b4b4b 	c2	0x14b4b4b
 31c:	4b4b4b4b 	c2	0x14b4b4b
 320:	4b4d4e4b 	c2	0x14d4e4b
 324:	024b4b4b 	0x24b4b4b
 328:	01010004 	sllv	zero,at,t0
 32c:	0000004c 	syscall	0x1
 330:	00210002 	0x210002
 334:	01010000 	0x1010000
 338:	000d0efb 	0xd0efb
 33c:	01010101 	0x1010101
 340:	01000000 	0x1000000
 344:	00010000 	sll	zero,at,0x0
 348:	6c5f3465 	0x6c5f3465
 34c:	63735f6c 	0x63735f6c
 350:	0000532e 	0x532e
 354:	00000000 	nop
 358:	0ea00205 	jal	a800814 <data_size+0xa800804>
 35c:	4b19bfc0 	c2	0x119bfc0
 360:	504b4b4b 	beql	v0,t3,13090 <data_size+0x13080>
 364:	4b4b4b83 	c2	0x14b4b83
 368:	4b4b4c4b 	c2	0x14b4c4b
 36c:	4b4b4c4b 	c2	0x14b4c4b
 370:	4b4d4f4b 	c2	0x14d4f4b
 374:	024b4b4b 	0x24b4b4b
 378:	01010004 	sllv	zero,at,t0

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc008b8 	0xbfc008b8
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
  6c:	00018901 	0x18901
  70:	c008c000 	ll	t0,-16384(zero)
  74:	c00920bf 	ll	t1,8383(zero)
  78:	5f3565bf 	0x5f3565bf
  7c:	7a766f6d 	0x7a766f6d
  80:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
  84:	00532e6e 	0x532e6e
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
  cc:	00698001 	0x698001
  d0:	00020000 	sll	zero,v0,0x0
  d4:	00000028 	0x28
  d8:	01db0104 	0x1db0104
  dc:	09200000 	j	4800000 <data_size+0x47ffff0>
  e0:	0d60bfc0 	jal	582ff00 <data_size+0x582fef0>
  e4:	3165bfc0 	andi	a1,t3,0xbfc0
  e8:	6172745f 	0x6172745f
  ec:	65745f70 	0x65745f70
  f0:	532e7473 	beql	t9,t6,1d2c0 <data_size+0x1d2b0>
  f4:	6f682f00 	0x6f682f00
  f8:	6c2f656d 	0x6c2f656d
  fc:	702f6278 	0x702f6278
 100:	656a6f72 	0x656a6f72
 104:	6c2f7463 	0x6c2f7463
 108:	6f6f6f6f 	0x6f6f6f6f
 10c:	6f73676e 	0x6f73676e
 110:	6f732f6e 	0x6f732f6e
 114:	662f7466 	0x662f7466
 118:	5f636e75 	0x5f636e75
 11c:	65747865 	0x65747865
 120:	6465646e 	0x6465646e
 124:	736e692f 	0x736e692f
 128:	4e470074 	c3	0x470074
 12c:	53412055 	beql	k0,at,8284 <data_size+0x8274>
 130:	312e3220 	andi	t6,t1,0x3220
 134:	30352e38 	andi	s5,at,0x2e38
 138:	67800100 	0x67800100
 13c:	02000000 	0x2000000
 140:	00003c00 	sll	a3,zero,0x10
 144:	6f010400 	0x6f010400
 148:	60000002 	0x60000002
 14c:	c4bfc00d 	lwc1	$f31,-16371(a1)
 150:	65bfc00d 	0x65bfc00d
 154:	6c635f32 	0x6c635f32
 158:	6c635f6f 	0x6c635f6f
 15c:	00532e7a 	0x532e7a
 160:	6d6f682f 	0x6d6f682f
 164:	786c2f65 	0x786c2f65
 168:	72702f62 	0x72702f62
 16c:	63656a6f 	0x63656a6f
 170:	6f6c2f74 	0x6f6c2f74
 174:	6e6f6f6f 	0x6e6f6f6f
 178:	6e6f7367 	0x6e6f7367
 17c:	666f732f 	0x666f732f
 180:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 184:	655f636e 	0x655f636e
 188:	6e657478 	0x6e657478
 18c:	2f646564 	sltiu	a0,k1,25956
 190:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 194:	554e4700 	bnel	t2,t6,11d98 <data_size+0x11d88>
 198:	20534120 	addi	s3,v0,16672
 19c:	38312e32 	xori	s1,at,0x2e32
 1a0:	0030352e 	0x30352e
 1a4:	00698001 	0x698001
 1a8:	00020000 	sll	zero,v0,0x0
 1ac:	00000050 	0x50
 1b0:	02bf0104 	0x2bf0104
 1b4:	0dd00000 	jal	7400000 <data_size+0x73ffff0>
 1b8:	0e98bfc0 	jal	a62ff00 <data_size+0xa62fef0>
 1bc:	3365bfc0 	andi	a1,k1,0xbfc0
 1c0:	64616d5f 	0x64616d5f
 1c4:	736d5f64 	0x736d5f64
 1c8:	532e6275 	beql	t9,t6,18ba0 <data_size+0x18b90>
 1cc:	6f682f00 	0x6f682f00
 1d0:	6c2f656d 	0x6c2f656d
 1d4:	702f6278 	0x702f6278
 1d8:	656a6f72 	0x656a6f72
 1dc:	6c2f7463 	0x6c2f7463
 1e0:	6f6f6f6f 	0x6f6f6f6f
 1e4:	6f73676e 	0x6f73676e
 1e8:	6f732f6e 	0x6f732f6e
 1ec:	662f7466 	0x662f7466
 1f0:	5f636e75 	0x5f636e75
 1f4:	65747865 	0x65747865
 1f8:	6465646e 	0x6465646e
 1fc:	736e692f 	0x736e692f
 200:	4e470074 	c3	0x470074
 204:	53412055 	beql	k0,at,835c <data_size+0x834c>
 208:	312e3220 	andi	t6,t1,0x3220
 20c:	30352e38 	andi	s5,at,0x2e38
 210:	65800100 	0x65800100
 214:	02000000 	0x2000000
 218:	00006400 	sll	t4,zero,0x10
 21c:	2c010400 	sltiu	at,zero,1024
 220:	a0000003 	sb	zero,3(zero)
 224:	08bfc00e 	j	2ff0038 <data_size+0x2ff0028>
 228:	65bfc00f 	0x65bfc00f
 22c:	6c6c5f34 	0x6c6c5f34
 230:	2e63735f 	sltiu	v1,s3,29535
 234:	682f0053 	0x682f0053
 238:	2f656d6f 	sltiu	a1,k1,28015
 23c:	2f62786c 	sltiu	v0,k1,30828
 240:	6a6f7270 	0x6a6f7270
 244:	2f746365 	sltiu	s4,k1,25445
 248:	6f6f6f6c 	0x6f6f6f6c
 24c:	73676e6f 	0x73676e6f
 250:	732f6e6f 	0x732f6e6f
 254:	2f74666f 	sltiu	s4,k1,26223
 258:	636e7566 	0x636e7566
 25c:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 260:	65646e65 	0x65646e65
 264:	6e692f64 	0x6e692f64
 268:	47007473 	c1	0x1007473
 26c:	4120554e 	0x4120554e
 270:	2e322053 	sltiu	s2,s1,8275
 274:	352e3831 	ori	t6,t1,0x3831
 278:	80010030 	lb	at,48(zero)

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
  28:	10001101 	b	4430 <data_size+0x4420>
  2c:	12011106 	beq	s0,at,4448 <data_size+0x4438>
  30:	1b080301 	0x1b080301
  34:	13082508 	beq	t8,t0,9458 <data_size+0x9448>
  38:	00000005 	0x5
  3c:	10001101 	b	4444 <data_size+0x4434>
  40:	12011106 	beq	s0,at,445c <data_size+0x444c>
  44:	1b080301 	0x1b080301
  48:	13082508 	beq	t8,t0,946c <data_size+0x945c>
  4c:	00000005 	0x5
  50:	10001101 	b	4458 <data_size+0x4448>
  54:	12011106 	beq	s0,at,4470 <data_size+0x4460>
  58:	1b080301 	0x1b080301
  5c:	13082508 	beq	t8,t0,9480 <data_size+0x9470>
  60:	00000005 	0x5
  64:	10001101 	b	446c <data_size+0x445c>
  68:	12011106 	beq	s0,at,4484 <data_size+0x4474>
  6c:	1b080301 	0x1b080301
  70:	13082508 	beq	t8,t0,9494 <data_size+0x9484>
  74:	00000005 	0x5
