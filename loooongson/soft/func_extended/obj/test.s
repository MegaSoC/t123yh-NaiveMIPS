
main.elf:     file format elf32-tradlittlemips
main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/lxb/project/loooongson/soft/func_extended/start.S:19
bfc00000:	24081800 	li	t0,6144
/home/lxb/project/loooongson/soft/func_extended/start.S:20
bfc00004:	40882800 	mtc0	t0,$5
/home/lxb/project/loooongson/soft/func_extended/start.S:21
bfc00008:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:22
bfc0000c:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:23
bfc00010:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:24
bfc00014:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:25
bfc00018:	10000200 	b	bfc0081c <locate>
/home/lxb/project/loooongson/soft/func_extended/start.S:26
bfc0001c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:29
bfc00020:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:30
bfc00024:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:31
bfc00028:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:32
bfc0002c:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:33
bfc00030:	8d0c0000 	lw	t4,0(t0)
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:38
bfc000ec:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:39
bfc000f0:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:40
bfc000f4:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:41
bfc000f8:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:42
bfc000fc:	8d0c0000 	lw	t4,0(t0)

bfc00100 <test_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:45
bfc00100:	25080001 	addiu	t0,t0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:46
bfc00104:	240900ff 	li	t1,255
/home/lxb/project/loooongson/soft/func_extended/start.S:47
bfc00108:	3c0abfaf 	lui	t2,0xbfaf
bfc0010c:	354afff0 	ori	t2,t2,0xfff0
/home/lxb/project/loooongson/soft/func_extended/start.S:48
bfc00110:	ad490000 	sw	t1,0(t2)
/home/lxb/project/loooongson/soft/func_extended/start.S:49
bfc00114:	1000fffa 	b	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:50
bfc00118:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:52
bfc0011c:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:53
bfc00120:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:54
bfc00124:	01005025 	move	t2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:55
bfc00128:	01ae5821 	addu	t3,t5,t6
/home/lxb/project/loooongson/soft/func_extended/start.S:56
bfc0012c:	8d0c0000 	lw	t4,0(t0)

bfc00130 <ebase_entry>:
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:62
bfc00200:	3c03ffe8 	lui	v1,0xffe8
/home/lxb/project/loooongson/soft/func_extended/start.S:63
bfc00204:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:64
bfc00208:	10430141 	beq	v0,v1,bfc00710 <tlbwr_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:65
bfc0020c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:66
bfc00210:	3c03efe8 	lui	v1,0xefe8
/home/lxb/project/loooongson/soft/func_extended/start.S:67
bfc00214:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:68
bfc00218:	1043015b 	beq	v0,v1,bfc00788 <tlbwi_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:69
bfc0021c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:70
bfc00220:	3c038888 	lui	v1,0x8888
/home/lxb/project/loooongson/soft/func_extended/start.S:71
bfc00224:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:72
bfc00228:	1043016d 	beq	v0,v1,bfc007e0 <tlb_double_fill>
/home/lxb/project/loooongson/soft/func_extended/start.S:73
bfc0022c:	00000000 	nop
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:80
bfc00380:	0000d010 	mfhi	k0
/home/lxb/project/loooongson/soft/func_extended/start.S:81
bfc00384:	0000d812 	mflo	k1
/home/lxb/project/loooongson/soft/func_extended/start.S:82
bfc00388:	3c1a800d 	lui	k0,0x800d
/home/lxb/project/loooongson/soft/func_extended/start.S:83
bfc0038c:	8f5b0000 	lw	k1,0(k0)
/home/lxb/project/loooongson/soft/func_extended/start.S:84
bfc00390:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:85
bfc00394:	137a001b 	beq	k1,k0,bfc00404 <syscall_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:86
bfc00398:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:87
bfc0039c:	241a0002 	li	k0,2
/home/lxb/project/loooongson/soft/func_extended/start.S:88
bfc003a0:	137a0029 	beq	k1,k0,bfc00448 <break_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:89
bfc003a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:90
bfc003a8:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/start.S:91
bfc003ac:	137a0048 	beq	k1,k0,bfc004d0 <overflow_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:92
bfc003b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:93
bfc003b4:	241a0004 	li	k0,4
/home/lxb/project/loooongson/soft/func_extended/start.S:94
bfc003b8:	137a0055 	beq	k1,k0,bfc00510 <adel_load_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:95
bfc003bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:96
bfc003c0:	241a0005 	li	k0,5
/home/lxb/project/loooongson/soft/func_extended/start.S:97
bfc003c4:	137a0063 	beq	k1,k0,bfc00554 <ades_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:98
bfc003c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:99
bfc003cc:	241a0006 	li	k0,6
/home/lxb/project/loooongson/soft/func_extended/start.S:100
bfc003d0:	137a0071 	beq	k1,k0,bfc00598 <adel_if_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:101
bfc003d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:102
bfc003d8:	241a0007 	li	k0,7
/home/lxb/project/loooongson/soft/func_extended/start.S:103
bfc003dc:	137a0080 	beq	k1,k0,bfc005e0 <reserved_inst_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:104
bfc003e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:105
bfc003e4:	241a0008 	li	k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:106
bfc003e8:	137a008e 	beq	k1,k0,bfc00624 <int_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:107
bfc003ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:108
bfc003f0:	241a0009 	li	k0,9
/home/lxb/project/loooongson/soft/func_extended/start.S:109
bfc003f4:	137a0025 	beq	k1,k0,bfc0048c <trap_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:110
bfc003f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:111
bfc003fc:	241a0010 	li	k0,16
/home/lxb/project/loooongson/soft/func_extended/start.S:112
bfc00400:	137a00ef 	beq	k1,k0,bfc007c0 <tlb_double_ex>

bfc00404 <syscall_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:115
bfc00404:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:116
bfc00408:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:117
bfc0040c:	175400b0 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:118
bfc00410:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:119
bfc00414:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:120
bfc00418:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:121
bfc0041c:	241b0020 	li	k1,32
/home/lxb/project/loooongson/soft/func_extended/start.S:122
bfc00420:	175b00ab 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:123
bfc00424:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:124
bfc00428:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:125
bfc0042c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:126
bfc00430:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:127
bfc00434:	175b00a6 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:128
bfc00438:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:129
bfc0043c:	3c120001 	lui	s2,0x1
/home/lxb/project/loooongson/soft/func_extended/start.S:130
bfc00440:	100000a3 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:131
bfc00444:	00000000 	nop

bfc00448 <break_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:134
bfc00448:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:135
bfc0044c:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:136
bfc00450:	1754009f 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:137
bfc00454:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:138
bfc00458:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:139
bfc0045c:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:140
bfc00460:	241b0024 	li	k1,36
/home/lxb/project/loooongson/soft/func_extended/start.S:141
bfc00464:	175b009a 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:142
bfc00468:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:143
bfc0046c:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:144
bfc00470:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:145
bfc00474:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:146
bfc00478:	175b0095 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:147
bfc0047c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:148
bfc00480:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:149
bfc00484:	10000092 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:150
bfc00488:	00000000 	nop

bfc0048c <trap_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:155
bfc0048c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:156
bfc00490:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:157
bfc00494:	1754008e 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:158
bfc00498:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:159
bfc0049c:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:160
bfc004a0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:161
bfc004a4:	241b0034 	li	k1,52
/home/lxb/project/loooongson/soft/func_extended/start.S:162
bfc004a8:	175b0089 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:163
bfc004ac:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:164
bfc004b0:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:165
bfc004b4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:166
bfc004b8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:167
bfc004bc:	175b0084 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:168
bfc004c0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:169
bfc004c4:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:170
bfc004c8:	10000081 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:171
bfc004cc:	00000000 	nop

bfc004d0 <overflow_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:174
bfc004d0:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:175
bfc004d4:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:176
bfc004d8:	1754007d 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:177
bfc004dc:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:178
bfc004e0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:179
bfc004e4:	241b0030 	li	k1,48
/home/lxb/project/loooongson/soft/func_extended/start.S:180
bfc004e8:	175b0079 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:181
bfc004ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:182
bfc004f0:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:183
bfc004f4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:184
bfc004f8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:185
bfc004fc:	175b0074 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:186
bfc00500:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:187
bfc00504:	3c120003 	lui	s2,0x3
/home/lxb/project/loooongson/soft/func_extended/start.S:188
bfc00508:	10000071 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:189
bfc0050c:	00000000 	nop

bfc00510 <adel_load_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:192
bfc00510:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:193
bfc00514:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:194
bfc00518:	1754006d 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:195
bfc0051c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:196
bfc00520:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:197
bfc00524:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:198
bfc00528:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:199
bfc0052c:	175b0068 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:200
bfc00530:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:201
bfc00534:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:202
bfc00538:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:203
bfc0053c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:204
bfc00540:	175b0063 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:205
bfc00544:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:206
bfc00548:	3c120004 	lui	s2,0x4
/home/lxb/project/loooongson/soft/func_extended/start.S:207
bfc0054c:	10000060 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:208
bfc00550:	00000000 	nop

bfc00554 <ades_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:211
bfc00554:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:212
bfc00558:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:213
bfc0055c:	1754005c 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:214
bfc00560:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:215
bfc00564:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:216
bfc00568:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:217
bfc0056c:	241b0014 	li	k1,20
/home/lxb/project/loooongson/soft/func_extended/start.S:218
bfc00570:	175b0057 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:219
bfc00574:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:220
bfc00578:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:221
bfc0057c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:222
bfc00580:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:223
bfc00584:	175b0052 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:224
bfc00588:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:225
bfc0058c:	3c120005 	lui	s2,0x5
/home/lxb/project/loooongson/soft/func_extended/start.S:226
bfc00590:	1000004f 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:227
bfc00594:	00000000 	nop

bfc00598 <adel_if_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:230
bfc00598:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:231
bfc0059c:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:232
bfc005a0:	1754004b 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:233
bfc005a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:234
bfc005a8:	40957000 	mtc0	s5,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:235
bfc005ac:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:236
bfc005b0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:237
bfc005b4:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:238
bfc005b8:	175b0045 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:239
bfc005bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:240
bfc005c0:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:241
bfc005c4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:242
bfc005c8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:243
bfc005cc:	175b0040 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:244
bfc005d0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:245
bfc005d4:	3c120006 	lui	s2,0x6
/home/lxb/project/loooongson/soft/func_extended/start.S:246
bfc005d8:	1000003d 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:247
bfc005dc:	00000000 	nop

bfc005e0 <reserved_inst_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:250
bfc005e0:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:251
bfc005e4:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:252
bfc005e8:	17540039 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:253
bfc005ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:254
bfc005f0:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:255
bfc005f4:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:256
bfc005f8:	241b0028 	li	k1,40
/home/lxb/project/loooongson/soft/func_extended/start.S:257
bfc005fc:	175b0034 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:258
bfc00600:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:259
bfc00604:	401a6000 	mfc0	k0,$12
/home/lxb/project/loooongson/soft/func_extended/start.S:260
bfc00608:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:261
bfc0060c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:262
bfc00610:	175b002f 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:263
bfc00614:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:264
bfc00618:	3c120007 	lui	s2,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:265
bfc0061c:	1000002c 	b	bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:266
bfc00620:	00000000 	nop

bfc00624 <int_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:269
bfc00624:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:270
bfc00628:	401a7000 	mfc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:271
bfc0062c:	17540028 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:272
bfc00630:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:273
bfc00634:	275a0008 	addiu	k0,k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:274
bfc00638:	409a7000 	mtc0	k0,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:275
bfc0063c:	3c1bbfb0 	lui	k1,0xbfb0
bfc00640:	af608ffc 	sw	zero,-28676(k1)
bfc00644:	af608ffc 	sw	zero,-28676(k1)
bfc00648:	af60fff8 	sw	zero,-8(k1)
bfc0064c:	af608ffc 	sw	zero,-28676(k1)
bfc00650:	af608ffc 	sw	zero,-28676(k1)
bfc00654:	8f608ffc 	lw	zero,-28676(k1)
bfc00658:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:276
bfc0065c:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:277
bfc00660:	3c1bbfb0 	lui	k1,0xbfb0
bfc00664:	af608ffc 	sw	zero,-28676(k1)
bfc00668:	af608ffc 	sw	zero,-28676(k1)
bfc0066c:	af7bfff8 	sw	k1,-8(k1)
bfc00670:	af608ffc 	sw	zero,-28676(k1)
bfc00674:	af608ffc 	sw	zero,-28676(k1)
bfc00678:	8f608ffc 	lw	zero,-28676(k1)
bfc0067c:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:278
bfc00680:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:279
bfc00684:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:280
bfc00688:	175b0011 	bne	k0,k1,bfc006d0 <ex_finish>
bfc0068c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:281
bfc00690:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:282
bfc00694:	401a6000 	mfc0	k0,$12
bfc00698:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:283
bfc0069c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:284
bfc006a0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:285
bfc006a4:	175b000a 	bne	k0,k1,bfc006d0 <ex_finish>
bfc006a8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:286
bfc006ac:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:287
bfc006b0:	241affff 	li	k0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:288
bfc006b4:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:289
bfc006b8:	409a5800 	mtc0	k0,$11
bfc006bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:290
bfc006c0:	409b6800 	mtc0	k1,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:291
bfc006c4:	10000010 	b	bfc00708 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:292
bfc006c8:	3c120008 	lui	s2,0x8
/home/lxb/project/loooongson/soft/func_extended/start.S:293
bfc006cc:	00000000 	nop

bfc006d0 <ex_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:296
bfc006d0:	401a6800 	mfc0	k0,$13
/home/lxb/project/loooongson/soft/func_extended/start.S:297
bfc006d4:	3c1b8000 	lui	k1,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:298
bfc006d8:	035bd024 	and	k0,k0,k1
/home/lxb/project/loooongson/soft/func_extended/start.S:299
bfc006dc:	401b7000 	mfc0	k1,$14
bfc006e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:300
bfc006e4:	13400003 	beqz	k0,bfc006f4 <ex_finish+0x24>
/home/lxb/project/loooongson/soft/func_extended/start.S:301
bfc006e8:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:302
bfc006ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:303
bfc006f0:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:305
bfc006f4:	409b7000 	mtc0	k1,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:306
bfc006f8:	16400003 	bnez	s2,bfc00708 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:307
bfc006fc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:308
bfc00700:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:309
bfc00704:	3c12ffff 	lui	s2,0xffff

bfc00708 <ex_ret>:
/home/lxb/project/loooongson/soft/func_extended/start.S:312
bfc00708:	42000018 	c0	0x18
/home/lxb/project/loooongson/soft/func_extended/start.S:314
bfc0070c:	00000000 	nop

bfc00710 <tlbwr_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:317
bfc00710:	24030001 	li	v1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:318
bfc00714:	1343000b 	beq	k0,v1,bfc00744 <tlbwr_allbit>
bfc00718:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:319
bfc0071c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:320
bfc00720:	24030003 	li	v1,3
/home/lxb/project/loooongson/soft/func_extended/start.S:321
bfc00724:	1343000b 	beq	k0,v1,bfc00754 <tlbwr_asid>
bfc00728:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:322
bfc0072c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:323
bfc00730:	25080001 	addiu	t0,t0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:324
bfc00734:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:325
bfc00738:	0bf001d8 	j	bfc00760 <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:326
bfc0073c:	275a0001 	addiu	k0,k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:327
bfc00740:	00000000 	nop

bfc00744 <tlbwr_allbit>:
/home/lxb/project/loooongson/soft/func_extended/start.S:329
bfc00744:	35080007 	ori	t0,t0,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:330
bfc00748:	0bf001d8 	j	bfc00760 <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:331
bfc0074c:	35290007 	ori	t1,t1,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:332
bfc00750:	00000000 	nop

bfc00754 <tlbwr_asid>:
/home/lxb/project/loooongson/soft/func_extended/start.S:334
bfc00754:	0bf001d8 	j	bfc00760 <tlbwr_return>
bfc00758:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:335
bfc0075c:	00000000 	nop

bfc00760 <tlbwr_return>:
/home/lxb/project/loooongson/soft/func_extended/start.S:337
bfc00760:	40955000 	mtc0	s5,$10
bfc00764:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:338
bfc00768:	40881000 	mtc0	t0,$2
bfc0076c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:339
bfc00770:	40891800 	mtc0	t1,$3
/home/lxb/project/loooongson/soft/func_extended/start.S:340
bfc00774:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:341
bfc00778:	3c03ed08 	lui	v1,0xed08
/home/lxb/project/loooongson/soft/func_extended/start.S:342
bfc0077c:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project/loooongson/soft/func_extended/start.S:343
bfc00780:	007a1820 	add	v1,v1,k0
/home/lxb/project/loooongson/soft/func_extended/start.S:345
bfc00784:	42000018 	c0	0x18

bfc00788 <tlbwi_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:348
bfc00788:	40034000 	mfc0	v1,$8
/home/lxb/project/loooongson/soft/func_extended/start.S:349
bfc0078c:	3c05ffff 	lui	a1,0xffff
/home/lxb/project/loooongson/soft/func_extended/start.S:350
bfc00790:	34a5e000 	ori	a1,a1,0xe000
/home/lxb/project/loooongson/soft/func_extended/start.S:351
bfc00794:	00a31824 	and	v1,a1,v1
/home/lxb/project/loooongson/soft/func_extended/start.S:352
bfc00798:	40835000 	mtc0	v1,$10
/home/lxb/project/loooongson/soft/func_extended/start.S:353
bfc0079c:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:354
bfc007a0:	40831000 	mtc0	v1,$2
/home/lxb/project/loooongson/soft/func_extended/start.S:355
bfc007a4:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:356
bfc007a8:	40831800 	mtc0	v1,$3
/home/lxb/project/loooongson/soft/func_extended/start.S:357
bfc007ac:	42000002 	tlbwi
/home/lxb/project/loooongson/soft/func_extended/start.S:358
bfc007b0:	3c03ed12 	lui	v1,0xed12
/home/lxb/project/loooongson/soft/func_extended/start.S:359
bfc007b4:	34635678 	ori	v1,v1,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:361
bfc007b8:	42000018 	c0	0x18
/home/lxb/project/loooongson/soft/func_extended/start.S:363
bfc007bc:	00000000 	nop

bfc007c0 <tlb_double_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:367
bfc007c0:	40195000 	mfc0	t9,$10
/home/lxb/project/loooongson/soft/func_extended/start.S:368
bfc007c4:	3c198000 	lui	t9,0x8000
bfc007c8:	3739d007 	ori	t9,t9,0xd007
/home/lxb/project/loooongson/soft/func_extended/start.S:369
bfc007cc:	40991000 	mtc0	t9,$2
/home/lxb/project/loooongson/soft/func_extended/start.S:370
bfc007d0:	40991800 	mtc0	t9,$3
/home/lxb/project/loooongson/soft/func_extended/start.S:371
bfc007d4:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:372
bfc007d8:	40197000 	mfc0	t9,$14
/home/lxb/project/loooongson/soft/func_extended/start.S:374
bfc007dc:	42000018 	c0	0x18

bfc007e0 <tlb_double_fill>:
/home/lxb/project/loooongson/soft/func_extended/start.S:378
bfc007e0:	3c18800d 	lui	t8,0x800d
/home/lxb/project/loooongson/soft/func_extended/start.S:379
bfc007e4:	24120010 	li	s2,16
/home/lxb/project/loooongson/soft/func_extended/start.S:380
bfc007e8:	af120000 	sw	s2,0(t8)
/home/lxb/project/loooongson/soft/func_extended/start.S:381
bfc007ec:	3c18000c 	lui	t8,0xc
/home/lxb/project/loooongson/soft/func_extended/start.S:382
bfc007f0:	8f120000 	lw	s2,0(t8)
/home/lxb/project/loooongson/soft/func_extended/start.S:383
bfc007f4:	2652fff7 	addiu	s2,s2,-9
/home/lxb/project/loooongson/soft/func_extended/start.S:384
bfc007f8:	02484025 	or	t0,s2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:385
bfc007fc:	02494825 	or	t1,s2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:386
bfc00800:	40881000 	mtc0	t0,$2
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc00804:	40891800 	mtc0	t1,$3
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc00808:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc0080c:	3c033333 	lui	v1,0x3333
/home/lxb/project/loooongson/soft/func_extended/start.S:390
bfc00810:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project/loooongson/soft/func_extended/start.S:393
bfc00814:	42000018 	c0	0x18
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc00818:	00000000 	nop

bfc0081c <locate>:
/home/lxb/project/loooongson/soft/func_extended/start.S:400
bfc0081c:	3c04bfaf 	lui	a0,0xbfaf
bfc00820:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:401
bfc00824:	3c05bfaf 	lui	a1,0xbfaf
bfc00828:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:402
bfc0082c:	3c11bfaf 	lui	s1,0xbfaf
bfc00830:	3631f010 	ori	s1,s1,0xf010
/home/lxb/project/loooongson/soft/func_extended/start.S:404
bfc00834:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:405
bfc00838:	240a0001 	li	t2,1
/home/lxb/project/loooongson/soft/func_extended/start.S:406
bfc0083c:	3c130000 	lui	s3,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:408
bfc00840:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:409
bfc00844:	acaa0000 	sw	t2,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:410
bfc00848:	ae330000 	sw	s3,0(s1)
/home/lxb/project/loooongson/soft/func_extended/start.S:412
bfc0084c:	3c100000 	lui	s0,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:414
bfc00850:	3c09bfc0 	lui	t1,0xbfc0
bfc00854:	25290868 	addiu	t1,t1,2152
/home/lxb/project/loooongson/soft/func_extended/start.S:415
bfc00858:	3c0a2000 	lui	t2,0x2000
/home/lxb/project/loooongson/soft/func_extended/start.S:416
bfc0085c:	012ac823 	subu	t9,t1,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:417
bfc00860:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:418
bfc00864:	00000000 	nop

bfc00868 <inst_test>:
/home/lxb/project/loooongson/soft/func_extended/start.S:421
bfc00868:	0ff002d4 	jal	bfc00b50 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:422
bfc0086c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:423
bfc00870:	0ff00268 	jal	bfc009a0 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:424
bfc00874:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:425
bfc00878:	0ff0046c 	jal	bfc011b0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:426
bfc0087c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:427
bfc00880:	0ff0041c 	jal	bfc01070 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:428
bfc00884:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:429
bfc00888:	0ff00450 	jal	bfc01140 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:430
bfc0088c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:431
bfc00890:	0ff002bc 	jal	bfc00af0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:432
bfc00894:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:433
bfc00898:	0ff003e4 	jal	bfc00f90 <n92_tlbwi_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:434
bfc0089c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:435
bfc008a0:	0ff00488 	jal	bfc01220 <n93_tlbwr_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:436
bfc008a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:438
bfc008a8:	3c19bfc0 	lui	t9,0xbfc0
bfc008ac:	273908b8 	addiu	t9,t9,2232
/home/lxb/project/loooongson/soft/func_extended/start.S:439
bfc008b0:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:440
bfc008b4:	00000000 	nop

bfc008b8 <kseg0_kseg1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:443
bfc008b8:	0ff002d4 	jal	bfc00b50 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:444
bfc008bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:445
bfc008c0:	0ff00268 	jal	bfc009a0 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:446
bfc008c4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:447
bfc008c8:	0ff0046c 	jal	bfc011b0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:448
bfc008cc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:449
bfc008d0:	0ff0041c 	jal	bfc01070 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:450
bfc008d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:451
bfc008d8:	0ff00450 	jal	bfc01140 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:452
bfc008dc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:453
bfc008e0:	0ff002bc 	jal	bfc00af0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:454
bfc008e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:455
bfc008e8:	0ff00286 	jal	bfc00a18 <e6_mapped_instr>
/home/lxb/project/loooongson/soft/func_extended/start.S:456
bfc008ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:457
bfc008f0:	0ff002a4 	jal	bfc00a90 <e7_tlb_double_miss>
/home/lxb/project/loooongson/soft/func_extended/start.S:458
bfc008f4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:461
bfc008f8:	3c04bfaf 	lui	a0,0xbfaf
bfc008fc:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:462
bfc00900:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:463
bfc00904:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:464
bfc00908:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:465
bfc0090c:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:466
bfc00910:	15090009 	bne	t0,t1,bfc00938 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:467
bfc00914:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:469
bfc00918:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:470
bfc0091c:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:471
bfc00920:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:472
bfc00924:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:473
bfc00928:	15090003 	bne	t0,t1,bfc00938 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:474
bfc0092c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:475
bfc00930:	10000003 	b	bfc00940 <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:476
bfc00934:	00000000 	nop

bfc00938 <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:478
bfc00938:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:479
bfc0093c:	ae300000 	sw	s0,0(s1)

bfc00940 <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:482
bfc00940:	2410000c 	li	s0,12
/home/lxb/project/loooongson/soft/func_extended/start.S:483
bfc00944:	1213000d 	beq	s0,s3,bfc0097c <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:484
bfc00948:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:486
bfc0094c:	3c04bfaf 	lui	a0,0xbfaf
bfc00950:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:487
bfc00954:	3c05bfaf 	lui	a1,0xbfaf
bfc00958:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:488
bfc0095c:	3c06bfaf 	lui	a2,0xbfaf
bfc00960:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:490
bfc00964:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:492
bfc00968:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:493
bfc0096c:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:494
bfc00970:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:495
bfc00974:	10000008 	b	bfc00998 <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:496
bfc00978:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:498
bfc0097c:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:499
bfc00980:	3c04bfaf 	lui	a0,0xbfaf
bfc00984:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:500
bfc00988:	3c05bfaf 	lui	a1,0xbfaf
bfc0098c:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:501
bfc00990:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:502
bfc00994:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:505
bfc00998:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:506
bfc0099c:	00000000 	nop

bfc009a0 <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:509
bfc009a0:	3c08bfaf 	lui	t0,0xbfaf
bfc009a4:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:510
bfc009a8:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:513
bfc009ac:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:514
bfc009b0:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:515
bfc009b4:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:516
bfc009b8:	256b0001 	addiu	t3,t3,1

bfc009bc <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:519
bfc009bc:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:522
bfc009c0:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:523
bfc009c4:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:524
bfc009c8:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:525
bfc009cc:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:526
bfc009d0:	15800002 	bnez	t4,bfc009dc <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:527
bfc009d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:528
bfc009d8:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:530
bfc009dc:	1560fff7 	bnez	t3,bfc009bc <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:531
bfc009e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:532
bfc009e4:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:533
bfc009e8:	00000000 	nop
sub1():
bfc009ec:	00000000 	nop

bfc009f0 <instr_tlb>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:8
bfc009f0:	240a0000 	li	t2,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:9
bfc009f4:	240c0000 	li	t4,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:10
bfc009f8:	240b000a 	li	t3,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:12
bfc009fc:	254a0001 	addiu	t2,t2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:13
bfc00a00:	154bfffe 	bne	t2,t3,bfc009fc <instr_tlb+0xc>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:14
bfc00a04:	258c000a 	addiu	t4,t4,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:15
bfc00a08:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:16
bfc00a0c:	00000000 	nop
	...

bfc00a18 <e6_mapped_instr>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:21
bfc00a18:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:22
bfc00a1c:	03e0c821 	move	t9,ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:23
bfc00a20:	2404005d 	li	a0,93
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:25
bfc00a24:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:26
bfc00a28:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:27
bfc00a2c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:28
bfc00a30:	3c08bfc0 	lui	t0,0xbfc0
bfc00a34:	250809f0 	addiu	t0,t0,2544
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:29
bfc00a38:	240de000 	li	t5,-8192
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:30
bfc00a3c:	24156000 	li	s5,24576
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:31
bfc00a40:	010d4024 	and	t0,t0,t5
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:32
bfc00a44:	00084182 	srl	t0,t0,0x6
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:33
bfc00a48:	01004821 	move	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:34
bfc00a4c:	3c0ebfc0 	lui	t6,0xbfc0
bfc00a50:	25ce09f0 	addiu	t6,t6,2544
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:35
bfc00a54:	31ce0fff 	andi	t6,t6,0xfff
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:36
bfc00a58:	35ce6000 	ori	t6,t6,0x6000
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:37
bfc00a5c:	01c0f809 	jalr	t6
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:38
bfc00a60:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:39
bfc00a64:	24010064 	li	at,100
bfc00a68:	15810002 	bne	t4,at,bfc00a74 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:40
bfc00a6c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:43
bfc00a70:	26730001 	addiu	s3,s3,1

bfc00a74 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:46
bfc00a74:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:47
bfc00a78:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:48
bfc00a7c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:49
bfc00a80:	0320f821 	move	ra,t9
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:50
bfc00a84:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:51
bfc00a88:	00000000 	nop
inst_error():
bfc00a8c:	00000000 	nop

bfc00a90 <e7_tlb_double_miss>:
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:7
bfc00a90:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:8
bfc00a94:	2404005d 	li	a0,93
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:10
bfc00a98:	3c028888 	lui	v0,0x8888
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:11
bfc00a9c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:12
bfc00aa0:	3c160011 	lui	s6,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:13
bfc00aa4:	36d6e124 	ori	s6,s6,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:14
bfc00aa8:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:15
bfc00aac:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:16
bfc00ab0:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:17
bfc00ab4:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:18
bfc00ab8:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:19
bfc00abc:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:20
bfc00ac0:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:21
bfc00ac4:	aec70000 	sw	a3,0(s6)
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:22
bfc00ac8:	3c083333 	lui	t0,0x3333
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:23
bfc00acc:	3508dc15 	ori	t0,t0,0xdc15
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:24
bfc00ad0:	14680002 	bne	v1,t0,bfc00adc <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:25
bfc00ad4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:27
bfc00ad8:	26730001 	addiu	s3,s3,1

bfc00adc <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:30
bfc00adc:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:31
bfc00ae0:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:32
bfc00ae4:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:33
bfc00ae8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:34
bfc00aec:	00000000 	nop

bfc00af0 <e5_movz_movn>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc00af0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc00af4:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc00af8:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc00afc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc00b00:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc00b04:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc00b08:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc00b0c:	012b500b 	0x12b500b
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc00b10:	240904d6 	li	t1,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc00b14:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc00b18:	012b500b 	0x12b500b
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc00b1c:	24090929 	li	t1,2345
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc00b20:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc00b24:	012b500a 	0x12b500a
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc00b28:	3c090001 	lui	t1,0x1
bfc00b2c:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc00b30:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc00b34:	012b500a 	0x12b500a
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc00b38:	26730001 	addiu	s3,s3,1

bfc00b3c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc00b3c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc00b40:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc00b44:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc00b48:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc00b4c:	00000000 	nop

bfc00b50 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00b50:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00b54:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00b58:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc00b5c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00b60:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00b64:	240f1926 	li	t7,6438
bfc00b68:	24181926 	li	t8,6438
bfc00b6c:	3c14bfc0 	lui	s4,0xbfc0
bfc00b70:	26940b74 	addiu	s4,s4,2932
bfc00b74:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc00b78:	240f1926 	li	t7,6438
bfc00b7c:	24180817 	li	t8,2071
bfc00b80:	3c14bfc0 	lui	s4,0xbfc0
bfc00b84:	26940b88 	addiu	s4,s4,2952
bfc00b88:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc00b8c:	240f1926 	li	t7,6438
bfc00b90:	3c14bfc0 	lui	s4,0xbfc0
bfc00b94:	26940b98 	addiu	s4,s4,2968
bfc00b98:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc00b9c:	240f1926 	li	t7,6438
bfc00ba0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ba4:	26940ba8 	addiu	s4,s4,2984
bfc00ba8:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc00bac:	240f1926 	li	t7,6438
bfc00bb0:	24181926 	li	t8,6438
bfc00bb4:	3c14bfc0 	lui	s4,0xbfc0
bfc00bb8:	26940bbc 	addiu	s4,s4,3004
bfc00bbc:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00bc0:	240f1926 	li	t7,6438
bfc00bc4:	24180817 	li	t8,2071
bfc00bc8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bcc:	26940bd0 	addiu	s4,s4,3024
bfc00bd0:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00bd4:	240f1926 	li	t7,6438
bfc00bd8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bdc:	26940be0 	addiu	s4,s4,3040
bfc00be0:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00be4:	240f1926 	li	t7,6438
bfc00be8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bec:	26940bf0 	addiu	s4,s4,3056
bfc00bf0:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00bf4:	240f04d2 	li	t7,1234
bfc00bf8:	2418fb2e 	li	t8,-1234
bfc00bfc:	3c14bfc0 	lui	s4,0xbfc0
bfc00c00:	26940c04 	addiu	s4,s4,3076
bfc00c04:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00c08:	240ffb2e 	li	t7,-1234
bfc00c0c:	241804d2 	li	t8,1234
bfc00c10:	3c14bfc0 	lui	s4,0xbfc0
bfc00c14:	26940c18 	addiu	s4,s4,3096
bfc00c18:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc00c1c:	240f04d2 	li	t7,1234
bfc00c20:	3c14bfc0 	lui	s4,0xbfc0
bfc00c24:	26940c28 	addiu	s4,s4,3112
bfc00c28:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc00c2c:	240ffb2e 	li	t7,-1234
bfc00c30:	3c14bfc0 	lui	s4,0xbfc0
bfc00c34:	26940c38 	addiu	s4,s4,3128
bfc00c38:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00c3c:	240f04d2 	li	t7,1234
bfc00c40:	2418fb2e 	li	t8,-1234
bfc00c44:	3c14bfc0 	lui	s4,0xbfc0
bfc00c48:	26940c4c 	addiu	s4,s4,3148
bfc00c4c:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00c50:	240ffb2e 	li	t7,-1234
bfc00c54:	241804d2 	li	t8,1234
bfc00c58:	3c14bfc0 	lui	s4,0xbfc0
bfc00c5c:	26940c60 	addiu	s4,s4,3168
bfc00c60:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00c64:	240f04d2 	li	t7,1234
bfc00c68:	3c14bfc0 	lui	s4,0xbfc0
bfc00c6c:	26940c70 	addiu	s4,s4,3184
bfc00c70:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00c74:	240ffb2e 	li	t7,-1234
bfc00c78:	3c14bfc0 	lui	s4,0xbfc0
bfc00c7c:	26940c80 	addiu	s4,s4,3200
bfc00c80:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00c84:	240f04d2 	li	t7,1234
bfc00c88:	2418fb2e 	li	t8,-1234
bfc00c8c:	3c14bfc0 	lui	s4,0xbfc0
bfc00c90:	26940c94 	addiu	s4,s4,3220
bfc00c94:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00c98:	240ffb2e 	li	t7,-1234
bfc00c9c:	241804d2 	li	t8,1234
bfc00ca0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ca4:	26940ca8 	addiu	s4,s4,3240
bfc00ca8:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00cac:	240f04d2 	li	t7,1234
bfc00cb0:	3c14bfc0 	lui	s4,0xbfc0
bfc00cb4:	26940cb8 	addiu	s4,s4,3256
bfc00cb8:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00cbc:	240ffb2e 	li	t7,-1234
bfc00cc0:	3c14bfc0 	lui	s4,0xbfc0
bfc00cc4:	26940cc8 	addiu	s4,s4,3272
bfc00cc8:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00ccc:	240f04d2 	li	t7,1234
bfc00cd0:	2418fb2e 	li	t8,-1234
bfc00cd4:	3c14bfc0 	lui	s4,0xbfc0
bfc00cd8:	26940cdc 	addiu	s4,s4,3292
bfc00cdc:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00ce0:	240ffb2e 	li	t7,-1234
bfc00ce4:	241804d2 	li	t8,1234
bfc00ce8:	3c14bfc0 	lui	s4,0xbfc0
bfc00cec:	26940cf0 	addiu	s4,s4,3312
bfc00cf0:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00cf4:	240f04d2 	li	t7,1234
bfc00cf8:	3c14bfc0 	lui	s4,0xbfc0
bfc00cfc:	26940d00 	addiu	s4,s4,3328
bfc00d00:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00d04:	240ffb2e 	li	t7,-1234
bfc00d08:	3c14bfc0 	lui	s4,0xbfc0
bfc00d0c:	26940d10 	addiu	s4,s4,3344
bfc00d10:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00d14:	03e01021 	move	v0,ra
bfc00d18:	240f04d2 	li	t7,1234
bfc00d1c:	241804d2 	li	t8,1234
bfc00d20:	51f80002 	beql	t7,t8,bfc00d2c <e1_trap_test+0x1dc>
bfc00d24:	25ef0001 	addiu	t7,t7,1
bfc00d28:	25ef000a 	addiu	t7,t7,10
bfc00d2c:	27180064 	addiu	t8,t8,100
bfc00d30:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00d34:	03e01021 	move	v0,ra
bfc00d38:	240f04d2 	li	t7,1234
bfc00d3c:	2418162e 	li	t8,5678
bfc00d40:	51f80002 	beql	t7,t8,bfc00d4c <e1_trap_test+0x1fc>
bfc00d44:	25ef0001 	addiu	t7,t7,1
bfc00d48:	25ef000a 	addiu	t7,t7,10
bfc00d4c:	27180064 	addiu	t8,t8,100
bfc00d50:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00d54:	03e01021 	move	v0,ra
bfc00d58:	240f162e 	li	t7,5678
bfc00d5c:	241804d2 	li	t8,1234
bfc00d60:	51f80002 	beql	t7,t8,bfc00d6c <e1_trap_test+0x21c>
bfc00d64:	25ef0001 	addiu	t7,t7,1
bfc00d68:	25ef000a 	addiu	t7,t7,10
bfc00d6c:	27180064 	addiu	t8,t8,100
bfc00d70:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00d74:	03e01021 	move	v0,ra
bfc00d78:	240f04d2 	li	t7,1234
bfc00d7c:	241804d2 	li	t8,1234
bfc00d80:	55f80002 	bnel	t7,t8,bfc00d8c <e1_trap_test+0x23c>
bfc00d84:	25ef0001 	addiu	t7,t7,1
bfc00d88:	25ef000a 	addiu	t7,t7,10
bfc00d8c:	27180064 	addiu	t8,t8,100
bfc00d90:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00d94:	03e01021 	move	v0,ra
bfc00d98:	240f04d2 	li	t7,1234
bfc00d9c:	2418162e 	li	t8,5678
bfc00da0:	55f80002 	bnel	t7,t8,bfc00dac <e1_trap_test+0x25c>
bfc00da4:	25ef0001 	addiu	t7,t7,1
bfc00da8:	25ef000a 	addiu	t7,t7,10
bfc00dac:	27180064 	addiu	t8,t8,100
bfc00db0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00db4:	03e01021 	move	v0,ra
bfc00db8:	240f162e 	li	t7,5678
bfc00dbc:	241804d2 	li	t8,1234
bfc00dc0:	55f80002 	bnel	t7,t8,bfc00dcc <e1_trap_test+0x27c>
bfc00dc4:	25ef0001 	addiu	t7,t7,1
bfc00dc8:	25ef000a 	addiu	t7,t7,10
bfc00dcc:	27180064 	addiu	t8,t8,100
bfc00dd0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00dd4:	03e01021 	move	v0,ra
bfc00dd8:	240f04d2 	li	t7,1234
bfc00ddc:	05e30002 	bgezl	t7,bfc00de8 <e1_trap_test+0x298>
bfc00de0:	25ef0001 	addiu	t7,t7,1
bfc00de4:	25ef0014 	addiu	t7,t7,20
bfc00de8:	25ef000a 	addiu	t7,t7,10
bfc00dec:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00df0:	03e01021 	move	v0,ra
bfc00df4:	240f0000 	li	t7,0
bfc00df8:	05e30002 	bgezl	t7,bfc00e04 <e1_trap_test+0x2b4>
bfc00dfc:	25ef0001 	addiu	t7,t7,1
bfc00e00:	25ef0014 	addiu	t7,t7,20
bfc00e04:	25ef000a 	addiu	t7,t7,10
bfc00e08:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00e0c:	03e01021 	move	v0,ra
bfc00e10:	240ffb2e 	li	t7,-1234
bfc00e14:	05e30002 	bgezl	t7,bfc00e20 <e1_trap_test+0x2d0>
bfc00e18:	25ef0001 	addiu	t7,t7,1
bfc00e1c:	25ef0014 	addiu	t7,t7,20
bfc00e20:	25ef000a 	addiu	t7,t7,10
bfc00e24:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00e28:	03e01021 	move	v0,ra
bfc00e2c:	240f04d2 	li	t7,1234
bfc00e30:	5de00002 	bgtzl	t7,bfc00e3c <e1_trap_test+0x2ec>
bfc00e34:	25ef0001 	addiu	t7,t7,1
bfc00e38:	25ef0014 	addiu	t7,t7,20
bfc00e3c:	25ef000a 	addiu	t7,t7,10
bfc00e40:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00e44:	03e01021 	move	v0,ra
bfc00e48:	240f0000 	li	t7,0
bfc00e4c:	5de00002 	bgtzl	t7,bfc00e58 <e1_trap_test+0x308>
bfc00e50:	25ef0001 	addiu	t7,t7,1
bfc00e54:	25ef0014 	addiu	t7,t7,20
bfc00e58:	25ef000a 	addiu	t7,t7,10
bfc00e5c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00e60:	03e01021 	move	v0,ra
bfc00e64:	240ffb2e 	li	t7,-1234
bfc00e68:	5de00002 	bgtzl	t7,bfc00e74 <e1_trap_test+0x324>
bfc00e6c:	25ef0001 	addiu	t7,t7,1
bfc00e70:	25ef0014 	addiu	t7,t7,20
bfc00e74:	25ef000a 	addiu	t7,t7,10
bfc00e78:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00e7c:	03e01021 	move	v0,ra
bfc00e80:	240f04d2 	li	t7,1234
bfc00e84:	05e20002 	bltzl	t7,bfc00e90 <e1_trap_test+0x340>
bfc00e88:	25ef0001 	addiu	t7,t7,1
bfc00e8c:	25ef0014 	addiu	t7,t7,20
bfc00e90:	25ef000a 	addiu	t7,t7,10
bfc00e94:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00e98:	03e01021 	move	v0,ra
bfc00e9c:	240f0000 	li	t7,0
bfc00ea0:	05e20002 	bltzl	t7,bfc00eac <e1_trap_test+0x35c>
bfc00ea4:	25ef0001 	addiu	t7,t7,1
bfc00ea8:	25ef0014 	addiu	t7,t7,20
bfc00eac:	25ef000a 	addiu	t7,t7,10
bfc00eb0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00eb4:	03e01021 	move	v0,ra
bfc00eb8:	240ffb2e 	li	t7,-1234
bfc00ebc:	05e20002 	bltzl	t7,bfc00ec8 <e1_trap_test+0x378>
bfc00ec0:	25ef0001 	addiu	t7,t7,1
bfc00ec4:	25ef0014 	addiu	t7,t7,20
bfc00ec8:	25ef000a 	addiu	t7,t7,10
bfc00ecc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00ed0:	03e01021 	move	v0,ra
bfc00ed4:	240f04d2 	li	t7,1234
bfc00ed8:	59e00002 	blezl	t7,bfc00ee4 <e1_trap_test+0x394>
bfc00edc:	25ef0001 	addiu	t7,t7,1
bfc00ee0:	25ef0014 	addiu	t7,t7,20
bfc00ee4:	25ef000a 	addiu	t7,t7,10
bfc00ee8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00eec:	03e01021 	move	v0,ra
bfc00ef0:	240f0000 	li	t7,0
bfc00ef4:	59e00002 	blezl	t7,bfc00f00 <e1_trap_test+0x3b0>
bfc00ef8:	25ef0001 	addiu	t7,t7,1
bfc00efc:	25ef0014 	addiu	t7,t7,20
bfc00f00:	25ef000a 	addiu	t7,t7,10
bfc00f04:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00f08:	03e01021 	move	v0,ra
bfc00f0c:	240ffb2e 	li	t7,-1234
bfc00f10:	59e00002 	blezl	t7,bfc00f1c <e1_trap_test+0x3cc>
bfc00f14:	25ef0001 	addiu	t7,t7,1
bfc00f18:	25ef0014 	addiu	t7,t7,20
bfc00f1c:	25ef000a 	addiu	t7,t7,10
bfc00f20:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00f24:	03e01021 	move	v0,ra
bfc00f28:	240f04d2 	li	t7,1234
bfc00f2c:	05f30002 	bgezall	t7,bfc00f38 <e1_trap_test+0x3e8>
bfc00f30:	25ef0001 	addiu	t7,t7,1
bfc00f34:	25ef0014 	addiu	t7,t7,20
bfc00f38:	25ef000a 	addiu	t7,t7,10
bfc00f3c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00f40:	03e01021 	move	v0,ra
bfc00f44:	240f0000 	li	t7,0
bfc00f48:	05f30002 	bgezall	t7,bfc00f54 <e1_trap_test+0x404>
bfc00f4c:	25ef0001 	addiu	t7,t7,1
bfc00f50:	25ef0014 	addiu	t7,t7,20
bfc00f54:	25ef000a 	addiu	t7,t7,10
bfc00f58:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00f5c:	03e01021 	move	v0,ra
bfc00f60:	240ffb2e 	li	t7,-1234
bfc00f64:	05f30002 	bgezall	t7,bfc00f70 <e1_trap_test+0x420>
bfc00f68:	25ef0001 	addiu	t7,t7,1
bfc00f6c:	25ef0014 	addiu	t7,t7,20
bfc00f70:	25ef000a 	addiu	t7,t7,10
bfc00f74:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00f78:	26730001 	addiu	s3,s3,1

bfc00f7c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00f7c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00f80:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00f84:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00f88:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00f8c:	00000000 	nop

bfc00f90 <n92_tlbwi_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:9
bfc00f90:	2404005c 	li	a0,92
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:10
bfc00f94:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:12
bfc00f98:	24120000 	li	s2,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:13
bfc00f9c:	241a0010 	li	k0,16

bfc00fa0 <test_phase1_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:15
bfc00fa0:	40920000 	mtc0	s2,$0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:16
bfc00fa4:	3c02efe8 	lui	v0,0xefe8
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:17
bfc00fa8:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:18
bfc00fac:	00124c00 	sll	t1,s2,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:19
bfc00fb0:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:20
bfc00fb4:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:21
bfc00fb8:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:22
bfc00fbc:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:23
bfc00fc0:	aea70000 	sw	a3,0(s5)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:29
bfc00fd8:	3c08ed12 	lui	t0,0xed12
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:30
bfc00fdc:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:31
bfc00fe0:	1468001d 	bne	v1,t0,bfc01058 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:32
bfc00fe4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:33
bfc00fe8:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:34
bfc00fec:	8ea80000 	lw	t0,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:35
bfc00ff0:	3c15abcd 	lui	s5,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:36
bfc00ff4:	36b5ef81 	ori	s5,s5,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:37
bfc00ff8:	16a80017 	bne	s5,t0,bfc01058 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:38
bfc00ffc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:39
bfc01000:	26520001 	addiu	s2,s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:40
bfc01004:	1752ffe6 	bne	k0,s2,bfc00fa0 <test_phase1_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:41
bfc01008:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:42
bfc0100c:	24020000 	li	v0,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:43
bfc01010:	241a0010 	li	k0,16
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:44
bfc01014:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:45
bfc01018:	24030000 	li	v1,0

bfc0101c <test_phase2_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:47
bfc0101c:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:48
bfc01020:	00024c00 	sll	t1,v0,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:49
bfc01024:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:50
bfc01028:	8ea90000 	lw	t1,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:51
bfc0102c:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:52
bfc01030:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:53
bfc01034:	15270008 	bne	t1,a3,bfc01058 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:54
bfc01038:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:55
bfc0103c:	24420001 	addiu	v0,v0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:56
bfc01040:	24090000 	li	t1,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:57
bfc01044:	15230004 	bne	t1,v1,bfc01058 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:58
bfc01048:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:59
bfc0104c:	145afff3 	bne	v0,k0,bfc0101c <test_phase2_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:60
bfc01050:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:62
bfc01054:	26730001 	addiu	s3,s3,1

bfc01058 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:65
bfc01058:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:66
bfc0105c:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:67
bfc01060:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:68
bfc01064:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:69
bfc01068:	00000000 	nop
bfc0106c:	00000000 	nop

bfc01070 <e3_madd_msub_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc01070:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc01074:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc01078:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc0107c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc01080:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc01084:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc01088:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc0108c:	24091234 	li	t1,4660
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc01090:	240a5678 	li	t2,22136
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc01094:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc01098:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc0109c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc010a0:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc010a4:	712a0004 	0x712a0004
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc010a8:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc010ac:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc010b0:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc010b4:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc010b8:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc010bc:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc010c0:	712a0001 	0x712a0001
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc010c4:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc010c8:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc010cc:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc010d0:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc010d4:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc010d8:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc010dc:	712a0000 	0x712a0000
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc010e0:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc010e4:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc010e8:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc010ec:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc010f0:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc010f4:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc010f8:	712a0005 	0x712a0005
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc010fc:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc01100:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc01104:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc01108:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc0110c:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc01110:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc01114:	712a0004 	0x712a0004
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc01118:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc0111c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc01120:	26730001 	addiu	s3,s3,1

bfc01124 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc01124:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc01128:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc0112c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc01130:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc01134:	00000000 	nop
	...

bfc01140 <e4_ll_sc>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc01140:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc01144:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc01148:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc0114c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc01150:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc01154:	3c088000 	lui	t0,0x8000
bfc01158:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc0115c:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc01160:	ad090004 	sw	t1,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc01164:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc01168:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc0116c:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc01170:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc01174:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc01178:	0000000c 	syscall
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc0117c:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc01180:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc01184:	240c04d6 	li	t4,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc01188:	156c0002 	bne	t3,t4,bfc01194 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc0118c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc01190:	26730001 	addiu	s3,s3,1

bfc01194 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc01194:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc01198:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc0119c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc011a0:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc011a4:	00000000 	nop
	...

bfc011b0 <e2_clo_clz_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc011b0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc011b4:	40805800 	mtc0	zero,$11
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc011b8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc011bc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc011c0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc011c4:	3c08e234 	lui	t0,0xe234
bfc011c8:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc011cc:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc011d0:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc011d4:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc011d8:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc011dc:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc011e0:	3c081926 	lui	t0,0x1926
bfc011e4:	35080817 	ori	t0,t0,0x817
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc011e8:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc011ec:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc011f0:	2408000e 	li	t0,14
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc011f4:	71094821 	0x71094821
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc011f8:	71094820 	0x71094820
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc011fc:	26730001 	addiu	s3,s3,1

bfc01200 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc01200:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc01204:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc01208:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc0120c:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc01210:	00000000 	nop
	...

bfc01220 <n93_tlbwr_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:9
bfc01220:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:10
bfc01224:	2404005d 	li	a0,93

bfc01228 <test_gbit_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:13
bfc01228:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:14
bfc0122c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:15
bfc01230:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:16
bfc01234:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:17
bfc01238:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:18
bfc0123c:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:19
bfc01240:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:20
bfc01244:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:21
bfc01248:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:22
bfc0124c:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:23
bfc01250:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:24
bfc01254:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:30
bfc0126c:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:31
bfc01270:	3508dc16 	ori	t0,t0,0xdc16
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:32
bfc01274:	14680064 	bne	v1,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:33
bfc01278:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:34
bfc0127c:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:35
bfc01280:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:36
bfc01284:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:37
bfc01288:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:38
bfc0128c:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:39
bfc01290:	14e8005d 	bne	a3,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:40
bfc01294:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:41
bfc01298:	3c128010 	lui	s2,0x8010
bfc0129c:	36520124 	ori	s2,s2,0x124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:42
bfc012a0:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:43
bfc012a4:	14e80058 	bne	a3,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:44
bfc012a8:	00000000 	nop

bfc012ac <test_asid_match>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:46
bfc012ac:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:47
bfc012b0:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:48
bfc012b4:	3c120012 	lui	s2,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:49
bfc012b8:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:50
bfc012bc:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:51
bfc012c0:	3c150012 	lui	s5,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:52
bfc012c4:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:53
bfc012c8:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:54
bfc012cc:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:55
bfc012d0:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:56
bfc012d4:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:57
bfc012d8:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:63
bfc012f0:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:64
bfc012f4:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:65
bfc012f8:	14680043 	bne	v1,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:66
bfc012fc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:67
bfc01300:	3c150013 	lui	s5,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:68
bfc01304:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:69
bfc01308:	40955000 	mtc0	s5,$10
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:70
bfc0130c:	3c120013 	lui	s2,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:71
bfc01310:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:72
bfc01314:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:73
bfc01318:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:74
bfc0131c:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:75
bfc01320:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:76
bfc01324:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:77
bfc01328:	14e80037 	bne	a3,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:78
bfc0132c:	00000000 	nop

bfc01330 <test_asid_2>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:80
bfc01330:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:81
bfc01334:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:82
bfc01338:	3c120014 	lui	s2,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:83
bfc0133c:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:84
bfc01340:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:85
bfc01344:	3c150014 	lui	s5,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:86
bfc01348:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:87
bfc0134c:	3c07bd86 	lui	a3,0xbd86
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:88
bfc01350:	34e713ac 	ori	a3,a3,0x13ac
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:89
bfc01354:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:90
bfc01358:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:91
bfc0135c:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:97
bfc01374:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:98
bfc01378:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:99
bfc0137c:	14680022 	bne	v1,t0,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:100
bfc01380:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:101
bfc01384:	3c120015 	lui	s2,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:102
bfc01388:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:103
bfc0138c:	3c150015 	lui	s5,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:104
bfc01390:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:105
bfc01394:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:106
bfc01398:	24094002 	li	t1,16386
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:107
bfc0139c:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:108
bfc013a0:	8e470000 	lw	a3,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:109
bfc013a4:	3c07ed08 	lui	a3,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:110
bfc013a8:	34e7dc18 	ori	a3,a3,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:111
bfc013ac:	14e30016 	bne	a3,v1,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:112
bfc013b0:	00000000 	nop

bfc013b4 <test_tlbp>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:114
bfc013b4:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:115
bfc013b8:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:116
bfc013bc:	40955000 	mtc0	s5,$10
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:117
bfc013c0:	40801000 	mtc0	zero,$2
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:118
bfc013c4:	40801800 	mtc0	zero,$3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:119
bfc013c8:	42000008 	tlbp
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:120
bfc013cc:	42000001 	tlbr
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:121
bfc013d0:	40805000 	mtc0	zero,$10
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:122
bfc013d4:	400b1000 	mfc0	t3,$2
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:123
bfc013d8:	240c4007 	li	t4,16391
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:124
bfc013dc:	156c000a 	bne	t3,t4,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:125
bfc013e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:126
bfc013e4:	400b1800 	mfc0	t3,$3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:127
bfc013e8:	240c4007 	li	t4,16391
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:128
bfc013ec:	156c0006 	bne	t3,t4,bfc01408 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:129
bfc013f0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:130
bfc013f4:	40801000 	mtc0	zero,$2
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:131
bfc013f8:	40801800 	mtc0	zero,$3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:132
bfc013fc:	42000002 	tlbwi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:133
bfc01400:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:135
bfc01404:	26730001 	addiu	s3,s3,1

bfc01408 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:138
bfc01408:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:139
bfc0140c:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:140
bfc01410:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:141
bfc01414:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:142
bfc01418:	00000000 	nop
bfc0141c:	00000000 	nop
bfc01420:	9f3f7f7c 	0x9f3f7f7c
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
  14:	000009ec 	0x9ec
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc009f0 	0xbfc009f0
  34:	0000009c 	0x9c
	...
  40:	0000001c 	0x1c
  44:	00d10002 	0xd10002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc00a90 	0xbfc00a90
  54:	00000060 	0x60
	...
  60:	0000001c 	0x1c
  64:	01440002 	0x1440002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00af0 	0xbfc00af0
  74:	00000060 	0x60
	...
  80:	0000001c 	0x1c
  84:	01b10002 	0x1b10002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00b50 	0xbfc00b50
  94:	00000440 	sll	zero,zero,0x11
	...
  a0:	0000001c 	0x1c
  a4:	021e0002 	0x21e0002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00f90 	0xbfc00f90
  b4:	000000dc 	0xdc
	...
  c0:	0000001c 	0x1c
  c4:	02880002 	0x2880002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc01070 	0xbfc01070
  d4:	000000c8 	0xc8
	...
  e0:	0000001c 	0x1c
  e4:	02f50002 	0x2f50002
  e8:	00040000 	sll	zero,a0,0x0
  ec:	00000000 	nop
  f0:	bfc01140 	0xbfc01140
  f4:	00000068 	0x68
	...
 100:	0000001c 	0x1c
 104:	035e0002 	0x35e0002
 108:	00040000 	sll	zero,a0,0x0
 10c:	00000000 	nop
 110:	bfc011b0 	0xbfc011b0
 114:	00000064 	0x64
	...
 120:	0000001c 	0x1c
 124:	03c90002 	0x3c90002
 128:	00040000 	sll	zero,a0,0x0
 12c:	00000000 	nop
 130:	bfc01220 	0xbfc01220
 134:	000001fc 	0x1fc
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00a18 	0xbfc00a18
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00a90 	0xbfc00a90
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00af0 	0xbfc00af0
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00b50 	0xbfc00b50
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00f90 	0xbfc00f90
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc01070 	0xbfc01070
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc01140 	0xbfc01140
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc011b0 	0xbfc011b0
	...
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	bfc01220 	0xbfc01220
	...
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000001dd 	0x1dd
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
  34:	4b4b4b4b 	c2	0x14b4b4b
  38:	4b4b4d4b 	c2	0x14b4d4b
  3c:	024b4b4b 	0x24b4b4b
  40:	4b1601b8 	c2	0x11601b8
  44:	4d4b4b4b 	0x4d4b4b4b
  48:	4b834b4b 	c2	0x1834b4b
  4c:	4b4b4c4b 	c2	0x14b4c4b
  50:	d4024b4b 	ldc1	$f2,19275(zero)
  54:	4b4b1801 	c2	0x14b1801
  58:	4b4b4b4b 	c2	0x14b4b4b
  5c:	4b4b4b4b 	c2	0x14b4b4b
  60:	02d4024b 	0x2d4024b
  64:	4b4b4b19 	c2	0x14b4b19
  68:	4b4b4b4b 	c2	0x14b4b4b
  6c:	4b4b4b4b 	c2	0x14b4b4b
  70:	4b4b4b4b 	c2	0x14b4b4b
  74:	4b4b4b4b 	c2	0x14b4b4b
  78:	4b4b4b4b 	c2	0x14b4b4b
  7c:	4b4b4b4b 	c2	0x14b4b4b
  80:	4b4b4b4b 	c2	0x14b4b4b
  84:	4b4b4d4b 	c2	0x14b4d4b
  88:	4b4b4b4b 	c2	0x14b4b4b
  8c:	4b4b4b4b 	c2	0x14b4b4b
  90:	4b4b4b4b 	c2	0x14b4b4b
  94:	4b4d4b4b 	c2	0x14d4b4b
  98:	4b4b4b4b 	c2	0x14b4b4b
  9c:	4b4b4b4b 	c2	0x14b4b4b
  a0:	4b4b4b4b 	c2	0x14b4b4b
  a4:	4f4b4b4b 	c3	0x14b4b4b
  a8:	4b4b4b4b 	c2	0x14b4b4b
  ac:	4b4b4b4b 	c2	0x14b4b4b
  b0:	4b4b4b4b 	c2	0x14b4b4b
  b4:	4b4b4b4b 	c2	0x14b4b4b
  b8:	4b4b4b4d 	c2	0x14b4b4d
  bc:	4b4b4b4b 	c2	0x14b4b4b
  c0:	4b4b4b4b 	c2	0x14b4b4b
  c4:	4b4b4b4b 	c2	0x14b4b4b
  c8:	4b4b4b4d 	c2	0x14b4b4d
  cc:	4b4b4b4b 	c2	0x14b4b4b
  d0:	4b4b4b4b 	c2	0x14b4b4b
  d4:	4b4b4b4b 	c2	0x14b4b4b
  d8:	4b4b4d4b 	c2	0x14b4d4b
  dc:	4b4b4b4b 	c2	0x14b4b4b
  e0:	4b4b4b4b 	c2	0x14b4b4b
  e4:	4b4b4b4b 	c2	0x14b4b4b
  e8:	4b4d4b4b 	c2	0x14d4b4b
  ec:	4b4b4b4b 	c2	0x14b4b4b
  f0:	4b4b4b4b 	c2	0x14b4b4b
  f4:	4b4b4b4b 	c2	0x14b4b4b
  f8:	4b4b4b4b 	c2	0x14b4b4b
  fc:	4b4b4b4d 	c2	0x14b4b4d
 100:	4b4b4b4b 	c2	0x14b4b4b
 104:	4b4b4b4b 	c2	0x14b4b4b
 108:	4b4b4b4b 	c2	0x14b4b4b
 10c:	4b4b4d4b 	c2	0x14b4d4b
 110:	4b4b4b4b 	c2	0x14b4b4b
 114:	084be508 	j	12f9420 <data_size+0x12f9410>
 118:	834b4be5 	lb	t3,19429(k0)
 11c:	4b4b834b 	c2	0x14b834b
 120:	4b4b4b83 	c2	0x14b4b83
 124:	4b4b4b83 	c2	0x14b4b83
 128:	4b4b4b4d 	c2	0x14b4b4d
 12c:	4b4b4b83 	c2	0x14b4b83
 130:	4b4b4b4c 	c2	0x14b4b4c
 134:	4d4c4d4b 	0x4d4c4d4b
 138:	4b4b834b 	c2	0x14b834b
 13c:	4b4b4b83 	c2	0x14b4b83
 140:	4b4c4b4b 	c2	0x14c4b4b
 144:	834c4b4b 	lb	t4,19275(k0)
 148:	4b83834c 	c2	0x183834c
 14c:	4c4b4b4b 	0x4c4b4b4b
 150:	4b4b4b4d 	c2	0x14b4b4d
 154:	4b4b4b4b 	c2	0x14b4b4b
 158:	4b4b4b4b 	c2	0x14b4b4b
 15c:	4b4e4c4c 	c2	0x14e4c4c
 160:	4b4b4b83 	c2	0x14b4b83
 164:	4b4b4e4c 	c2	0x14b4e4c
 168:	4b4b4b4b 	c2	0x14b4b4b
 16c:	4b4b4b4b 	c2	0x14b4b4b
 170:	4c4d4b4b 	0x4c4d4b4b
 174:	8483834f 	lh	v1,-31921(a0)
 178:	4b4c4b4b 	c2	0x14c4b4b
 17c:	834c4c4b 	lb	t4,19531(k0)
 180:	4d4b4b4b 	0x4d4b4b4b
 184:	4b4b4b4b 	c2	0x14b4b4b
 188:	4b4b4b4b 	c2	0x14b4b4b
 18c:	4b4b4b4b 	c2	0x14b4b4b
 190:	4c4b4b4b 	0x4c4b4b4b
 194:	4b4d4b83 	c2	0x14d4b83
 198:	4b4b4b4b 	c2	0x14b4b4b
 19c:	4b4b4b4b 	c2	0x14b4b4b
 1a0:	4b4b4b4b 	c2	0x14b4b4b
 1a4:	834d4b4b 	lb	t5,19275(k0)
 1a8:	4b4b4b4b 	c2	0x14b4b4b
 1ac:	4b4b4c4b 	c2	0x14b4c4b
 1b0:	4b4b4b4b 	c2	0x14b4b4b
 1b4:	4d4b4c4b 	0x4d4b4c4b
 1b8:	834c4b4b 	lb	t4,19275(k0)
 1bc:	4b4c8483 	c2	0x14c8483
 1c0:	4c4b4b4b 	0x4c4b4b4b
 1c4:	4b83834b 	c2	0x183834b
 1c8:	834d4b4d 	lb	t5,19277(k0)
 1cc:	4b4b4b4d 	c2	0x14b4b4d
 1d0:	4b4b4d4d 	c2	0x14b4d4d
 1d4:	4b4b4b4b 	c2	0x14b4b4b
 1d8:	4b4b4b4c 	c2	0x14b4b4c
 1dc:	01000402 	0x1000402
 1e0:	00005d01 	0x5d01
 1e4:	28000200 	slti	zero,zero,512
 1e8:	01000000 	0x1000000
 1ec:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 1f0:	01010100 	0x1010100
 1f4:	00000001 	0x1
 1f8:	01000001 	0x1000001
 1fc:	5f366500 	0x5f366500
 200:	7070616d 	0x7070616d
 204:	695f6465 	0x695f6465
 208:	7274736e 	0x7274736e
 20c:	0000532e 	0x532e
 210:	00000000 	nop
 214:	09f00205 	j	7c00814 <data_size+0x7c00804>
 218:	4b19bfc0 	c2	0x119bfc0
 21c:	4b4b4c4b 	c2	0x14b4c4b
 220:	864b4b4b 	lh	t3,19275(s2)
 224:	4b4c4b4b 	c2	0x14c4b4b
 228:	4b834b4b 	c2	0x1834b4b
 22c:	4b4b4b4b 	c2	0x14b4b4b
 230:	4b4b4b83 	c2	0x14b4b83
 234:	4d4d834b 	0x4d4d834b
 238:	4b4b4b4b 	c2	0x14b4b4b
 23c:	0004024b 	0x4024b
 240:	00550101 	0x550101
 244:	00020000 	sll	zero,v0,0x0
 248:	0000002b 	sltu	zero,zero,zero
 24c:	0efb0101 	jal	bec0404 <data_size+0xbec03f4>
 250:	0101000d 	break	0x101
 254:	00000101 	0x101
 258:	00000100 	sll	zero,zero,0x4
 25c:	37650001 	ori	a1,k1,0x1
 260:	626c745f 	0x626c745f
 264:	756f645f 	jalx	5bd917c <data_size+0x5bd916c>
 268:	5f656c62 	0x5f656c62
 26c:	7373696d 	0x7373696d
 270:	0000532e 	0x532e
 274:	00000000 	nop
 278:	0a900205 	j	a400814 <data_size+0xa400804>
 27c:	4b18bfc0 	c2	0x118bfc0
 280:	4b4b4b4c 	c2	0x14b4b4c
 284:	4b4b4b4b 	c2	0x14b4b4b
 288:	4b4b4b4b 	c2	0x14b4b4b
 28c:	4b4b4b4b 	c2	0x14b4b4b
 290:	4b4b4d4c 	c2	0x14b4d4c
 294:	04024b4b 	bltzl	zero,12fc4 <data_size+0x12fb4>
 298:	4e010100 	c3	0x10100
 29c:	02000000 	0x2000000
 2a0:	00002500 	sll	a0,zero,0x14
 2a4:	fb010100 	sdc2	$1,256(t8)
 2a8:	01000d0e 	0x1000d0e
 2ac:	00010101 	0x10101
 2b0:	00010000 	sll	zero,at,0x0
 2b4:	65000100 	0x65000100
 2b8:	6f6d5f35 	0x6f6d5f35
 2bc:	6d5f7a76 	0x6d5f7a76
 2c0:	2e6e766f 	sltiu	t6,s3,30319
 2c4:	00000053 	0x53
 2c8:	05000000 	bltz	t0,2cc <data_size+0x2bc>
 2cc:	c00af002 	ll	t2,-4094(zero)
 2d0:	4b4b19bf 	c2	0x14b19bf
 2d4:	4b504b4b 	c2	0x1504b4b
 2d8:	4b4b4b4b 	c2	0x14b4b4b
 2dc:	4b4b4b4b 	c2	0x14b4b4b
 2e0:	4d4f4b83 	0x4d4f4b83
 2e4:	4b4b4b4b 	c2	0x14b4b4b
 2e8:	01000402 	0x1000402
 2ec:	00009001 	0x9001
 2f0:	25000200 	addiu	zero,t0,512
 2f4:	01000000 	0x1000000
 2f8:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 2fc:	01010100 	0x1010100
 300:	00000001 	0x1
 304:	01000001 	0x1000001
 308:	5f316500 	0x5f316500
 30c:	70617274 	0x70617274
 310:	7365745f 	0x7365745f
 314:	00532e74 	teq	v0,s3,0xb9
 318:	00000000 	nop
 31c:	50020500 	beql	zero,v0,1720 <data_size+0x1710>
 320:	19bfc00b 	0x19bfc00b
 324:	4b4b4b4b 	c2	0x14b4b4b
 328:	083d084d 	j	f42134 <data_size+0xf42124>
 32c:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 330:	f33d083d 	0xf33d083d
 334:	083d08f4 	j	f423d0 <data_size+0xf423c0>
 338:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 33c:	f33d083d 	0xf33d083d
 340:	083d08f3 	j	f423cc <data_size+0xf423bc>
 344:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 348:	f33d083d 	0xf33d083d
 34c:	08e508f4 	j	39423d0 <data_size+0x39423c0>
 350:	08e508e5 	j	3942394 <data_size+0x3942384>
 354:	08e508e5 	j	3942394 <data_size+0x3942384>
 358:	08ad08e5 	j	2b42394 <data_size+0x2b42384>
 35c:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 360:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 364:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 368:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 36c:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 370:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 374:	4db008ad 	0x4db008ad
 378:	4b4b4b4b 	c2	0x14b4b4b
 37c:	01000402 	0x1000402
 380:	00006b01 	0x6b01
 384:	22000200 	addi	zero,s0,512
 388:	01000000 	0x1000000
 38c:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 390:	01010100 	0x1010100
 394:	00000001 	0x1
 398:	01000001 	0x1000001
 39c:	32396e00 	andi	t9,s1,0x6e00
 3a0:	626c745f 	0x626c745f
 3a4:	532e6977 	beql	t9,t6,1a984 <data_size+0x1a974>
 3a8:	00000000 	nop
 3ac:	02050000 	0x2050000
 3b0:	bfc00f90 	0xbfc00f90
 3b4:	4b4c4b1a 	c2	0x14c4b1a
 3b8:	4b4b4b4c 	c2	0x14b4b4c
 3bc:	4b4b4b4b 	c2	0x14b4b4b
 3c0:	4b4b4b4b 	c2	0x14b4b4b
 3c4:	4b4b4b4b 	c2	0x14b4b4b
 3c8:	4b4b4b4b 	c2	0x14b4b4b
 3cc:	4b4b4b4b 	c2	0x14b4b4b
 3d0:	4b4b4b4b 	c2	0x14b4b4b
 3d4:	4c4b4b4b 	0x4c4b4b4b
 3d8:	4b4b4b4b 	c2	0x14b4b4b
 3dc:	4b4b4b4b 	c2	0x14b4b4b
 3e0:	4b4b4b4b 	c2	0x14b4b4b
 3e4:	4b4d4c4b 	c2	0x14d4c4b
 3e8:	024b4b4b 	0x24b4b4b
 3ec:	01010004 	sllv	zero,at,t0
 3f0:	00000069 	0x69
 3f4:	00250002 	0x250002
 3f8:	01010000 	0x1010000
 3fc:	000d0efb 	0xd0efb
 400:	01010101 	0x1010101
 404:	01000000 	0x1000000
 408:	00010000 	sll	zero,at,0x0
 40c:	6d5f3365 	0x6d5f3365
 410:	5f646461 	0x5f646461
 414:	6275736d 	0x6275736d
 418:	0000532e 	0x532e
 41c:	00000000 	nop
 420:	10700205 	beq	v1,s0,c38 <data_size+0xc28>
 424:	4b19bfc0 	c2	0x119bfc0
 428:	4d4b4b4b 	0x4d4b4b4b
 42c:	4b4b4b4b 	c2	0x14b4b4b
 430:	4b4b4b4b 	c2	0x14b4b4b
 434:	4b4b4b4b 	c2	0x14b4b4b
 438:	4b4b4b4b 	c2	0x14b4b4b
 43c:	4b4b4b4b 	c2	0x14b4b4b
 440:	4b4b4b4b 	c2	0x14b4b4b
 444:	4b4b4b4b 	c2	0x14b4b4b
 448:	4b4b4b4b 	c2	0x14b4b4b
 44c:	4b4b4b4b 	c2	0x14b4b4b
 450:	4d4e4b4b 	0x4d4e4b4b
 454:	4b4b4b4b 	c2	0x14b4b4b
 458:	01000402 	0x1000402
 45c:	00004c01 	0x4c01
 460:	21000200 	addi	zero,t0,512
 464:	01000000 	0x1000000
 468:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 46c:	01010100 	0x1010100
 470:	00000001 	0x1
 474:	01000001 	0x1000001
 478:	5f346500 	0x5f346500
 47c:	735f6c6c 	0x735f6c6c
 480:	00532e63 	0x532e63
 484:	00000000 	nop
 488:	40020500 	0x40020500
 48c:	19bfc011 	0x19bfc011
 490:	4b4b4b4b 	c2	0x14b4b4b
 494:	4b4b8350 	c2	0x14b8350
 498:	4b4c4b4b 	c2	0x14c4b4b
 49c:	4b4c4b4b 	c2	0x14c4b4b
 4a0:	4d4f4b4b 	0x4d4f4b4b
 4a4:	4b4b4b4b 	c2	0x14b4b4b
 4a8:	01000402 	0x1000402
 4ac:	00004c01 	0x4c01
 4b0:	23000200 	addi	zero,t8,512
 4b4:	01000000 	0x1000000
 4b8:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 4bc:	01010100 	0x1010100
 4c0:	00000001 	0x1
 4c4:	01000001 	0x1000001
 4c8:	5f326500 	0x5f326500
 4cc:	5f6f6c63 	0x5f6f6c63
 4d0:	2e7a6c63 	sltiu	k0,s3,27747
 4d4:	00000053 	0x53
 4d8:	05000000 	bltz	t0,4dc <data_size+0x4cc>
 4dc:	c011b002 	ll	s1,-20478(zero)
 4e0:	4b4b19bf 	c2	0x14b19bf
 4e4:	834d4b4b 	lb	t5,19275(k0)
 4e8:	4b4b4b4b 	c2	0x14b4b4b
 4ec:	4b4b834b 	c2	0x14b834b
 4f0:	4d4e4b4b 	0x4d4e4b4b
 4f4:	4b4b4b4b 	c2	0x14b4b4b
 4f8:	01000402 	0x1000402
 4fc:	0000b201 	0xb201
 500:	22000200 	addi	zero,s0,512
 504:	01000000 	0x1000000
 508:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 50c:	01010100 	0x1010100
 510:	00000001 	0x1
 514:	01000001 	0x1000001
 518:	33396e00 	andi	t9,t9,0x6e00
 51c:	626c745f 	0x626c745f
 520:	532e7277 	beql	t9,t6,1cf00 <data_size+0x1cef0>
 524:	00000000 	nop
 528:	02050000 	0x2050000
 52c:	bfc01220 	0xbfc01220
 530:	4b4d4b1a 	c2	0x14d4b1a
 534:	4b4b4b4b 	c2	0x14b4b4b
 538:	4b4b4b4b 	c2	0x14b4b4b
 53c:	4b4b4b4b 	c2	0x14b4b4b
 540:	4b4b4b4b 	c2	0x14b4b4b
 544:	4b4b4b4b 	c2	0x14b4b4b
 548:	4b4b4b4b 	c2	0x14b4b4b
 54c:	834b4b4b 	lb	t3,19275(k0)
 550:	4b4c4b4b 	c2	0x14c4b4b
 554:	4b4b4b4b 	c2	0x14b4b4b
 558:	4b4b4b4b 	c2	0x14b4b4b
 55c:	4b4b4b4b 	c2	0x14b4b4b
 560:	4b4b4b4b 	c2	0x14b4b4b
 564:	4b4b4b4b 	c2	0x14b4b4b
 568:	4b4b4b4b 	c2	0x14b4b4b
 56c:	4b4b4b4b 	c2	0x14b4b4b
 570:	4c4b4b4b 	0x4c4b4b4b
 574:	4b4b4b4b 	c2	0x14b4b4b
 578:	4b4b4b4b 	c2	0x14b4b4b
 57c:	4b4b4b4b 	c2	0x14b4b4b
 580:	4b4b4b4b 	c2	0x14b4b4b
 584:	4b4b4b4b 	c2	0x14b4b4b
 588:	4b4b4b4b 	c2	0x14b4b4b
 58c:	4b4b4b4b 	c2	0x14b4b4b
 590:	4b4b4b4b 	c2	0x14b4b4b
 594:	4b4b4b4c 	c2	0x14b4b4c
 598:	4b4b4b4b 	c2	0x14b4b4b
 59c:	4b4b4b4b 	c2	0x14b4b4b
 5a0:	4b4b4b4b 	c2	0x14b4b4b
 5a4:	4b4b4b4b 	c2	0x14b4b4b
 5a8:	4b4b4d4c 	c2	0x14b4d4c
 5ac:	04024b4b 	bltzl	zero,132dc <data_size+0x132cc>
 5b0:	Address 0x00000000000005b0 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc009ec 	0xbfc009ec
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
  60:	00006c80 	sll	t5,zero,0x12
  64:	14000200 	bnez	zero,868 <data_size+0x858>
  68:	04000000 	bltz	zero,6c <data_size+0x5c>
  6c:	0001e101 	0x1e101
  70:	c009f000 	ll	t1,-4096(zero)
  74:	c00a8cbf 	ll	t2,-29505(zero)
  78:	5f3665bf 	0x5f3665bf
  7c:	7070616d 	0x7070616d
  80:	695f6465 	0x695f6465
  84:	7274736e 	0x7274736e
  88:	2f00532e 	sltiu	zero,t8,21294
  8c:	656d6f68 	0x656d6f68
  90:	62786c2f 	0x62786c2f
  94:	6f72702f 	0x6f72702f
  98:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
  9c:	6f6f6c2f 	0x6f6f6c2f
  a0:	676e6f6f 	0x676e6f6f
  a4:	2f6e6f73 	sltiu	t6,k1,28531
  a8:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
  ac:	6e75662f 	0x6e75662f
  b0:	78655f63 	0x78655f63
  b4:	646e6574 	0x646e6574
  b8:	692f6465 	0x692f6465
  bc:	0074736e 	0x74736e
  c0:	20554e47 	addi	s5,v0,20039
  c4:	32205341 	andi	zero,s1,0x5341
  c8:	2e38312e 	sltiu	t8,s1,12590
  cc:	01003035 	0x1003035
  d0:	00006f80 	sll	t5,zero,0x1e
  d4:	28000200 	slti	zero,zero,512
  d8:	04000000 	bltz	zero,dc <data_size+0xcc>
  dc:	00024201 	0x24201
  e0:	c00a9000 	ll	t2,-28672(zero)
  e4:	c00af0bf 	ll	t2,-3905(zero)
  e8:	5f3765bf 	0x5f3765bf
  ec:	5f626c74 	0x5f626c74
  f0:	62756f64 	0x62756f64
  f4:	6d5f656c 	0x6d5f656c
  f8:	2e737369 	sltiu	s3,s3,29545
  fc:	682f0053 	0x682f0053
 100:	2f656d6f 	sltiu	a1,k1,28015
 104:	2f62786c 	sltiu	v0,k1,30828
 108:	6a6f7270 	0x6a6f7270
 10c:	2f746365 	sltiu	s4,k1,25445
 110:	6f6f6f6c 	0x6f6f6f6c
 114:	73676e6f 	0x73676e6f
 118:	732f6e6f 	0x732f6e6f
 11c:	2f74666f 	sltiu	s4,k1,26223
 120:	636e7566 	0x636e7566
 124:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 128:	65646e65 	0x65646e65
 12c:	6e692f64 	0x6e692f64
 130:	47007473 	c1	0x1007473
 134:	4120554e 	0x4120554e
 138:	2e322053 	sltiu	s2,s1,8275
 13c:	352e3831 	ori	t6,t1,0x3831
 140:	80010030 	lb	at,48(zero)
 144:	00000069 	0x69
 148:	003c0002 	0x3c0002
 14c:	01040000 	0x1040000
 150:	0000029b 	0x29b
 154:	bfc00af0 	0xbfc00af0
 158:	bfc00b50 	0xbfc00b50
 15c:	6d5f3565 	0x6d5f3565
 160:	5f7a766f 	0x5f7a766f
 164:	6e766f6d 	0x6e766f6d
 168:	2f00532e 	sltiu	zero,t8,21294
 16c:	656d6f68 	0x656d6f68
 170:	62786c2f 	0x62786c2f
 174:	6f72702f 	0x6f72702f
 178:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 17c:	6f6f6c2f 	0x6f6f6c2f
 180:	676e6f6f 	0x676e6f6f
 184:	2f6e6f73 	sltiu	t6,k1,28531
 188:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 18c:	6e75662f 	0x6e75662f
 190:	78655f63 	0x78655f63
 194:	646e6574 	0x646e6574
 198:	692f6465 	0x692f6465
 19c:	0074736e 	0x74736e
 1a0:	20554e47 	addi	s5,v0,20039
 1a4:	32205341 	andi	zero,s1,0x5341
 1a8:	2e38312e 	sltiu	t8,s1,12590
 1ac:	01003035 	0x1003035
 1b0:	00006980 	sll	t5,zero,0x6
 1b4:	50000200 	beqzl	zero,9b8 <data_size+0x9a8>
 1b8:	04000000 	bltz	zero,1bc <data_size+0x1ac>
 1bc:	0002ed01 	0x2ed01
 1c0:	c00b5000 	ll	t3,20480(zero)
 1c4:	c00f90bf 	ll	t7,-28481(zero)
 1c8:	5f3165bf 	0x5f3165bf
 1cc:	70617274 	0x70617274
 1d0:	7365745f 	0x7365745f
 1d4:	00532e74 	teq	v0,s3,0xb9
 1d8:	6d6f682f 	0x6d6f682f
 1dc:	786c2f65 	0x786c2f65
 1e0:	72702f62 	0x72702f62
 1e4:	63656a6f 	0x63656a6f
 1e8:	6f6c2f74 	0x6f6c2f74
 1ec:	6e6f6f6f 	0x6e6f6f6f
 1f0:	6e6f7367 	0x6e6f7367
 1f4:	666f732f 	0x666f732f
 1f8:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 1fc:	655f636e 	0x655f636e
 200:	6e657478 	0x6e657478
 204:	2f646564 	sltiu	a0,k1,25956
 208:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 20c:	554e4700 	bnel	t2,t6,11e10 <data_size+0x11e00>
 210:	20534120 	addi	s3,v0,16672
 214:	38312e32 	xori	s1,at,0x2e32
 218:	0030352e 	0x30352e
 21c:	00668001 	0x668001
 220:	00020000 	sll	zero,v0,0x0
 224:	00000064 	0x64
 228:	03810104 	0x3810104
 22c:	0f900000 	jal	e400000 <data_size+0xe3ffff0>
 230:	106cbfc0 	beq	v1,t4,ffff0134 <_etext+0x403eecfc>
 234:	396ebfc0 	xori	t6,t3,0xbfc0
 238:	6c745f32 	0x6c745f32
 23c:	2e697762 	sltiu	t1,s3,30562
 240:	682f0053 	0x682f0053
 244:	2f656d6f 	sltiu	a1,k1,28015
 248:	2f62786c 	sltiu	v0,k1,30828
 24c:	6a6f7270 	0x6a6f7270
 250:	2f746365 	sltiu	s4,k1,25445
 254:	6f6f6f6c 	0x6f6f6f6c
 258:	73676e6f 	0x73676e6f
 25c:	732f6e6f 	0x732f6e6f
 260:	2f74666f 	sltiu	s4,k1,26223
 264:	636e7566 	0x636e7566
 268:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 26c:	65646e65 	0x65646e65
 270:	6e692f64 	0x6e692f64
 274:	47007473 	c1	0x1007473
 278:	4120554e 	0x4120554e
 27c:	2e322053 	sltiu	s2,s1,8275
 280:	352e3831 	ori	t6,t1,0x3831
 284:	80010030 	lb	at,48(zero)
 288:	00000069 	0x69
 28c:	00780002 	0x780002
 290:	01040000 	0x1040000
 294:	000003f0 	tge	zero,zero,0xf
 298:	bfc01070 	0xbfc01070
 29c:	bfc01138 	0xbfc01138
 2a0:	6d5f3365 	0x6d5f3365
 2a4:	5f646461 	0x5f646461
 2a8:	6275736d 	0x6275736d
 2ac:	2f00532e 	sltiu	zero,t8,21294
 2b0:	656d6f68 	0x656d6f68
 2b4:	62786c2f 	0x62786c2f
 2b8:	6f72702f 	0x6f72702f
 2bc:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 2c0:	6f6f6c2f 	0x6f6f6c2f
 2c4:	676e6f6f 	0x676e6f6f
 2c8:	2f6e6f73 	sltiu	t6,k1,28531
 2cc:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 2d0:	6e75662f 	0x6e75662f
 2d4:	78655f63 	0x78655f63
 2d8:	646e6574 	0x646e6574
 2dc:	692f6465 	0x692f6465
 2e0:	0074736e 	0x74736e
 2e4:	20554e47 	addi	s5,v0,20039
 2e8:	32205341 	andi	zero,s1,0x5341
 2ec:	2e38312e 	sltiu	t8,s1,12590
 2f0:	01003035 	0x1003035
 2f4:	00006580 	sll	t4,zero,0x16
 2f8:	8c000200 	lw	zero,512(zero)
 2fc:	04000000 	bltz	zero,300 <data_size+0x2f0>
 300:	00045d01 	0x45d01
 304:	c0114000 	ll	s1,16384(zero)
 308:	c011a8bf 	ll	s1,-22337(zero)
 30c:	5f3465bf 	0x5f3465bf
 310:	735f6c6c 	0x735f6c6c
 314:	00532e63 	0x532e63
 318:	6d6f682f 	0x6d6f682f
 31c:	786c2f65 	0x786c2f65
 320:	72702f62 	0x72702f62
 324:	63656a6f 	0x63656a6f
 328:	6f6c2f74 	0x6f6c2f74
 32c:	6e6f6f6f 	0x6e6f6f6f
 330:	6e6f7367 	0x6e6f7367
 334:	666f732f 	0x666f732f
 338:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 33c:	655f636e 	0x655f636e
 340:	6e657478 	0x6e657478
 344:	2f646564 	sltiu	a0,k1,25956
 348:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 34c:	554e4700 	bnel	t2,t6,11f50 <data_size+0x11f40>
 350:	20534120 	addi	s3,v0,16672
 354:	38312e32 	xori	s1,at,0x2e32
 358:	0030352e 	0x30352e
 35c:	00678001 	0x678001
 360:	00020000 	sll	zero,v0,0x0
 364:	000000a0 	0xa0
 368:	04ad0104 	0x4ad0104
 36c:	11b00000 	beq	t5,s0,370 <data_size+0x360>
 370:	1214bfc0 	beq	s0,s4,ffff0274 <_etext+0x403eee3c>
 374:	3265bfc0 	andi	a1,s3,0xbfc0
 378:	6f6c635f 	0x6f6c635f
 37c:	7a6c635f 	0x7a6c635f
 380:	2f00532e 	sltiu	zero,t8,21294
 384:	656d6f68 	0x656d6f68
 388:	62786c2f 	0x62786c2f
 38c:	6f72702f 	0x6f72702f
 390:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 394:	6f6f6c2f 	0x6f6f6c2f
 398:	676e6f6f 	0x676e6f6f
 39c:	2f6e6f73 	sltiu	t6,k1,28531
 3a0:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 3a4:	6e75662f 	0x6e75662f
 3a8:	78655f63 	0x78655f63
 3ac:	646e6574 	0x646e6574
 3b0:	692f6465 	0x692f6465
 3b4:	0074736e 	0x74736e
 3b8:	20554e47 	addi	s5,v0,20039
 3bc:	32205341 	andi	zero,s1,0x5341
 3c0:	2e38312e 	sltiu	t8,s1,12590
 3c4:	01003035 	0x1003035
 3c8:	00006680 	sll	t4,zero,0x1a
 3cc:	b4000200 	0xb4000200
 3d0:	04000000 	bltz	zero,3d4 <data_size+0x3c4>
 3d4:	0004fd01 	0x4fd01
 3d8:	c0122000 	ll	s2,8192(zero)
 3dc:	c0141cbf 	ll	s4,7359(zero)
 3e0:	33396ebf 	andi	t9,t9,0x6ebf
 3e4:	626c745f 	0x626c745f
 3e8:	532e7277 	beql	t9,t6,1cdc8 <data_size+0x1cdb8>
 3ec:	6f682f00 	0x6f682f00
 3f0:	6c2f656d 	0x6c2f656d
 3f4:	702f6278 	0x702f6278
 3f8:	656a6f72 	0x656a6f72
 3fc:	6c2f7463 	0x6c2f7463
 400:	6f6f6f6f 	0x6f6f6f6f
 404:	6f73676e 	0x6f73676e
 408:	6f732f6e 	0x6f732f6e
 40c:	662f7466 	0x662f7466
 410:	5f636e75 	0x5f636e75
 414:	65747865 	0x65747865
 418:	6465646e 	0x6465646e
 41c:	736e692f 	0x736e692f
 420:	4e470074 	c3	0x470074
 424:	53412055 	beql	k0,at,857c <data_size+0x856c>
 428:	312e3220 	andi	t6,t1,0x3220
 42c:	30352e38 	andi	s5,at,0x2e38
 430:	Address 0x0000000000000430 is out of bounds.


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
  78:	10001101 	b	4480 <data_size+0x4470>
  7c:	12011106 	beq	s0,at,4498 <data_size+0x4488>
  80:	1b080301 	0x1b080301
  84:	13082508 	beq	t8,t0,94a8 <data_size+0x9498>
  88:	00000005 	0x5
  8c:	10001101 	b	4494 <data_size+0x4484>
  90:	12011106 	beq	s0,at,44ac <data_size+0x449c>
  94:	1b080301 	0x1b080301
  98:	13082508 	beq	t8,t0,94bc <data_size+0x94ac>
  9c:	00000005 	0x5
  a0:	10001101 	b	44a8 <data_size+0x4498>
  a4:	12011106 	beq	s0,at,44c0 <data_size+0x44b0>
  a8:	1b080301 	0x1b080301
  ac:	13082508 	beq	t8,t0,94d0 <data_size+0x94c0>
  b0:	00000005 	0x5
  b4:	10001101 	b	44bc <data_size+0x44ac>
  b8:	12011106 	beq	s0,at,44d4 <data_size+0x44c4>
  bc:	1b080301 	0x1b080301
  c0:	13082508 	beq	t8,t0,94e4 <data_size+0x94d4>
  c4:	00000005 	0x5
