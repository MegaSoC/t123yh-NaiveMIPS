
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
bfc00018:	100001e4 	b	bfc007ac <locate>
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
bfc00208:	1043013c 	beq	v0,v1,bfc006fc <tlbwr_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:65
bfc0020c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:66
bfc00210:	3c03efe8 	lui	v1,0xefe8
/home/lxb/project/loooongson/soft/func_extended/start.S:67
bfc00214:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project/loooongson/soft/func_extended/start.S:68
bfc00218:	10430156 	beq	v0,v1,bfc00774 <tlbwi_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:69
bfc0021c:	00000000 	nop
	...
/home/lxb/project/loooongson/soft/func_extended/start.S:76
bfc00380:	0000d010 	mfhi	k0
/home/lxb/project/loooongson/soft/func_extended/start.S:77
bfc00384:	0000d812 	mflo	k1
/home/lxb/project/loooongson/soft/func_extended/start.S:78
bfc00388:	3c1a800d 	lui	k0,0x800d
/home/lxb/project/loooongson/soft/func_extended/start.S:79
bfc0038c:	8f5b0000 	lw	k1,0(k0)
/home/lxb/project/loooongson/soft/func_extended/start.S:80
bfc00390:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:81
bfc00394:	137a0019 	beq	k1,k0,bfc003fc <syscall_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:82
bfc00398:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:83
bfc0039c:	241a0002 	li	k0,2
/home/lxb/project/loooongson/soft/func_extended/start.S:84
bfc003a0:	137a0027 	beq	k1,k0,bfc00440 <break_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:85
bfc003a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:86
bfc003a8:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/start.S:87
bfc003ac:	137a0046 	beq	k1,k0,bfc004c8 <overflow_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:88
bfc003b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:89
bfc003b4:	241a0004 	li	k0,4
/home/lxb/project/loooongson/soft/func_extended/start.S:90
bfc003b8:	137a0053 	beq	k1,k0,bfc00508 <adel_load_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:91
bfc003bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:92
bfc003c0:	241a0005 	li	k0,5
/home/lxb/project/loooongson/soft/func_extended/start.S:93
bfc003c4:	137a0061 	beq	k1,k0,bfc0054c <ades_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:94
bfc003c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:95
bfc003cc:	241a0006 	li	k0,6
/home/lxb/project/loooongson/soft/func_extended/start.S:96
bfc003d0:	137a006f 	beq	k1,k0,bfc00590 <adel_if_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:97
bfc003d4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:98
bfc003d8:	241a0007 	li	k0,7
/home/lxb/project/loooongson/soft/func_extended/start.S:99
bfc003dc:	137a007e 	beq	k1,k0,bfc005d8 <reserved_inst_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:100
bfc003e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:101
bfc003e4:	241a0008 	li	k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:102
bfc003e8:	137a008c 	beq	k1,k0,bfc0061c <int_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:103
bfc003ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:104
bfc003f0:	241a0009 	li	k0,9
/home/lxb/project/loooongson/soft/func_extended/start.S:105
bfc003f4:	137a0023 	beq	k1,k0,bfc00484 <trap_ex>
/home/lxb/project/loooongson/soft/func_extended/start.S:106
bfc003f8:	00000000 	nop

bfc003fc <syscall_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:109
bfc003fc:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:110
bfc00400:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:111
bfc00404:	175400ae 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:112
bfc00408:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:113
bfc0040c:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:114
bfc00410:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:115
bfc00414:	241b0020 	li	k1,32
/home/lxb/project/loooongson/soft/func_extended/start.S:116
bfc00418:	175b00a9 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:117
bfc0041c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:118
bfc00420:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:119
bfc00424:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:120
bfc00428:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:121
bfc0042c:	175b00a4 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:122
bfc00430:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:123
bfc00434:	3c120001 	lui	s2,0x1
/home/lxb/project/loooongson/soft/func_extended/start.S:124
bfc00438:	100000a1 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:125
bfc0043c:	00000000 	nop

bfc00440 <break_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:128
bfc00440:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:129
bfc00444:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:130
bfc00448:	1754009d 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:131
bfc0044c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:132
bfc00450:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:133
bfc00454:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:134
bfc00458:	241b0024 	li	k1,36
/home/lxb/project/loooongson/soft/func_extended/start.S:135
bfc0045c:	175b0098 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:136
bfc00460:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:137
bfc00464:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:138
bfc00468:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:139
bfc0046c:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:140
bfc00470:	175b0093 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:141
bfc00474:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:142
bfc00478:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:143
bfc0047c:	10000090 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:144
bfc00480:	00000000 	nop

bfc00484 <trap_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:149
bfc00484:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:150
bfc00488:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:151
bfc0048c:	1754008c 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:152
bfc00490:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:153
bfc00494:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:154
bfc00498:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:155
bfc0049c:	241b0034 	li	k1,52
/home/lxb/project/loooongson/soft/func_extended/start.S:156
bfc004a0:	175b0087 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:157
bfc004a4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:158
bfc004a8:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:159
bfc004ac:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:160
bfc004b0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:161
bfc004b4:	175b0082 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:162
bfc004b8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:163
bfc004bc:	3c120002 	lui	s2,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:164
bfc004c0:	1000007f 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:165
bfc004c4:	00000000 	nop

bfc004c8 <overflow_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:168
bfc004c8:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:169
bfc004cc:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:170
bfc004d0:	1754007b 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:171
bfc004d4:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:172
bfc004d8:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:173
bfc004dc:	241b0030 	li	k1,48
/home/lxb/project/loooongson/soft/func_extended/start.S:174
bfc004e0:	175b0077 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:175
bfc004e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:176
bfc004e8:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:177
bfc004ec:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:178
bfc004f0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:179
bfc004f4:	175b0072 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:180
bfc004f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:181
bfc004fc:	3c120003 	lui	s2,0x3
/home/lxb/project/loooongson/soft/func_extended/start.S:182
bfc00500:	1000006f 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:183
bfc00504:	00000000 	nop

bfc00508 <adel_load_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:186
bfc00508:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:187
bfc0050c:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:188
bfc00510:	1754006b 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:189
bfc00514:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:190
bfc00518:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:191
bfc0051c:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:192
bfc00520:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:193
bfc00524:	175b0066 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:194
bfc00528:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:195
bfc0052c:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:196
bfc00530:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:197
bfc00534:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:198
bfc00538:	175b0061 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:199
bfc0053c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:200
bfc00540:	3c120004 	lui	s2,0x4
/home/lxb/project/loooongson/soft/func_extended/start.S:201
bfc00544:	1000005e 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:202
bfc00548:	00000000 	nop

bfc0054c <ades_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:205
bfc0054c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:206
bfc00550:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:207
bfc00554:	1754005a 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:208
bfc00558:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:209
bfc0055c:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:210
bfc00560:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:211
bfc00564:	241b0014 	li	k1,20
/home/lxb/project/loooongson/soft/func_extended/start.S:212
bfc00568:	175b0055 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:213
bfc0056c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:214
bfc00570:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:215
bfc00574:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:216
bfc00578:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:217
bfc0057c:	175b0050 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:218
bfc00580:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:219
bfc00584:	3c120005 	lui	s2,0x5
/home/lxb/project/loooongson/soft/func_extended/start.S:220
bfc00588:	1000004d 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:221
bfc0058c:	00000000 	nop

bfc00590 <adel_if_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:224
bfc00590:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:225
bfc00594:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:226
bfc00598:	17540049 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:227
bfc0059c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:228
bfc005a0:	40957000 	mtc0	s5,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:229
bfc005a4:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:230
bfc005a8:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:231
bfc005ac:	241b0010 	li	k1,16
/home/lxb/project/loooongson/soft/func_extended/start.S:232
bfc005b0:	175b0043 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:233
bfc005b4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:234
bfc005b8:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:235
bfc005bc:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:236
bfc005c0:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:237
bfc005c4:	175b003e 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:238
bfc005c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:239
bfc005cc:	3c120006 	lui	s2,0x6
/home/lxb/project/loooongson/soft/func_extended/start.S:240
bfc005d0:	1000003b 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:241
bfc005d4:	00000000 	nop

bfc005d8 <reserved_inst_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:244
bfc005d8:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:245
bfc005dc:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:246
bfc005e0:	17540037 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:247
bfc005e4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:248
bfc005e8:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:249
bfc005ec:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:250
bfc005f0:	241b0028 	li	k1,40
/home/lxb/project/loooongson/soft/func_extended/start.S:251
bfc005f4:	175b0032 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:252
bfc005f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:253
bfc005fc:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:254
bfc00600:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:255
bfc00604:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:256
bfc00608:	175b002d 	bne	k0,k1,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:257
bfc0060c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:258
bfc00610:	3c120007 	lui	s2,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:259
bfc00614:	1000002a 	b	bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:260
bfc00618:	00000000 	nop

bfc0061c <int_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:263
bfc0061c:	00009021 	move	s2,zero
/home/lxb/project/loooongson/soft/func_extended/start.S:264
bfc00620:	401a7000 	mfc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:265
bfc00624:	17540026 	bne	k0,s4,bfc006c0 <ex_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:266
bfc00628:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:267
bfc0062c:	275a0008 	addiu	k0,k0,8
/home/lxb/project/loooongson/soft/func_extended/start.S:268
bfc00630:	409a7000 	mtc0	k0,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:269
bfc00634:	3c1bbfb0 	lui	k1,0xbfb0
bfc00638:	af608ffc 	sw	zero,-28676(k1)
bfc0063c:	af608ffc 	sw	zero,-28676(k1)
bfc00640:	af60fff8 	sw	zero,-8(k1)
bfc00644:	af608ffc 	sw	zero,-28676(k1)
bfc00648:	af608ffc 	sw	zero,-28676(k1)
bfc0064c:	8f608ffc 	lw	zero,-28676(k1)
bfc00650:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:270
bfc00654:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:271
bfc00658:	3c1bbfb0 	lui	k1,0xbfb0
bfc0065c:	af608ffc 	sw	zero,-28676(k1)
bfc00660:	af608ffc 	sw	zero,-28676(k1)
bfc00664:	af7bfff8 	sw	k1,-8(k1)
bfc00668:	af608ffc 	sw	zero,-28676(k1)
bfc0066c:	af608ffc 	sw	zero,-28676(k1)
bfc00670:	8f608ffc 	lw	zero,-28676(k1)
bfc00674:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project/loooongson/soft/func_extended/start.S:272
bfc00678:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project/loooongson/soft/func_extended/start.S:273
bfc0067c:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:274
bfc00680:	175b000f 	bne	k0,k1,bfc006c0 <ex_finish>
bfc00684:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:275
bfc00688:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:276
bfc0068c:	401a6000 	mfc0	k0,c0_status
/home/lxb/project/loooongson/soft/func_extended/start.S:277
bfc00690:	335a0002 	andi	k0,k0,0x2
/home/lxb/project/loooongson/soft/func_extended/start.S:278
bfc00694:	241b0002 	li	k1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:279
bfc00698:	175b0009 	bne	k0,k1,bfc006c0 <ex_finish>
bfc0069c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:280
bfc006a0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:281
bfc006a4:	241affff 	li	k0,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:282
bfc006a8:	241b0000 	li	k1,0
/home/lxb/project/loooongson/soft/func_extended/start.S:283
bfc006ac:	409a5800 	mtc0	k0,c0_compare
/home/lxb/project/loooongson/soft/func_extended/start.S:284
bfc006b0:	409b6800 	mtc0	k1,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:285
bfc006b4:	1000000f 	b	bfc006f4 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:286
bfc006b8:	3c120008 	lui	s2,0x8
/home/lxb/project/loooongson/soft/func_extended/start.S:287
bfc006bc:	00000000 	nop

bfc006c0 <ex_finish>:
/home/lxb/project/loooongson/soft/func_extended/start.S:290
bfc006c0:	401a6800 	mfc0	k0,c0_cause
/home/lxb/project/loooongson/soft/func_extended/start.S:291
bfc006c4:	3c1b8000 	lui	k1,0x8000
/home/lxb/project/loooongson/soft/func_extended/start.S:292
bfc006c8:	035bd024 	and	k0,k0,k1
/home/lxb/project/loooongson/soft/func_extended/start.S:293
bfc006cc:	401b7000 	mfc0	k1,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:294
bfc006d0:	13400003 	beqz	k0,bfc006e0 <ex_finish+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:295
bfc006d4:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:296
bfc006d8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:297
bfc006dc:	277b0004 	addiu	k1,k1,4
/home/lxb/project/loooongson/soft/func_extended/start.S:299
bfc006e0:	409b7000 	mtc0	k1,c0_epc
/home/lxb/project/loooongson/soft/func_extended/start.S:300
bfc006e4:	16400003 	bnez	s2,bfc006f4 <ex_ret>
/home/lxb/project/loooongson/soft/func_extended/start.S:301
bfc006e8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:302
bfc006ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:303
bfc006f0:	3c12ffff 	lui	s2,0xffff

bfc006f4 <ex_ret>:
/home/lxb/project/loooongson/soft/func_extended/start.S:306
bfc006f4:	42000018 	eret
/home/lxb/project/loooongson/soft/func_extended/start.S:308
bfc006f8:	00000000 	nop

bfc006fc <tlbwr_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:311
bfc006fc:	24030001 	li	v1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:312
bfc00700:	1343000b 	beq	k0,v1,bfc00730 <tlbwr_allbit>
bfc00704:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:313
bfc00708:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:314
bfc0070c:	24030003 	li	v1,3
/home/lxb/project/loooongson/soft/func_extended/start.S:315
bfc00710:	1343000b 	beq	k0,v1,bfc00740 <tlbwr_asid>
bfc00714:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:316
bfc00718:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:317
bfc0071c:	25080001 	addiu	t0,t0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:318
bfc00720:	25290001 	addiu	t1,t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:319
bfc00724:	0bf001d3 	j	bfc0074c <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:320
bfc00728:	275a0001 	addiu	k0,k0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:321
bfc0072c:	00000000 	nop

bfc00730 <tlbwr_allbit>:
/home/lxb/project/loooongson/soft/func_extended/start.S:323
bfc00730:	35080007 	ori	t0,t0,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:324
bfc00734:	0bf001d3 	j	bfc0074c <tlbwr_return>
/home/lxb/project/loooongson/soft/func_extended/start.S:325
bfc00738:	35290007 	ori	t1,t1,0x7
/home/lxb/project/loooongson/soft/func_extended/start.S:326
bfc0073c:	00000000 	nop

bfc00740 <tlbwr_asid>:
/home/lxb/project/loooongson/soft/func_extended/start.S:328
bfc00740:	0bf001d3 	j	bfc0074c <tlbwr_return>
bfc00744:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:329
bfc00748:	00000000 	nop

bfc0074c <tlbwr_return>:
/home/lxb/project/loooongson/soft/func_extended/start.S:331
bfc0074c:	40955000 	mtc0	s5,c0_entryhi
bfc00750:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:332
bfc00754:	40881000 	mtc0	t0,c0_entrylo0
bfc00758:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:333
bfc0075c:	40891800 	mtc0	t1,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:334
bfc00760:	42000006 	tlbwr
/home/lxb/project/loooongson/soft/func_extended/start.S:335
bfc00764:	3c03ed08 	lui	v1,0xed08
/home/lxb/project/loooongson/soft/func_extended/start.S:336
bfc00768:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project/loooongson/soft/func_extended/start.S:337
bfc0076c:	007a1820 	add	v1,v1,k0
/home/lxb/project/loooongson/soft/func_extended/start.S:339
bfc00770:	42000018 	eret

bfc00774 <tlbwi_ex>:
/home/lxb/project/loooongson/soft/func_extended/start.S:342
bfc00774:	40034000 	mfc0	v1,c0_badvaddr
/home/lxb/project/loooongson/soft/func_extended/start.S:343
bfc00778:	3c05ffff 	lui	a1,0xffff
/home/lxb/project/loooongson/soft/func_extended/start.S:344
bfc0077c:	34a5e000 	ori	a1,a1,0xe000
/home/lxb/project/loooongson/soft/func_extended/start.S:345
bfc00780:	00a31824 	and	v1,a1,v1
/home/lxb/project/loooongson/soft/func_extended/start.S:346
bfc00784:	40835000 	mtc0	v1,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/start.S:347
bfc00788:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:348
bfc0078c:	40831000 	mtc0	v1,c0_entrylo0
/home/lxb/project/loooongson/soft/func_extended/start.S:349
bfc00790:	24034007 	li	v1,16391
/home/lxb/project/loooongson/soft/func_extended/start.S:350
bfc00794:	40831800 	mtc0	v1,c0_entrylo1
/home/lxb/project/loooongson/soft/func_extended/start.S:351
bfc00798:	42000002 	tlbwi
/home/lxb/project/loooongson/soft/func_extended/start.S:352
bfc0079c:	3c03ed12 	lui	v1,0xed12
/home/lxb/project/loooongson/soft/func_extended/start.S:353
bfc007a0:	34635678 	ori	v1,v1,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:355
bfc007a4:	42000018 	eret
/home/lxb/project/loooongson/soft/func_extended/start.S:357
bfc007a8:	00000000 	nop

bfc007ac <locate>:
/home/lxb/project/loooongson/soft/func_extended/start.S:363
bfc007ac:	3c04bfaf 	lui	a0,0xbfaf
bfc007b0:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:364
bfc007b4:	3c05bfaf 	lui	a1,0xbfaf
bfc007b8:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:365
bfc007bc:	3c11bfaf 	lui	s1,0xbfaf
bfc007c0:	3631f010 	ori	s1,s1,0xf010
/home/lxb/project/loooongson/soft/func_extended/start.S:367
bfc007c4:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:368
bfc007c8:	240a0001 	li	t2,1
/home/lxb/project/loooongson/soft/func_extended/start.S:369
bfc007cc:	3c130000 	lui	s3,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:371
bfc007d0:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:372
bfc007d4:	acaa0000 	sw	t2,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:373
bfc007d8:	ae330000 	sw	s3,0(s1)
/home/lxb/project/loooongson/soft/func_extended/start.S:375
bfc007dc:	3c100000 	lui	s0,0x0
/home/lxb/project/loooongson/soft/func_extended/start.S:377
bfc007e0:	3c09bfc0 	lui	t1,0xbfc0
bfc007e4:	252907f8 	addiu	t1,t1,2040
/home/lxb/project/loooongson/soft/func_extended/start.S:378
bfc007e8:	3c0a2000 	lui	t2,0x2000
/home/lxb/project/loooongson/soft/func_extended/start.S:379
bfc007ec:	012ac823 	subu	t9,t1,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:380
bfc007f0:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:381
bfc007f4:	00000000 	nop

bfc007f8 <inst_test>:
/home/lxb/project/loooongson/soft/func_extended/start.S:384
bfc007f8:	0ff002a0 	jal	bfc00a80 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:385
bfc007fc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:386
bfc00800:	0ff0024a 	jal	bfc00928 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc00804:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc00808:	0ff00438 	jal	bfc010e0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc0080c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:390
bfc00810:	0ff003e8 	jal	bfc00fa0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:391
bfc00814:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:392
bfc00818:	0ff0041c 	jal	bfc01070 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:393
bfc0081c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:394
bfc00820:	0ff00288 	jal	bfc00a20 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc00824:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:396
bfc00828:	0ff003b0 	jal	bfc00ec0 <n92_tlbwi_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:397
bfc0082c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:398
bfc00830:	0ff00454 	jal	bfc01150 <n93_tlbwr_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:399
bfc00834:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:401
bfc00838:	3c19bfc0 	lui	t9,0xbfc0
bfc0083c:	27390848 	addiu	t9,t9,2120
/home/lxb/project/loooongson/soft/func_extended/start.S:402
bfc00840:	03200008 	jr	t9
/home/lxb/project/loooongson/soft/func_extended/start.S:403
bfc00844:	00000000 	nop

bfc00848 <kseg0_kseg1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:406
bfc00848:	0ff002a0 	jal	bfc00a80 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:407
bfc0084c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:408
bfc00850:	0ff0024a 	jal	bfc00928 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:409
bfc00854:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:410
bfc00858:	0ff00438 	jal	bfc010e0 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:411
bfc0085c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:412
bfc00860:	0ff003e8 	jal	bfc00fa0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:413
bfc00864:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:414
bfc00868:	0ff0041c 	jal	bfc01070 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:415
bfc0086c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:416
bfc00870:	0ff00288 	jal	bfc00a20 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:417
bfc00874:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:418
bfc00878:	0ff0026a 	jal	bfc009a8 <e6_mapped_instr>
/home/lxb/project/loooongson/soft/func_extended/start.S:419
bfc0087c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:422
bfc00880:	3c04bfaf 	lui	a0,0xbfaf
bfc00884:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:423
bfc00888:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:424
bfc0088c:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:425
bfc00890:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:426
bfc00894:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:427
bfc00898:	15090009 	bne	t0,t1,bfc008c0 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:428
bfc0089c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:430
bfc008a0:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:431
bfc008a4:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:432
bfc008a8:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:433
bfc008ac:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:434
bfc008b0:	15090003 	bne	t0,t1,bfc008c0 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:435
bfc008b4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:436
bfc008b8:	10000003 	b	bfc008c8 <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:437
bfc008bc:	00000000 	nop

bfc008c0 <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:439
bfc008c0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:440
bfc008c4:	ae300000 	sw	s0,0(s1)

bfc008c8 <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:443
bfc008c8:	2410000c 	li	s0,12
/home/lxb/project/loooongson/soft/func_extended/start.S:444
bfc008cc:	1213000d 	beq	s0,s3,bfc00904 <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:445
bfc008d0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:447
bfc008d4:	3c04bfaf 	lui	a0,0xbfaf
bfc008d8:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:448
bfc008dc:	3c05bfaf 	lui	a1,0xbfaf
bfc008e0:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:449
bfc008e4:	3c06bfaf 	lui	a2,0xbfaf
bfc008e8:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:451
bfc008ec:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:453
bfc008f0:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:454
bfc008f4:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:455
bfc008f8:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:456
bfc008fc:	10000008 	b	bfc00920 <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:457
bfc00900:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:459
bfc00904:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:460
bfc00908:	3c04bfaf 	lui	a0,0xbfaf
bfc0090c:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:461
bfc00910:	3c05bfaf 	lui	a1,0xbfaf
bfc00914:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:462
bfc00918:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:463
bfc0091c:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:466
bfc00920:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:467
bfc00924:	00000000 	nop

bfc00928 <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:470
bfc00928:	3c08bfaf 	lui	t0,0xbfaf
bfc0092c:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:471
bfc00930:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:474
bfc00934:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:475
bfc00938:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:476
bfc0093c:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:477
bfc00940:	256b0001 	addiu	t3,t3,1

bfc00944 <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:480
bfc00944:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:483
bfc00948:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:484
bfc0094c:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:485
bfc00950:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:486
bfc00954:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:487
bfc00958:	15800002 	bnez	t4,bfc00964 <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:488
bfc0095c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:489
bfc00960:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:491
bfc00964:	1560fff7 	bnez	t3,bfc00944 <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:492
bfc00968:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:493
bfc0096c:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:494
bfc00970:	00000000 	nop
	...

bfc00980 <instr_tlb>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:8
bfc00980:	240a0000 	li	t2,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:9
bfc00984:	240c0000 	li	t4,0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:10
bfc00988:	240b000a 	li	t3,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:12
bfc0098c:	254a0001 	addiu	t2,t2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:13
bfc00990:	154bfffe 	bne	t2,t3,bfc0098c <instr_tlb+0xc>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:14
bfc00994:	258c000a 	addiu	t4,t4,10
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:15
bfc00998:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:16
bfc0099c:	00000000 	nop
	...

bfc009a8 <e6_mapped_instr>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:21
bfc009a8:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:22
bfc009ac:	03e0c821 	move	t9,ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:23
bfc009b0:	2404005d 	li	a0,93
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:25
bfc009b4:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:26
bfc009b8:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:27
bfc009bc:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:28
bfc009c0:	3c08bfc0 	lui	t0,0xbfc0
bfc009c4:	25080980 	addiu	t0,t0,2432
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:29
bfc009c8:	240de000 	li	t5,-8192
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:30
bfc009cc:	24156000 	li	s5,24576
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:31
bfc009d0:	010d4024 	and	t0,t0,t5
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:32
bfc009d4:	01004821 	move	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:33
bfc009d8:	3c0ebfc0 	lui	t6,0xbfc0
bfc009dc:	25ce0980 	addiu	t6,t6,2432
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:34
bfc009e0:	31ce0fff 	andi	t6,t6,0xfff
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:35
bfc009e4:	35ce6000 	ori	t6,t6,0x6000
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:36
bfc009e8:	01c0f809 	jalr	t6
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:37
bfc009ec:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:38
bfc009f0:	24010064 	li	at,100
bfc009f4:	15810002 	bne	t4,at,bfc00a00 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:39
bfc009f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:42
bfc009fc:	26730001 	addiu	s3,s3,1

bfc00a00 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:45
bfc00a00:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:46
bfc00a04:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:47
bfc00a08:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:48
bfc00a0c:	0320f821 	move	ra,t9
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:49
bfc00a10:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e6_mapped_instr.S:50
bfc00a14:	00000000 	nop
	...

bfc00a20 <e5_movz_movn>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc00a20:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc00a24:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc00a28:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc00a2c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc00a30:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc00a34:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc00a38:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc00a3c:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc00a40:	240904d6 	li	t1,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc00a44:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc00a48:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc00a4c:	24090929 	li	t1,2345
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc00a50:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc00a54:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc00a58:	3c090001 	lui	t1,0x1
bfc00a5c:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc00a60:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc00a64:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc00a68:	26730001 	addiu	s3,s3,1

bfc00a6c <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc00a6c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc00a70:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc00a74:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc00a78:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc00a7c:	00000000 	nop

bfc00a80 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00a80:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00a84:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00a88:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc00a8c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00a90:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00a94:	240f1926 	li	t7,6438
bfc00a98:	24181926 	li	t8,6438
bfc00a9c:	3c14bfc0 	lui	s4,0xbfc0
bfc00aa0:	26940aa4 	addiu	s4,s4,2724
bfc00aa4:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc00aa8:	240f1926 	li	t7,6438
bfc00aac:	24180817 	li	t8,2071
bfc00ab0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ab4:	26940ab8 	addiu	s4,s4,2744
bfc00ab8:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc00abc:	240f1926 	li	t7,6438
bfc00ac0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ac4:	26940ac8 	addiu	s4,s4,2760
bfc00ac8:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc00acc:	240f1926 	li	t7,6438
bfc00ad0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ad4:	26940ad8 	addiu	s4,s4,2776
bfc00ad8:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc00adc:	240f1926 	li	t7,6438
bfc00ae0:	24181926 	li	t8,6438
bfc00ae4:	3c14bfc0 	lui	s4,0xbfc0
bfc00ae8:	26940aec 	addiu	s4,s4,2796
bfc00aec:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00af0:	240f1926 	li	t7,6438
bfc00af4:	24180817 	li	t8,2071
bfc00af8:	3c14bfc0 	lui	s4,0xbfc0
bfc00afc:	26940b00 	addiu	s4,s4,2816
bfc00b00:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00b04:	240f1926 	li	t7,6438
bfc00b08:	3c14bfc0 	lui	s4,0xbfc0
bfc00b0c:	26940b10 	addiu	s4,s4,2832
bfc00b10:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00b14:	240f1926 	li	t7,6438
bfc00b18:	3c14bfc0 	lui	s4,0xbfc0
bfc00b1c:	26940b20 	addiu	s4,s4,2848
bfc00b20:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00b24:	240f04d2 	li	t7,1234
bfc00b28:	2418fb2e 	li	t8,-1234
bfc00b2c:	3c14bfc0 	lui	s4,0xbfc0
bfc00b30:	26940b34 	addiu	s4,s4,2868
bfc00b34:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00b38:	240ffb2e 	li	t7,-1234
bfc00b3c:	241804d2 	li	t8,1234
bfc00b40:	3c14bfc0 	lui	s4,0xbfc0
bfc00b44:	26940b48 	addiu	s4,s4,2888
bfc00b48:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc00b4c:	240f04d2 	li	t7,1234
bfc00b50:	3c14bfc0 	lui	s4,0xbfc0
bfc00b54:	26940b58 	addiu	s4,s4,2904
bfc00b58:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc00b5c:	240ffb2e 	li	t7,-1234
bfc00b60:	3c14bfc0 	lui	s4,0xbfc0
bfc00b64:	26940b68 	addiu	s4,s4,2920
bfc00b68:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00b6c:	240f04d2 	li	t7,1234
bfc00b70:	2418fb2e 	li	t8,-1234
bfc00b74:	3c14bfc0 	lui	s4,0xbfc0
bfc00b78:	26940b7c 	addiu	s4,s4,2940
bfc00b7c:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00b80:	240ffb2e 	li	t7,-1234
bfc00b84:	241804d2 	li	t8,1234
bfc00b88:	3c14bfc0 	lui	s4,0xbfc0
bfc00b8c:	26940b90 	addiu	s4,s4,2960
bfc00b90:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00b94:	240f04d2 	li	t7,1234
bfc00b98:	3c14bfc0 	lui	s4,0xbfc0
bfc00b9c:	26940ba0 	addiu	s4,s4,2976
bfc00ba0:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00ba4:	240ffb2e 	li	t7,-1234
bfc00ba8:	3c14bfc0 	lui	s4,0xbfc0
bfc00bac:	26940bb0 	addiu	s4,s4,2992
bfc00bb0:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00bb4:	240f04d2 	li	t7,1234
bfc00bb8:	2418fb2e 	li	t8,-1234
bfc00bbc:	3c14bfc0 	lui	s4,0xbfc0
bfc00bc0:	26940bc4 	addiu	s4,s4,3012
bfc00bc4:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00bc8:	240ffb2e 	li	t7,-1234
bfc00bcc:	241804d2 	li	t8,1234
bfc00bd0:	3c14bfc0 	lui	s4,0xbfc0
bfc00bd4:	26940bd8 	addiu	s4,s4,3032
bfc00bd8:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00bdc:	240f04d2 	li	t7,1234
bfc00be0:	3c14bfc0 	lui	s4,0xbfc0
bfc00be4:	26940be8 	addiu	s4,s4,3048
bfc00be8:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00bec:	240ffb2e 	li	t7,-1234
bfc00bf0:	3c14bfc0 	lui	s4,0xbfc0
bfc00bf4:	26940bf8 	addiu	s4,s4,3064
bfc00bf8:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00bfc:	240f04d2 	li	t7,1234
bfc00c00:	2418fb2e 	li	t8,-1234
bfc00c04:	3c14bfc0 	lui	s4,0xbfc0
bfc00c08:	26940c0c 	addiu	s4,s4,3084
bfc00c0c:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00c10:	240ffb2e 	li	t7,-1234
bfc00c14:	241804d2 	li	t8,1234
bfc00c18:	3c14bfc0 	lui	s4,0xbfc0
bfc00c1c:	26940c20 	addiu	s4,s4,3104
bfc00c20:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00c24:	240f04d2 	li	t7,1234
bfc00c28:	3c14bfc0 	lui	s4,0xbfc0
bfc00c2c:	26940c30 	addiu	s4,s4,3120
bfc00c30:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00c34:	240ffb2e 	li	t7,-1234
bfc00c38:	3c14bfc0 	lui	s4,0xbfc0
bfc00c3c:	26940c40 	addiu	s4,s4,3136
bfc00c40:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00c44:	03e01021 	move	v0,ra
bfc00c48:	240f04d2 	li	t7,1234
bfc00c4c:	241804d2 	li	t8,1234
bfc00c50:	51f80002 	beql	t7,t8,bfc00c5c <e1_trap_test+0x1dc>
bfc00c54:	25ef0001 	addiu	t7,t7,1
bfc00c58:	25ef000a 	addiu	t7,t7,10
bfc00c5c:	27180064 	addiu	t8,t8,100
bfc00c60:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00c64:	03e01021 	move	v0,ra
bfc00c68:	240f04d2 	li	t7,1234
bfc00c6c:	2418162e 	li	t8,5678
bfc00c70:	51f80002 	beql	t7,t8,bfc00c7c <e1_trap_test+0x1fc>
bfc00c74:	25ef0001 	addiu	t7,t7,1
bfc00c78:	25ef000a 	addiu	t7,t7,10
bfc00c7c:	27180064 	addiu	t8,t8,100
bfc00c80:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00c84:	03e01021 	move	v0,ra
bfc00c88:	240f162e 	li	t7,5678
bfc00c8c:	241804d2 	li	t8,1234
bfc00c90:	51f80002 	beql	t7,t8,bfc00c9c <e1_trap_test+0x21c>
bfc00c94:	25ef0001 	addiu	t7,t7,1
bfc00c98:	25ef000a 	addiu	t7,t7,10
bfc00c9c:	27180064 	addiu	t8,t8,100
bfc00ca0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00ca4:	03e01021 	move	v0,ra
bfc00ca8:	240f04d2 	li	t7,1234
bfc00cac:	241804d2 	li	t8,1234
bfc00cb0:	55f80002 	bnel	t7,t8,bfc00cbc <e1_trap_test+0x23c>
bfc00cb4:	25ef0001 	addiu	t7,t7,1
bfc00cb8:	25ef000a 	addiu	t7,t7,10
bfc00cbc:	27180064 	addiu	t8,t8,100
bfc00cc0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00cc4:	03e01021 	move	v0,ra
bfc00cc8:	240f04d2 	li	t7,1234
bfc00ccc:	2418162e 	li	t8,5678
bfc00cd0:	55f80002 	bnel	t7,t8,bfc00cdc <e1_trap_test+0x25c>
bfc00cd4:	25ef0001 	addiu	t7,t7,1
bfc00cd8:	25ef000a 	addiu	t7,t7,10
bfc00cdc:	27180064 	addiu	t8,t8,100
bfc00ce0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00ce4:	03e01021 	move	v0,ra
bfc00ce8:	240f162e 	li	t7,5678
bfc00cec:	241804d2 	li	t8,1234
bfc00cf0:	55f80002 	bnel	t7,t8,bfc00cfc <e1_trap_test+0x27c>
bfc00cf4:	25ef0001 	addiu	t7,t7,1
bfc00cf8:	25ef000a 	addiu	t7,t7,10
bfc00cfc:	27180064 	addiu	t8,t8,100
bfc00d00:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00d04:	03e01021 	move	v0,ra
bfc00d08:	240f04d2 	li	t7,1234
bfc00d0c:	05e30002 	bgezl	t7,bfc00d18 <e1_trap_test+0x298>
bfc00d10:	25ef0001 	addiu	t7,t7,1
bfc00d14:	25ef0014 	addiu	t7,t7,20
bfc00d18:	25ef000a 	addiu	t7,t7,10
bfc00d1c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00d20:	03e01021 	move	v0,ra
bfc00d24:	240f0000 	li	t7,0
bfc00d28:	05e30002 	bgezl	t7,bfc00d34 <e1_trap_test+0x2b4>
bfc00d2c:	25ef0001 	addiu	t7,t7,1
bfc00d30:	25ef0014 	addiu	t7,t7,20
bfc00d34:	25ef000a 	addiu	t7,t7,10
bfc00d38:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00d3c:	03e01021 	move	v0,ra
bfc00d40:	240ffb2e 	li	t7,-1234
bfc00d44:	05e30002 	bgezl	t7,bfc00d50 <e1_trap_test+0x2d0>
bfc00d48:	25ef0001 	addiu	t7,t7,1
bfc00d4c:	25ef0014 	addiu	t7,t7,20
bfc00d50:	25ef000a 	addiu	t7,t7,10
bfc00d54:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00d58:	03e01021 	move	v0,ra
bfc00d5c:	240f04d2 	li	t7,1234
bfc00d60:	5de00002 	bgtzl	t7,bfc00d6c <e1_trap_test+0x2ec>
bfc00d64:	25ef0001 	addiu	t7,t7,1
bfc00d68:	25ef0014 	addiu	t7,t7,20
bfc00d6c:	25ef000a 	addiu	t7,t7,10
bfc00d70:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00d74:	03e01021 	move	v0,ra
bfc00d78:	240f0000 	li	t7,0
bfc00d7c:	5de00002 	bgtzl	t7,bfc00d88 <e1_trap_test+0x308>
bfc00d80:	25ef0001 	addiu	t7,t7,1
bfc00d84:	25ef0014 	addiu	t7,t7,20
bfc00d88:	25ef000a 	addiu	t7,t7,10
bfc00d8c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00d90:	03e01021 	move	v0,ra
bfc00d94:	240ffb2e 	li	t7,-1234
bfc00d98:	5de00002 	bgtzl	t7,bfc00da4 <e1_trap_test+0x324>
bfc00d9c:	25ef0001 	addiu	t7,t7,1
bfc00da0:	25ef0014 	addiu	t7,t7,20
bfc00da4:	25ef000a 	addiu	t7,t7,10
bfc00da8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00dac:	03e01021 	move	v0,ra
bfc00db0:	240f04d2 	li	t7,1234
bfc00db4:	05e20002 	bltzl	t7,bfc00dc0 <e1_trap_test+0x340>
bfc00db8:	25ef0001 	addiu	t7,t7,1
bfc00dbc:	25ef0014 	addiu	t7,t7,20
bfc00dc0:	25ef000a 	addiu	t7,t7,10
bfc00dc4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00dc8:	03e01021 	move	v0,ra
bfc00dcc:	240f0000 	li	t7,0
bfc00dd0:	05e20002 	bltzl	t7,bfc00ddc <e1_trap_test+0x35c>
bfc00dd4:	25ef0001 	addiu	t7,t7,1
bfc00dd8:	25ef0014 	addiu	t7,t7,20
bfc00ddc:	25ef000a 	addiu	t7,t7,10
bfc00de0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00de4:	03e01021 	move	v0,ra
bfc00de8:	240ffb2e 	li	t7,-1234
bfc00dec:	05e20002 	bltzl	t7,bfc00df8 <e1_trap_test+0x378>
bfc00df0:	25ef0001 	addiu	t7,t7,1
bfc00df4:	25ef0014 	addiu	t7,t7,20
bfc00df8:	25ef000a 	addiu	t7,t7,10
bfc00dfc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00e00:	03e01021 	move	v0,ra
bfc00e04:	240f04d2 	li	t7,1234
bfc00e08:	59e00002 	blezl	t7,bfc00e14 <e1_trap_test+0x394>
bfc00e0c:	25ef0001 	addiu	t7,t7,1
bfc00e10:	25ef0014 	addiu	t7,t7,20
bfc00e14:	25ef000a 	addiu	t7,t7,10
bfc00e18:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00e1c:	03e01021 	move	v0,ra
bfc00e20:	240f0000 	li	t7,0
bfc00e24:	59e00002 	blezl	t7,bfc00e30 <e1_trap_test+0x3b0>
bfc00e28:	25ef0001 	addiu	t7,t7,1
bfc00e2c:	25ef0014 	addiu	t7,t7,20
bfc00e30:	25ef000a 	addiu	t7,t7,10
bfc00e34:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00e38:	03e01021 	move	v0,ra
bfc00e3c:	240ffb2e 	li	t7,-1234
bfc00e40:	59e00002 	blezl	t7,bfc00e4c <e1_trap_test+0x3cc>
bfc00e44:	25ef0001 	addiu	t7,t7,1
bfc00e48:	25ef0014 	addiu	t7,t7,20
bfc00e4c:	25ef000a 	addiu	t7,t7,10
bfc00e50:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00e54:	03e01021 	move	v0,ra
bfc00e58:	240f04d2 	li	t7,1234
bfc00e5c:	05f30002 	bgezall	t7,bfc00e68 <e1_trap_test+0x3e8>
bfc00e60:	25ef0001 	addiu	t7,t7,1
bfc00e64:	25ef0014 	addiu	t7,t7,20
bfc00e68:	25ef000a 	addiu	t7,t7,10
bfc00e6c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00e70:	03e01021 	move	v0,ra
bfc00e74:	240f0000 	li	t7,0
bfc00e78:	05f30002 	bgezall	t7,bfc00e84 <e1_trap_test+0x404>
bfc00e7c:	25ef0001 	addiu	t7,t7,1
bfc00e80:	25ef0014 	addiu	t7,t7,20
bfc00e84:	25ef000a 	addiu	t7,t7,10
bfc00e88:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00e8c:	03e01021 	move	v0,ra
bfc00e90:	240ffb2e 	li	t7,-1234
bfc00e94:	05f30002 	bgezall	t7,bfc00ea0 <e1_trap_test+0x420>
bfc00e98:	25ef0001 	addiu	t7,t7,1
bfc00e9c:	25ef0014 	addiu	t7,t7,20
bfc00ea0:	25ef000a 	addiu	t7,t7,10
bfc00ea4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00ea8:	26730001 	addiu	s3,s3,1

bfc00eac <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00eac:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00eb0:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00eb4:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00eb8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00ebc:	00000000 	nop

bfc00ec0 <n92_tlbwi_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:9
bfc00ec0:	2404005c 	li	a0,92
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:10
bfc00ec4:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:12
bfc00ec8:	24120000 	li	s2,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:13
bfc00ecc:	241a0010 	li	k0,16

bfc00ed0 <test_phase1_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:15
bfc00ed0:	40920000 	mtc0	s2,c0_index
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:16
bfc00ed4:	3c02efe8 	lui	v0,0xefe8
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:17
bfc00ed8:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:18
bfc00edc:	00124c00 	sll	t1,s2,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:19
bfc00ee0:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:20
bfc00ee4:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:21
bfc00ee8:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:22
bfc00eec:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:23
bfc00ef0:	aea70000 	sw	a3,0(s5)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:29
bfc00f08:	3c08ed12 	lui	t0,0xed12
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:30
bfc00f0c:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:31
bfc00f10:	1468001d 	bne	v1,t0,bfc00f88 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:32
bfc00f14:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:33
bfc00f18:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:34
bfc00f1c:	8ea80000 	lw	t0,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:35
bfc00f20:	3c15abcd 	lui	s5,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:36
bfc00f24:	36b5ef81 	ori	s5,s5,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:37
bfc00f28:	16a80017 	bne	s5,t0,bfc00f88 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:38
bfc00f2c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:39
bfc00f30:	26520001 	addiu	s2,s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:40
bfc00f34:	1752ffe6 	bne	k0,s2,bfc00ed0 <test_phase1_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:41
bfc00f38:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:42
bfc00f3c:	24020000 	li	v0,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:43
bfc00f40:	241a0010 	li	k0,16
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:44
bfc00f44:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:45
bfc00f48:	24030000 	li	v1,0

bfc00f4c <test_phase2_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:47
bfc00f4c:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:48
bfc00f50:	00024c00 	sll	t1,v0,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:49
bfc00f54:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:50
bfc00f58:	8ea90000 	lw	t1,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:51
bfc00f5c:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:52
bfc00f60:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:53
bfc00f64:	15270008 	bne	t1,a3,bfc00f88 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:54
bfc00f68:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:55
bfc00f6c:	24420001 	addiu	v0,v0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:56
bfc00f70:	24090000 	li	t1,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:57
bfc00f74:	15230004 	bne	t1,v1,bfc00f88 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:58
bfc00f78:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:59
bfc00f7c:	145afff3 	bne	v0,k0,bfc00f4c <test_phase2_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:60
bfc00f80:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:62
bfc00f84:	26730001 	addiu	s3,s3,1

bfc00f88 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:65
bfc00f88:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:66
bfc00f8c:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:67
bfc00f90:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:68
bfc00f94:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:69
bfc00f98:	00000000 	nop
inst_error():
bfc00f9c:	00000000 	nop

bfc00fa0 <e3_madd_msub_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc00fa0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc00fa4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc00fa8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc00fac:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc00fb0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc00fb4:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc00fb8:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc00fbc:	24091234 	li	t1,4660
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc00fc0:	240a5678 	li	t2,22136
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc00fc4:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc00fc8:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc00fcc:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc00fd0:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc00fd4:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc00fd8:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc00fdc:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc00fe0:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc00fe4:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc00fe8:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc00fec:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc00ff0:	712a0001 	maddu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc00ff4:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc00ff8:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc00ffc:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc01000:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc01004:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc01008:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc0100c:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc01010:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc01014:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc01018:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc0101c:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc01020:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc01024:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc01028:	712a0005 	msubu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc0102c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc01030:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc01034:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc01038:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc0103c:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc01040:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc01044:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc01048:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc0104c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc01050:	26730001 	addiu	s3,s3,1

bfc01054 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc01054:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc01058:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc0105c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc01060:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc01064:	00000000 	nop
	...

bfc01070 <e4_ll_sc>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc01070:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc01074:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc01078:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc0107c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc01080:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc01084:	3c088000 	lui	t0,0x8000
bfc01088:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc0108c:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc01090:	ad090004 	sw	t1,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc01094:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc01098:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc0109c:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc010a0:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc010a4:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc010a8:	0000000c 	syscall
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc010ac:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc010b0:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc010b4:	240c04d6 	li	t4,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc010b8:	156c0002 	bne	t3,t4,bfc010c4 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc010bc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc010c0:	26730001 	addiu	s3,s3,1

bfc010c4 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc010c4:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc010c8:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc010cc:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc010d0:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc010d4:	00000000 	nop
	...

bfc010e0 <e2_clo_clz_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc010e0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc010e4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc010e8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc010ec:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc010f0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc010f4:	3c08e234 	lui	t0,0xe234
bfc010f8:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc010fc:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc01100:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc01104:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc01108:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc0110c:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc01110:	3c081926 	lui	t0,0x1926
bfc01114:	35080817 	ori	t0,t0,0x817
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc01118:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc0111c:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc01120:	2408000e 	li	t0,14
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc01124:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc01128:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc0112c:	26730001 	addiu	s3,s3,1

bfc01130 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc01130:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc01134:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc01138:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc0113c:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc01140:	00000000 	nop
	...

bfc01150 <n93_tlbwr_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:9
bfc01150:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:10
bfc01154:	2404005d 	li	a0,93

bfc01158 <test_gbit_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:13
bfc01158:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:14
bfc0115c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:15
bfc01160:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:16
bfc01164:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:17
bfc01168:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:18
bfc0116c:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:19
bfc01170:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:20
bfc01174:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:21
bfc01178:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:22
bfc0117c:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:23
bfc01180:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:24
bfc01184:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:30
bfc0119c:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:31
bfc011a0:	3508dc16 	ori	t0,t0,0xdc16
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:32
bfc011a4:	14680050 	bne	v1,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:33
bfc011a8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:34
bfc011ac:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:35
bfc011b0:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:36
bfc011b4:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:37
bfc011b8:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:38
bfc011bc:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:39
bfc011c0:	14e80049 	bne	a3,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:40
bfc011c4:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:41
bfc011c8:	3c128010 	lui	s2,0x8010
bfc011cc:	36520124 	ori	s2,s2,0x124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:42
bfc011d0:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:43
bfc011d4:	14e80044 	bne	a3,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:44
bfc011d8:	00000000 	nop

bfc011dc <test_asid_match>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:46
bfc011dc:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:47
bfc011e0:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:48
bfc011e4:	3c120012 	lui	s2,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:49
bfc011e8:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:50
bfc011ec:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:51
bfc011f0:	3c150012 	lui	s5,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:52
bfc011f4:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:53
bfc011f8:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:54
bfc011fc:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:55
bfc01200:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:56
bfc01204:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:57
bfc01208:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:63
bfc01220:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:64
bfc01224:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:65
bfc01228:	1468002f 	bne	v1,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:66
bfc0122c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:67
bfc01230:	3c150013 	lui	s5,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:68
bfc01234:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:69
bfc01238:	40955000 	mtc0	s5,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:70
bfc0123c:	3c120013 	lui	s2,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:71
bfc01240:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:72
bfc01244:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:73
bfc01248:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:74
bfc0124c:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:75
bfc01250:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:76
bfc01254:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:77
bfc01258:	14e80023 	bne	a3,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:78
bfc0125c:	00000000 	nop

bfc01260 <test_asid_2>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:80
bfc01260:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:81
bfc01264:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:82
bfc01268:	3c120014 	lui	s2,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:83
bfc0126c:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:84
bfc01270:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:85
bfc01274:	3c150014 	lui	s5,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:86
bfc01278:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:87
bfc0127c:	3c07bd86 	lui	a3,0xbd86
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:88
bfc01280:	34e713ac 	ori	a3,a3,0x13ac
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:89
bfc01284:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:90
bfc01288:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:91
bfc0128c:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:97
bfc012a4:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:98
bfc012a8:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:99
bfc012ac:	1468000e 	bne	v1,t0,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:100
bfc012b0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:101
bfc012b4:	3c120015 	lui	s2,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:102
bfc012b8:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:103
bfc012bc:	3c150015 	lui	s5,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:104
bfc012c0:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:105
bfc012c4:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:106
bfc012c8:	24094002 	li	t1,16386
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:107
bfc012cc:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:108
bfc012d0:	8e470000 	lw	a3,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:109
bfc012d4:	3c07ed08 	lui	a3,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:110
bfc012d8:	34e7dc18 	ori	a3,a3,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:111
bfc012dc:	14e30002 	bne	a3,v1,bfc012e8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:112
bfc012e0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:114
bfc012e4:	26730001 	addiu	s3,s3,1

bfc012e8 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:117
bfc012e8:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:118
bfc012ec:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:119
bfc012f0:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:120
bfc012f4:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:121
bfc012f8:	00000000 	nop
bfc012fc:	00000000 	nop
bfc01300:	9e3f7f7c 	0x9e3f7f7c
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
  14:	00000974 	teq	zero,zero,0x25
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc00980 	cache	0x0,2432(s8)
  34:	00000098 	0x98
	...
  40:	0000001c 	0x1c
  44:	00d10002 	0xd10002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc00a20 	cache	0x0,2592(s8)
  54:	00000060 	0x60
	...
  60:	0000001c 	0x1c
  64:	013e0002 	0x13e0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00a80 	cache	0x0,2688(s8)
  74:	00000440 	sll	zero,zero,0x11
	...
  80:	0000001c 	0x1c
  84:	01ab0002 	0x1ab0002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00ec0 	cache	0x0,3776(s8)
  94:	000000dc 	0xdc
	...
  a0:	0000001c 	0x1c
  a4:	02150002 	0x2150002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00fa0 	cache	0x0,4000(s8)
  b4:	000000c8 	0xc8
	...
  c0:	0000001c 	0x1c
  c4:	02820002 	0x2820002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc01070 	cache	0x0,4208(s8)
  d4:	00000068 	0x68
	...
  e0:	0000001c 	0x1c
  e4:	02eb0002 	0x2eb0002
  e8:	00040000 	sll	zero,a0,0x0
  ec:	00000000 	nop
  f0:	bfc010e0 	cache	0x0,4320(s8)
  f4:	00000064 	0x64
	...
 100:	0000001c 	0x1c
 104:	03560002 	0x3560002
 108:	00040000 	sll	zero,a0,0x0
 10c:	00000000 	nop
 110:	bfc01150 	cache	0x0,4432(s8)
 114:	000001ac 	0x1ac
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc009a8 	cache	0x0,2472(s8)
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00a20 	cache	0x0,2592(s8)
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00a80 	cache	0x0,2688(s8)
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00ec0 	cache	0x0,3776(s8)
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00fa0 	cache	0x0,4000(s8)
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc01070 	cache	0x0,4208(s8)
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc010e0 	cache	0x0,4320(s8)
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc01150 	cache	0x0,4432(s8)
	...
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000001bf 	0x1bf
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
  5c:	02e4024b 	0x2e4024b
  60:	4b4b4b19 	c2	0x14b4b19
  64:	4b4b4b4b 	c2	0x14b4b4b
  68:	4b4b4b4b 	c2	0x14b4b4b
  6c:	4b4b4b4b 	c2	0x14b4b4b
  70:	4b4b4b4b 	c2	0x14b4b4b
  74:	4b4b4b4b 	c2	0x14b4b4b
  78:	4b4b4b4b 	c2	0x14b4b4b
  7c:	4d4b4b4b 	0x4d4b4b4b
  80:	4b4b4b4b 	c2	0x14b4b4b
  84:	4b4b4b4b 	c2	0x14b4b4b
  88:	4b4b4b4b 	c2	0x14b4b4b
  8c:	4b4b4b4b 	c2	0x14b4b4b
  90:	4b4b4b4d 	c2	0x14b4b4d
  94:	4b4b4b4b 	c2	0x14b4b4b
  98:	4b4b4b4b 	c2	0x14b4b4b
  9c:	4b4b4b4b 	c2	0x14b4b4b
  a0:	4b4b4f4b 	c2	0x14b4f4b
  a4:	4b4b4b4b 	c2	0x14b4b4b
  a8:	4b4b4b4b 	c2	0x14b4b4b
  ac:	4b4b4b4b 	c2	0x14b4b4b
  b0:	4b4d4b4b 	c2	0x14d4b4b
  b4:	4b4b4b4b 	c2	0x14b4b4b
  b8:	4b4b4b4b 	c2	0x14b4b4b
  bc:	4b4b4b4b 	c2	0x14b4b4b
  c0:	4b4d4b4b 	c2	0x14d4b4b
  c4:	4b4b4b4b 	c2	0x14b4b4b
  c8:	4b4b4b4b 	c2	0x14b4b4b
  cc:	4b4b4b4b 	c2	0x14b4b4b
  d0:	4d4b4b4b 	0x4d4b4b4b
  d4:	4b4b4b4b 	c2	0x14b4b4b
  d8:	4b4b4b4b 	c2	0x14b4b4b
  dc:	4b4b4b4b 	c2	0x14b4b4b
  e0:	4b4b4b4b 	c2	0x14b4b4b
  e4:	4b4b4b4d 	c2	0x14b4b4d
  e8:	4b4b4b4b 	c2	0x14b4b4b
  ec:	4b4b4b4b 	c2	0x14b4b4b
  f0:	4b4b4b4b 	c2	0x14b4b4b
  f4:	4b4d4b4b 	c2	0x14d4b4b
  f8:	4b4b4b4b 	c2	0x14b4b4b
  fc:	4b4b4b4b 	c2	0x14b4b4b
 100:	4b4b4b4b 	c2	0x14b4b4b
 104:	4d4b4b4b 	0x4d4b4b4b
 108:	4b4b4b4b 	c2	0x14b4b4b
 10c:	e5084b4b 	swc1	$f8,19275(t0)
 110:	4be5084b 	c2	0x1e5084b
 114:	4b4b834b 	c2	0x14b834b
 118:	4b834b4b 	c2	0x1834b4b
 11c:	4b4b4b4b 	c2	0x14b4b4b
 120:	4b4d4b4b 	c2	0x14d4b4b
 124:	4b4b4b4b 	c2	0x14b4b4b
 128:	4b4c4b4b 	c2	0x14c4b4b
 12c:	4d4b4b4b 	0x4d4b4b4b
 130:	834b4d4c 	lb	t3,19788(k0)
 134:	4b834b4b 	c2	0x1834b4b
 138:	4b4b4b4b 	c2	0x14b4b4b
 13c:	4b4b4b4c 	c2	0x14b4b4c
 140:	834c834c 	lb	t4,-31924(k0)
 144:	4b4b4b83 	c2	0x14b4b83
 148:	4b4d4c4b 	c2	0x14d4c4b
 14c:	4b4b4b4b 	c2	0x14b4b4b
 150:	4b4b4b4b 	c2	0x14b4b4b
 154:	4c4c4b4b 	0x4c4c4b4b
 158:	84838350 	lh	v1,-31920(a0)
 15c:	4b4c4b4b 	c2	0x14c4b4b
 160:	834c4c4b 	lb	t4,19531(k0)
 164:	4d4b4b4b 	0x4d4b4b4b
 168:	4b4b4b4b 	c2	0x14b4b4b
 16c:	4b4b4b4b 	c2	0x14b4b4b
 170:	4b4b4b4b 	c2	0x14b4b4b
 174:	4c4b4b4b 	0x4c4b4b4b
 178:	4b4d4b83 	c2	0x14d4b83
 17c:	4b4b4b4b 	c2	0x14b4b4b
 180:	4b4b4b4b 	c2	0x14b4b4b
 184:	4b4b4b4b 	c2	0x14b4b4b
 188:	4b4b834d 	c2	0x14b834d
 18c:	4c4b4b4b 	0x4c4b4b4b
 190:	4b4b4b4b 	c2	0x14b4b4b
 194:	4c4b4b4b 	0x4c4b4b4b
 198:	4b4b4d4b 	c2	0x14b4d4b
 19c:	8483834c 	lh	v1,-31924(a0)
 1a0:	4b4b4b4c 	c2	0x14b4b4c
 1a4:	834b4c4b 	lb	t3,19531(k0)
 1a8:	4b4d4b83 	c2	0x14d4b83
 1ac:	4b4d834d 	c2	0x14d834d
 1b0:	4d4d4b4b 	0x4d4d4b4b
 1b4:	4b4b4b4b 	c2	0x14b4b4b
 1b8:	4b4c4b4b 	c2	0x14c4b4b
 1bc:	04024b4b 	bltzl	zero,12eec <data_size+0x12edc>
 1c0:	5c010100 	0x5c010100
 1c4:	02000000 	0x2000000
 1c8:	00002800 	sll	a1,zero,0x0
 1cc:	fb010100 	sdc2	$1,256(t8)
 1d0:	01000d0e 	0x1000d0e
 1d4:	00010101 	0x10101
 1d8:	00010000 	sll	zero,at,0x0
 1dc:	65000100 	0x65000100
 1e0:	616d5f36 	0x616d5f36
 1e4:	64657070 	0x64657070
 1e8:	736e695f 	0x736e695f
 1ec:	532e7274 	beql	t9,t6,1cbc0 <data_size+0x1cbb0>
 1f0:	00000000 	nop
 1f4:	02050000 	0x2050000
 1f8:	bfc00980 	cache	0x0,2432(s8)
 1fc:	4c4b4b19 	0x4c4b4b19
 200:	4b4b4b4b 	c2	0x14b4b4b
 204:	4b4b864b 	c2	0x14b864b
 208:	4b4b4b4c 	c2	0x14b4b4c
 20c:	4b4b4b83 	c2	0x14b4b83
 210:	4b4b834b 	c2	0x14b834b
 214:	4d834b4b 	0x4d834b4b
 218:	4b4b4b4d 	c2	0x14b4b4d
 21c:	04024b4b 	bltzl	zero,12f4c <data_size+0x12f3c>
 220:	4e010100 	c3	0x10100
 224:	02000000 	0x2000000
 228:	00002500 	sll	a0,zero,0x14
 22c:	fb010100 	sdc2	$1,256(t8)
 230:	01000d0e 	0x1000d0e
 234:	00010101 	0x10101
 238:	00010000 	sll	zero,at,0x0
 23c:	65000100 	0x65000100
 240:	6f6d5f35 	0x6f6d5f35
 244:	6d5f7a76 	0x6d5f7a76
 248:	2e6e766f 	sltiu	t6,s3,30319
 24c:	00000053 	mtlhx	zero
 250:	05000000 	bltz	t0,254 <data_size+0x244>
 254:	c00a2002 	ll	t2,8194(zero)
 258:	4b4b19bf 	c2	0x14b19bf
 25c:	4b504b4b 	c2	0x1504b4b
 260:	4b4b4b4b 	c2	0x14b4b4b
 264:	4b4b4b4b 	c2	0x14b4b4b
 268:	4d4f4b83 	0x4d4f4b83
 26c:	4b4b4b4b 	c2	0x14b4b4b
 270:	01000402 	0x1000402
 274:	00009001 	movf	s2,zero,$fcc0
 278:	25000200 	addiu	zero,t0,512
 27c:	01000000 	0x1000000
 280:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 284:	01010100 	0x1010100
 288:	00000001 	movf	zero,zero,$fcc0
 28c:	01000001 	movf	zero,t0,$fcc0
 290:	5f316500 	0x5f316500
 294:	70617274 	0x70617274
 298:	7365745f 	0x7365745f
 29c:	00532e74 	teq	v0,s3,0xb9
 2a0:	00000000 	nop
 2a4:	80020500 	lb	v0,1280(zero)
 2a8:	19bfc00a 	0x19bfc00a
 2ac:	4b4b4b4b 	c2	0x14b4b4b
 2b0:	083d084d 	j	f42134 <data_size+0xf42124>
 2b4:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 2b8:	f33d083d 	0xf33d083d
 2bc:	083d08f4 	j	f423d0 <data_size+0xf423c0>
 2c0:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 2c4:	f33d083d 	0xf33d083d
 2c8:	083d08f3 	j	f423cc <data_size+0xf423bc>
 2cc:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 2d0:	f33d083d 	0xf33d083d
 2d4:	08e508f4 	j	39423d0 <data_size+0x39423c0>
 2d8:	08e508e5 	j	3942394 <data_size+0x3942384>
 2dc:	08e508e5 	j	3942394 <data_size+0x3942384>
 2e0:	08ad08e5 	j	2b42394 <data_size+0x2b42384>
 2e4:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2e8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2ec:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2f0:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2f4:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2f8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 2fc:	4db008ad 	0x4db008ad
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	01000402 	0x1000402
 308:	00006b01 	0x6b01
 30c:	22000200 	addi	zero,s0,512
 310:	01000000 	0x1000000
 314:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 318:	01010100 	0x1010100
 31c:	00000001 	movf	zero,zero,$fcc0
 320:	01000001 	movf	zero,t0,$fcc0
 324:	32396e00 	andi	t9,s1,0x6e00
 328:	626c745f 	0x626c745f
 32c:	532e6977 	beql	t9,t6,1a90c <data_size+0x1a8fc>
 330:	00000000 	nop
 334:	02050000 	0x2050000
 338:	bfc00ec0 	cache	0x0,3776(s8)
 33c:	4b4c4b1a 	c2	0x14c4b1a
 340:	4b4b4b4c 	c2	0x14b4b4c
 344:	4b4b4b4b 	c2	0x14b4b4b
 348:	4b4b4b4b 	c2	0x14b4b4b
 34c:	4b4b4b4b 	c2	0x14b4b4b
 350:	4b4b4b4b 	c2	0x14b4b4b
 354:	4b4b4b4b 	c2	0x14b4b4b
 358:	4b4b4b4b 	c2	0x14b4b4b
 35c:	4c4b4b4b 	0x4c4b4b4b
 360:	4b4b4b4b 	c2	0x14b4b4b
 364:	4b4b4b4b 	c2	0x14b4b4b
 368:	4b4b4b4b 	c2	0x14b4b4b
 36c:	4b4d4c4b 	c2	0x14d4c4b
 370:	024b4b4b 	0x24b4b4b
 374:	01010004 	sllv	zero,at,t0
 378:	00000069 	0x69
 37c:	00250002 	ror	zero,a1,0x0
 380:	01010000 	0x1010000
 384:	000d0efb 	0xd0efb
 388:	01010101 	0x1010101
 38c:	01000000 	0x1000000
 390:	00010000 	sll	zero,at,0x0
 394:	6d5f3365 	0x6d5f3365
 398:	5f646461 	0x5f646461
 39c:	6275736d 	0x6275736d
 3a0:	0000532e 	0x532e
 3a4:	00000000 	nop
 3a8:	0fa00205 	jal	e800814 <data_size+0xe800804>
 3ac:	4b19bfc0 	c2	0x119bfc0
 3b0:	4d4b4b4b 	0x4d4b4b4b
 3b4:	4b4b4b4b 	c2	0x14b4b4b
 3b8:	4b4b4b4b 	c2	0x14b4b4b
 3bc:	4b4b4b4b 	c2	0x14b4b4b
 3c0:	4b4b4b4b 	c2	0x14b4b4b
 3c4:	4b4b4b4b 	c2	0x14b4b4b
 3c8:	4b4b4b4b 	c2	0x14b4b4b
 3cc:	4b4b4b4b 	c2	0x14b4b4b
 3d0:	4b4b4b4b 	c2	0x14b4b4b
 3d4:	4b4b4b4b 	c2	0x14b4b4b
 3d8:	4d4e4b4b 	0x4d4e4b4b
 3dc:	4b4b4b4b 	c2	0x14b4b4b
 3e0:	01000402 	0x1000402
 3e4:	00004c01 	0x4c01
 3e8:	21000200 	addi	zero,t0,512
 3ec:	01000000 	0x1000000
 3f0:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 3f4:	01010100 	0x1010100
 3f8:	00000001 	movf	zero,zero,$fcc0
 3fc:	01000001 	movf	zero,t0,$fcc0
 400:	5f346500 	0x5f346500
 404:	735f6c6c 	0x735f6c6c
 408:	00532e63 	0x532e63
 40c:	00000000 	nop
 410:	70020500 	0x70020500
 414:	19bfc010 	0x19bfc010
 418:	4b4b4b4b 	c2	0x14b4b4b
 41c:	4b4b8350 	c2	0x14b8350
 420:	4b4c4b4b 	c2	0x14c4b4b
 424:	4b4c4b4b 	c2	0x14c4b4b
 428:	4d4f4b4b 	0x4d4f4b4b
 42c:	4b4b4b4b 	c2	0x14b4b4b
 430:	01000402 	0x1000402
 434:	00004c01 	0x4c01
 438:	23000200 	addi	zero,t8,512
 43c:	01000000 	0x1000000
 440:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 444:	01010100 	0x1010100
 448:	00000001 	movf	zero,zero,$fcc0
 44c:	01000001 	movf	zero,t0,$fcc0
 450:	5f326500 	0x5f326500
 454:	5f6f6c63 	0x5f6f6c63
 458:	2e7a6c63 	sltiu	k0,s3,27747
 45c:	00000053 	mtlhx	zero
 460:	05000000 	bltz	t0,464 <data_size+0x454>
 464:	c010e002 	ll	s0,-8190(zero)
 468:	4b4b19bf 	c2	0x14b19bf
 46c:	834d4b4b 	lb	t5,19275(k0)
 470:	4b4b4b4b 	c2	0x14b4b4b
 474:	4b4b834b 	c2	0x14b834b
 478:	4d4e4b4b 	0x4d4e4b4b
 47c:	4b4b4b4b 	c2	0x14b4b4b
 480:	01000402 	0x1000402
 484:	00009e01 	0x9e01
 488:	22000200 	addi	zero,s0,512
 48c:	01000000 	0x1000000
 490:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 494:	01010100 	0x1010100
 498:	00000001 	movf	zero,zero,$fcc0
 49c:	01000001 	movf	zero,t0,$fcc0
 4a0:	33396e00 	andi	t9,t9,0x6e00
 4a4:	626c745f 	0x626c745f
 4a8:	532e7277 	beql	t9,t6,1ce88 <data_size+0x1ce78>
 4ac:	00000000 	nop
 4b0:	02050000 	0x2050000
 4b4:	bfc01150 	cache	0x0,4432(s8)
 4b8:	4b4d4b1a 	c2	0x14d4b1a
 4bc:	4b4b4b4b 	c2	0x14b4b4b
 4c0:	4b4b4b4b 	c2	0x14b4b4b
 4c4:	4b4b4b4b 	c2	0x14b4b4b
 4c8:	4b4b4b4b 	c2	0x14b4b4b
 4cc:	4b4b4b4b 	c2	0x14b4b4b
 4d0:	4b4b4b4b 	c2	0x14b4b4b
 4d4:	834b4b4b 	lb	t3,19275(k0)
 4d8:	4b4c4b4b 	c2	0x14c4b4b
 4dc:	4b4b4b4b 	c2	0x14b4b4b
 4e0:	4b4b4b4b 	c2	0x14b4b4b
 4e4:	4b4b4b4b 	c2	0x14b4b4b
 4e8:	4b4b4b4b 	c2	0x14b4b4b
 4ec:	4b4b4b4b 	c2	0x14b4b4b
 4f0:	4b4b4b4b 	c2	0x14b4b4b
 4f4:	4b4b4b4b 	c2	0x14b4b4b
 4f8:	4c4b4b4b 	0x4c4b4b4b
 4fc:	4b4b4b4b 	c2	0x14b4b4b
 500:	4b4b4b4b 	c2	0x14b4b4b
 504:	4b4b4b4b 	c2	0x14b4b4b
 508:	4b4b4b4b 	c2	0x14b4b4b
 50c:	4b4b4b4b 	c2	0x14b4b4b
 510:	4b4b4b4b 	c2	0x14b4b4b
 514:	4b4b4b4b 	c2	0x14b4b4b
 518:	4b4b4b4b 	c2	0x14b4b4b
 51c:	4b4b4d4c 	c2	0x14b4d4c
 520:	04024b4b 	bltzl	zero,13250 <data_size+0x13240>
 524:	Address 0x0000000000000524 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	cache	0x0,0(s8)
  14:	bfc00974 	cache	0x0,2420(s8)
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
  6c:	0001c301 	0x1c301
  70:	c0098000 	ll	t1,-32768(zero)
  74:	c00a18bf 	ll	t2,6335(zero)
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
  d0:	00006980 	sll	t5,zero,0x6
  d4:	28000200 	slti	zero,zero,512
  d8:	04000000 	bltz	zero,dc <data_size+0xcc>
  dc:	00022301 	0x22301
  e0:	c00a2000 	ll	t2,8192(zero)
  e4:	c00a80bf 	ll	t2,-32577(zero)
  e8:	5f3565bf 	0x5f3565bf
  ec:	7a766f6d 	0x7a766f6d
  f0:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
  f4:	00532e6e 	0x532e6e
  f8:	6d6f682f 	0x6d6f682f
  fc:	786c2f65 	0x786c2f65
 100:	72702f62 	0x72702f62
 104:	63656a6f 	0x63656a6f
 108:	6f6c2f74 	0x6f6c2f74
 10c:	6e6f6f6f 	0x6e6f6f6f
 110:	6e6f7367 	0x6e6f7367
 114:	666f732f 	0x666f732f
 118:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 11c:	655f636e 	0x655f636e
 120:	6e657478 	0x6e657478
 124:	2f646564 	sltiu	a0,k1,25956
 128:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 12c:	554e4700 	bnel	t2,t6,11d30 <data_size+0x11d20>
 130:	20534120 	addi	s3,v0,16672
 134:	38312e32 	xori	s1,at,0x2e32
 138:	0030352e 	0x30352e
 13c:	00698001 	movt	s0,v1,$fcc2
 140:	00020000 	sll	zero,v0,0x0
 144:	0000003c 	0x3c
 148:	02750104 	0x2750104
 14c:	0a800000 	j	a000000 <data_size+0x9fffff0>
 150:	0ec0bfc0 	jal	b02ff00 <data_size+0xb02fef0>
 154:	3165bfc0 	andi	a1,t3,0xbfc0
 158:	6172745f 	0x6172745f
 15c:	65745f70 	0x65745f70
 160:	532e7473 	beql	t9,t6,1d330 <data_size+0x1d320>
 164:	6f682f00 	0x6f682f00
 168:	6c2f656d 	0x6c2f656d
 16c:	702f6278 	0x702f6278
 170:	656a6f72 	0x656a6f72
 174:	6c2f7463 	0x6c2f7463
 178:	6f6f6f6f 	0x6f6f6f6f
 17c:	6f73676e 	0x6f73676e
 180:	6f732f6e 	0x6f732f6e
 184:	662f7466 	0x662f7466
 188:	5f636e75 	0x5f636e75
 18c:	65747865 	0x65747865
 190:	6465646e 	0x6465646e
 194:	736e692f 	0x736e692f
 198:	4e470074 	c3	0x470074
 19c:	53412055 	beql	k0,at,82f4 <data_size+0x82e4>
 1a0:	312e3220 	andi	t6,t1,0x3220
 1a4:	30352e38 	andi	s5,at,0x2e38
 1a8:	66800100 	0x66800100
 1ac:	02000000 	0x2000000
 1b0:	00005000 	sll	t2,zero,0x0
 1b4:	09010400 	j	4041000 <data_size+0x4040ff0>
 1b8:	c0000003 	ll	zero,3(zero)
 1bc:	9cbfc00e 	0x9cbfc00e
 1c0:	6ebfc00f 	0x6ebfc00f
 1c4:	745f3239 	jalx	17cc8e4 <data_size+0x17cc8d4>
 1c8:	6977626c 	0x6977626c
 1cc:	2f00532e 	sltiu	zero,t8,21294
 1d0:	656d6f68 	0x656d6f68
 1d4:	62786c2f 	0x62786c2f
 1d8:	6f72702f 	0x6f72702f
 1dc:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 1e0:	6f6f6c2f 	0x6f6f6c2f
 1e4:	676e6f6f 	0x676e6f6f
 1e8:	2f6e6f73 	sltiu	t6,k1,28531
 1ec:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 1f0:	6e75662f 	0x6e75662f
 1f4:	78655f63 	0x78655f63
 1f8:	646e6574 	0x646e6574
 1fc:	692f6465 	0x692f6465
 200:	0074736e 	0x74736e
 204:	20554e47 	addi	s5,v0,20039
 208:	32205341 	andi	zero,s1,0x5341
 20c:	2e38312e 	sltiu	t8,s1,12590
 210:	01003035 	0x1003035
 214:	00006980 	sll	t5,zero,0x6
 218:	64000200 	0x64000200
 21c:	04000000 	bltz	zero,220 <data_size+0x210>
 220:	00037801 	0x37801
 224:	c00fa000 	ll	t7,-24576(zero)
 228:	c01068bf 	ll	s0,26815(zero)
 22c:	5f3365bf 	0x5f3365bf
 230:	6464616d 	0x6464616d
 234:	75736d5f 	jalx	5cdb57c <data_size+0x5cdb56c>
 238:	00532e62 	0x532e62
 23c:	6d6f682f 	0x6d6f682f
 240:	786c2f65 	0x786c2f65
 244:	72702f62 	0x72702f62
 248:	63656a6f 	0x63656a6f
 24c:	6f6c2f74 	0x6f6c2f74
 250:	6e6f6f6f 	0x6e6f6f6f
 254:	6e6f7367 	0x6e6f7367
 258:	666f732f 	0x666f732f
 25c:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 260:	655f636e 	0x655f636e
 264:	6e657478 	0x6e657478
 268:	2f646564 	sltiu	a0,k1,25956
 26c:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 270:	554e4700 	bnel	t2,t6,11e74 <data_size+0x11e64>
 274:	20534120 	addi	s3,v0,16672
 278:	38312e32 	xori	s1,at,0x2e32
 27c:	0030352e 	0x30352e
 280:	00658001 	movt	s0,v1,$fcc1
 284:	00020000 	sll	zero,v0,0x0
 288:	00000078 	0x78
 28c:	03e50104 	0x3e50104
 290:	10700000 	beq	v1,s0,294 <data_size+0x284>
 294:	10d8bfc0 	beq	a2,t8,ffff0198 <_etext+0x403eee80>
 298:	3465bfc0 	ori	a1,v1,0xbfc0
 29c:	5f6c6c5f 	0x5f6c6c5f
 2a0:	532e6373 	beql	t9,t6,19070 <data_size+0x19060>
 2a4:	6f682f00 	0x6f682f00
 2a8:	6c2f656d 	0x6c2f656d
 2ac:	702f6278 	0x702f6278
 2b0:	656a6f72 	0x656a6f72
 2b4:	6c2f7463 	0x6c2f7463
 2b8:	6f6f6f6f 	0x6f6f6f6f
 2bc:	6f73676e 	0x6f73676e
 2c0:	6f732f6e 	0x6f732f6e
 2c4:	662f7466 	0x662f7466
 2c8:	5f636e75 	0x5f636e75
 2cc:	65747865 	0x65747865
 2d0:	6465646e 	0x6465646e
 2d4:	736e692f 	0x736e692f
 2d8:	4e470074 	c3	0x470074
 2dc:	53412055 	beql	k0,at,8434 <data_size+0x8424>
 2e0:	312e3220 	andi	t6,t1,0x3220
 2e4:	30352e38 	andi	s5,at,0x2e38
 2e8:	67800100 	0x67800100
 2ec:	02000000 	0x2000000
 2f0:	00008c00 	sll	s1,zero,0x10
 2f4:	35010400 	ori	at,t0,0x400
 2f8:	e0000004 	sc	zero,4(zero)
 2fc:	44bfc010 	0x44bfc010
 300:	65bfc011 	0x65bfc011
 304:	6c635f32 	0x6c635f32
 308:	6c635f6f 	0x6c635f6f
 30c:	00532e7a 	0x532e7a
 310:	6d6f682f 	0x6d6f682f
 314:	786c2f65 	0x786c2f65
 318:	72702f62 	0x72702f62
 31c:	63656a6f 	0x63656a6f
 320:	6f6c2f74 	0x6f6c2f74
 324:	6e6f6f6f 	0x6e6f6f6f
 328:	6e6f7367 	0x6e6f7367
 32c:	666f732f 	0x666f732f
 330:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 334:	655f636e 	0x655f636e
 338:	6e657478 	0x6e657478
 33c:	2f646564 	sltiu	a0,k1,25956
 340:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 344:	554e4700 	bnel	t2,t6,11f48 <data_size+0x11f38>
 348:	20534120 	addi	s3,v0,16672
 34c:	38312e32 	xori	s1,at,0x2e32
 350:	0030352e 	0x30352e
 354:	00668001 	0x668001
 358:	00020000 	sll	zero,v0,0x0
 35c:	000000a0 	0xa0
 360:	04850104 	0x4850104
 364:	11500000 	beq	t2,s0,368 <data_size+0x358>
 368:	12fcbfc0 	beq	s7,gp,ffff026c <_etext+0x403eef54>
 36c:	396ebfc0 	xori	t6,t3,0xbfc0
 370:	6c745f33 	0x6c745f33
 374:	2e727762 	sltiu	s2,s3,30562
 378:	682f0053 	0x682f0053
 37c:	2f656d6f 	sltiu	a1,k1,28015
 380:	2f62786c 	sltiu	v0,k1,30828
 384:	6a6f7270 	0x6a6f7270
 388:	2f746365 	sltiu	s4,k1,25445
 38c:	6f6f6f6c 	0x6f6f6f6c
 390:	73676e6f 	0x73676e6f
 394:	732f6e6f 	0x732f6e6f
 398:	2f74666f 	sltiu	s4,k1,26223
 39c:	636e7566 	0x636e7566
 3a0:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 3a4:	65646e65 	0x65646e65
 3a8:	6e692f64 	0x6e692f64
 3ac:	47007473 	c1	0x1007473
 3b0:	4120554e 	0x4120554e
 3b4:	2e322053 	sltiu	s2,s1,8275
 3b8:	352e3831 	ori	t6,t1,0x3831
 3bc:	80010030 	lb	at,48(zero)

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
