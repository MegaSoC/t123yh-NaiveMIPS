
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
bfc007f8:	0ff00274 	jal	bfc009d0 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:385
bfc007fc:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:386
bfc00800:	0ff00248 	jal	bfc00920 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:387
bfc00804:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:388
bfc00808:	0ff0040c 	jal	bfc01030 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:389
bfc0080c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:390
bfc00810:	0ff003bc 	jal	bfc00ef0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:391
bfc00814:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:392
bfc00818:	0ff003f0 	jal	bfc00fc0 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:393
bfc0081c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:394
bfc00820:	0ff0025c 	jal	bfc00970 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:395
bfc00824:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:396
bfc00828:	0ff00384 	jal	bfc00e10 <n92_tlbwi_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:397
bfc0082c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:398
bfc00830:	0ff00428 	jal	bfc010a0 <n93_tlbwr_test>
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
bfc00848:	0ff00274 	jal	bfc009d0 <e1_trap_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:407
bfc0084c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:408
bfc00850:	0ff00248 	jal	bfc00920 <wait_1s>
/home/lxb/project/loooongson/soft/func_extended/start.S:409
bfc00854:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:410
bfc00858:	0ff0040c 	jal	bfc01030 <e2_clo_clz_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:411
bfc0085c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:412
bfc00860:	0ff003bc 	jal	bfc00ef0 <e3_madd_msub_test>
/home/lxb/project/loooongson/soft/func_extended/start.S:413
bfc00864:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:414
bfc00868:	0ff003f0 	jal	bfc00fc0 <e4_ll_sc>
/home/lxb/project/loooongson/soft/func_extended/start.S:415
bfc0086c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:416
bfc00870:	0ff0025c 	jal	bfc00970 <e5_movz_movn>
/home/lxb/project/loooongson/soft/func_extended/start.S:417
bfc00874:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:420
bfc00878:	3c04bfaf 	lui	a0,0xbfaf
bfc0087c:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project/loooongson/soft/func_extended/start.S:421
bfc00880:	24081234 	li	t0,4660
/home/lxb/project/loooongson/soft/func_extended/start.S:422
bfc00884:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:423
bfc00888:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:424
bfc0088c:	00084400 	sll	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:425
bfc00890:	15090009 	bne	t0,t1,bfc008b8 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:426
bfc00894:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:428
bfc00898:	3c085678 	lui	t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/start.S:429
bfc0089c:	ac880000 	sw	t0,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:430
bfc008a0:	00084402 	srl	t0,t0,0x10
/home/lxb/project/loooongson/soft/func_extended/start.S:431
bfc008a4:	8c890000 	lw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:432
bfc008a8:	15090003 	bne	t0,t1,bfc008b8 <io_err>
/home/lxb/project/loooongson/soft/func_extended/start.S:433
bfc008ac:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:434
bfc008b0:	10000003 	b	bfc008c0 <test_end>
/home/lxb/project/loooongson/soft/func_extended/start.S:435
bfc008b4:	00000000 	nop

bfc008b8 <io_err>:
/home/lxb/project/loooongson/soft/func_extended/start.S:437
bfc008b8:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/start.S:438
bfc008bc:	ae300000 	sw	s0,0(s1)

bfc008c0 <test_end>:
/home/lxb/project/loooongson/soft/func_extended/start.S:441
bfc008c0:	2410000c 	li	s0,12
/home/lxb/project/loooongson/soft/func_extended/start.S:442
bfc008c4:	1213000d 	beq	s0,s3,bfc008fc <test_end+0x3c>
/home/lxb/project/loooongson/soft/func_extended/start.S:443
bfc008c8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:445
bfc008cc:	3c04bfaf 	lui	a0,0xbfaf
bfc008d0:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project/loooongson/soft/func_extended/start.S:446
bfc008d4:	3c05bfaf 	lui	a1,0xbfaf
bfc008d8:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:447
bfc008dc:	3c06bfaf 	lui	a2,0xbfaf
bfc008e0:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:449
bfc008e4:	24090002 	li	t1,2
/home/lxb/project/loooongson/soft/func_extended/start.S:451
bfc008e8:	ac800000 	sw	zero,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:452
bfc008ec:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:453
bfc008f0:	acc90000 	sw	t1,0(a2)
/home/lxb/project/loooongson/soft/func_extended/start.S:454
bfc008f4:	10000008 	b	bfc00918 <test_end+0x58>
/home/lxb/project/loooongson/soft/func_extended/start.S:455
bfc008f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:457
bfc008fc:	24090001 	li	t1,1
/home/lxb/project/loooongson/soft/func_extended/start.S:458
bfc00900:	3c04bfaf 	lui	a0,0xbfaf
bfc00904:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project/loooongson/soft/func_extended/start.S:459
bfc00908:	3c05bfaf 	lui	a1,0xbfaf
bfc0090c:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project/loooongson/soft/func_extended/start.S:460
bfc00910:	ac890000 	sw	t1,0(a0)
/home/lxb/project/loooongson/soft/func_extended/start.S:461
bfc00914:	aca90000 	sw	t1,0(a1)
/home/lxb/project/loooongson/soft/func_extended/start.S:464
bfc00918:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project/loooongson/soft/func_extended/start.S:465
bfc0091c:	00000000 	nop

bfc00920 <wait_1s>:
/home/lxb/project/loooongson/soft/func_extended/start.S:468
bfc00920:	3c08bfaf 	lui	t0,0xbfaf
bfc00924:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project/loooongson/soft/func_extended/start.S:469
bfc00928:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project/loooongson/soft/func_extended/start.S:472
bfc0092c:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:473
bfc00930:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:474
bfc00934:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:475
bfc00938:	256b0001 	addiu	t3,t3,1

bfc0093c <sub1>:
/home/lxb/project/loooongson/soft/func_extended/start.S:478
bfc0093c:	256bffff 	addiu	t3,t3,-1
/home/lxb/project/loooongson/soft/func_extended/start.S:481
bfc00940:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/start.S:482
bfc00944:	01495026 	xor	t2,t2,t1
/home/lxb/project/loooongson/soft/func_extended/start.S:483
bfc00948:	000a5240 	sll	t2,t2,0x9
/home/lxb/project/loooongson/soft/func_extended/start.S:484
bfc0094c:	016a602b 	sltu	t4,t3,t2
/home/lxb/project/loooongson/soft/func_extended/start.S:485
bfc00950:	15800002 	bnez	t4,bfc0095c <sub1+0x20>
/home/lxb/project/loooongson/soft/func_extended/start.S:486
bfc00954:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:487
bfc00958:	254b0000 	addiu	t3,t2,0
/home/lxb/project/loooongson/soft/func_extended/start.S:489
bfc0095c:	1560fff7 	bnez	t3,bfc0093c <sub1>
/home/lxb/project/loooongson/soft/func_extended/start.S:490
bfc00960:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/start.S:491
bfc00964:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/start.S:492
bfc00968:	00000000 	nop
sub1():
bfc0096c:	00000000 	nop

bfc00970 <e5_movz_movn>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc00970:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc00974:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc00978:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc0097c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc00980:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc00984:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc00988:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc0098c:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc00990:	240904d6 	li	t1,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc00994:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc00998:	012b500b 	movn	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc0099c:	24090929 	li	t1,2345
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc009a0:	240b0000 	li	t3,0
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc009a4:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc009a8:	3c090001 	lui	t1,0x1
bfc009ac:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc009b0:	240b0001 	li	t3,1
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc009b4:	012b500a 	movz	t2,t1,t3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc009b8:	26730001 	addiu	s3,s3,1

bfc009bc <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc009bc:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc009c0:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc009c4:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc009c8:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc009cc:	00000000 	nop

bfc009d0 <e1_trap_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc009d0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc009d4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc009d8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc009dc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc009e0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc009e4:	240f1926 	li	t7,6438
bfc009e8:	24181926 	li	t8,6438
bfc009ec:	3c14bfc0 	lui	s4,0xbfc0
bfc009f0:	269409f4 	addiu	s4,s4,2548
bfc009f4:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc009f8:	240f1926 	li	t7,6438
bfc009fc:	24180817 	li	t8,2071
bfc00a00:	3c14bfc0 	lui	s4,0xbfc0
bfc00a04:	26940a08 	addiu	s4,s4,2568
bfc00a08:	01f80034 	teq	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc00a0c:	240f1926 	li	t7,6438
bfc00a10:	3c14bfc0 	lui	s4,0xbfc0
bfc00a14:	26940a18 	addiu	s4,s4,2584
bfc00a18:	05ec1926 	teqi	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc00a1c:	240f1926 	li	t7,6438
bfc00a20:	3c14bfc0 	lui	s4,0xbfc0
bfc00a24:	26940a28 	addiu	s4,s4,2600
bfc00a28:	05ec0817 	teqi	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc00a2c:	240f1926 	li	t7,6438
bfc00a30:	24181926 	li	t8,6438
bfc00a34:	3c14bfc0 	lui	s4,0xbfc0
bfc00a38:	26940a3c 	addiu	s4,s4,2620
bfc00a3c:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00a40:	240f1926 	li	t7,6438
bfc00a44:	24180817 	li	t8,2071
bfc00a48:	3c14bfc0 	lui	s4,0xbfc0
bfc00a4c:	26940a50 	addiu	s4,s4,2640
bfc00a50:	01f80036 	tne	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00a54:	240f1926 	li	t7,6438
bfc00a58:	3c14bfc0 	lui	s4,0xbfc0
bfc00a5c:	26940a60 	addiu	s4,s4,2656
bfc00a60:	05ee1926 	tnei	t7,6438
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00a64:	240f1926 	li	t7,6438
bfc00a68:	3c14bfc0 	lui	s4,0xbfc0
bfc00a6c:	26940a70 	addiu	s4,s4,2672
bfc00a70:	05ee0817 	tnei	t7,2071
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00a74:	240f04d2 	li	t7,1234
bfc00a78:	2418fb2e 	li	t8,-1234
bfc00a7c:	3c14bfc0 	lui	s4,0xbfc0
bfc00a80:	26940a84 	addiu	s4,s4,2692
bfc00a84:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00a88:	240ffb2e 	li	t7,-1234
bfc00a8c:	241804d2 	li	t8,1234
bfc00a90:	3c14bfc0 	lui	s4,0xbfc0
bfc00a94:	26940a98 	addiu	s4,s4,2712
bfc00a98:	01f80030 	tge	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc00a9c:	240f04d2 	li	t7,1234
bfc00aa0:	3c14bfc0 	lui	s4,0xbfc0
bfc00aa4:	26940aa8 	addiu	s4,s4,2728
bfc00aa8:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc00aac:	240ffb2e 	li	t7,-1234
bfc00ab0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ab4:	26940ab8 	addiu	s4,s4,2744
bfc00ab8:	05e804d2 	tgei	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00abc:	240f04d2 	li	t7,1234
bfc00ac0:	2418fb2e 	li	t8,-1234
bfc00ac4:	3c14bfc0 	lui	s4,0xbfc0
bfc00ac8:	26940acc 	addiu	s4,s4,2764
bfc00acc:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00ad0:	240ffb2e 	li	t7,-1234
bfc00ad4:	241804d2 	li	t8,1234
bfc00ad8:	3c14bfc0 	lui	s4,0xbfc0
bfc00adc:	26940ae0 	addiu	s4,s4,2784
bfc00ae0:	01f80031 	tgeu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00ae4:	240f04d2 	li	t7,1234
bfc00ae8:	3c14bfc0 	lui	s4,0xbfc0
bfc00aec:	26940af0 	addiu	s4,s4,2800
bfc00af0:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00af4:	240ffb2e 	li	t7,-1234
bfc00af8:	3c14bfc0 	lui	s4,0xbfc0
bfc00afc:	26940b00 	addiu	s4,s4,2816
bfc00b00:	05e904d2 	tgeiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00b04:	240f04d2 	li	t7,1234
bfc00b08:	2418fb2e 	li	t8,-1234
bfc00b0c:	3c14bfc0 	lui	s4,0xbfc0
bfc00b10:	26940b14 	addiu	s4,s4,2836
bfc00b14:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00b18:	240ffb2e 	li	t7,-1234
bfc00b1c:	241804d2 	li	t8,1234
bfc00b20:	3c14bfc0 	lui	s4,0xbfc0
bfc00b24:	26940b28 	addiu	s4,s4,2856
bfc00b28:	01f80032 	tlt	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00b2c:	240f04d2 	li	t7,1234
bfc00b30:	3c14bfc0 	lui	s4,0xbfc0
bfc00b34:	26940b38 	addiu	s4,s4,2872
bfc00b38:	05eafb2e 	tlti	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00b3c:	240ffb2e 	li	t7,-1234
bfc00b40:	3c14bfc0 	lui	s4,0xbfc0
bfc00b44:	26940b48 	addiu	s4,s4,2888
bfc00b48:	05ea04d2 	tlti	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00b4c:	240f04d2 	li	t7,1234
bfc00b50:	2418fb2e 	li	t8,-1234
bfc00b54:	3c14bfc0 	lui	s4,0xbfc0
bfc00b58:	26940b5c 	addiu	s4,s4,2908
bfc00b5c:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00b60:	240ffb2e 	li	t7,-1234
bfc00b64:	241804d2 	li	t8,1234
bfc00b68:	3c14bfc0 	lui	s4,0xbfc0
bfc00b6c:	26940b70 	addiu	s4,s4,2928
bfc00b70:	01f80033 	tltu	t7,t8
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00b74:	240f04d2 	li	t7,1234
bfc00b78:	3c14bfc0 	lui	s4,0xbfc0
bfc00b7c:	26940b80 	addiu	s4,s4,2944
bfc00b80:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00b84:	240ffb2e 	li	t7,-1234
bfc00b88:	3c14bfc0 	lui	s4,0xbfc0
bfc00b8c:	26940b90 	addiu	s4,s4,2960
bfc00b90:	05eb04d2 	tltiu	t7,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00b94:	03e01021 	move	v0,ra
bfc00b98:	240f04d2 	li	t7,1234
bfc00b9c:	241804d2 	li	t8,1234
bfc00ba0:	51f80002 	beql	t7,t8,bfc00bac <e1_trap_test+0x1dc>
bfc00ba4:	25ef0001 	addiu	t7,t7,1
bfc00ba8:	25ef000a 	addiu	t7,t7,10
bfc00bac:	27180064 	addiu	t8,t8,100
bfc00bb0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00bb4:	03e01021 	move	v0,ra
bfc00bb8:	240f04d2 	li	t7,1234
bfc00bbc:	2418162e 	li	t8,5678
bfc00bc0:	51f80002 	beql	t7,t8,bfc00bcc <e1_trap_test+0x1fc>
bfc00bc4:	25ef0001 	addiu	t7,t7,1
bfc00bc8:	25ef000a 	addiu	t7,t7,10
bfc00bcc:	27180064 	addiu	t8,t8,100
bfc00bd0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00bd4:	03e01021 	move	v0,ra
bfc00bd8:	240f162e 	li	t7,5678
bfc00bdc:	241804d2 	li	t8,1234
bfc00be0:	51f80002 	beql	t7,t8,bfc00bec <e1_trap_test+0x21c>
bfc00be4:	25ef0001 	addiu	t7,t7,1
bfc00be8:	25ef000a 	addiu	t7,t7,10
bfc00bec:	27180064 	addiu	t8,t8,100
bfc00bf0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00bf4:	03e01021 	move	v0,ra
bfc00bf8:	240f04d2 	li	t7,1234
bfc00bfc:	241804d2 	li	t8,1234
bfc00c00:	55f80002 	bnel	t7,t8,bfc00c0c <e1_trap_test+0x23c>
bfc00c04:	25ef0001 	addiu	t7,t7,1
bfc00c08:	25ef000a 	addiu	t7,t7,10
bfc00c0c:	27180064 	addiu	t8,t8,100
bfc00c10:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00c14:	03e01021 	move	v0,ra
bfc00c18:	240f04d2 	li	t7,1234
bfc00c1c:	2418162e 	li	t8,5678
bfc00c20:	55f80002 	bnel	t7,t8,bfc00c2c <e1_trap_test+0x25c>
bfc00c24:	25ef0001 	addiu	t7,t7,1
bfc00c28:	25ef000a 	addiu	t7,t7,10
bfc00c2c:	27180064 	addiu	t8,t8,100
bfc00c30:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00c34:	03e01021 	move	v0,ra
bfc00c38:	240f162e 	li	t7,5678
bfc00c3c:	241804d2 	li	t8,1234
bfc00c40:	55f80002 	bnel	t7,t8,bfc00c4c <e1_trap_test+0x27c>
bfc00c44:	25ef0001 	addiu	t7,t7,1
bfc00c48:	25ef000a 	addiu	t7,t7,10
bfc00c4c:	27180064 	addiu	t8,t8,100
bfc00c50:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00c54:	03e01021 	move	v0,ra
bfc00c58:	240f04d2 	li	t7,1234
bfc00c5c:	05e30002 	bgezl	t7,bfc00c68 <e1_trap_test+0x298>
bfc00c60:	25ef0001 	addiu	t7,t7,1
bfc00c64:	25ef0014 	addiu	t7,t7,20
bfc00c68:	25ef000a 	addiu	t7,t7,10
bfc00c6c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00c70:	03e01021 	move	v0,ra
bfc00c74:	240f0000 	li	t7,0
bfc00c78:	05e30002 	bgezl	t7,bfc00c84 <e1_trap_test+0x2b4>
bfc00c7c:	25ef0001 	addiu	t7,t7,1
bfc00c80:	25ef0014 	addiu	t7,t7,20
bfc00c84:	25ef000a 	addiu	t7,t7,10
bfc00c88:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00c8c:	03e01021 	move	v0,ra
bfc00c90:	240ffb2e 	li	t7,-1234
bfc00c94:	05e30002 	bgezl	t7,bfc00ca0 <e1_trap_test+0x2d0>
bfc00c98:	25ef0001 	addiu	t7,t7,1
bfc00c9c:	25ef0014 	addiu	t7,t7,20
bfc00ca0:	25ef000a 	addiu	t7,t7,10
bfc00ca4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00ca8:	03e01021 	move	v0,ra
bfc00cac:	240f04d2 	li	t7,1234
bfc00cb0:	5de00002 	bgtzl	t7,bfc00cbc <e1_trap_test+0x2ec>
bfc00cb4:	25ef0001 	addiu	t7,t7,1
bfc00cb8:	25ef0014 	addiu	t7,t7,20
bfc00cbc:	25ef000a 	addiu	t7,t7,10
bfc00cc0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00cc4:	03e01021 	move	v0,ra
bfc00cc8:	240f0000 	li	t7,0
bfc00ccc:	5de00002 	bgtzl	t7,bfc00cd8 <e1_trap_test+0x308>
bfc00cd0:	25ef0001 	addiu	t7,t7,1
bfc00cd4:	25ef0014 	addiu	t7,t7,20
bfc00cd8:	25ef000a 	addiu	t7,t7,10
bfc00cdc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00ce0:	03e01021 	move	v0,ra
bfc00ce4:	240ffb2e 	li	t7,-1234
bfc00ce8:	5de00002 	bgtzl	t7,bfc00cf4 <e1_trap_test+0x324>
bfc00cec:	25ef0001 	addiu	t7,t7,1
bfc00cf0:	25ef0014 	addiu	t7,t7,20
bfc00cf4:	25ef000a 	addiu	t7,t7,10
bfc00cf8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00cfc:	03e01021 	move	v0,ra
bfc00d00:	240f04d2 	li	t7,1234
bfc00d04:	05e20002 	bltzl	t7,bfc00d10 <e1_trap_test+0x340>
bfc00d08:	25ef0001 	addiu	t7,t7,1
bfc00d0c:	25ef0014 	addiu	t7,t7,20
bfc00d10:	25ef000a 	addiu	t7,t7,10
bfc00d14:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00d18:	03e01021 	move	v0,ra
bfc00d1c:	240f0000 	li	t7,0
bfc00d20:	05e20002 	bltzl	t7,bfc00d2c <e1_trap_test+0x35c>
bfc00d24:	25ef0001 	addiu	t7,t7,1
bfc00d28:	25ef0014 	addiu	t7,t7,20
bfc00d2c:	25ef000a 	addiu	t7,t7,10
bfc00d30:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00d34:	03e01021 	move	v0,ra
bfc00d38:	240ffb2e 	li	t7,-1234
bfc00d3c:	05e20002 	bltzl	t7,bfc00d48 <e1_trap_test+0x378>
bfc00d40:	25ef0001 	addiu	t7,t7,1
bfc00d44:	25ef0014 	addiu	t7,t7,20
bfc00d48:	25ef000a 	addiu	t7,t7,10
bfc00d4c:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc00d50:	03e01021 	move	v0,ra
bfc00d54:	240f04d2 	li	t7,1234
bfc00d58:	59e00002 	blezl	t7,bfc00d64 <e1_trap_test+0x394>
bfc00d5c:	25ef0001 	addiu	t7,t7,1
bfc00d60:	25ef0014 	addiu	t7,t7,20
bfc00d64:	25ef000a 	addiu	t7,t7,10
bfc00d68:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc00d6c:	03e01021 	move	v0,ra
bfc00d70:	240f0000 	li	t7,0
bfc00d74:	59e00002 	blezl	t7,bfc00d80 <e1_trap_test+0x3b0>
bfc00d78:	25ef0001 	addiu	t7,t7,1
bfc00d7c:	25ef0014 	addiu	t7,t7,20
bfc00d80:	25ef000a 	addiu	t7,t7,10
bfc00d84:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc00d88:	03e01021 	move	v0,ra
bfc00d8c:	240ffb2e 	li	t7,-1234
bfc00d90:	59e00002 	blezl	t7,bfc00d9c <e1_trap_test+0x3cc>
bfc00d94:	25ef0001 	addiu	t7,t7,1
bfc00d98:	25ef0014 	addiu	t7,t7,20
bfc00d9c:	25ef000a 	addiu	t7,t7,10
bfc00da0:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc00da4:	03e01021 	move	v0,ra
bfc00da8:	240f04d2 	li	t7,1234
bfc00dac:	05f30002 	bgezall	t7,bfc00db8 <e1_trap_test+0x3e8>
bfc00db0:	25ef0001 	addiu	t7,t7,1
bfc00db4:	25ef0014 	addiu	t7,t7,20
bfc00db8:	25ef000a 	addiu	t7,t7,10
bfc00dbc:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc00dc0:	03e01021 	move	v0,ra
bfc00dc4:	240f0000 	li	t7,0
bfc00dc8:	05f30002 	bgezall	t7,bfc00dd4 <e1_trap_test+0x404>
bfc00dcc:	25ef0001 	addiu	t7,t7,1
bfc00dd0:	25ef0014 	addiu	t7,t7,20
bfc00dd4:	25ef000a 	addiu	t7,t7,10
bfc00dd8:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc00ddc:	03e01021 	move	v0,ra
bfc00de0:	240ffb2e 	li	t7,-1234
bfc00de4:	05f30002 	bgezall	t7,bfc00df0 <e1_trap_test+0x420>
bfc00de8:	25ef0001 	addiu	t7,t7,1
bfc00dec:	25ef0014 	addiu	t7,t7,20
bfc00df0:	25ef000a 	addiu	t7,t7,10
bfc00df4:	0040f821 	move	ra,v0
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc00df8:	26730001 	addiu	s3,s3,1

bfc00dfc <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc00dfc:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc00e00:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc00e04:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc00e08:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc00e0c:	00000000 	nop

bfc00e10 <n92_tlbwi_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:9
bfc00e10:	2404005c 	li	a0,92
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:10
bfc00e14:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:12
bfc00e18:	24120000 	li	s2,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:13
bfc00e1c:	241a0010 	li	k0,16

bfc00e20 <test_phase1_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:15
bfc00e20:	40920000 	mtc0	s2,c0_index
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:16
bfc00e24:	3c02efe8 	lui	v0,0xefe8
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:17
bfc00e28:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:18
bfc00e2c:	00124c00 	sll	t1,s2,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:19
bfc00e30:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:20
bfc00e34:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:21
bfc00e38:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:22
bfc00e3c:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:23
bfc00e40:	aea70000 	sw	a3,0(s5)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:29
bfc00e58:	3c08ed12 	lui	t0,0xed12
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:30
bfc00e5c:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:31
bfc00e60:	1468001d 	bne	v1,t0,bfc00ed8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:32
bfc00e64:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:33
bfc00e68:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:34
bfc00e6c:	8ea80000 	lw	t0,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:35
bfc00e70:	3c15abcd 	lui	s5,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:36
bfc00e74:	36b5ef81 	ori	s5,s5,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:37
bfc00e78:	16a80017 	bne	s5,t0,bfc00ed8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:38
bfc00e7c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:39
bfc00e80:	26520001 	addiu	s2,s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:40
bfc00e84:	1752ffe6 	bne	k0,s2,bfc00e20 <test_phase1_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:41
bfc00e88:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:42
bfc00e8c:	24020000 	li	v0,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:43
bfc00e90:	241a0010 	li	k0,16
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:44
bfc00e94:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:45
bfc00e98:	24030000 	li	v1,0

bfc00e9c <test_phase2_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:47
bfc00e9c:	3415f124 	li	s5,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:48
bfc00ea0:	00024c00 	sll	t1,v0,0x10
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:49
bfc00ea4:	0135a820 	add	s5,t1,s5
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:50
bfc00ea8:	8ea90000 	lw	t1,0(s5)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:51
bfc00eac:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:52
bfc00eb0:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:53
bfc00eb4:	15270008 	bne	t1,a3,bfc00ed8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:54
bfc00eb8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:55
bfc00ebc:	24420001 	addiu	v0,v0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:56
bfc00ec0:	24090000 	li	t1,0
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:57
bfc00ec4:	15230004 	bne	t1,v1,bfc00ed8 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:58
bfc00ec8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:59
bfc00ecc:	145afff3 	bne	v0,k0,bfc00e9c <test_phase2_start>
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:60
bfc00ed0:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:62
bfc00ed4:	26730001 	addiu	s3,s3,1

bfc00ed8 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:65
bfc00ed8:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:66
bfc00edc:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:67
bfc00ee0:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:68
bfc00ee4:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n92_tlbwi.S:69
bfc00ee8:	00000000 	nop
inst_error():
bfc00eec:	00000000 	nop

bfc00ef0 <e3_madd_msub_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc00ef0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc00ef4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc00ef8:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc00efc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc00f00:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc00f04:	00000013 	mtlo	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc00f08:	00000011 	mthi	zero
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc00f0c:	24091234 	li	t1,4660
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc00f10:	240a5678 	li	t2,22136
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc00f14:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc00f18:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc00f1c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc00f20:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc00f24:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc00f28:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc00f2c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc00f30:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc00f34:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc00f38:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc00f3c:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc00f40:	712a0001 	maddu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc00f44:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc00f48:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc00f4c:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc00f50:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc00f54:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc00f58:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc00f5c:	712a0000 	madd	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc00f60:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc00f64:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc00f68:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc00f6c:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc00f70:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc00f74:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc00f78:	712a0005 	msubu	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc00f7c:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc00f80:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc00f84:	2409fff4 	li	t1,-12
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc00f88:	240a0022 	li	t2,34
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc00f8c:	01200013 	mtlo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc00f90:	01400011 	mthi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc00f94:	712a0004 	msub	t1,t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc00f98:	00004812 	mflo	t1
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc00f9c:	00005010 	mfhi	t2
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc00fa0:	26730001 	addiu	s3,s3,1

bfc00fa4 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc00fa4:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc00fa8:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc00fac:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc00fb0:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc00fb4:	00000000 	nop
	...

bfc00fc0 <e4_ll_sc>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc00fc0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc00fc4:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc00fc8:	24120001 	li	s2,1
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc00fcc:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc00fd0:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc00fd4:	3c088000 	lui	t0,0x8000
bfc00fd8:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc00fdc:	240904d2 	li	t1,1234
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc00fe0:	ad090004 	sw	t1,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc00fe4:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc00fe8:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc00fec:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc00ff0:	c10a0004 	ll	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc00ff4:	254a0004 	addiu	t2,t2,4
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc00ff8:	0000000c 	syscall
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc00ffc:	e10a0004 	sc	t2,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc01000:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc01004:	240c04d6 	li	t4,1238
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc01008:	156c0002 	bne	t3,t4,bfc01014 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc0100c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc01010:	26730001 	addiu	s3,s3,1

bfc01014 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc01014:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc01018:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc0101c:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc01020:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc01024:	00000000 	nop
	...

bfc01030 <e2_clo_clz_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc01030:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc01034:	40805800 	mtc0	zero,c0_compare
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc01038:	24120009 	li	s2,9
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc0103c:	3c08800d 	lui	t0,0x800d
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc01040:	ad120000 	sw	s2,0(t0)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc01044:	3c08e234 	lui	t0,0xe234
bfc01048:	35085678 	ori	t0,t0,0x5678
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc0104c:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc01050:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc01054:	3c088000 	lui	t0,0x8000
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc01058:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc0105c:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc01060:	3c081926 	lui	t0,0x1926
bfc01064:	35080817 	ori	t0,t0,0x817
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc01068:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc0106c:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc01070:	2408000e 	li	t0,14
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc01074:	71094821 	clo	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc01078:	71094820 	clz	t1,t0
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc0107c:	26730001 	addiu	s3,s3,1

bfc01080 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc01080:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc01084:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc01088:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc0108c:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc01090:	00000000 	nop
	...

bfc010a0 <n93_tlbwr_test>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:9
bfc010a0:	26100001 	addiu	s0,s0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:10
bfc010a4:	2404005d 	li	a0,93

bfc010a8 <test_gbit_start>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:13
bfc010a8:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:14
bfc010ac:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:15
bfc010b0:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:16
bfc010b4:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:17
bfc010b8:	3c150011 	lui	s5,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:18
bfc010bc:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:19
bfc010c0:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:20
bfc010c4:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:21
bfc010c8:	241a0001 	li	k0,1
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:22
bfc010cc:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:23
bfc010d0:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:24
bfc010d4:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:30
bfc010ec:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:31
bfc010f0:	3508dc16 	ori	t0,t0,0xdc16
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:32
bfc010f4:	14680050 	bne	v1,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:33
bfc010f8:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:34
bfc010fc:	3c120011 	lui	s2,0x11
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:35
bfc01100:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:36
bfc01104:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:37
bfc01108:	3c071234 	lui	a3,0x1234
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:38
bfc0110c:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:39
bfc01110:	14e80049 	bne	a3,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:40
bfc01114:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:41
bfc01118:	3c128010 	lui	s2,0x8010
bfc0111c:	36520124 	ori	s2,s2,0x124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:42
bfc01120:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:43
bfc01124:	14e80044 	bne	a3,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:44
bfc01128:	00000000 	nop

bfc0112c <test_asid_match>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:46
bfc0112c:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:47
bfc01130:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:48
bfc01134:	3c120012 	lui	s2,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:49
bfc01138:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:50
bfc0113c:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:51
bfc01140:	3c150012 	lui	s5,0x12
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:52
bfc01144:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:53
bfc01148:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:54
bfc0114c:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:55
bfc01150:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:56
bfc01154:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:57
bfc01158:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:63
bfc01170:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:64
bfc01174:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:65
bfc01178:	1468002f 	bne	v1,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:66
bfc0117c:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:67
bfc01180:	3c150013 	lui	s5,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:68
bfc01184:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:69
bfc01188:	40955000 	mtc0	s5,c0_entryhi
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:70
bfc0118c:	3c120013 	lui	s2,0x13
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:71
bfc01190:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:72
bfc01194:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:73
bfc01198:	24094006 	li	t1,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:74
bfc0119c:	8e480000 	lw	t0,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:75
bfc011a0:	3c07e235 	lui	a3,0xe235
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:76
bfc011a4:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:77
bfc011a8:	14e80023 	bne	a3,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:78
bfc011ac:	00000000 	nop

bfc011b0 <test_asid_2>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:80
bfc011b0:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:81
bfc011b4:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:82
bfc011b8:	3c120014 	lui	s2,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:83
bfc011bc:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:84
bfc011c0:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:85
bfc011c4:	3c150014 	lui	s5,0x14
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:86
bfc011c8:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:87
bfc011cc:	3c07bd86 	lui	a3,0xbd86
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:88
bfc011d0:	34e713ac 	ori	a3,a3,0x13ac
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:89
bfc011d4:	24084006 	li	t0,16390
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:90
bfc011d8:	24094000 	li	t1,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:91
bfc011dc:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:97
bfc011f4:	3c08ed08 	lui	t0,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:98
bfc011f8:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:99
bfc011fc:	1468000e 	bne	v1,t0,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:100
bfc01200:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:101
bfc01204:	3c120015 	lui	s2,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:102
bfc01208:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:103
bfc0120c:	3c150015 	lui	s5,0x15
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:104
bfc01210:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:105
bfc01214:	24084000 	li	t0,16384
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:106
bfc01218:	24094002 	li	t1,16386
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:107
bfc0121c:	241a0003 	li	k0,3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:108
bfc01220:	8e470000 	lw	a3,0(s2)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:109
bfc01224:	3c07ed08 	lui	a3,0xed08
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:110
bfc01228:	34e7dc18 	ori	a3,a3,0xdc18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:111
bfc0122c:	14e30002 	bne	a3,v1,bfc01238 <inst_error>
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:112
bfc01230:	00000000 	nop
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:114
bfc01234:	26730001 	addiu	s3,s3,1

bfc01238 <inst_error>:
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:117
bfc01238:	00104e00 	sll	t1,s0,0x18
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:118
bfc0123c:	01334025 	or	t0,t1,s3
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:119
bfc01240:	ae280000 	sw	t0,0(s1)
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:120
bfc01244:	03e00008 	jr	ra
/home/lxb/project/loooongson/soft/func_extended/inst/n93_tlbwr.S:121
bfc01248:	00000000 	nop
bfc0124c:	00000000 	nop
bfc01250:	9e3f7f7c 	0x9e3f7f7c
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
  14:	0000096c 	0x96c
	...
  20:	0000001c 	0x1c
  24:	00610002 	0x610002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc00970 	cache	0x0,2416(s8)
  34:	00000060 	0x60
	...
  40:	0000001c 	0x1c
  44:	00ce0002 	0xce0002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc009d0 	cache	0x0,2512(s8)
  54:	00000440 	sll	zero,zero,0x11
	...
  60:	0000001c 	0x1c
  64:	013b0002 	0x13b0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00e10 	cache	0x0,3600(s8)
  74:	000000dc 	0xdc
	...
  80:	0000001c 	0x1c
  84:	01a50002 	0x1a50002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00ef0 	cache	0x0,3824(s8)
  94:	000000c8 	0xc8
	...
  a0:	0000001c 	0x1c
  a4:	02120002 	0x2120002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00fc0 	cache	0x0,4032(s8)
  b4:	00000068 	0x68
	...
  c0:	0000001c 	0x1c
  c4:	027b0002 	0x27b0002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc01030 	cache	0x0,4144(s8)
  d4:	00000064 	0x64
	...
  e0:	0000001c 	0x1c
  e4:	02e60002 	0x2e60002
  e8:	00040000 	sll	zero,a0,0x0
  ec:	00000000 	nop
  f0:	bfc010a0 	cache	0x0,4256(s8)
  f4:	000001ac 	0x1ac
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00970 	cache	0x0,2416(s8)
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc009d0 	cache	0x0,2512(s8)
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00e10 	cache	0x0,3600(s8)
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00ef0 	cache	0x0,3824(s8)
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00fc0 	cache	0x0,4032(s8)
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc01030 	cache	0x0,4144(s8)
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc010a0 	cache	0x0,4256(s8)
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000001bd 	0x1bd
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
 184:	834d4b4b 	lb	t5,19275(k0)
 188:	4b4b4b4b 	c2	0x14b4b4b
 18c:	4b4b4c4b 	c2	0x14b4c4b
 190:	4b4b4b4b 	c2	0x14b4b4b
 194:	4d4b4c4b 	0x4d4b4c4b
 198:	834c4b4b 	lb	t4,19275(k0)
 19c:	4b4c8483 	c2	0x14c8483
 1a0:	4c4b4b4b 	0x4c4b4b4b
 1a4:	4b83834b 	c2	0x183834b
 1a8:	834d4b4d 	lb	t5,19277(k0)
 1ac:	4b4b4b4d 	c2	0x14b4b4d
 1b0:	4b4b4d4d 	c2	0x14b4d4d
 1b4:	4b4b4b4b 	c2	0x14b4b4b
 1b8:	4b4b4b4c 	c2	0x14b4b4c
 1bc:	01000402 	0x1000402
 1c0:	00004e01 	0x4e01
 1c4:	25000200 	addiu	zero,t0,512
 1c8:	01000000 	0x1000000
 1cc:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 1d0:	01010100 	0x1010100
 1d4:	00000001 	movf	zero,zero,$fcc0
 1d8:	01000001 	movf	zero,t0,$fcc0
 1dc:	5f356500 	0x5f356500
 1e0:	7a766f6d 	0x7a766f6d
 1e4:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
 1e8:	00532e6e 	0x532e6e
 1ec:	00000000 	nop
 1f0:	70020500 	0x70020500
 1f4:	19bfc009 	0x19bfc009
 1f8:	4b4b4b4b 	c2	0x14b4b4b
 1fc:	4b4b4b50 	c2	0x14b4b50
 200:	4b4b4b4b 	c2	0x14b4b4b
 204:	4b834b4b 	c2	0x1834b4b
 208:	4b4b4d4f 	c2	0x14b4d4f
 20c:	04024b4b 	bltzl	zero,12f3c <data_size+0x12f2c>
 210:	90010100 	lbu	at,256(zero)
 214:	02000000 	0x2000000
 218:	00002500 	sll	a0,zero,0x14
 21c:	fb010100 	sdc2	$1,256(t8)
 220:	01000d0e 	0x1000d0e
 224:	00010101 	0x10101
 228:	00010000 	sll	zero,at,0x0
 22c:	65000100 	0x65000100
 230:	72745f31 	0x72745f31
 234:	745f7061 	jalx	17dc184 <data_size+0x17dc174>
 238:	2e747365 	sltiu	s4,s3,29541
 23c:	00000053 	mtlhx	zero
 240:	05000000 	bltz	t0,244 <data_size+0x234>
 244:	c009d002 	ll	t1,-12286(zero)
 248:	4b4b19bf 	c2	0x14b19bf
 24c:	084d4b4b 	j	1352d2c <data_size+0x1352d1c>
 250:	f33d083d 	0xf33d083d
 254:	083d08f3 	j	f423cc <data_size+0xf423bc>
 258:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 25c:	f33d083d 	0xf33d083d
 260:	083d08f3 	j	f423cc <data_size+0xf423bc>
 264:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 268:	f33d083d 	0xf33d083d
 26c:	083d08f3 	j	f423cc <data_size+0xf423bc>
 270:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 274:	08e508e5 	j	3942394 <data_size+0x3942384>
 278:	08e508e5 	j	3942394 <data_size+0x3942384>
 27c:	08e508e5 	j	3942394 <data_size+0x3942384>
 280:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 284:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 288:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 28c:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 290:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 294:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 298:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 29c:	4b4b4db0 	c2	0x14b4db0
 2a0:	04024b4b 	bltzl	zero,12fd0 <data_size+0x12fc0>
 2a4:	6b010100 	0x6b010100
 2a8:	02000000 	0x2000000
 2ac:	00002200 	sll	a0,zero,0x8
 2b0:	fb010100 	sdc2	$1,256(t8)
 2b4:	01000d0e 	0x1000d0e
 2b8:	00010101 	0x10101
 2bc:	00010000 	sll	zero,at,0x0
 2c0:	6e000100 	0x6e000100
 2c4:	745f3239 	jalx	17cc8e4 <data_size+0x17cc8d4>
 2c8:	6977626c 	0x6977626c
 2cc:	0000532e 	0x532e
 2d0:	00000000 	nop
 2d4:	0e100205 	jal	8400814 <data_size+0x8400804>
 2d8:	4b1abfc0 	c2	0x11abfc0
 2dc:	4b4c4b4c 	c2	0x14c4b4c
 2e0:	4b4b4b4b 	c2	0x14b4b4b
 2e4:	4b4b4b4b 	c2	0x14b4b4b
 2e8:	4b4b4b4b 	c2	0x14b4b4b
 2ec:	4b4b4b4b 	c2	0x14b4b4b
 2f0:	4b4b4b4b 	c2	0x14b4b4b
 2f4:	4b4b4b4b 	c2	0x14b4b4b
 2f8:	4b4b4b4b 	c2	0x14b4b4b
 2fc:	4b4b4c4b 	c2	0x14b4c4b
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	4b4b4b4b 	c2	0x14b4b4b
 308:	4c4b4b4b 	0x4c4b4b4b
 30c:	4b4b4b4d 	c2	0x14b4b4d
 310:	0004024b 	0x4024b
 314:	00690101 	0x690101
 318:	00020000 	sll	zero,v0,0x0
 31c:	00000025 	move	zero,zero
 320:	0efb0101 	jal	bec0404 <data_size+0xbec03f4>
 324:	0101000d 	break	0x101
 328:	00000101 	0x101
 32c:	00000100 	sll	zero,zero,0x4
 330:	33650001 	andi	a1,k1,0x1
 334:	64616d5f 	0x64616d5f
 338:	736d5f64 	0x736d5f64
 33c:	532e6275 	beql	t9,t6,18d14 <data_size+0x18d04>
 340:	00000000 	nop
 344:	02050000 	0x2050000
 348:	bfc00ef0 	cache	0x0,3824(s8)
 34c:	4b4b4b19 	c2	0x14b4b19
 350:	4b4b4d4b 	c2	0x14b4d4b
 354:	4b4b4b4b 	c2	0x14b4b4b
 358:	4b4b4b4b 	c2	0x14b4b4b
 35c:	4b4b4b4b 	c2	0x14b4b4b
 360:	4b4b4b4b 	c2	0x14b4b4b
 364:	4b4b4b4b 	c2	0x14b4b4b
 368:	4b4b4b4b 	c2	0x14b4b4b
 36c:	4b4b4b4b 	c2	0x14b4b4b
 370:	4b4b4b4b 	c2	0x14b4b4b
 374:	4b4b4b4b 	c2	0x14b4b4b
 378:	4b4b4d4e 	c2	0x14b4d4e
 37c:	04024b4b 	bltzl	zero,130ac <data_size+0x1309c>
 380:	4c010100 	0x4c010100
 384:	02000000 	0x2000000
 388:	00002100 	sll	a0,zero,0x4
 38c:	fb010100 	sdc2	$1,256(t8)
 390:	01000d0e 	0x1000d0e
 394:	00010101 	0x10101
 398:	00010000 	sll	zero,at,0x0
 39c:	65000100 	0x65000100
 3a0:	6c6c5f34 	0x6c6c5f34
 3a4:	2e63735f 	sltiu	v1,s3,29535
 3a8:	00000053 	mtlhx	zero
 3ac:	05000000 	bltz	t0,3b0 <data_size+0x3a0>
 3b0:	c00fc002 	ll	t7,-16382(zero)
 3b4:	4b4b19bf 	c2	0x14b19bf
 3b8:	83504b4b 	lb	s0,19275(k0)
 3bc:	4b4b4b4b 	c2	0x14b4b4b
 3c0:	4b4b4b4c 	c2	0x14b4b4c
 3c4:	4b4b4b4c 	c2	0x14b4b4c
 3c8:	4b4b4d4f 	c2	0x14b4d4f
 3cc:	04024b4b 	bltzl	zero,130fc <data_size+0x130ec>
 3d0:	4c010100 	0x4c010100
 3d4:	02000000 	0x2000000
 3d8:	00002300 	sll	a0,zero,0xc
 3dc:	fb010100 	sdc2	$1,256(t8)
 3e0:	01000d0e 	0x1000d0e
 3e4:	00010101 	0x10101
 3e8:	00010000 	sll	zero,at,0x0
 3ec:	65000100 	0x65000100
 3f0:	6c635f32 	0x6c635f32
 3f4:	6c635f6f 	0x6c635f6f
 3f8:	00532e7a 	0x532e7a
 3fc:	00000000 	nop
 400:	30020500 	andi	v0,zero,0x500
 404:	19bfc010 	0x19bfc010
 408:	4b4b4b4b 	c2	0x14b4b4b
 40c:	4b4b834d 	c2	0x14b834d
 410:	834b4b4b 	lb	t3,19275(k0)
 414:	4b4b4b4b 	c2	0x14b4b4b
 418:	4b4b4d4e 	c2	0x14b4d4e
 41c:	04024b4b 	bltzl	zero,1314c <data_size+0x1313c>
 420:	9e010100 	0x9e010100
 424:	02000000 	0x2000000
 428:	00002200 	sll	a0,zero,0x8
 42c:	fb010100 	sdc2	$1,256(t8)
 430:	01000d0e 	0x1000d0e
 434:	00010101 	0x10101
 438:	00010000 	sll	zero,at,0x0
 43c:	6e000100 	0x6e000100
 440:	745f3339 	jalx	17ccce4 <data_size+0x17cccd4>
 444:	7277626c 	0x7277626c
 448:	0000532e 	0x532e
 44c:	00000000 	nop
 450:	10a00205 	beqz	a1,c68 <data_size+0xc58>
 454:	4b1abfc0 	c2	0x11abfc0
 458:	4b4b4b4d 	c2	0x14b4b4d
 45c:	4b4b4b4b 	c2	0x14b4b4b
 460:	4b4b4b4b 	c2	0x14b4b4b
 464:	4b4b4b4b 	c2	0x14b4b4b
 468:	4b4b4b4b 	c2	0x14b4b4b
 46c:	4b4b4b4b 	c2	0x14b4b4b
 470:	4b4b4b4b 	c2	0x14b4b4b
 474:	4b4b834b 	c2	0x14b834b
 478:	4b4b4b4c 	c2	0x14b4b4c
 47c:	4b4b4b4b 	c2	0x14b4b4b
 480:	4b4b4b4b 	c2	0x14b4b4b
 484:	4b4b4b4b 	c2	0x14b4b4b
 488:	4b4b4b4b 	c2	0x14b4b4b
 48c:	4b4b4b4b 	c2	0x14b4b4b
 490:	4b4b4b4b 	c2	0x14b4b4b
 494:	4b4b4b4b 	c2	0x14b4b4b
 498:	4b4b4c4b 	c2	0x14b4c4b
 49c:	4b4b4b4b 	c2	0x14b4b4b
 4a0:	4b4b4b4b 	c2	0x14b4b4b
 4a4:	4b4b4b4b 	c2	0x14b4b4b
 4a8:	4b4b4b4b 	c2	0x14b4b4b
 4ac:	4b4b4b4b 	c2	0x14b4b4b
 4b0:	4b4b4b4b 	c2	0x14b4b4b
 4b4:	4b4b4b4b 	c2	0x14b4b4b
 4b8:	4d4c4b4b 	0x4d4c4b4b
 4bc:	4b4b4b4b 	c2	0x14b4b4b
 4c0:	01000402 	0x1000402
 4c4:	Address 0x00000000000004c4 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000005d 	0x5d
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	cache	0x0,0(s8)
  14:	bfc0096c 	cache	0x0,2412(s8)
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
  6c:	0001c101 	0x1c101
  70:	c0097000 	ll	t1,28672(zero)
  74:	c009d0bf 	ll	t1,-12097(zero)
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
  cc:	00698001 	movt	s0,v1,$fcc2
  d0:	00020000 	sll	zero,v0,0x0
  d4:	00000028 	0x28
  d8:	02130104 	0x2130104
  dc:	09d00000 	j	7400000 <data_size+0x73ffff0>
  e0:	0e10bfc0 	jal	842ff00 <data_size+0x842fef0>
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
 138:	66800100 	0x66800100
 13c:	02000000 	0x2000000
 140:	00003c00 	sll	a3,zero,0x10
 144:	a7010400 	sh	at,1024(t8)
 148:	10000002 	b	154 <data_size+0x144>
 14c:	ecbfc00e 	swc3	$31,-16370(a1)
 150:	6ebfc00e 	0x6ebfc00e
 154:	745f3239 	jalx	17cc8e4 <data_size+0x17cc8d4>
 158:	6977626c 	0x6977626c
 15c:	2f00532e 	sltiu	zero,t8,21294
 160:	656d6f68 	0x656d6f68
 164:	62786c2f 	0x62786c2f
 168:	6f72702f 	0x6f72702f
 16c:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 170:	6f6f6c2f 	0x6f6f6c2f
 174:	676e6f6f 	0x676e6f6f
 178:	2f6e6f73 	sltiu	t6,k1,28531
 17c:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 180:	6e75662f 	0x6e75662f
 184:	78655f63 	0x78655f63
 188:	646e6574 	0x646e6574
 18c:	692f6465 	0x692f6465
 190:	0074736e 	0x74736e
 194:	20554e47 	addi	s5,v0,20039
 198:	32205341 	andi	zero,s1,0x5341
 19c:	2e38312e 	sltiu	t8,s1,12590
 1a0:	01003035 	0x1003035
 1a4:	00006980 	sll	t5,zero,0x6
 1a8:	50000200 	beqzl	zero,9ac <data_size+0x99c>
 1ac:	04000000 	bltz	zero,1b0 <data_size+0x1a0>
 1b0:	00031601 	0x31601
 1b4:	c00ef000 	ll	t6,-4096(zero)
 1b8:	c00fb8bf 	ll	t7,-18241(zero)
 1bc:	5f3365bf 	0x5f3365bf
 1c0:	6464616d 	0x6464616d
 1c4:	75736d5f 	jalx	5cdb57c <data_size+0x5cdb56c>
 1c8:	00532e62 	0x532e62
 1cc:	6d6f682f 	0x6d6f682f
 1d0:	786c2f65 	0x786c2f65
 1d4:	72702f62 	0x72702f62
 1d8:	63656a6f 	0x63656a6f
 1dc:	6f6c2f74 	0x6f6c2f74
 1e0:	6e6f6f6f 	0x6e6f6f6f
 1e4:	6e6f7367 	0x6e6f7367
 1e8:	666f732f 	0x666f732f
 1ec:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 1f0:	655f636e 	0x655f636e
 1f4:	6e657478 	0x6e657478
 1f8:	2f646564 	sltiu	a0,k1,25956
 1fc:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 200:	554e4700 	bnel	t2,t6,11e04 <data_size+0x11df4>
 204:	20534120 	addi	s3,v0,16672
 208:	38312e32 	xori	s1,at,0x2e32
 20c:	0030352e 	0x30352e
 210:	00658001 	movt	s0,v1,$fcc1
 214:	00020000 	sll	zero,v0,0x0
 218:	00000064 	0x64
 21c:	03830104 	0x3830104
 220:	0fc00000 	jal	f000000 <data_size+0xefffff0>
 224:	1028bfc0 	beq	at,t0,ffff0128 <_etext+0x403eeec0>
 228:	3465bfc0 	ori	a1,v1,0xbfc0
 22c:	5f6c6c5f 	0x5f6c6c5f
 230:	532e6373 	beql	t9,t6,19000 <data_size+0x18ff0>
 234:	6f682f00 	0x6f682f00
 238:	6c2f656d 	0x6c2f656d
 23c:	702f6278 	0x702f6278
 240:	656a6f72 	0x656a6f72
 244:	6c2f7463 	0x6c2f7463
 248:	6f6f6f6f 	0x6f6f6f6f
 24c:	6f73676e 	0x6f73676e
 250:	6f732f6e 	0x6f732f6e
 254:	662f7466 	0x662f7466
 258:	5f636e75 	0x5f636e75
 25c:	65747865 	0x65747865
 260:	6465646e 	0x6465646e
 264:	736e692f 	0x736e692f
 268:	4e470074 	c3	0x470074
 26c:	53412055 	beql	k0,at,83c4 <data_size+0x83b4>
 270:	312e3220 	andi	t6,t1,0x3220
 274:	30352e38 	andi	s5,at,0x2e38
 278:	67800100 	0x67800100
 27c:	02000000 	0x2000000
 280:	00007800 	sll	t7,zero,0x0
 284:	d3010400 	0xd3010400
 288:	30000003 	andi	zero,zero,0x3
 28c:	94bfc010 	lhu	ra,-16368(a1)
 290:	65bfc010 	0x65bfc010
 294:	6c635f32 	0x6c635f32
 298:	6c635f6f 	0x6c635f6f
 29c:	00532e7a 	0x532e7a
 2a0:	6d6f682f 	0x6d6f682f
 2a4:	786c2f65 	0x786c2f65
 2a8:	72702f62 	0x72702f62
 2ac:	63656a6f 	0x63656a6f
 2b0:	6f6c2f74 	0x6f6c2f74
 2b4:	6e6f6f6f 	0x6e6f6f6f
 2b8:	6e6f7367 	0x6e6f7367
 2bc:	666f732f 	0x666f732f
 2c0:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 2c4:	655f636e 	0x655f636e
 2c8:	6e657478 	0x6e657478
 2cc:	2f646564 	sltiu	a0,k1,25956
 2d0:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 2d4:	554e4700 	bnel	t2,t6,11ed8 <data_size+0x11ec8>
 2d8:	20534120 	addi	s3,v0,16672
 2dc:	38312e32 	xori	s1,at,0x2e32
 2e0:	0030352e 	0x30352e
 2e4:	00668001 	0x668001
 2e8:	00020000 	sll	zero,v0,0x0
 2ec:	0000008c 	syscall	0x2
 2f0:	04230104 	bgezl	at,704 <data_size+0x6f4>
 2f4:	10a00000 	beqz	a1,2f8 <data_size+0x2e8>
 2f8:	124cbfc0 	beq	s2,t4,ffff01fc <_etext+0x403eef94>
 2fc:	396ebfc0 	xori	t6,t3,0xbfc0
 300:	6c745f33 	0x6c745f33
 304:	2e727762 	sltiu	s2,s3,30562
 308:	682f0053 	0x682f0053
 30c:	2f656d6f 	sltiu	a1,k1,28015
 310:	2f62786c 	sltiu	v0,k1,30828
 314:	6a6f7270 	0x6a6f7270
 318:	2f746365 	sltiu	s4,k1,25445
 31c:	6f6f6f6c 	0x6f6f6f6c
 320:	73676e6f 	0x73676e6f
 324:	732f6e6f 	0x732f6e6f
 328:	2f74666f 	sltiu	s4,k1,26223
 32c:	636e7566 	0x636e7566
 330:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 334:	65646e65 	0x65646e65
 338:	6e692f64 	0x6e692f64
 33c:	47007473 	c1	0x1007473
 340:	4120554e 	0x4120554e
 344:	2e322053 	sltiu	s2,s1,8275
 348:	352e3831 	ori	t6,t1,0x3831
 34c:	80010030 	lb	at,48(zero)

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
