
main.elf:     file format elf32-tradlittlemips
main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/lxb/project/loooongson/soft/func_extended/start.S:19
bfc00000:	24081800 	li	t0,6144
/home/lxb/project/loooongson/soft/func_extended/start.S:20
bfc00004:	40882800 	mtc0	t0,c0_pagemask
/home/lxb/project/loooongson/soft/func_extended/start.S:21
bfc00008:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:22
bfc0000c:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/start.S:23
bfc00010:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:24
bfc00014:	2408ffff 	li	t0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:25
bfc00018:	100001fd 	b	bfc00810 <locate>
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
bfc00208:	1043013e 	beq	v0,v1,bfc00704 <tlbwr_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:65
bfc0020c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:66
bfc00210:	3c03efe8 	lui	v1,0xefe8
/home/lxb/project/loooongson/soft/func_extended/start.S:67
bfc00214:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:68
bfc00218:	10430158 	beq	v0,v1,bfc0077c <tlbwi_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:69
bfc0021c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:70
bfc00220:	3c038888 	lui	v1,0x8888
/home/lxb/project/loooongson/soft/func_extended/start.S:71
bfc00224:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:72
bfc00228:	1043016a 	beq	v0,v1,bfc007d4 <tlb_double_fill>
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
bfc00400:	137a00ec 	beq	k1,k0,bfc007b4 <tlb_double_ex>

bfc00404 <syscall_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:115
bfc00404:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:116
bfc00408:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:117
bfc0040c:	175400ae 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:118
bfc00410:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:119
bfc00414:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:120
bfc00418:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:121
bfc0041c:	241b0020 	li	k1,32
/home/lxb/project/loooongson/soft/func_extended/start.S:122
bfc00420:	175b00a9 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:123
bfc00424:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:124
bfc00428:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:125
bfc0042c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:126
bfc00430:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:127
bfc00434:	175b00a4 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:128
bfc00438:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:129
bfc0043c:	3c120001 	lui	s2,0x1
/home/lxb/project/loooongson/soft/func_extended/start.S:130
bfc00440:	100000a1 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:131
bfc00444:	00000000 	nop

bfc00448 <break_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:134
bfc00448:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:135
bfc0044c:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:136
bfc00450:	1754009d 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:137
bfc00454:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:138
bfc00458:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:139
bfc0045c:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:140
bfc00460:	241b0024 	li	k1,36
/home/lxb/project/loooongson/soft/func_extended/start.S:141
bfc00464:	175b0098 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:142
bfc00468:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:143
bfc0046c:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:144
bfc00470:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:145
bfc00474:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:146
bfc00478:	175b0093 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:147
bfc0047c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:148
bfc00480:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:149
bfc00484:	10000090 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:150
bfc00488:	00000000 	nop

bfc0048c <trap_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:155
bfc0048c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:156
bfc00490:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:157
bfc00494:	1754008c 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:158
bfc00498:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:159
bfc0049c:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:160
bfc004a0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:161
bfc004a4:	241b0034 	li	k1,52
/home/lxb/project/loooongson/soft/func_extended/start.S:162
bfc004a8:	175b0087 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:163
bfc004ac:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:164
bfc004b0:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:165
bfc004b4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:166
bfc004b8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:167
bfc004bc:	175b0082 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:168
bfc004c0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:169
bfc004c4:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:170
bfc004c8:	1000007f 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:171
bfc004cc:	00000000 	nop

bfc004d0 <overflow_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:174
bfc004d0:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:175
bfc004d4:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:176
bfc004d8:	1754007b 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:177
bfc004dc:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:178
bfc004e0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:179
bfc004e4:	241b0030 	li	k1,48
/home/lxb/project/loooongson/soft/func_extended/start.S:180
bfc004e8:	175b0077 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:181
bfc004ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:182
bfc004f0:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:183
bfc004f4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:184
bfc004f8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:185
bfc004fc:	175b0072 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:186
bfc00500:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:187
bfc00504:	3c120003 	lui	s2,0x3
/home/lxb/project/loooongson/soft/func_extended/start.S:188
bfc00508:	1000006f 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:189
bfc0050c:	00000000 	nop

bfc00510 <adel_load_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:192
bfc00510:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:193
bfc00514:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:194
bfc00518:	1754006b 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:195
bfc0051c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:196
bfc00520:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:197
bfc00524:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:198
bfc00528:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:199
bfc0052c:	175b0066 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:200
bfc00530:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:201
bfc00534:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:202
bfc00538:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:203
bfc0053c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:204
bfc00540:	175b0061 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:205
bfc00544:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:206
bfc00548:	3c120004 	lui	s2,0x4
/home/lxb/project/loooongson/soft/func_extended/start.S:207
bfc0054c:	1000005e 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:208
bfc00550:	00000000 	nop

bfc00554 <ades_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:211
bfc00554:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:212
bfc00558:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:213
bfc0055c:	1754005a 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:214
bfc00560:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:215
bfc00564:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:216
bfc00568:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:217
bfc0056c:	241b0014 	li	k1,20
/home/lxb/project/loooongson/soft/func_extended/start.S:218
bfc00570:	175b0055 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:219
bfc00574:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:220
bfc00578:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:221
bfc0057c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:222
bfc00580:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:223
bfc00584:	175b0050 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:224
bfc00588:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:225
bfc0058c:	3c120005 	lui	s2,0x5
/home/lxb/project/loooongson/soft/func_extended/start.S:226
bfc00590:	1000004d 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:227
bfc00594:	00000000 	nop

bfc00598 <adel_if_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:230
bfc00598:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:231
bfc0059c:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:232
bfc005a0:	17540049 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:233
bfc005a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:234
bfc005a8:	40957000 	mtc0	s5,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:235
bfc005ac:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:236
bfc005b0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:237
bfc005b4:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:238
bfc005b8:	175b0043 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:239
bfc005bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:240
bfc005c0:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:241
bfc005c4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:242
bfc005c8:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:243
bfc005cc:	175b003e 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:244
bfc005d0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:245
bfc005d4:	3c120006 	lui	s2,0x6
/home/lxb/project/loooongson/soft/func_extended/start.S:246
bfc005d8:	1000003b 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:247
bfc005dc:	00000000 	nop

bfc005e0 <reserved_inst_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:250
bfc005e0:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:251
bfc005e4:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:252
bfc005e8:	17540037 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:253
bfc005ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:254
bfc005f0:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:255
bfc005f4:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:256
bfc005f8:	241b0028 	li	k1,40
/home/lxb/project/loooongson/soft/func_extended/start.S:257
bfc005fc:	175b0032 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:258
bfc00600:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:259
bfc00604:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:260
bfc00608:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:261
bfc0060c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:262
bfc00610:	175b002d 	bne	k0,k1,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:263
bfc00614:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:264
bfc00618:	3c120007 	lui	s2,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:265
bfc0061c:	1000002a 	b	bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:266
bfc00620:	00000000 	nop

bfc00624 <int_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:269
bfc00624:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:270
bfc00628:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:271
bfc0062c:	17540026 	bne	k0,s4,bfc006c8 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:272
bfc00630:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:273
bfc00634:	275a0008 	addiu	k0,k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:274
bfc00638:	409a7000 	mtc0	k0,c0_epc
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
bfc0065c:	401a6800 	mfc0	k0,c0_cause
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
bfc00688:	175b000f 	bne	k0,k1,bfc006c8 <ex_finish>
bfc0068c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:281
bfc00690:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:282
bfc00694:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:283
bfc00698:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:284
bfc0069c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:285
bfc006a0:	175b0009 	bne	k0,k1,bfc006c8 <ex_finish>
bfc006a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:286
bfc006a8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:287
bfc006ac:	241affff 	li	k0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:288
bfc006b0:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:289
bfc006b4:	409a5800 	mtc0	k0,c0_compare
/home/lxb/project/loooongson/soft/func_extended/start.S:290
bfc006b8:	409b6800 	mtc0	k1,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:291
bfc006bc:	1000000f 	b	bfc006fc <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:292
bfc006c0:	3c120008 	lui	s2,0x8
/home/lxb/project/loooongson/soft/func_extended/start.S:293
bfc006c4:	00000000 	nop

bfc006c8 <ex_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:296
bfc006c8:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:297
bfc006cc:	3c1b8000 	lui	k1,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:298
bfc006d0:	035bd024 	and	k0,k0,k1
/home/lxb/project/loooongson/soft/func_extended/start.S:299
bfc006d4:	401b7000 	mfc0	k1,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:300
bfc006d8:	13400003 	beqz	k0,bfc006e8 <ex_finish+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:301
bfc006dc:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:302
bfc006e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:303
bfc006e4:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:305
bfc006e8:	409b7000 	mtc0	k1,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:306
bfc006ec:	16400003 	bnez	s2,bfc006fc <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:307
bfc006f0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:308
bfc006f4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:309
bfc006f8:	3c12ffff 	lui	s2,0xffff

bfc006fc <ex_ret>:
/home/lxb/project/loooongson/soft/func_extended/start.S:312
bfc006fc:	42000018 	eret
/home/lxb/project/loooongson/soft/func_extended/start.S:314
bfc00700:	00000000 	nop

bfc00704 <tlbwr_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:317
bfc00704:	24030001 	li	v1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:318
bfc00708:	1343000b 	beq	k0,v1,bfc00738 <tlbwr_allbit>
bfc0070c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:319
bfc00710:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:320
bfc00714:	24030003 	li	v1,3
/home/lxb/project/loooongson/soft/func_extended/start.S:321
bfc00718:	1343000b 	beq	k0,v1,bfc00748 <tlbwr_asid>
bfc0071c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:322
bfc00720:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:323
bfc00724:	25080001 	addiu	t0,t0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:324
bfc00728:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:325
bfc0072c:	0bf001d5 	j	bfc00754 <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:326
bfc00730:	275a0001 	addiu	k0,k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:327
bfc00734:	00000000 	nop

bfc00738 <tlbwr_allbit>:
/home/lxb/project/loooongson/soft/func_extended/start.S:329
bfc00738:	35080007 	ori	t0,t0,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:330
bfc0073c:	0bf001d5 	j	bfc00754 <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:331
bfc00740:	35290007 	ori	t1,t1,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:332
bfc00744:	00000000 	nop

bfc00748 <tlbwr_asid>:
/home/lxb/project/loooongson/soft/func_extended/start.S:334
bfc00748:	0bf001d5 	j	bfc00754 <tlbwr_return>
bfc0074c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:335
bfc00750:	00000000 	nop

bfc00754 <tlbwr_return>:
/home/lxb/project/loooongson/soft/func_extended/start.S:337
bfc00754:	40955000 	mtc0	s5,c0_entryhi
bfc00758:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:338
bfc0075c:	40881000 	mtc0	t0,c0_entrylo0
bfc00760:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:339
bfc00764:	40891800 	mtc0	t1,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:340
bfc00768:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:341
bfc0076c:	3c03ed08 	lui	v1,0xed08
/home/lxb/project/loooongson/soft/func_extended/start.S:342
bfc00770:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project/loooongson/soft/func_extended/start.S:343
bfc00774:	007a1820 	add	v1,v1,k0
/home/lxb/project/loooongson/soft/func_extended/start.S:345
bfc00778:	42000018 	eret

bfc0077c <tlbwi_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:348
bfc0077c:	40034000 	mfc0	v1,c0_badvaddr
/home/lxb/project/loooongson/soft/func_extended/start.S:349
bfc00780:	3c05ffff 	lui	a1,0xffff
/home/lxb/project/loooongson/soft/func_extended/start.S:350
bfc00784:	34a5e000 	ori	a1,a1,0xe000
/home/lxb/project/loooongson/soft/func_extended/start.S:351
bfc00788:	00a31824 	and	v1,a1,v1
/home/lxb/project/loooongson/soft/func_extended/start.S:352
bfc0078c:	40835000 	mtc0	v1,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/start.S:353
bfc00790:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:354
bfc00794:	40831000 	mtc0	v1,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/start.S:355
bfc00798:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:356
bfc0079c:	40831800 	mtc0	v1,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:357
bfc007a0:	42000002 	tlbwi
/home/lxb/project/loooongson/soft/func_extended/start.S:358
bfc007a4:	3c03ed12 	lui	v1,0xed12
/home/lxb/project/loooongson/soft/func_extended/start.S:359
bfc007a8:	34635678 	ori	v1,v1,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:361
bfc007ac:	42000018 	eret
/home/lxb/project/loooongson/soft/func_extended/start.S:363
bfc007b0:	00000000 	nop

bfc007b4 <tlb_double_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:367
bfc007b4:	40195000 	mfc0	t9,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/start.S:368
bfc007b8:	3c198000 	lui	t9,0x8000
bfc007bc:	3739d007 	ori	t9,t9,0xd007
/home/lxb/project/loooongson/soft/func_extended/start.S:369
bfc007c0:	40991000 	mtc0	t9,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/start.S:370
bfc007c4:	40991800 	mtc0	t9,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:371
bfc007c8:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:372
bfc007cc:	40197000 	mfc0	t9,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:374
bfc007d0:	42000018 	eret

bfc007d4 <tlb_double_fill>:
/home/lxb/project/loooongson/soft/func_extended/start.S:378
bfc007d4:	3c18800d 	lui	t8,0x800d
/home/lxb/project/loooongson/soft/func_extended/start.S:379
bfc007d8:	24120010 	li	s2,16
/home/lxb/project/loooongson/soft/func_extended/start.S:380
bfc007dc:	af120000 	sw	s2,0(t8)
/home/lxb/project/loooongson/soft/func_extended/start.S:381
bfc007e0:	3c18000c 	lui	t8,0xc
/home/lxb/project/loooongson/soft/func_extended/start.S:382
bfc007e4:	8f120000 	lw	s2,0(t8)
/home/lxb/project/loooongson/soft/func_extended/start.S:383
bfc007e8:	2652fff7 	addiu	s2,s2,-9
/home/lxb/project/loooongson/soft/func_extended/start.S:384
bfc007ec:	02484025 	or	t0,s2,t0
/home/lxb/project/loooongson/soft/func_extended/start.S:385
bfc007f0:	02494825 	or	t1,s2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:386
bfc007f4:	40881000 	mtc0	t0,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc007f8:	40891800 	mtc0	t1,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc007fc:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc00800:	3c033333 	lui	v1,0x3333
/home/lxb/project/loooongson/soft/func_extended/start.S:390
bfc00804:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project/loooongson/soft/func_extended/start.S:393
bfc00808:	42000018 	eret
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc0080c:	00000000 	nop

bfc00810 <locate>:
/home/lxb/project/loooongson/soft/func_extended/start.S:400
bfc00810:	3c04bfaf 	lui	a0,0xbfaf
bfc00814:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:401
bfc00818:	3c05bfaf 	lui	a1,0xbfaf
bfc0081c:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:402
bfc00820:	3c11bfaf 	lui	s1,0xbfaf
bfc00824:	3631f010 	ori	s1,s1,0xf010
/home/lxb/project/loooongson/soft/func_extended/start.S:404
bfc00828:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:405
bfc0082c:	240a0001 	li	t2,1
/home/lxb/project/loooongson/soft/func_extended/start.S:406
bfc00830:	3c130000 	lui	s3,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:408
bfc00834:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:409
bfc00838:	acaa0000 	sw	t2,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:410
bfc0083c:	ae330000 	sw	s3,0(s1)
/home/lxb/project/loooongson/soft/func_extended/start.S:412
bfc00840:	3c100000 	lui	s0,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:414
bfc00844:	3c09bfc0 	lui	t1,0xbfc0
bfc00848:	2529085c 	addiu	t1,t1,2140
/home/lxb/project/loooongson/soft/func_extended/start.S:415
bfc0084c:	3c0a2000 	lui	t2,0x2000
/home/lxb/project/loooongson/soft/func_extended/start.S:416
bfc00850:	012ac823 	subu	t9,t1,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:417
bfc00854:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:418
bfc00858:	00000000 	nop

bfc0085c <inst_test>:
/home/lxb/project/loooongson/soft/func_extended/start.S:421
bfc0085c:	0ff002d0 	jal	bfc00b40 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:422
bfc00860:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:423
bfc00864:	0ff00265 	jal	bfc00994 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:424
bfc00868:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:425
bfc0086c:	0ff00468 	jal	bfc011a0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:426
bfc00870:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:427
bfc00874:	0ff00418 	jal	bfc01060 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:428
bfc00878:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:429
bfc0087c:	0ff0044c 	jal	bfc01130 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:430
bfc00880:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:431
bfc00884:	0ff002b8 	jal	bfc00ae0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:432
bfc00888:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:433
bfc0088c:	0ff003e0 	jal	bfc00f80 <n92_tlbwi_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:434
bfc00890:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:435
bfc00894:	0ff00484 	jal	bfc01210 <n93_tlbwr_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:436
bfc00898:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:438
bfc0089c:	3c19bfc0 	lui	t9,0xbfc0
bfc008a0:	273908ac 	addiu	t9,t9,2220
/home/lxb/project/loooongson/soft/func_extended/start.S:439
bfc008a4:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:440
bfc008a8:	00000000 	nop

bfc008ac <kseg0_kseg1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:443
bfc008ac:	0ff002d0 	jal	bfc00b40 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:444
bfc008b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:445
bfc008b4:	0ff00265 	jal	bfc00994 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:446
bfc008b8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:447
bfc008bc:	0ff00468 	jal	bfc011a0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:448
bfc008c0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:449
bfc008c4:	0ff00418 	jal	bfc01060 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:450
bfc008c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:451
bfc008cc:	0ff0044c 	jal	bfc01130 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:452
bfc008d0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:453
bfc008d4:	0ff002b8 	jal	bfc00ae0 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:454
bfc008d8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:455
bfc008dc:	0ff00282 	jal	bfc00a08 <e6_mapped_instr>
/home/lxb/project/loooongson/soft/func_extended/start.S:456
bfc008e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:457
bfc008e4:	0ff002a0 	jal	bfc00a80 <e7_tlb_double_miss>
/home/lxb/project/loooongson/soft/func_extended/start.S:458
bfc008e8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:461
bfc008ec:	3c04bfaf 	lui	a0,0xbfaf
bfc008f0:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:462
bfc008f4:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:463
bfc008f8:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:464
bfc008fc:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:465
bfc00900:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:466
bfc00904:	15090009 	bne	t0,t1,bfc0092c <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:467
bfc00908:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:469
bfc0090c:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:470
bfc00910:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:471
bfc00914:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:472
bfc00918:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:473
bfc0091c:	15090003 	bne	t0,t1,bfc0092c <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:474
bfc00920:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:475
bfc00924:	10000003 	b	bfc00934 <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:476
bfc00928:	00000000 	nop

bfc0092c <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:478
bfc0092c:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:479
bfc00930:	ae300000 	sw	s0,0(s1)

bfc00934 <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:482
bfc00934:	2410000c 	li	s0,12
/home/lxb/project/loooongson/soft/func_extended/start.S:483
bfc00938:	1213000d 	beq	s0,s3,bfc00970 <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:484
bfc0093c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:486
bfc00940:	3c04bfaf 	lui	a0,0xbfaf
bfc00944:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:487
bfc00948:	3c05bfaf 	lui	a1,0xbfaf
bfc0094c:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:488
bfc00950:	3c06bfaf 	lui	a2,0xbfaf
bfc00954:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:490
bfc00958:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:492
bfc0095c:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:493
bfc00960:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:494
bfc00964:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:495
bfc00968:	10000008 	b	bfc0098c <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:496
bfc0096c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:498
bfc00970:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:499
bfc00974:	3c04bfaf 	lui	a0,0xbfaf
bfc00978:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:500
bfc0097c:	3c05bfaf 	lui	a1,0xbfaf
bfc00980:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:501
bfc00984:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:502
bfc00988:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:505
bfc0098c:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:506
bfc00990:	00000000 	nop

bfc00994 <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:509
bfc00994:	3c08bfaf 	lui	t0,0xbfaf
bfc00998:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:510
bfc0099c:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:513
bfc009a0:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:514
bfc009a4:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:515
bfc009a8:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:516
bfc009ac:	256b0001 	addiu	t3,t3,1

bfc009b0 <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:519
bfc009b0:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:522
bfc009b4:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:523
bfc009b8:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:524
bfc009bc:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:525
bfc009c0:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:526
bfc009c4:	15800002 	bnez	t4,bfc009d0 <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:527
bfc009c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:528
bfc009cc:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:530
bfc009d0:	1560fff7 	bnez	t3,bfc009b0 <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:531
bfc009d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:532
bfc009d8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:533
bfc009dc:	00000000 	nop

bfc009e0 <instr_tlb>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:8
bfc009e0:	240a0000 	li	t2,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:9
bfc009e4:	240c0000 	li	t4,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:10
bfc009e8:	240b000a 	li	t3,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:12
bfc009ec:	254a0001 	addiu	t2,t2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:13
bfc009f0:	154bfffe 	bne	t2,t3,bfc009ec <instr_tlb+0xc>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:14
bfc009f4:	258c000a 	addiu	t4,t4,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:15
bfc009f8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:16
bfc009fc:	00000000 	nop
	...

bfc00a08 <e6_mapped_instr>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:21
bfc00a08:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:22
bfc00a0c:	03e0c821 	move	t9,ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:23
bfc00a10:	2404005d 	li	a0,93
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:25
bfc00a14:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:26
bfc00a18:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:27
bfc00a1c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:28
bfc00a20:	3c08bfc0 	lui	t0,0xbfc0
bfc00a24:	250809e0 	addiu	t0,t0,2528
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:29
bfc00a28:	240de000 	li	t5,-8192
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:30
bfc00a2c:	24156000 	li	s5,24576
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:31
bfc00a30:	010d4024 	and	t0,t0,t5
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:32
bfc00a34:	01004821 	move	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:33
bfc00a38:	3c0ebfc0 	lui	t6,0xbfc0
bfc00a3c:	25ce09e0 	addiu	t6,t6,2528
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:34
bfc00a40:	31ce0fff 	andi	t6,t6,0xfff
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:35
bfc00a44:	35ce6000 	ori	t6,t6,0x6000
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:36
bfc00a48:	01c0f809 	jalr	t6
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:37
bfc00a4c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:38
bfc00a50:	24010064 	li	at,100
bfc00a54:	15810002 	bne	t4,at,bfc00a60 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:39
bfc00a58:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:42
bfc00a5c:	26730001 	addiu	s3,s3,1

bfc00a60 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:45
bfc00a60:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:46
bfc00a64:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:47
bfc00a68:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:48
bfc00a6c:	0320f821 	move	ra,t9
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:49
bfc00a70:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:50
bfc00a74:	00000000 	nop
	...

bfc00a80 <e7_tlb_double_miss>:
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:7
bfc00a80:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:8
bfc00a84:	2404005d 	li	a0,93
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:10
bfc00a88:	3c028888 	lui	v0,0x8888
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:11
bfc00a8c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:12
bfc00a90:	3c160011 	lui	s6,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:13
bfc00a94:	36d6e124 	ori	s6,s6,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:14
bfc00a98:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:15
bfc00a9c:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:16
bfc00aa0:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:17
bfc00aa4:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:18
bfc00aa8:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:19
bfc00aac:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:20
bfc00ab0:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:21
bfc00ab4:	aec70000 	sw	a3,0(s6)
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:22
bfc00ab8:	3c083333 	lui	t0,0x3333
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:23
bfc00abc:	3508dc15 	ori	t0,t0,0xdc15
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:24
bfc00ac0:	14680002 	bne	v1,t0,bfc00acc <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:25
bfc00ac4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:27
bfc00ac8:	26730001 	addiu	s3,s3,1

bfc00acc <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:30
bfc00acc:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:31
bfc00ad0:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:32
bfc00ad4:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:33
bfc00ad8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:34
bfc00adc:	00000000 	nop

bfc00ae0 <e5_movz_movn>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc00ae0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc00ae4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc00ae8:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc00aec:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc00af0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc00af4:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc00af8:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc00afc:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc00b00:	240904d6 	li	t1,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc00b04:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc00b08:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc00b0c:	24090929 	li	t1,2345
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc00b10:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc00b14:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc00b18:	3c090001 	lui	t1,0x1
bfc00b1c:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc00b20:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc00b24:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc00b28:	26730001 	addiu	s3,s3,1

bfc00b2c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc00b2c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc00b30:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc00b34:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc00b38:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc00b3c:	00000000 	nop

bfc00b40 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00b40:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00b44:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00b48:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc00b4c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00b50:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00b54:	240f1926 	li	t7,6438
bfc00b58:	24181926 	li	t8,6438
bfc00b5c:	3c14bfc0 	lui	s4,0xbfc0
bfc00b60:	26940b64 	addiu	s4,s4,2916
bfc00b64:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc00b68:	240f1926 	li	t7,6438
bfc00b6c:	24180817 	li	t8,2071
bfc00b70:	3c14bfc0 	lui	s4,0xbfc0
bfc00b74:	26940b78 	addiu	s4,s4,2936
bfc00b78:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc00b7c:	240f1926 	li	t7,6438
bfc00b80:	3c14bfc0 	lui	s4,0xbfc0
bfc00b84:	26940b88 	addiu	s4,s4,2952
bfc00b88:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc00b8c:	240f1926 	li	t7,6438
bfc00b90:	3c14bfc0 	lui	s4,0xbfc0
bfc00b94:	26940b98 	addiu	s4,s4,2968
bfc00b98:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc00b9c:	240f1926 	li	t7,6438
bfc00ba0:	24181926 	li	t8,6438
bfc00ba4:	3c14bfc0 	lui	s4,0xbfc0
bfc00ba8:	26940bac 	addiu	s4,s4,2988
bfc00bac:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00bb0:	240f1926 	li	t7,6438
bfc00bb4:	24180817 	li	t8,2071
bfc00bb8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bbc:	26940bc0 	addiu	s4,s4,3008
bfc00bc0:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00bc4:	240f1926 	li	t7,6438
bfc00bc8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bcc:	26940bd0 	addiu	s4,s4,3024
bfc00bd0:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00bd4:	240f1926 	li	t7,6438
bfc00bd8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bdc:	26940be0 	addiu	s4,s4,3040
bfc00be0:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00be4:	240f04d2 	li	t7,1234
bfc00be8:	2418fb2e 	li	t8,-1234
bfc00bec:	3c14bfc0 	lui	s4,0xbfc0
bfc00bf0:	26940bf4 	addiu	s4,s4,3060
bfc00bf4:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00bf8:	240ffb2e 	li	t7,-1234
bfc00bfc:	241804d2 	li	t8,1234
bfc00c00:	3c14bfc0 	lui	s4,0xbfc0
bfc00c04:	26940c08 	addiu	s4,s4,3080
bfc00c08:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc00c0c:	240f04d2 	li	t7,1234
bfc00c10:	3c14bfc0 	lui	s4,0xbfc0
bfc00c14:	26940c18 	addiu	s4,s4,3096
bfc00c18:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc00c1c:	240ffb2e 	li	t7,-1234
bfc00c20:	3c14bfc0 	lui	s4,0xbfc0
bfc00c24:	26940c28 	addiu	s4,s4,3112
bfc00c28:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00c2c:	240f04d2 	li	t7,1234
bfc00c30:	2418fb2e 	li	t8,-1234
bfc00c34:	3c14bfc0 	lui	s4,0xbfc0
bfc00c38:	26940c3c 	addiu	s4,s4,3132
bfc00c3c:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00c40:	240ffb2e 	li	t7,-1234
bfc00c44:	241804d2 	li	t8,1234
bfc00c48:	3c14bfc0 	lui	s4,0xbfc0
bfc00c4c:	26940c50 	addiu	s4,s4,3152
bfc00c50:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00c54:	240f04d2 	li	t7,1234
bfc00c58:	3c14bfc0 	lui	s4,0xbfc0
bfc00c5c:	26940c60 	addiu	s4,s4,3168
bfc00c60:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00c64:	240ffb2e 	li	t7,-1234
bfc00c68:	3c14bfc0 	lui	s4,0xbfc0
bfc00c6c:	26940c70 	addiu	s4,s4,3184
bfc00c70:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00c74:	240f04d2 	li	t7,1234
bfc00c78:	2418fb2e 	li	t8,-1234
bfc00c7c:	3c14bfc0 	lui	s4,0xbfc0
bfc00c80:	26940c84 	addiu	s4,s4,3204
bfc00c84:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00c88:	240ffb2e 	li	t7,-1234
bfc00c8c:	241804d2 	li	t8,1234
bfc00c90:	3c14bfc0 	lui	s4,0xbfc0
bfc00c94:	26940c98 	addiu	s4,s4,3224
bfc00c98:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00c9c:	240f04d2 	li	t7,1234
bfc00ca0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ca4:	26940ca8 	addiu	s4,s4,3240
bfc00ca8:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00cac:	240ffb2e 	li	t7,-1234
bfc00cb0:	3c14bfc0 	lui	s4,0xbfc0
bfc00cb4:	26940cb8 	addiu	s4,s4,3256
bfc00cb8:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00cbc:	240f04d2 	li	t7,1234
bfc00cc0:	2418fb2e 	li	t8,-1234
bfc00cc4:	3c14bfc0 	lui	s4,0xbfc0
bfc00cc8:	26940ccc 	addiu	s4,s4,3276
bfc00ccc:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00cd0:	240ffb2e 	li	t7,-1234
bfc00cd4:	241804d2 	li	t8,1234
bfc00cd8:	3c14bfc0 	lui	s4,0xbfc0
bfc00cdc:	26940ce0 	addiu	s4,s4,3296
bfc00ce0:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00ce4:	240f04d2 	li	t7,1234
bfc00ce8:	3c14bfc0 	lui	s4,0xbfc0
bfc00cec:	26940cf0 	addiu	s4,s4,3312
bfc00cf0:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00cf4:	240ffb2e 	li	t7,-1234
bfc00cf8:	3c14bfc0 	lui	s4,0xbfc0
bfc00cfc:	26940d00 	addiu	s4,s4,3328
bfc00d00:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00d04:	03e01021 	move	v0,ra
bfc00d08:	240f04d2 	li	t7,1234
bfc00d0c:	241804d2 	li	t8,1234
bfc00d10:	51f80002 	beql	t7,t8,bfc00d1c <e1_trap_test+0x1dc>
bfc00d14:	25ef0001 	addiu	t7,t7,1
bfc00d18:	25ef000a 	addiu	t7,t7,10
bfc00d1c:	27180064 	addiu	t8,t8,100
bfc00d20:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00d24:	03e01021 	move	v0,ra
bfc00d28:	240f04d2 	li	t7,1234
bfc00d2c:	2418162e 	li	t8,5678
bfc00d30:	51f80002 	beql	t7,t8,bfc00d3c <e1_trap_test+0x1fc>
bfc00d34:	25ef0001 	addiu	t7,t7,1
bfc00d38:	25ef000a 	addiu	t7,t7,10
bfc00d3c:	27180064 	addiu	t8,t8,100
bfc00d40:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00d44:	03e01021 	move	v0,ra
bfc00d48:	240f162e 	li	t7,5678
bfc00d4c:	241804d2 	li	t8,1234
bfc00d50:	51f80002 	beql	t7,t8,bfc00d5c <e1_trap_test+0x21c>
bfc00d54:	25ef0001 	addiu	t7,t7,1
bfc00d58:	25ef000a 	addiu	t7,t7,10
bfc00d5c:	27180064 	addiu	t8,t8,100
bfc00d60:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00d64:	03e01021 	move	v0,ra
bfc00d68:	240f04d2 	li	t7,1234
bfc00d6c:	241804d2 	li	t8,1234
bfc00d70:	55f80002 	bnel	t7,t8,bfc00d7c <e1_trap_test+0x23c>
bfc00d74:	25ef0001 	addiu	t7,t7,1
bfc00d78:	25ef000a 	addiu	t7,t7,10
bfc00d7c:	27180064 	addiu	t8,t8,100
bfc00d80:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00d84:	03e01021 	move	v0,ra
bfc00d88:	240f04d2 	li	t7,1234
bfc00d8c:	2418162e 	li	t8,5678
bfc00d90:	55f80002 	bnel	t7,t8,bfc00d9c <e1_trap_test+0x25c>
bfc00d94:	25ef0001 	addiu	t7,t7,1
bfc00d98:	25ef000a 	addiu	t7,t7,10
bfc00d9c:	27180064 	addiu	t8,t8,100
bfc00da0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00da4:	03e01021 	move	v0,ra
bfc00da8:	240f162e 	li	t7,5678
bfc00dac:	241804d2 	li	t8,1234
bfc00db0:	55f80002 	bnel	t7,t8,bfc00dbc <e1_trap_test+0x27c>
bfc00db4:	25ef0001 	addiu	t7,t7,1
bfc00db8:	25ef000a 	addiu	t7,t7,10
bfc00dbc:	27180064 	addiu	t8,t8,100
bfc00dc0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00dc4:	03e01021 	move	v0,ra
bfc00dc8:	240f04d2 	li	t7,1234
bfc00dcc:	05e30002 	bgezl	t7,bfc00dd8 <e1_trap_test+0x298>
bfc00dd0:	25ef0001 	addiu	t7,t7,1
bfc00dd4:	25ef0014 	addiu	t7,t7,20
bfc00dd8:	25ef000a 	addiu	t7,t7,10
bfc00ddc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00de0:	03e01021 	move	v0,ra
bfc00de4:	240f0000 	li	t7,0
bfc00de8:	05e30002 	bgezl	t7,bfc00df4 <e1_trap_test+0x2b4>
bfc00dec:	25ef0001 	addiu	t7,t7,1
bfc00df0:	25ef0014 	addiu	t7,t7,20
bfc00df4:	25ef000a 	addiu	t7,t7,10
bfc00df8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00dfc:	03e01021 	move	v0,ra
bfc00e00:	240ffb2e 	li	t7,-1234
bfc00e04:	05e30002 	bgezl	t7,bfc00e10 <e1_trap_test+0x2d0>
bfc00e08:	25ef0001 	addiu	t7,t7,1
bfc00e0c:	25ef0014 	addiu	t7,t7,20
bfc00e10:	25ef000a 	addiu	t7,t7,10
bfc00e14:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00e18:	03e01021 	move	v0,ra
bfc00e1c:	240f04d2 	li	t7,1234
bfc00e20:	5de00002 	bgtzl	t7,bfc00e2c <e1_trap_test+0x2ec>
bfc00e24:	25ef0001 	addiu	t7,t7,1
bfc00e28:	25ef0014 	addiu	t7,t7,20
bfc00e2c:	25ef000a 	addiu	t7,t7,10
bfc00e30:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00e34:	03e01021 	move	v0,ra
bfc00e38:	240f0000 	li	t7,0
bfc00e3c:	5de00002 	bgtzl	t7,bfc00e48 <e1_trap_test+0x308>
bfc00e40:	25ef0001 	addiu	t7,t7,1
bfc00e44:	25ef0014 	addiu	t7,t7,20
bfc00e48:	25ef000a 	addiu	t7,t7,10
bfc00e4c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00e50:	03e01021 	move	v0,ra
bfc00e54:	240ffb2e 	li	t7,-1234
bfc00e58:	5de00002 	bgtzl	t7,bfc00e64 <e1_trap_test+0x324>
bfc00e5c:	25ef0001 	addiu	t7,t7,1
bfc00e60:	25ef0014 	addiu	t7,t7,20
bfc00e64:	25ef000a 	addiu	t7,t7,10
bfc00e68:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00e6c:	03e01021 	move	v0,ra
bfc00e70:	240f04d2 	li	t7,1234
bfc00e74:	05e20002 	bltzl	t7,bfc00e80 <e1_trap_test+0x340>
bfc00e78:	25ef0001 	addiu	t7,t7,1
bfc00e7c:	25ef0014 	addiu	t7,t7,20
bfc00e80:	25ef000a 	addiu	t7,t7,10
bfc00e84:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00e88:	03e01021 	move	v0,ra
bfc00e8c:	240f0000 	li	t7,0
bfc00e90:	05e20002 	bltzl	t7,bfc00e9c <e1_trap_test+0x35c>
bfc00e94:	25ef0001 	addiu	t7,t7,1
bfc00e98:	25ef0014 	addiu	t7,t7,20
bfc00e9c:	25ef000a 	addiu	t7,t7,10
bfc00ea0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00ea4:	03e01021 	move	v0,ra
bfc00ea8:	240ffb2e 	li	t7,-1234
bfc00eac:	05e20002 	bltzl	t7,bfc00eb8 <e1_trap_test+0x378>
bfc00eb0:	25ef0001 	addiu	t7,t7,1
bfc00eb4:	25ef0014 	addiu	t7,t7,20
bfc00eb8:	25ef000a 	addiu	t7,t7,10
bfc00ebc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00ec0:	03e01021 	move	v0,ra
bfc00ec4:	240f04d2 	li	t7,1234
bfc00ec8:	59e00002 	blezl	t7,bfc00ed4 <e1_trap_test+0x394>
bfc00ecc:	25ef0001 	addiu	t7,t7,1
bfc00ed0:	25ef0014 	addiu	t7,t7,20
bfc00ed4:	25ef000a 	addiu	t7,t7,10
bfc00ed8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00edc:	03e01021 	move	v0,ra
bfc00ee0:	240f0000 	li	t7,0
bfc00ee4:	59e00002 	blezl	t7,bfc00ef0 <e1_trap_test+0x3b0>
bfc00ee8:	25ef0001 	addiu	t7,t7,1
bfc00eec:	25ef0014 	addiu	t7,t7,20
bfc00ef0:	25ef000a 	addiu	t7,t7,10
bfc00ef4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00ef8:	03e01021 	move	v0,ra
bfc00efc:	240ffb2e 	li	t7,-1234
bfc00f00:	59e00002 	blezl	t7,bfc00f0c <e1_trap_test+0x3cc>
bfc00f04:	25ef0001 	addiu	t7,t7,1
bfc00f08:	25ef0014 	addiu	t7,t7,20
bfc00f0c:	25ef000a 	addiu	t7,t7,10
bfc00f10:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00f14:	03e01021 	move	v0,ra
bfc00f18:	240f04d2 	li	t7,1234
bfc00f1c:	05f30002 	bgezall	t7,bfc00f28 <e1_trap_test+0x3e8>
bfc00f20:	25ef0001 	addiu	t7,t7,1
bfc00f24:	25ef0014 	addiu	t7,t7,20
bfc00f28:	25ef000a 	addiu	t7,t7,10
bfc00f2c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00f30:	03e01021 	move	v0,ra
bfc00f34:	240f0000 	li	t7,0
bfc00f38:	05f30002 	bgezall	t7,bfc00f44 <e1_trap_test+0x404>
bfc00f3c:	25ef0001 	addiu	t7,t7,1
bfc00f40:	25ef0014 	addiu	t7,t7,20
bfc00f44:	25ef000a 	addiu	t7,t7,10
bfc00f48:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00f4c:	03e01021 	move	v0,ra
bfc00f50:	240ffb2e 	li	t7,-1234
bfc00f54:	05f30002 	bgezall	t7,bfc00f60 <e1_trap_test+0x420>
bfc00f58:	25ef0001 	addiu	t7,t7,1
bfc00f5c:	25ef0014 	addiu	t7,t7,20
bfc00f60:	25ef000a 	addiu	t7,t7,10
bfc00f64:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00f68:	26730001 	addiu	s3,s3,1

bfc00f6c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00f6c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00f70:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00f74:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00f78:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00f7c:	00000000 	nop

bfc00f80 <n92_tlbwi_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:9
bfc00f80:	2404005c 	li	a0,92
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:10
bfc00f84:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:12
bfc00f88:	24120000 	li	s2,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:13
bfc00f8c:	241a0010 	li	k0,16

bfc00f90 <test_phase1_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:15
bfc00f90:	40920000 	mtc0	s2,c0_index
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:16
bfc00f94:	3c02efe8 	lui	v0,0xefe8
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:17
bfc00f98:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:18
bfc00f9c:	00124c00 	sll	t1,s2,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:19
bfc00fa0:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:20
bfc00fa4:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:21
bfc00fa8:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:22
bfc00fac:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:23
bfc00fb0:	aea70000 	sw	a3,0(s5)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:29
bfc00fc8:	3c08ed12 	lui	t0,0xed12
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:30
bfc00fcc:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:31
bfc00fd0:	1468001d 	bne	v1,t0,bfc01048 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:32
bfc00fd4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:33
bfc00fd8:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:34
bfc00fdc:	8ea80000 	lw	t0,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:35
bfc00fe0:	3c15abcd 	lui	s5,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:36
bfc00fe4:	36b5ef81 	ori	s5,s5,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:37
bfc00fe8:	16a80017 	bne	s5,t0,bfc01048 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:38
bfc00fec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:39
bfc00ff0:	26520001 	addiu	s2,s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:40
bfc00ff4:	1752ffe6 	bne	k0,s2,bfc00f90 <test_phase1_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:41
bfc00ff8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:42
bfc00ffc:	24020000 	li	v0,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:43
bfc01000:	241a0010 	li	k0,16
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:44
bfc01004:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:45
bfc01008:	24030000 	li	v1,0

bfc0100c <test_phase2_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:47
bfc0100c:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:48
bfc01010:	00024c00 	sll	t1,v0,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:49
bfc01014:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:50
bfc01018:	8ea90000 	lw	t1,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:51
bfc0101c:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:52
bfc01020:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:53
bfc01024:	15270008 	bne	t1,a3,bfc01048 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:54
bfc01028:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:55
bfc0102c:	24420001 	addiu	v0,v0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:56
bfc01030:	24090000 	li	t1,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:57
bfc01034:	15230004 	bne	t1,v1,bfc01048 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:58
bfc01038:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:59
bfc0103c:	145afff3 	bne	v0,k0,bfc0100c <test_phase2_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:60
bfc01040:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:62
bfc01044:	26730001 	addiu	s3,s3,1

bfc01048 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:65
bfc01048:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:66
bfc0104c:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:67
bfc01050:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:68
bfc01054:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:69
bfc01058:	00000000 	nop
inst_error():
bfc0105c:	00000000 	nop

bfc01060 <e3_madd_msub_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc01060:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc01064:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc01068:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc0106c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc01070:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc01074:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc01078:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc0107c:	24091234 	li	t1,4660
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc01080:	240a5678 	li	t2,22136
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc01084:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc01088:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc0108c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc01090:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc01094:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc01098:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc0109c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc010a0:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc010a4:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc010a8:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc010ac:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc010b0:	712a0001 	maddu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc010b4:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc010b8:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc010bc:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc010c0:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc010c4:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc010c8:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc010cc:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc010d0:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc010d4:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc010d8:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc010dc:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc010e0:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc010e4:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc010e8:	712a0005 	msubu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc010ec:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc010f0:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc010f4:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc010f8:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc010fc:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc01100:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc01104:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc01108:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc0110c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc01110:	26730001 	addiu	s3,s3,1

bfc01114 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc01114:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc01118:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc0111c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc01120:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc01124:	00000000 	nop
	...

bfc01130 <e4_ll_sc>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc01130:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc01134:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc01138:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc0113c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc01140:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc01144:	3c088000 	lui	t0,0x8000
bfc01148:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc0114c:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc01150:	ad090004 	sw	t1,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc01154:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc01158:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc0115c:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc01160:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc01164:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc01168:	0000000c 	syscall
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc0116c:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc01170:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc01174:	240c04d6 	li	t4,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc01178:	156c0002 	bne	t3,t4,bfc01184 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc0117c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc01180:	26730001 	addiu	s3,s3,1

bfc01184 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc01184:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc01188:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc0118c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc01190:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc01194:	00000000 	nop
	...

bfc011a0 <e2_clo_clz_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc011a0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc011a4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc011a8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc011ac:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc011b0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc011b4:	3c08e234 	lui	t0,0xe234
bfc011b8:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc011bc:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc011c0:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc011c4:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc011c8:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc011cc:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc011d0:	3c081926 	lui	t0,0x1926
bfc011d4:	35080817 	ori	t0,t0,0x817
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc011d8:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc011dc:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc011e0:	2408000e 	li	t0,14
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc011e4:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc011e8:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc011ec:	26730001 	addiu	s3,s3,1

bfc011f0 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc011f0:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc011f4:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc011f8:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc011fc:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc01200:	00000000 	nop
	...

bfc01210 <n93_tlbwr_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:9
bfc01210:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:10
bfc01214:	2404005d 	li	a0,93

bfc01218 <test_gbit_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:13
bfc01218:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:14
bfc0121c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:15
bfc01220:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:16
bfc01224:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:17
bfc01228:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:18
bfc0122c:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:19
bfc01230:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:20
bfc01234:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:21
bfc01238:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:22
bfc0123c:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:23
bfc01240:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:24
bfc01244:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:30
bfc0125c:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:31
bfc01260:	3508dc16 	ori	t0,t0,0xdc16
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:32
bfc01264:	14680064 	bne	v1,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:33
bfc01268:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:34
bfc0126c:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:35
bfc01270:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:36
bfc01274:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:37
bfc01278:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:38
bfc0127c:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:39
bfc01280:	14e8005d 	bne	a3,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:40
bfc01284:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:41
bfc01288:	3c128010 	lui	s2,0x8010
bfc0128c:	36520124 	ori	s2,s2,0x124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:42
bfc01290:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:43
bfc01294:	14e80058 	bne	a3,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:44
bfc01298:	00000000 	nop

bfc0129c <test_asid_match>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:46
bfc0129c:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:47
bfc012a0:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:48
bfc012a4:	3c120012 	lui	s2,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:49
bfc012a8:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:50
bfc012ac:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:51
bfc012b0:	3c150012 	lui	s5,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:52
bfc012b4:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:53
bfc012b8:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:54
bfc012bc:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:55
bfc012c0:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:56
bfc012c4:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:57
bfc012c8:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:63
bfc012e0:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:64
bfc012e4:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:65
bfc012e8:	14680043 	bne	v1,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:66
bfc012ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:67
bfc012f0:	3c150013 	lui	s5,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:68
bfc012f4:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:69
bfc012f8:	40955000 	mtc0	s5,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:70
bfc012fc:	3c120013 	lui	s2,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:71
bfc01300:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:72
bfc01304:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:73
bfc01308:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:74
bfc0130c:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:75
bfc01310:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:76
bfc01314:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:77
bfc01318:	14e80037 	bne	a3,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:78
bfc0131c:	00000000 	nop

bfc01320 <test_asid_2>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:80
bfc01320:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:81
bfc01324:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:82
bfc01328:	3c120014 	lui	s2,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:83
bfc0132c:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:84
bfc01330:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:85
bfc01334:	3c150014 	lui	s5,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:86
bfc01338:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:87
bfc0133c:	3c07bd86 	lui	a3,0xbd86
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:88
bfc01340:	34e713ac 	ori	a3,a3,0x13ac
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:89
bfc01344:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:90
bfc01348:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:91
bfc0134c:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:97
bfc01364:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:98
bfc01368:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:99
bfc0136c:	14680022 	bne	v1,t0,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:100
bfc01370:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:101
bfc01374:	3c120015 	lui	s2,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:102
bfc01378:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:103
bfc0137c:	3c150015 	lui	s5,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:104
bfc01380:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:105
bfc01384:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:106
bfc01388:	24094002 	li	t1,16386
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:107
bfc0138c:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:108
bfc01390:	8e470000 	lw	a3,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:109
bfc01394:	3c07ed08 	lui	a3,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:110
bfc01398:	34e7dc18 	ori	a3,a3,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:111
bfc0139c:	14e30016 	bne	a3,v1,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:112
bfc013a0:	00000000 	nop

bfc013a4 <test_tlbp>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:114
bfc013a4:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:115
bfc013a8:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:116
bfc013ac:	40955000 	mtc0	s5,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:117
bfc013b0:	40801000 	mtc0	zero,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:118
bfc013b4:	40801800 	mtc0	zero,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:119
bfc013b8:	42000008 	tlbp
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:120
bfc013bc:	42000001 	tlbr
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:121
bfc013c0:	40805000 	mtc0	zero,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:122
bfc013c4:	400b1000 	mfc0	t3,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:123
bfc013c8:	240c4007 	li	t4,16391
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:124
bfc013cc:	156c000a 	bne	t3,t4,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:125
bfc013d0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:126
bfc013d4:	400b1800 	mfc0	t3,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:127
bfc013d8:	240c4007 	li	t4,16391
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:128
bfc013dc:	156c0006 	bne	t3,t4,bfc013f8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:129
bfc013e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:130
bfc013e4:	40801000 	mtc0	zero,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:131
bfc013e8:	40801800 	mtc0	zero,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:132
bfc013ec:	42000002 	tlbwi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:133
bfc013f0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:135
bfc013f4:	26730001 	addiu	s3,s3,1

bfc013f8 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:138
bfc013f8:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:139
bfc013fc:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:140
bfc01400:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:141
bfc01404:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:142
bfc01408:	00000000 	nop
bfc0140c:	00000000 	nop
bfc01410:	9f3f7f7c 	0x9f3f7f7c
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
  10:	bfc00000 	cache	0x0,0(s8)
  14:	000009e0 	0x9e0
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc009e0 	cache	0x0,2528(s8)
  34:	00000098 	0x98
	...
  40:	0000001c 	0x1c
  44:	00d10002 	0xd10002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc00a80 	cache	0x0,2688(s8)
  54:	00000060 	0x60
	...
  60:	0000001c 	0x1c
  64:	01440002 	0x1440002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00ae0 	cache	0x0,2784(s8)
  74:	00000060 	0x60
	...
  80:	0000001c 	0x1c
  84:	01b10002 	0x1b10002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00b40 	cache	0x0,2880(s8)
  94:	00000440 	sll	zero,zero,0x11
	...
  a0:	0000001c 	0x1c
  a4:	021e0002 	0x21e0002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00f80 	cache	0x0,3968(s8)
  b4:	000000dc 	0xdc
	...
  c0:	0000001c 	0x1c
  c4:	02880002 	0x2880002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc01060 	cache	0x0,4192(s8)
  d4:	000000c8 	0xc8
	...
  e0:	0000001c 	0x1c
  e4:	02f50002 	0x2f50002
  e8:	00040000 	sll	zero,a0,0x0
  ec:	00000000 	nop
  f0:	bfc01130 	cache	0x0,4400(s8)
  f4:	00000068 	0x68
	...
 100:	0000001c 	0x1c
 104:	035e0002 	0x35e0002
 108:	00040000 	sll	zero,a0,0x0
 10c:	00000000 	nop
 110:	bfc011a0 	cache	0x0,4512(s8)
 114:	00000064 	0x64
	...
 120:	0000001c 	0x1c
 124:	03c90002 	0x3c90002
 128:	00040000 	sll	zero,a0,0x0
 12c:	00000000 	nop
 130:	bfc01210 	cache	0x0,4624(s8)
 134:	000001fc 	0x1fc
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00a08 	cache	0x0,2568(s8)
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00a80 	cache	0x0,2688(s8)
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00ae0 	cache	0x0,2784(s8)
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00b40 	cache	0x0,2880(s8)
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00f80 	cache	0x0,3968(s8)
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc01060 	cache	0x0,4192(s8)
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc01130 	cache	0x0,4400(s8)
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc011a0 	cache	0x0,4512(s8)
	...
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	bfc01210 	cache	0x0,4624(s8)
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
 11c:	4b4b4b4b 	c2	0x14b4b4b
 120:	4b4b4b83 	c2	0x14b4b83
 124:	4b4b4b4b 	c2	0x14b4b4b
 128:	4b4b4b4d 	c2	0x14b4b4d
 12c:	4b4b4b4b 	c2	0x14b4b4b
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
 1e0:	00005c01 	0x5c01
 1e4:	28000200 	slti	zero,zero,512
 1e8:	01000000 	0x1000000
 1ec:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 1f0:	01010100 	0x1010100
 1f4:	00000001 	movf	zero,zero,$fcc0
 1f8:	01000001 	movf	zero,t0,$fcc0
 1fc:	5f366500 	0x5f366500
 200:	7070616d 	0x7070616d
 204:	695f6465 	0x695f6465
 208:	7274736e 	0x7274736e
 20c:	0000532e 	0x532e
 210:	00000000 	nop
 214:	09e00205 	j	7800814 <data_size+0x7800804>
 218:	4b19bfc0 	c2	0x119bfc0
 21c:	4b4b4c4b 	c2	0x14b4c4b
 220:	864b4b4b 	lh	t3,19275(s2)
 224:	4b4c4b4b 	c2	0x14c4b4b
 228:	4b834b4b 	c2	0x1834b4b
 22c:	834b4b4b 	lb	t3,19275(k0)
 230:	4b4b4b4b 	c2	0x14b4b4b
 234:	4b4d4d83 	c2	0x14d4d83
 238:	4b4b4b4b 	c2	0x14b4b4b
 23c:	01000402 	0x1000402
 240:	00005501 	0x5501
 244:	2b000200 	slti	zero,t8,512
 248:	01000000 	0x1000000
 24c:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 250:	01010100 	0x1010100
 254:	00000001 	movf	zero,zero,$fcc0
 258:	01000001 	movf	zero,t0,$fcc0
 25c:	5f376500 	0x5f376500
 260:	5f626c74 	0x5f626c74
 264:	62756f64 	0x62756f64
 268:	6d5f656c 	0x6d5f656c
 26c:	2e737369 	sltiu	s3,s3,29545
 270:	00000053 	mtlhx	zero
 274:	05000000 	bltz	t0,278 <data_size+0x268>
 278:	c00a8002 	ll	t2,-32766(zero)
 27c:	4c4b18bf 	0x4c4b18bf
 280:	4b4b4b4b 	c2	0x14b4b4b
 284:	4b4b4b4b 	c2	0x14b4b4b
 288:	4b4b4b4b 	c2	0x14b4b4b
 28c:	4c4b4b4b 	0x4c4b4b4b
 290:	4b4b4b4d 	c2	0x14b4b4d
 294:	0004024b 	0x4024b
 298:	004e0101 	0x4e0101
 29c:	00020000 	sll	zero,v0,0x0
 2a0:	00000025 	move	zero,zero
 2a4:	0efb0101 	jal	bec0404 <data_size+0xbec03f4>
 2a8:	0101000d 	break	0x101
 2ac:	00000101 	0x101
 2b0:	00000100 	sll	zero,zero,0x4
 2b4:	35650001 	ori	a1,t3,0x1
 2b8:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
 2bc:	6f6d5f7a 	0x6f6d5f7a
 2c0:	532e6e76 	beql	t9,t6,1bc9c <data_size+0x1bc8c>
 2c4:	00000000 	nop
 2c8:	02050000 	0x2050000
 2cc:	bfc00ae0 	cache	0x0,2784(s8)
 2d0:	4b4b4b19 	c2	0x14b4b19
 2d4:	4b4b504b 	c2	0x14b504b
 2d8:	4b4b4b4b 	c2	0x14b4b4b
 2dc:	834b4b4b 	lb	t3,19275(k0)
 2e0:	4b4d4f4b 	c2	0x14d4f4b
 2e4:	024b4b4b 	0x24b4b4b
 2e8:	01010004 	sllv	zero,at,t0
 2ec:	00000090 	0x90
 2f0:	00250002 	ror	zero,a1,0x0
 2f4:	01010000 	0x1010000
 2f8:	000d0efb 	0xd0efb
 2fc:	01010101 	0x1010101
 300:	01000000 	0x1000000
 304:	00010000 	sll	zero,at,0x0
 308:	745f3165 	jalx	17cc594 <data_size+0x17cc584>
 30c:	5f706172 	0x5f706172
 310:	74736574 	jalx	1cd95d0 <data_size+0x1cd95c0>
 314:	0000532e 	0x532e
 318:	00000000 	nop
 31c:	0b400205 	j	d000814 <data_size+0xd000804>
 320:	4b19bfc0 	c2	0x119bfc0
 324:	4d4b4b4b 	0x4d4b4b4b
 328:	3d083d08 	0x3d083d08
 32c:	3d08f3f3 	0x3d08f3f3
 330:	f4f33d08 	sdc1	$f19,15624(a3)
 334:	3d083d08 	0x3d083d08
 338:	3d08f3f3 	0x3d08f3f3
 33c:	f3f33d08 	0xf3f33d08
 340:	3d083d08 	0x3d083d08
 344:	3d08f3f3 	0x3d08f3f3
 348:	f4f33d08 	sdc1	$f19,15624(a3)
 34c:	e508e508 	swc1	$f8,-6904(t0)
 350:	e508e508 	swc1	$f8,-6904(t0)
 354:	e508e508 	swc1	$f8,-6904(t0)
 358:	ad08ad08 	sw	t0,-21240(t0)
 35c:	ad08ad08 	sw	t0,-21240(t0)
 360:	ad08ad08 	sw	t0,-21240(t0)
 364:	ad08ad08 	sw	t0,-21240(t0)
 368:	ad08ad08 	sw	t0,-21240(t0)
 36c:	ad08ad08 	sw	t0,-21240(t0)
 370:	ad08ad08 	sw	t0,-21240(t0)
 374:	4b4db008 	c2	0x14db008
 378:	024b4b4b 	0x24b4b4b
 37c:	01010004 	sllv	zero,at,t0
 380:	0000006b 	0x6b
 384:	00220002 	ror	zero,v0,0x0
 388:	01010000 	0x1010000
 38c:	000d0efb 	0xd0efb
 390:	01010101 	0x1010101
 394:	01000000 	0x1000000
 398:	00010000 	sll	zero,at,0x0
 39c:	5f32396e 	0x5f32396e
 3a0:	77626c74 	jalx	d89b1d0 <data_size+0xd89b1c0>
 3a4:	00532e69 	0x532e69
 3a8:	00000000 	nop
 3ac:	80020500 	lb	v0,1280(zero)
 3b0:	1abfc00f 	0x1abfc00f
 3b4:	4c4b4c4b 	0x4c4b4c4b
 3b8:	4b4b4b4b 	c2	0x14b4b4b
 3bc:	4b4b4b4b 	c2	0x14b4b4b
 3c0:	4b4b4b4b 	c2	0x14b4b4b
 3c4:	4b4b4b4b 	c2	0x14b4b4b
 3c8:	4b4b4b4b 	c2	0x14b4b4b
 3cc:	4b4b4b4b 	c2	0x14b4b4b
 3d0:	4b4b4b4b 	c2	0x14b4b4b
 3d4:	4b4c4b4b 	c2	0x14c4b4b
 3d8:	4b4b4b4b 	c2	0x14b4b4b
 3dc:	4b4b4b4b 	c2	0x14b4b4b
 3e0:	4b4b4b4b 	c2	0x14b4b4b
 3e4:	4b4b4d4c 	c2	0x14b4d4c
 3e8:	04024b4b 	bltzl	zero,13118 <data_size+0x13108>
 3ec:	69010100 	0x69010100
 3f0:	02000000 	0x2000000
 3f4:	00002500 	sll	a0,zero,0x14
 3f8:	fb010100 	sdc2	$1,256(t8)
 3fc:	01000d0e 	0x1000d0e
 400:	00010101 	0x10101
 404:	00010000 	sll	zero,at,0x0
 408:	65000100 	0x65000100
 40c:	616d5f33 	0x616d5f33
 410:	6d5f6464 	0x6d5f6464
 414:	2e627573 	sltiu	v0,s3,30067
 418:	00000053 	mtlhx	zero
 41c:	05000000 	bltz	t0,420 <data_size+0x410>
 420:	c0106002 	ll	s0,24578(zero)
 424:	4b4b19bf 	c2	0x14b19bf
 428:	4b4d4b4b 	c2	0x14d4b4b
 42c:	4b4b4b4b 	c2	0x14b4b4b
 430:	4b4b4b4b 	c2	0x14b4b4b
 434:	4b4b4b4b 	c2	0x14b4b4b
 438:	4b4b4b4b 	c2	0x14b4b4b
 43c:	4b4b4b4b 	c2	0x14b4b4b
 440:	4b4b4b4b 	c2	0x14b4b4b
 444:	4b4b4b4b 	c2	0x14b4b4b
 448:	4b4b4b4b 	c2	0x14b4b4b
 44c:	4b4b4b4b 	c2	0x14b4b4b
 450:	4b4d4e4b 	c2	0x14d4e4b
 454:	024b4b4b 	0x24b4b4b
 458:	01010004 	sllv	zero,at,t0
 45c:	0000004c 	syscall	0x1
 460:	00210002 	ror	zero,at,0x0
 464:	01010000 	0x1010000
 468:	000d0efb 	0xd0efb
 46c:	01010101 	0x1010101
 470:	01000000 	0x1000000
 474:	00010000 	sll	zero,at,0x0
 478:	6c5f3465 	0x6c5f3465
 47c:	63735f6c 	0x63735f6c
 480:	0000532e 	0x532e
 484:	00000000 	nop
 488:	11300205 	beq	t1,s0,ca0 <data_size+0xc90>
 48c:	4b19bfc0 	c2	0x119bfc0
 490:	504b4b4b 	beql	v0,t3,131c0 <data_size+0x131b0>
 494:	4b4b4b83 	c2	0x14b4b83
 498:	4b4b4c4b 	c2	0x14b4c4b
 49c:	4b4b4c4b 	c2	0x14b4c4b
 4a0:	4b4d4f4b 	c2	0x14d4f4b
 4a4:	024b4b4b 	0x24b4b4b
 4a8:	01010004 	sllv	zero,at,t0
 4ac:	0000004c 	syscall	0x1
 4b0:	00230002 	ror	zero,v1,0x0
 4b4:	01010000 	0x1010000
 4b8:	000d0efb 	0xd0efb
 4bc:	01010101 	0x1010101
 4c0:	01000000 	0x1000000
 4c4:	00010000 	sll	zero,at,0x0
 4c8:	635f3265 	0x635f3265
 4cc:	635f6f6c 	0x635f6f6c
 4d0:	532e7a6c 	beql	t9,t6,1ee84 <data_size+0x1ee74>
 4d4:	00000000 	nop
 4d8:	02050000 	0x2050000
 4dc:	bfc011a0 	cache	0x0,4512(s8)
 4e0:	4b4b4b19 	c2	0x14b4b19
 4e4:	4b834d4b 	c2	0x1834d4b
 4e8:	4b4b4b4b 	c2	0x14b4b4b
 4ec:	4b4b4b83 	c2	0x14b4b83
 4f0:	4b4d4e4b 	c2	0x14d4e4b
 4f4:	024b4b4b 	0x24b4b4b
 4f8:	01010004 	sllv	zero,at,t0
 4fc:	000000b2 	tlt	zero,zero,0x2
 500:	00220002 	ror	zero,v0,0x0
 504:	01010000 	0x1010000
 508:	000d0efb 	0xd0efb
 50c:	01010101 	0x1010101
 510:	01000000 	0x1000000
 514:	00010000 	sll	zero,at,0x0
 518:	5f33396e 	0x5f33396e
 51c:	77626c74 	jalx	d89b1d0 <data_size+0xd89b1c0>
 520:	00532e72 	tlt	v0,s3,0xb9
 524:	00000000 	nop
 528:	10020500 	beq	zero,v0,192c <data_size+0x191c>
 52c:	1abfc012 	0x1abfc012
 530:	4b4b4d4b 	c2	0x14b4d4b
 534:	4b4b4b4b 	c2	0x14b4b4b
 538:	4b4b4b4b 	c2	0x14b4b4b
 53c:	4b4b4b4b 	c2	0x14b4b4b
 540:	4b4b4b4b 	c2	0x14b4b4b
 544:	4b4b4b4b 	c2	0x14b4b4b
 548:	4b4b4b4b 	c2	0x14b4b4b
 54c:	4b834b4b 	c2	0x1834b4b
 550:	4b4b4c4b 	c2	0x14b4c4b
 554:	4b4b4b4b 	c2	0x14b4b4b
 558:	4b4b4b4b 	c2	0x14b4b4b
 55c:	4b4b4b4b 	c2	0x14b4b4b
 560:	4b4b4b4b 	c2	0x14b4b4b
 564:	4b4b4b4b 	c2	0x14b4b4b
 568:	4b4b4b4b 	c2	0x14b4b4b
 56c:	4b4b4b4b 	c2	0x14b4b4b
 570:	4b4c4b4b 	c2	0x14c4b4b
 574:	4b4b4b4b 	c2	0x14b4b4b
 578:	4b4b4b4b 	c2	0x14b4b4b
 57c:	4b4b4b4b 	c2	0x14b4b4b
 580:	4b4b4b4b 	c2	0x14b4b4b
 584:	4b4b4b4b 	c2	0x14b4b4b
 588:	4b4b4b4b 	c2	0x14b4b4b
 58c:	4b4b4b4b 	c2	0x14b4b4b
 590:	4c4b4b4b 	0x4c4b4b4b
 594:	4b4b4b4b 	c2	0x14b4b4b
 598:	4b4b4b4b 	c2	0x14b4b4b
 59c:	4b4b4b4b 	c2	0x14b4b4b
 5a0:	4b4b4b4b 	c2	0x14b4b4b
 5a4:	4c4b4b4b 	0x4c4b4b4b
 5a8:	4b4b4b4d 	c2	0x14b4b4d
 5ac:	0004024b 	0x4024b
 5b0:	Address 0x00000000000005b0 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	cache	0x0,0(s8)
  14:	bfc009e0 	cache	0x0,2528(s8)
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
  70:	c009e000 	ll	t1,-8192(zero)
  74:	c00a78bf 	ll	t2,30911(zero)
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
  dc:	00024101 	0x24101
  e0:	c00a8000 	ll	t2,-32768(zero)
  e4:	c00ae0bf 	ll	t2,-8001(zero)
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
 148:	003c0002 	ror	zero,gp,0x0
 14c:	01040000 	0x1040000
 150:	0000029a 	0x29a
 154:	bfc00ae0 	cache	0x0,2784(s8)
 158:	bfc00b40 	cache	0x0,2880(s8)
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
 1bc:	0002ec01 	0x2ec01
 1c0:	c00b4000 	ll	t3,16384(zero)
 1c4:	c00f80bf 	ll	t7,-32577(zero)
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
 228:	03800104 	0x3800104
 22c:	0f800000 	jal	e000000 <data_size+0xdfffff0>
 230:	105cbfc0 	beq	v0,gp,ffff0134 <_etext+0x403eed0c>
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
 294:	000003ef 	0x3ef
 298:	bfc01060 	cache	0x0,4192(s8)
 29c:	bfc01128 	cache	0x0,4392(s8)
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
 300:	00045c01 	0x45c01
 304:	c0113000 	ll	s1,12288(zero)
 308:	c01198bf 	ll	s1,-26433(zero)
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
 368:	04ac0104 	teqi	a1,260
 36c:	11a00000 	beqz	t5,370 <data_size+0x360>
 370:	1204bfc0 	beq	s0,a0,ffff0274 <_etext+0x403eee4c>
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
 3d4:	0004fc01 	0x4fc01
 3d8:	c0121000 	ll	s2,4096(zero)
 3dc:	c0140cbf 	ll	s4,3263(zero)
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
