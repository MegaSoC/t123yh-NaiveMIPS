
main.elf:     file format elf32-tradlittlemips
main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:19
bfc00000:	24081800 	li	t0,6144
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:20
bfc00004:	40882800 	mtc0	t0,$5
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:21
bfc00008:	00000013 	mtlo	zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:22
bfc0000c:	00000011 	mthi	zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:23
bfc00010:	2408ffff 	li	t0,-1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:24
bfc00014:	2408ffff 	li	t0,-1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:25
bfc00018:	10000200 	b	bfc0081c <locate>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:26
bfc0001c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:29
bfc00020:	3c088000 	lui	t0,0x8000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:30
bfc00024:	25290001 	addiu	t1,t1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:31
bfc00028:	01005025 	move	t2,t0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:32
bfc0002c:	01ae5821 	addu	t3,t5,t6
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:33
bfc00030:	8d0c0000 	lw	t4,0(t0)
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:38
bfc000ec:	3c088000 	lui	t0,0x8000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:39
bfc000f0:	25290001 	addiu	t1,t1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:40
bfc000f4:	01005025 	move	t2,t0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:41
bfc000f8:	01ae5821 	addu	t3,t5,t6
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:42
bfc000fc:	8d0c0000 	lw	t4,0(t0)

bfc00100 <test_finish>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:45
bfc00100:	25080001 	addiu	t0,t0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:46
bfc00104:	240900ff 	li	t1,255
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:47
bfc00108:	3c0abfaf 	lui	t2,0xbfaf
bfc0010c:	354afff0 	ori	t2,t2,0xfff0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:48
bfc00110:	ad490000 	sw	t1,0(t2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:49
bfc00114:	1000fffa 	b	bfc00100 <test_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:50
bfc00118:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:52
bfc0011c:	3c088000 	lui	t0,0x8000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:53
bfc00120:	25290001 	addiu	t1,t1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:54
bfc00124:	01005025 	move	t2,t0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:55
bfc00128:	01ae5821 	addu	t3,t5,t6
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:56
bfc0012c:	8d0c0000 	lw	t4,0(t0)

bfc00130 <ebase_entry>:
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:62
bfc00200:	3c03ffe8 	lui	v1,0xffe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:63
bfc00204:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:64
bfc00208:	10430141 	beq	v0,v1,bfc00710 <tlbwr_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:65
bfc0020c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:66
bfc00210:	3c03efe8 	lui	v1,0xefe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:67
bfc00214:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:68
bfc00218:	1043015b 	beq	v0,v1,bfc00788 <tlbwi_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:69
bfc0021c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:70
bfc00220:	3c038888 	lui	v1,0x8888
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:71
bfc00224:	3463dc03 	ori	v1,v1,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:72
bfc00228:	1043016d 	beq	v0,v1,bfc007e0 <tlb_double_fill>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:73
bfc0022c:	00000000 	nop
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:80
bfc00380:	0000d010 	mfhi	k0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:81
bfc00384:	0000d812 	mflo	k1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:82
bfc00388:	3c1a800d 	lui	k0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:83
bfc0038c:	8f5b0000 	lw	k1,0(k0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:84
bfc00390:	241a0001 	li	k0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:85
bfc00394:	137a001b 	beq	k1,k0,bfc00404 <syscall_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:86
bfc00398:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:87
bfc0039c:	241a0002 	li	k0,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:88
bfc003a0:	137a0029 	beq	k1,k0,bfc00448 <break_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:89
bfc003a4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:90
bfc003a8:	241a0003 	li	k0,3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:91
bfc003ac:	137a0048 	beq	k1,k0,bfc004d0 <overflow_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:92
bfc003b0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:93
bfc003b4:	241a0004 	li	k0,4
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:94
bfc003b8:	137a0055 	beq	k1,k0,bfc00510 <adel_load_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:95
bfc003bc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:96
bfc003c0:	241a0005 	li	k0,5
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:97
bfc003c4:	137a0063 	beq	k1,k0,bfc00554 <ades_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:98
bfc003c8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:99
bfc003cc:	241a0006 	li	k0,6
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:100
bfc003d0:	137a0071 	beq	k1,k0,bfc00598 <adel_if_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:101
bfc003d4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:102
bfc003d8:	241a0007 	li	k0,7
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:103
bfc003dc:	137a0080 	beq	k1,k0,bfc005e0 <reserved_inst_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:104
bfc003e0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:105
bfc003e4:	241a0008 	li	k0,8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:106
bfc003e8:	137a008e 	beq	k1,k0,bfc00624 <int_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:107
bfc003ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:108
bfc003f0:	241a0009 	li	k0,9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:109
bfc003f4:	137a0025 	beq	k1,k0,bfc0048c <trap_ex>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:110
bfc003f8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:111
bfc003fc:	241a0010 	li	k0,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:112
bfc00400:	137a00ef 	beq	k1,k0,bfc007c0 <tlb_double_ex>

bfc00404 <syscall_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:115
bfc00404:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:116
bfc00408:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:117
bfc0040c:	175400b0 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:118
bfc00410:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:119
bfc00414:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:120
bfc00418:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:121
bfc0041c:	241b0020 	li	k1,32
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:122
bfc00420:	175b00ab 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:123
bfc00424:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:124
bfc00428:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:125
bfc0042c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:126
bfc00430:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:127
bfc00434:	175b00a6 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:128
bfc00438:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:129
bfc0043c:	3c120001 	lui	s2,0x1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:130
bfc00440:	100000a3 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:131
bfc00444:	00000000 	nop

bfc00448 <break_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:134
bfc00448:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:135
bfc0044c:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:136
bfc00450:	1754009f 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:137
bfc00454:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:138
bfc00458:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:139
bfc0045c:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:140
bfc00460:	241b0024 	li	k1,36
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:141
bfc00464:	175b009a 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:142
bfc00468:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:143
bfc0046c:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:144
bfc00470:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:145
bfc00474:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:146
bfc00478:	175b0095 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:147
bfc0047c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:148
bfc00480:	3c120002 	lui	s2,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:149
bfc00484:	10000092 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:150
bfc00488:	00000000 	nop

bfc0048c <trap_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:155
bfc0048c:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:156
bfc00490:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:157
bfc00494:	1754008e 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:158
bfc00498:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:159
bfc0049c:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:160
bfc004a0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:161
bfc004a4:	241b0034 	li	k1,52
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:162
bfc004a8:	175b0089 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:163
bfc004ac:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:164
bfc004b0:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:165
bfc004b4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:166
bfc004b8:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:167
bfc004bc:	175b0084 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:168
bfc004c0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:169
bfc004c4:	3c120002 	lui	s2,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:170
bfc004c8:	10000081 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:171
bfc004cc:	00000000 	nop

bfc004d0 <overflow_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:174
bfc004d0:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:175
bfc004d4:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:176
bfc004d8:	1754007d 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:177
bfc004dc:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:178
bfc004e0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:179
bfc004e4:	241b0030 	li	k1,48
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:180
bfc004e8:	175b0079 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:181
bfc004ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:182
bfc004f0:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:183
bfc004f4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:184
bfc004f8:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:185
bfc004fc:	175b0074 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:186
bfc00500:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:187
bfc00504:	3c120003 	lui	s2,0x3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:188
bfc00508:	10000071 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:189
bfc0050c:	00000000 	nop

bfc00510 <adel_load_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:192
bfc00510:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:193
bfc00514:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:194
bfc00518:	1754006d 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:195
bfc0051c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:196
bfc00520:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:197
bfc00524:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:198
bfc00528:	241b0010 	li	k1,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:199
bfc0052c:	175b0068 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:200
bfc00530:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:201
bfc00534:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:202
bfc00538:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:203
bfc0053c:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:204
bfc00540:	175b0063 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:205
bfc00544:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:206
bfc00548:	3c120004 	lui	s2,0x4
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:207
bfc0054c:	10000060 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:208
bfc00550:	00000000 	nop

bfc00554 <ades_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:211
bfc00554:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:212
bfc00558:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:213
bfc0055c:	1754005c 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:214
bfc00560:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:215
bfc00564:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:216
bfc00568:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:217
bfc0056c:	241b0014 	li	k1,20
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:218
bfc00570:	175b0057 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:219
bfc00574:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:220
bfc00578:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:221
bfc0057c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:222
bfc00580:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:223
bfc00584:	175b0052 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:224
bfc00588:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:225
bfc0058c:	3c120005 	lui	s2,0x5
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:226
bfc00590:	1000004f 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:227
bfc00594:	00000000 	nop

bfc00598 <adel_if_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:230
bfc00598:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:231
bfc0059c:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:232
bfc005a0:	1754004b 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:233
bfc005a4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:234
bfc005a8:	40957000 	mtc0	s5,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:235
bfc005ac:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:236
bfc005b0:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:237
bfc005b4:	241b0010 	li	k1,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:238
bfc005b8:	175b0045 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:239
bfc005bc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:240
bfc005c0:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:241
bfc005c4:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:242
bfc005c8:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:243
bfc005cc:	175b0040 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:244
bfc005d0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:245
bfc005d4:	3c120006 	lui	s2,0x6
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:246
bfc005d8:	1000003d 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:247
bfc005dc:	00000000 	nop

bfc005e0 <reserved_inst_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:250
bfc005e0:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:251
bfc005e4:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:252
bfc005e8:	17540039 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:253
bfc005ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:254
bfc005f0:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:255
bfc005f4:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:256
bfc005f8:	241b0028 	li	k1,40
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:257
bfc005fc:	175b0034 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:258
bfc00600:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:259
bfc00604:	401a6000 	mfc0	k0,$12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:260
bfc00608:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:261
bfc0060c:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:262
bfc00610:	175b002f 	bne	k0,k1,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:263
bfc00614:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:264
bfc00618:	3c120007 	lui	s2,0x7
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:265
bfc0061c:	1000002c 	b	bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:266
bfc00620:	00000000 	nop

bfc00624 <int_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:269
bfc00624:	00009021 	move	s2,zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:270
bfc00628:	401a7000 	mfc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:271
bfc0062c:	17540028 	bne	k0,s4,bfc006d0 <ex_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:272
bfc00630:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:273
bfc00634:	275a0008 	addiu	k0,k0,8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:274
bfc00638:	409a7000 	mtc0	k0,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:275
bfc0063c:	3c1bbfb0 	lui	k1,0xbfb0
bfc00640:	af608ffc 	sw	zero,-28676(k1)
bfc00644:	af608ffc 	sw	zero,-28676(k1)
bfc00648:	af60fff8 	sw	zero,-8(k1)
bfc0064c:	af608ffc 	sw	zero,-28676(k1)
bfc00650:	af608ffc 	sw	zero,-28676(k1)
bfc00654:	8f608ffc 	lw	zero,-28676(k1)
bfc00658:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:276
bfc0065c:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:277
bfc00660:	3c1bbfb0 	lui	k1,0xbfb0
bfc00664:	af608ffc 	sw	zero,-28676(k1)
bfc00668:	af608ffc 	sw	zero,-28676(k1)
bfc0066c:	af7bfff8 	sw	k1,-8(k1)
bfc00670:	af608ffc 	sw	zero,-28676(k1)
bfc00674:	af608ffc 	sw	zero,-28676(k1)
bfc00678:	8f608ffc 	lw	zero,-28676(k1)
bfc0067c:	8f7bfff8 	lw	k1,-8(k1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:278
bfc00680:	335a007c 	andi	k0,k0,0x7c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:279
bfc00684:	241b0000 	li	k1,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:280
bfc00688:	175b0011 	bne	k0,k1,bfc006d0 <ex_finish>
bfc0068c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:281
bfc00690:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:282
bfc00694:	401a6000 	mfc0	k0,$12
bfc00698:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:283
bfc0069c:	335a0002 	andi	k0,k0,0x2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:284
bfc006a0:	241b0002 	li	k1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:285
bfc006a4:	175b000a 	bne	k0,k1,bfc006d0 <ex_finish>
bfc006a8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:286
bfc006ac:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:287
bfc006b0:	241affff 	li	k0,-1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:288
bfc006b4:	241b0000 	li	k1,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:289
bfc006b8:	409a5800 	mtc0	k0,$11
bfc006bc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:290
bfc006c0:	409b6800 	mtc0	k1,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:291
bfc006c4:	10000010 	b	bfc00708 <ex_ret>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:292
bfc006c8:	3c120008 	lui	s2,0x8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:293
bfc006cc:	00000000 	nop

bfc006d0 <ex_finish>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:296
bfc006d0:	401a6800 	mfc0	k0,$13
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:297
bfc006d4:	3c1b8000 	lui	k1,0x8000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:298
bfc006d8:	035bd024 	and	k0,k0,k1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:299
bfc006dc:	401b7000 	mfc0	k1,$14
bfc006e0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:300
bfc006e4:	13400003 	beqz	k0,bfc006f4 <ex_finish+0x24>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:301
bfc006e8:	277b0004 	addiu	k1,k1,4
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:302
bfc006ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:303
bfc006f0:	277b0004 	addiu	k1,k1,4
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:305
bfc006f4:	409b7000 	mtc0	k1,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:306
bfc006f8:	16400003 	bnez	s2,bfc00708 <ex_ret>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:307
bfc006fc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:308
bfc00700:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:309
bfc00704:	3c12ffff 	lui	s2,0xffff

bfc00708 <ex_ret>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:312
bfc00708:	42000018 	c0	0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:314
bfc0070c:	00000000 	nop

bfc00710 <tlbwr_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:317
bfc00710:	24030001 	li	v1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:318
bfc00714:	1343000b 	beq	k0,v1,bfc00744 <tlbwr_allbit>
bfc00718:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:319
bfc0071c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:320
bfc00720:	24030003 	li	v1,3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:321
bfc00724:	1343000b 	beq	k0,v1,bfc00754 <tlbwr_asid>
bfc00728:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:322
bfc0072c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:323
bfc00730:	25080001 	addiu	t0,t0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:324
bfc00734:	25290001 	addiu	t1,t1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:325
bfc00738:	0bf001d8 	j	bfc00760 <tlbwr_return>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:326
bfc0073c:	275a0001 	addiu	k0,k0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:327
bfc00740:	00000000 	nop

bfc00744 <tlbwr_allbit>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:329
bfc00744:	35080007 	ori	t0,t0,0x7
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:330
bfc00748:	0bf001d8 	j	bfc00760 <tlbwr_return>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:331
bfc0074c:	35290007 	ori	t1,t1,0x7
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:332
bfc00750:	00000000 	nop

bfc00754 <tlbwr_asid>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:334
bfc00754:	0bf001d8 	j	bfc00760 <tlbwr_return>
bfc00758:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:335
bfc0075c:	00000000 	nop

bfc00760 <tlbwr_return>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:337
bfc00760:	40955000 	mtc0	s5,$10
bfc00764:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:338
bfc00768:	40881000 	mtc0	t0,$2
bfc0076c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:339
bfc00770:	40891800 	mtc0	t1,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:340
bfc00774:	42000006 	tlbwr
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:341
bfc00778:	3c03ed08 	lui	v1,0xed08
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:342
bfc0077c:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:343
bfc00780:	007a1820 	add	v1,v1,k0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:345
bfc00784:	42000018 	c0	0x18

bfc00788 <tlbwi_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:348
bfc00788:	40034000 	mfc0	v1,$8
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:349
bfc0078c:	3c05ffff 	lui	a1,0xffff
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:350
bfc00790:	34a5e000 	ori	a1,a1,0xe000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:351
bfc00794:	00a31824 	and	v1,a1,v1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:352
bfc00798:	40835000 	mtc0	v1,$10
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:353
bfc0079c:	24034007 	li	v1,16391
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:354
bfc007a0:	40831000 	mtc0	v1,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:355
bfc007a4:	24034007 	li	v1,16391
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:356
bfc007a8:	40831800 	mtc0	v1,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:357
bfc007ac:	42000002 	tlbwi
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:358
bfc007b0:	3c03ed12 	lui	v1,0xed12
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:359
bfc007b4:	34635678 	ori	v1,v1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:361
bfc007b8:	42000018 	c0	0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:363
bfc007bc:	00000000 	nop

bfc007c0 <tlb_double_ex>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:367
bfc007c0:	40195000 	mfc0	t9,$10
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:368
bfc007c4:	3c198000 	lui	t9,0x8000
bfc007c8:	3739d007 	ori	t9,t9,0xd007
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:369
bfc007cc:	40991000 	mtc0	t9,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:370
bfc007d0:	40991800 	mtc0	t9,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:371
bfc007d4:	42000006 	tlbwr
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:372
bfc007d8:	40197000 	mfc0	t9,$14
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:374
bfc007dc:	42000018 	c0	0x18

bfc007e0 <tlb_double_fill>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:378
bfc007e0:	3c18800d 	lui	t8,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:379
bfc007e4:	24120010 	li	s2,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:380
bfc007e8:	af120000 	sw	s2,0(t8)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:381
bfc007ec:	3c18000c 	lui	t8,0xc
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:382
bfc007f0:	8f120000 	lw	s2,0(t8)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:383
bfc007f4:	2652fff7 	addiu	s2,s2,-9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:384
bfc007f8:	02484025 	or	t0,s2,t0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:385
bfc007fc:	02494825 	or	t1,s2,t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:386
bfc00800:	40881000 	mtc0	t0,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:387
bfc00804:	40891800 	mtc0	t1,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:388
bfc00808:	42000006 	tlbwr
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:389
bfc0080c:	3c033333 	lui	v1,0x3333
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:390
bfc00810:	3463dc15 	ori	v1,v1,0xdc15
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:393
bfc00814:	42000018 	c0	0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:395
bfc00818:	00000000 	nop

bfc0081c <locate>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:400
bfc0081c:	3c04bfaf 	lui	a0,0xbfaf
bfc00820:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:401
bfc00824:	3c05bfaf 	lui	a1,0xbfaf
bfc00828:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:402
bfc0082c:	3c11bfaf 	lui	s1,0xbfaf
bfc00830:	3631f010 	ori	s1,s1,0xf010
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:404
bfc00834:	24090002 	li	t1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:405
bfc00838:	240a0001 	li	t2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:406
bfc0083c:	3c130000 	lui	s3,0x0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:408
bfc00840:	ac890000 	sw	t1,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:409
bfc00844:	acaa0000 	sw	t2,0(a1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:410
bfc00848:	ae330000 	sw	s3,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:412
bfc0084c:	3c100000 	lui	s0,0x0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:414
bfc00850:	3c09bfc0 	lui	t1,0xbfc0
bfc00854:	25290868 	addiu	t1,t1,2152
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:415
bfc00858:	3c0a2000 	lui	t2,0x2000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:416
bfc0085c:	012ac823 	subu	t9,t1,t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:417
bfc00860:	03200008 	jr	t9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:418
bfc00864:	00000000 	nop

bfc00868 <inst_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:421
bfc00868:	0ff00324 	jal	bfc00c90 <e1_trap_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:422
bfc0086c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:423
bfc00870:	0ff00270 	jal	bfc009c0 <wait_1s>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:424
bfc00874:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:425
bfc00878:	0ff004bc 	jal	bfc012f0 <e2_clo_clz_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:426
bfc0087c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:427
bfc00880:	0ff0046c 	jal	bfc011b0 <e3_madd_msub_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:428
bfc00884:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:429
bfc00888:	0ff004d8 	jal	bfc01360 <e9_swl_swr>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:430
bfc0088c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:431
bfc00890:	0ff00284 	jal	bfc00a10 <e8_lwl_lwr>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:432
bfc00894:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:433
bfc00898:	0ff004a0 	jal	bfc01280 <e4_ll_sc>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:434
bfc0089c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:435
bfc008a0:	0ff0030c 	jal	bfc00c30 <e5_movz_movn>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:436
bfc008a4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:437
bfc008a8:	0ff00434 	jal	bfc010d0 <n92_tlbwi_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:438
bfc008ac:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:439
bfc008b0:	0ff00554 	jal	bfc01550 <n93_tlbwr_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:440
bfc008b4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:442
bfc008b8:	3c19bfc0 	lui	t9,0xbfc0
bfc008bc:	273908c8 	addiu	t9,t9,2248
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:443
bfc008c0:	03200008 	jr	t9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:444
bfc008c4:	00000000 	nop

bfc008c8 <kseg0_kseg1>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:447
bfc008c8:	0ff00324 	jal	bfc00c90 <e1_trap_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:448
bfc008cc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:449
bfc008d0:	0ff00270 	jal	bfc009c0 <wait_1s>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:450
bfc008d4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:451
bfc008d8:	0ff004bc 	jal	bfc012f0 <e2_clo_clz_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:452
bfc008dc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:453
bfc008e0:	0ff0046c 	jal	bfc011b0 <e3_madd_msub_test>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:454
bfc008e4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:455
bfc008e8:	0ff004d8 	jal	bfc01360 <e9_swl_swr>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:456
bfc008ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:457
bfc008f0:	0ff00284 	jal	bfc00a10 <e8_lwl_lwr>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:458
bfc008f4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:459
bfc008f8:	0ff004a0 	jal	bfc01280 <e4_ll_sc>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:460
bfc008fc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:461
bfc00900:	0ff0030c 	jal	bfc00c30 <e5_movz_movn>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:462
bfc00904:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:463
bfc00908:	0ff002d6 	jal	bfc00b58 <e6_mapped_instr>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:464
bfc0090c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:465
bfc00910:	0ff002f4 	jal	bfc00bd0 <e7_tlb_double_miss>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:466
bfc00914:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:469
bfc00918:	3c04bfaf 	lui	a0,0xbfaf
bfc0091c:	3484ffec 	ori	a0,a0,0xffec
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:470
bfc00920:	24081234 	li	t0,4660
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:471
bfc00924:	ac880000 	sw	t0,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:472
bfc00928:	8c890000 	lw	t1,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:473
bfc0092c:	00084400 	sll	t0,t0,0x10
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:474
bfc00930:	15090009 	bne	t0,t1,bfc00958 <io_err>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:475
bfc00934:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:477
bfc00938:	3c085678 	lui	t0,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:478
bfc0093c:	ac880000 	sw	t0,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:479
bfc00940:	00084402 	srl	t0,t0,0x10
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:480
bfc00944:	8c890000 	lw	t1,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:481
bfc00948:	15090003 	bne	t0,t1,bfc00958 <io_err>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:482
bfc0094c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:483
bfc00950:	10000003 	b	bfc00960 <test_end>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:484
bfc00954:	00000000 	nop

bfc00958 <io_err>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:486
bfc00958:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:487
bfc0095c:	ae300000 	sw	s0,0(s1)

bfc00960 <test_end>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:490
bfc00960:	24100010 	li	s0,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:491
bfc00964:	1213000d 	beq	s0,s3,bfc0099c <test_end+0x3c>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:492
bfc00968:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:494
bfc0096c:	3c04bfaf 	lui	a0,0xbfaf
bfc00970:	3484f000 	ori	a0,a0,0xf000
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:495
bfc00974:	3c05bfaf 	lui	a1,0xbfaf
bfc00978:	34a5f008 	ori	a1,a1,0xf008
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:496
bfc0097c:	3c06bfaf 	lui	a2,0xbfaf
bfc00980:	34c6f004 	ori	a2,a2,0xf004
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:498
bfc00984:	24090002 	li	t1,2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:500
bfc00988:	ac800000 	sw	zero,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:501
bfc0098c:	aca90000 	sw	t1,0(a1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:502
bfc00990:	acc90000 	sw	t1,0(a2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:503
bfc00994:	10000008 	b	bfc009b8 <test_end+0x58>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:504
bfc00998:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:506
bfc0099c:	24090001 	li	t1,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:507
bfc009a0:	3c04bfaf 	lui	a0,0xbfaf
bfc009a4:	3484f008 	ori	a0,a0,0xf008
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:508
bfc009a8:	3c05bfaf 	lui	a1,0xbfaf
bfc009ac:	34a5f004 	ori	a1,a1,0xf004
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:509
bfc009b0:	ac890000 	sw	t1,0(a0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:510
bfc009b4:	aca90000 	sw	t1,0(a1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:513
bfc009b8:	0ff00040 	jal	bfc00100 <test_finish>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:514
bfc009bc:	00000000 	nop

bfc009c0 <wait_1s>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:517
bfc009c0:	3c08bfaf 	lui	t0,0xbfaf
bfc009c4:	3508f02c 	ori	t0,t0,0xf02c
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:518
bfc009c8:	3409aaaa 	li	t1,0xaaaa
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:521
bfc009cc:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:522
bfc009d0:	01495026 	xor	t2,t2,t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:523
bfc009d4:	000a5a40 	sll	t3,t2,0x9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:524
bfc009d8:	256b0001 	addiu	t3,t3,1

bfc009dc <sub1>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:527
bfc009dc:	256bffff 	addiu	t3,t3,-1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:530
bfc009e0:	8d0a0000 	lw	t2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:531
bfc009e4:	01495026 	xor	t2,t2,t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:532
bfc009e8:	000a5240 	sll	t2,t2,0x9
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:533
bfc009ec:	016a602b 	sltu	t4,t3,t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:534
bfc009f0:	15800002 	bnez	t4,bfc009fc <sub1+0x20>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:535
bfc009f4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:536
bfc009f8:	254b0000 	addiu	t3,t2,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:538
bfc009fc:	1560fff7 	bnez	t3,bfc009dc <sub1>
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:539
bfc00a00:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:540
bfc00a04:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/start.S:541
bfc00a08:	00000000 	nop
sub1():
bfc00a0c:	00000000 	nop

bfc00a10 <e8_lwl_lwr>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:8
bfc00a10:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:9
bfc00a14:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:10
bfc00a18:	24120001 	li	s2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:11
bfc00a1c:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:12
bfc00a20:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:18
bfc00a24:	3c088000 	lui	t0,0x8000
bfc00a28:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:19
bfc00a2c:	3c091234 	lui	t1,0x1234
bfc00a30:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:20
bfc00a34:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:21
bfc00a38:	3c0a90ab 	lui	t2,0x90ab
bfc00a3c:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:22
bfc00a40:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:23
bfc00a44:	3c0b2233 	lui	t3,0x2233
bfc00a48:	356b4455 	ori	t3,t3,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:24
bfc00a4c:	890b0008 	lwl	t3,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:25
bfc00a50:	3c0eef33 	lui	t6,0xef33
bfc00a54:	35ce4455 	ori	t6,t6,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:26
bfc00a58:	156e002d 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:27
bfc00a5c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:28
bfc00a60:	990b0005 	lwr	t3,5(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:29
bfc00a64:	3c0eef12 	lui	t6,0xef12
bfc00a68:	35ce3456 	ori	t6,t6,0x3456
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:30
bfc00a6c:	156e0028 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:31
bfc00a70:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:32
bfc00a74:	3c0b2233 	lui	t3,0x2233
bfc00a78:	356b4455 	ori	t3,t3,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:33
bfc00a7c:	890b0009 	lwl	t3,9(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:34
bfc00a80:	3c0ecdef 	lui	t6,0xcdef
bfc00a84:	35ce4455 	ori	t6,t6,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:35
bfc00a88:	156e0021 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:36
bfc00a8c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:37
bfc00a90:	990b0006 	lwr	t3,6(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:38
bfc00a94:	3c0ecdef 	lui	t6,0xcdef
bfc00a98:	35ce1234 	ori	t6,t6,0x1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:39
bfc00a9c:	156e001c 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:40
bfc00aa0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:41
bfc00aa4:	3c0b2233 	lui	t3,0x2233
bfc00aa8:	356b4455 	ori	t3,t3,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:42
bfc00aac:	890b000a 	lwl	t3,10(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:43
bfc00ab0:	3c0eabcd 	lui	t6,0xabcd
bfc00ab4:	35ceef55 	ori	t6,t6,0xef55
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:44
bfc00ab8:	156e0015 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:45
bfc00abc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:46
bfc00ac0:	990b0007 	lwr	t3,7(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:47
bfc00ac4:	3c0eabcd 	lui	t6,0xabcd
bfc00ac8:	35ceef12 	ori	t6,t6,0xef12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:48
bfc00acc:	156e0010 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:49
bfc00ad0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:50
bfc00ad4:	3c0b2233 	lui	t3,0x2233
bfc00ad8:	356b4455 	ori	t3,t3,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:51
bfc00adc:	890b000b 	lwl	t3,11(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:52
bfc00ae0:	3c0e90ab 	lui	t6,0x90ab
bfc00ae4:	35cecdef 	ori	t6,t6,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:53
bfc00ae8:	156e0009 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:54
bfc00aec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:55
bfc00af0:	3c0b2233 	lui	t3,0x2233
bfc00af4:	356b4455 	ori	t3,t3,0x4455
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:56
bfc00af8:	990b0004 	lwr	t3,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:57
bfc00afc:	3c0e1234 	lui	t6,0x1234
bfc00b00:	35ce5678 	ori	t6,t6,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:58
bfc00b04:	156e0002 	bne	t3,t6,bfc00b10 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:59
bfc00b08:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:64
bfc00b0c:	26730001 	addiu	s3,s3,1

bfc00b10 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:67
bfc00b10:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:68
bfc00b14:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:69
bfc00b18:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:70
bfc00b1c:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e8_lwl_lwr.S:71
bfc00b20:	00000000 	nop
	...

bfc00b30 <instr_tlb>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:8
bfc00b30:	240a0000 	li	t2,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:9
bfc00b34:	240c0000 	li	t4,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:10
bfc00b38:	240b000a 	li	t3,10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:12
bfc00b3c:	254a0001 	addiu	t2,t2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:13
bfc00b40:	154bfffe 	bne	t2,t3,bfc00b3c <instr_tlb+0xc>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:14
bfc00b44:	258c000a 	addiu	t4,t4,10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:15
bfc00b48:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:16
bfc00b4c:	00000000 	nop
	...

bfc00b58 <e6_mapped_instr>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:21
bfc00b58:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:22
bfc00b5c:	03e0c821 	move	t9,ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:23
bfc00b60:	2404005d 	li	a0,93
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:25
bfc00b64:	241a0001 	li	k0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:26
bfc00b68:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:27
bfc00b6c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:28
bfc00b70:	3c08bfc0 	lui	t0,0xbfc0
bfc00b74:	25080b30 	addiu	t0,t0,2864
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:29
bfc00b78:	240de000 	li	t5,-8192
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:30
bfc00b7c:	24156000 	li	s5,24576
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:31
bfc00b80:	010d4024 	and	t0,t0,t5
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:32
bfc00b84:	00084182 	srl	t0,t0,0x6
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:33
bfc00b88:	01004821 	move	t1,t0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:34
bfc00b8c:	3c0ebfc0 	lui	t6,0xbfc0
bfc00b90:	25ce0b30 	addiu	t6,t6,2864
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:35
bfc00b94:	31ce0fff 	andi	t6,t6,0xfff
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:36
bfc00b98:	35ce6000 	ori	t6,t6,0x6000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:37
bfc00b9c:	01c0f809 	jalr	t6
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:38
bfc00ba0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:39
bfc00ba4:	24010064 	li	at,100
bfc00ba8:	15810002 	bne	t4,at,bfc00bb4 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:40
bfc00bac:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:43
bfc00bb0:	26730001 	addiu	s3,s3,1

bfc00bb4 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:46
bfc00bb4:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:47
bfc00bb8:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:48
bfc00bbc:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:49
bfc00bc0:	0320f821 	move	ra,t9
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:50
bfc00bc4:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e6_mapped_instr.S:51
bfc00bc8:	00000000 	nop
inst_error():
bfc00bcc:	00000000 	nop

bfc00bd0 <e7_tlb_double_miss>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:7
bfc00bd0:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:8
bfc00bd4:	2404005d 	li	a0,93
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:10
bfc00bd8:	3c028888 	lui	v0,0x8888
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:11
bfc00bdc:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:12
bfc00be0:	3c160011 	lui	s6,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:13
bfc00be4:	36d6e124 	ori	s6,s6,0xe124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:14
bfc00be8:	3c150011 	lui	s5,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:15
bfc00bec:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:16
bfc00bf0:	3c071234 	lui	a3,0x1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:17
bfc00bf4:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:18
bfc00bf8:	241a0001 	li	k0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:19
bfc00bfc:	24084000 	li	t0,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:20
bfc00c00:	24094000 	li	t1,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:21
bfc00c04:	aec70000 	sw	a3,0(s6)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:22
bfc00c08:	3c083333 	lui	t0,0x3333
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:23
bfc00c0c:	3508dc15 	ori	t0,t0,0xdc15
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:24
bfc00c10:	14680002 	bne	v1,t0,bfc00c1c <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:25
bfc00c14:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:27
bfc00c18:	26730001 	addiu	s3,s3,1

bfc00c1c <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:30
bfc00c1c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:31
bfc00c20:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:32
bfc00c24:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:33
bfc00c28:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e7_tlb_double_miss.S:34
bfc00c2c:	00000000 	nop

bfc00c30 <e5_movz_movn>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:8
bfc00c30:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:9
bfc00c34:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:10
bfc00c38:	24120001 	li	s2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:11
bfc00c3c:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:12
bfc00c40:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:18
bfc00c44:	240904d2 	li	t1,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:19
bfc00c48:	240b0000 	li	t3,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:20
bfc00c4c:	012b500b 	0x12b500b
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:21
bfc00c50:	240904d6 	li	t1,1238
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:22
bfc00c54:	240b0001 	li	t3,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:23
bfc00c58:	012b500b 	0x12b500b
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:24
bfc00c5c:	24090929 	li	t1,2345
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:25
bfc00c60:	240b0000 	li	t3,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:26
bfc00c64:	012b500a 	0x12b500a
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:27
bfc00c68:	3c090001 	lui	t1,0x1
bfc00c6c:	35292bdf 	ori	t1,t1,0x2bdf
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:28
bfc00c70:	240b0001 	li	t3,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:29
bfc00c74:	012b500a 	0x12b500a
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:34
bfc00c78:	26730001 	addiu	s3,s3,1

bfc00c7c <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:37
bfc00c7c:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:38
bfc00c80:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:39
bfc00c84:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:40
bfc00c88:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e5_movz_movn.S:41
bfc00c8c:	00000000 	nop

bfc00c90 <e1_trap_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:8
bfc00c90:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:9
bfc00c94:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:10
bfc00c98:	24120009 	li	s2,9
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:11
bfc00c9c:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:12
bfc00ca0:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:15
bfc00ca4:	240f1926 	li	t7,6438
bfc00ca8:	24181926 	li	t8,6438
bfc00cac:	3c14bfc0 	lui	s4,0xbfc0
bfc00cb0:	26940cb4 	addiu	s4,s4,3252
bfc00cb4:	01f80034 	teq	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:16
bfc00cb8:	240f1926 	li	t7,6438
bfc00cbc:	24180817 	li	t8,2071
bfc00cc0:	3c14bfc0 	lui	s4,0xbfc0
bfc00cc4:	26940cc8 	addiu	s4,s4,3272
bfc00cc8:	01f80034 	teq	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:17
bfc00ccc:	240f1926 	li	t7,6438
bfc00cd0:	3c14bfc0 	lui	s4,0xbfc0
bfc00cd4:	26940cd8 	addiu	s4,s4,3288
bfc00cd8:	05ec1926 	teqi	t7,6438
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:18
bfc00cdc:	240f1926 	li	t7,6438
bfc00ce0:	3c14bfc0 	lui	s4,0xbfc0
bfc00ce4:	26940ce8 	addiu	s4,s4,3304
bfc00ce8:	05ec0817 	teqi	t7,2071
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:19
bfc00cec:	240f1926 	li	t7,6438
bfc00cf0:	24181926 	li	t8,6438
bfc00cf4:	3c14bfc0 	lui	s4,0xbfc0
bfc00cf8:	26940cfc 	addiu	s4,s4,3324
bfc00cfc:	01f80036 	tne	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:20
bfc00d00:	240f1926 	li	t7,6438
bfc00d04:	24180817 	li	t8,2071
bfc00d08:	3c14bfc0 	lui	s4,0xbfc0
bfc00d0c:	26940d10 	addiu	s4,s4,3344
bfc00d10:	01f80036 	tne	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:21
bfc00d14:	240f1926 	li	t7,6438
bfc00d18:	3c14bfc0 	lui	s4,0xbfc0
bfc00d1c:	26940d20 	addiu	s4,s4,3360
bfc00d20:	05ee1926 	tnei	t7,6438
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:22
bfc00d24:	240f1926 	li	t7,6438
bfc00d28:	3c14bfc0 	lui	s4,0xbfc0
bfc00d2c:	26940d30 	addiu	s4,s4,3376
bfc00d30:	05ee0817 	tnei	t7,2071
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:24
bfc00d34:	240f04d2 	li	t7,1234
bfc00d38:	2418fb2e 	li	t8,-1234
bfc00d3c:	3c14bfc0 	lui	s4,0xbfc0
bfc00d40:	26940d44 	addiu	s4,s4,3396
bfc00d44:	01f80030 	tge	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:25
bfc00d48:	240ffb2e 	li	t7,-1234
bfc00d4c:	241804d2 	li	t8,1234
bfc00d50:	3c14bfc0 	lui	s4,0xbfc0
bfc00d54:	26940d58 	addiu	s4,s4,3416
bfc00d58:	01f80030 	tge	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:26
bfc00d5c:	240f04d2 	li	t7,1234
bfc00d60:	3c14bfc0 	lui	s4,0xbfc0
bfc00d64:	26940d68 	addiu	s4,s4,3432
bfc00d68:	05e8fb2e 	tgei	t7,-1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:27
bfc00d6c:	240ffb2e 	li	t7,-1234
bfc00d70:	3c14bfc0 	lui	s4,0xbfc0
bfc00d74:	26940d78 	addiu	s4,s4,3448
bfc00d78:	05e804d2 	tgei	t7,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:28
bfc00d7c:	240f04d2 	li	t7,1234
bfc00d80:	2418fb2e 	li	t8,-1234
bfc00d84:	3c14bfc0 	lui	s4,0xbfc0
bfc00d88:	26940d8c 	addiu	s4,s4,3468
bfc00d8c:	01f80031 	tgeu	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:29
bfc00d90:	240ffb2e 	li	t7,-1234
bfc00d94:	241804d2 	li	t8,1234
bfc00d98:	3c14bfc0 	lui	s4,0xbfc0
bfc00d9c:	26940da0 	addiu	s4,s4,3488
bfc00da0:	01f80031 	tgeu	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:30
bfc00da4:	240f04d2 	li	t7,1234
bfc00da8:	3c14bfc0 	lui	s4,0xbfc0
bfc00dac:	26940db0 	addiu	s4,s4,3504
bfc00db0:	05e9fb2e 	tgeiu	t7,-1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:31
bfc00db4:	240ffb2e 	li	t7,-1234
bfc00db8:	3c14bfc0 	lui	s4,0xbfc0
bfc00dbc:	26940dc0 	addiu	s4,s4,3520
bfc00dc0:	05e904d2 	tgeiu	t7,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:32
bfc00dc4:	240f04d2 	li	t7,1234
bfc00dc8:	2418fb2e 	li	t8,-1234
bfc00dcc:	3c14bfc0 	lui	s4,0xbfc0
bfc00dd0:	26940dd4 	addiu	s4,s4,3540
bfc00dd4:	01f80032 	tlt	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:33
bfc00dd8:	240ffb2e 	li	t7,-1234
bfc00ddc:	241804d2 	li	t8,1234
bfc00de0:	3c14bfc0 	lui	s4,0xbfc0
bfc00de4:	26940de8 	addiu	s4,s4,3560
bfc00de8:	01f80032 	tlt	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:34
bfc00dec:	240f04d2 	li	t7,1234
bfc00df0:	3c14bfc0 	lui	s4,0xbfc0
bfc00df4:	26940df8 	addiu	s4,s4,3576
bfc00df8:	05eafb2e 	tlti	t7,-1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:35
bfc00dfc:	240ffb2e 	li	t7,-1234
bfc00e00:	3c14bfc0 	lui	s4,0xbfc0
bfc00e04:	26940e08 	addiu	s4,s4,3592
bfc00e08:	05ea04d2 	tlti	t7,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:36
bfc00e0c:	240f04d2 	li	t7,1234
bfc00e10:	2418fb2e 	li	t8,-1234
bfc00e14:	3c14bfc0 	lui	s4,0xbfc0
bfc00e18:	26940e1c 	addiu	s4,s4,3612
bfc00e1c:	01f80033 	tltu	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:37
bfc00e20:	240ffb2e 	li	t7,-1234
bfc00e24:	241804d2 	li	t8,1234
bfc00e28:	3c14bfc0 	lui	s4,0xbfc0
bfc00e2c:	26940e30 	addiu	s4,s4,3632
bfc00e30:	01f80033 	tltu	t7,t8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:38
bfc00e34:	240f04d2 	li	t7,1234
bfc00e38:	3c14bfc0 	lui	s4,0xbfc0
bfc00e3c:	26940e40 	addiu	s4,s4,3648
bfc00e40:	05ebfb2e 	tltiu	t7,-1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:39
bfc00e44:	240ffb2e 	li	t7,-1234
bfc00e48:	3c14bfc0 	lui	s4,0xbfc0
bfc00e4c:	26940e50 	addiu	s4,s4,3664
bfc00e50:	05eb04d2 	tltiu	t7,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:41
bfc00e54:	03e01021 	move	v0,ra
bfc00e58:	240f04d2 	li	t7,1234
bfc00e5c:	241804d2 	li	t8,1234
bfc00e60:	51f80002 	beql	t7,t8,bfc00e6c <e1_trap_test+0x1dc>
bfc00e64:	25ef0001 	addiu	t7,t7,1
bfc00e68:	25ef000a 	addiu	t7,t7,10
bfc00e6c:	27180064 	addiu	t8,t8,100
bfc00e70:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:42
bfc00e74:	03e01021 	move	v0,ra
bfc00e78:	240f04d2 	li	t7,1234
bfc00e7c:	2418162e 	li	t8,5678
bfc00e80:	51f80002 	beql	t7,t8,bfc00e8c <e1_trap_test+0x1fc>
bfc00e84:	25ef0001 	addiu	t7,t7,1
bfc00e88:	25ef000a 	addiu	t7,t7,10
bfc00e8c:	27180064 	addiu	t8,t8,100
bfc00e90:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:43
bfc00e94:	03e01021 	move	v0,ra
bfc00e98:	240f162e 	li	t7,5678
bfc00e9c:	241804d2 	li	t8,1234
bfc00ea0:	51f80002 	beql	t7,t8,bfc00eac <e1_trap_test+0x21c>
bfc00ea4:	25ef0001 	addiu	t7,t7,1
bfc00ea8:	25ef000a 	addiu	t7,t7,10
bfc00eac:	27180064 	addiu	t8,t8,100
bfc00eb0:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:44
bfc00eb4:	03e01021 	move	v0,ra
bfc00eb8:	240f04d2 	li	t7,1234
bfc00ebc:	241804d2 	li	t8,1234
bfc00ec0:	55f80002 	bnel	t7,t8,bfc00ecc <e1_trap_test+0x23c>
bfc00ec4:	25ef0001 	addiu	t7,t7,1
bfc00ec8:	25ef000a 	addiu	t7,t7,10
bfc00ecc:	27180064 	addiu	t8,t8,100
bfc00ed0:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:45
bfc00ed4:	03e01021 	move	v0,ra
bfc00ed8:	240f04d2 	li	t7,1234
bfc00edc:	2418162e 	li	t8,5678
bfc00ee0:	55f80002 	bnel	t7,t8,bfc00eec <e1_trap_test+0x25c>
bfc00ee4:	25ef0001 	addiu	t7,t7,1
bfc00ee8:	25ef000a 	addiu	t7,t7,10
bfc00eec:	27180064 	addiu	t8,t8,100
bfc00ef0:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:46
bfc00ef4:	03e01021 	move	v0,ra
bfc00ef8:	240f162e 	li	t7,5678
bfc00efc:	241804d2 	li	t8,1234
bfc00f00:	55f80002 	bnel	t7,t8,bfc00f0c <e1_trap_test+0x27c>
bfc00f04:	25ef0001 	addiu	t7,t7,1
bfc00f08:	25ef000a 	addiu	t7,t7,10
bfc00f0c:	27180064 	addiu	t8,t8,100
bfc00f10:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:47
bfc00f14:	03e01021 	move	v0,ra
bfc00f18:	240f04d2 	li	t7,1234
bfc00f1c:	05e30002 	bgezl	t7,bfc00f28 <e1_trap_test+0x298>
bfc00f20:	25ef0001 	addiu	t7,t7,1
bfc00f24:	25ef0014 	addiu	t7,t7,20
bfc00f28:	25ef000a 	addiu	t7,t7,10
bfc00f2c:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:48
bfc00f30:	03e01021 	move	v0,ra
bfc00f34:	240f0000 	li	t7,0
bfc00f38:	05e30002 	bgezl	t7,bfc00f44 <e1_trap_test+0x2b4>
bfc00f3c:	25ef0001 	addiu	t7,t7,1
bfc00f40:	25ef0014 	addiu	t7,t7,20
bfc00f44:	25ef000a 	addiu	t7,t7,10
bfc00f48:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:49
bfc00f4c:	03e01021 	move	v0,ra
bfc00f50:	240ffb2e 	li	t7,-1234
bfc00f54:	05e30002 	bgezl	t7,bfc00f60 <e1_trap_test+0x2d0>
bfc00f58:	25ef0001 	addiu	t7,t7,1
bfc00f5c:	25ef0014 	addiu	t7,t7,20
bfc00f60:	25ef000a 	addiu	t7,t7,10
bfc00f64:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:50
bfc00f68:	03e01021 	move	v0,ra
bfc00f6c:	240f04d2 	li	t7,1234
bfc00f70:	5de00002 	bgtzl	t7,bfc00f7c <e1_trap_test+0x2ec>
bfc00f74:	25ef0001 	addiu	t7,t7,1
bfc00f78:	25ef0014 	addiu	t7,t7,20
bfc00f7c:	25ef000a 	addiu	t7,t7,10
bfc00f80:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:51
bfc00f84:	03e01021 	move	v0,ra
bfc00f88:	240f0000 	li	t7,0
bfc00f8c:	5de00002 	bgtzl	t7,bfc00f98 <e1_trap_test+0x308>
bfc00f90:	25ef0001 	addiu	t7,t7,1
bfc00f94:	25ef0014 	addiu	t7,t7,20
bfc00f98:	25ef000a 	addiu	t7,t7,10
bfc00f9c:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:52
bfc00fa0:	03e01021 	move	v0,ra
bfc00fa4:	240ffb2e 	li	t7,-1234
bfc00fa8:	5de00002 	bgtzl	t7,bfc00fb4 <e1_trap_test+0x324>
bfc00fac:	25ef0001 	addiu	t7,t7,1
bfc00fb0:	25ef0014 	addiu	t7,t7,20
bfc00fb4:	25ef000a 	addiu	t7,t7,10
bfc00fb8:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:53
bfc00fbc:	03e01021 	move	v0,ra
bfc00fc0:	240f04d2 	li	t7,1234
bfc00fc4:	05e20002 	bltzl	t7,bfc00fd0 <e1_trap_test+0x340>
bfc00fc8:	25ef0001 	addiu	t7,t7,1
bfc00fcc:	25ef0014 	addiu	t7,t7,20
bfc00fd0:	25ef000a 	addiu	t7,t7,10
bfc00fd4:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:54
bfc00fd8:	03e01021 	move	v0,ra
bfc00fdc:	240f0000 	li	t7,0
bfc00fe0:	05e20002 	bltzl	t7,bfc00fec <e1_trap_test+0x35c>
bfc00fe4:	25ef0001 	addiu	t7,t7,1
bfc00fe8:	25ef0014 	addiu	t7,t7,20
bfc00fec:	25ef000a 	addiu	t7,t7,10
bfc00ff0:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:55
bfc00ff4:	03e01021 	move	v0,ra
bfc00ff8:	240ffb2e 	li	t7,-1234
bfc00ffc:	05e20002 	bltzl	t7,bfc01008 <e1_trap_test+0x378>
bfc01000:	25ef0001 	addiu	t7,t7,1
bfc01004:	25ef0014 	addiu	t7,t7,20
bfc01008:	25ef000a 	addiu	t7,t7,10
bfc0100c:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:56
bfc01010:	03e01021 	move	v0,ra
bfc01014:	240f04d2 	li	t7,1234
bfc01018:	59e00002 	blezl	t7,bfc01024 <e1_trap_test+0x394>
bfc0101c:	25ef0001 	addiu	t7,t7,1
bfc01020:	25ef0014 	addiu	t7,t7,20
bfc01024:	25ef000a 	addiu	t7,t7,10
bfc01028:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:57
bfc0102c:	03e01021 	move	v0,ra
bfc01030:	240f0000 	li	t7,0
bfc01034:	59e00002 	blezl	t7,bfc01040 <e1_trap_test+0x3b0>
bfc01038:	25ef0001 	addiu	t7,t7,1
bfc0103c:	25ef0014 	addiu	t7,t7,20
bfc01040:	25ef000a 	addiu	t7,t7,10
bfc01044:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:58
bfc01048:	03e01021 	move	v0,ra
bfc0104c:	240ffb2e 	li	t7,-1234
bfc01050:	59e00002 	blezl	t7,bfc0105c <e1_trap_test+0x3cc>
bfc01054:	25ef0001 	addiu	t7,t7,1
bfc01058:	25ef0014 	addiu	t7,t7,20
bfc0105c:	25ef000a 	addiu	t7,t7,10
bfc01060:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:59
bfc01064:	03e01021 	move	v0,ra
bfc01068:	240f04d2 	li	t7,1234
bfc0106c:	05f30002 	bgezall	t7,bfc01078 <e1_trap_test+0x3e8>
bfc01070:	25ef0001 	addiu	t7,t7,1
bfc01074:	25ef0014 	addiu	t7,t7,20
bfc01078:	25ef000a 	addiu	t7,t7,10
bfc0107c:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:60
bfc01080:	03e01021 	move	v0,ra
bfc01084:	240f0000 	li	t7,0
bfc01088:	05f30002 	bgezall	t7,bfc01094 <e1_trap_test+0x404>
bfc0108c:	25ef0001 	addiu	t7,t7,1
bfc01090:	25ef0014 	addiu	t7,t7,20
bfc01094:	25ef000a 	addiu	t7,t7,10
bfc01098:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:61
bfc0109c:	03e01021 	move	v0,ra
bfc010a0:	240ffb2e 	li	t7,-1234
bfc010a4:	05f30002 	bgezall	t7,bfc010b0 <e1_trap_test+0x420>
bfc010a8:	25ef0001 	addiu	t7,t7,1
bfc010ac:	25ef0014 	addiu	t7,t7,20
bfc010b0:	25ef000a 	addiu	t7,t7,10
bfc010b4:	0040f821 	move	ra,v0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:65
bfc010b8:	26730001 	addiu	s3,s3,1

bfc010bc <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:68
bfc010bc:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:69
bfc010c0:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:70
bfc010c4:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:71
bfc010c8:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e1_trap_test.S:72
bfc010cc:	00000000 	nop

bfc010d0 <n92_tlbwi_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:9
bfc010d0:	2404005c 	li	a0,92
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:10
bfc010d4:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:12
bfc010d8:	24120000 	li	s2,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:13
bfc010dc:	241a0010 	li	k0,16

bfc010e0 <test_phase1_start>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:15
bfc010e0:	40920000 	mtc0	s2,$0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:16
bfc010e4:	3c02efe8 	lui	v0,0xefe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:17
bfc010e8:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:18
bfc010ec:	00124c00 	sll	t1,s2,0x10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:19
bfc010f0:	3415f124 	li	s5,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:20
bfc010f4:	0135a820 	add	s5,t1,s5
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:21
bfc010f8:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:22
bfc010fc:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:23
bfc01100:	aea70000 	sw	a3,0(s5)
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:29
bfc01118:	3c08ed12 	lui	t0,0xed12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:30
bfc0111c:	35085678 	ori	t0,t0,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:31
bfc01120:	1468001d 	bne	v1,t0,bfc01198 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:32
bfc01124:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:33
bfc01128:	3415f124 	li	s5,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:34
bfc0112c:	8ea80000 	lw	t0,0(s5)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:35
bfc01130:	3c15abcd 	lui	s5,0xabcd
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:36
bfc01134:	36b5ef81 	ori	s5,s5,0xef81
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:37
bfc01138:	16a80017 	bne	s5,t0,bfc01198 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:38
bfc0113c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:39
bfc01140:	26520001 	addiu	s2,s2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:40
bfc01144:	1752ffe6 	bne	k0,s2,bfc010e0 <test_phase1_start>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:41
bfc01148:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:42
bfc0114c:	24020000 	li	v0,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:43
bfc01150:	241a0010 	li	k0,16
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:44
bfc01154:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:45
bfc01158:	24030000 	li	v1,0

bfc0115c <test_phase2_start>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:47
bfc0115c:	3415f124 	li	s5,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:48
bfc01160:	00024c00 	sll	t1,v0,0x10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:49
bfc01164:	0135a820 	add	s5,t1,s5
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:50
bfc01168:	8ea90000 	lw	t1,0(s5)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:51
bfc0116c:	3c07abcd 	lui	a3,0xabcd
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:52
bfc01170:	34e7ef81 	ori	a3,a3,0xef81
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:53
bfc01174:	15270008 	bne	t1,a3,bfc01198 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:54
bfc01178:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:55
bfc0117c:	24420001 	addiu	v0,v0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:56
bfc01180:	24090000 	li	t1,0
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:57
bfc01184:	15230004 	bne	t1,v1,bfc01198 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:58
bfc01188:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:59
bfc0118c:	145afff3 	bne	v0,k0,bfc0115c <test_phase2_start>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:60
bfc01190:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:62
bfc01194:	26730001 	addiu	s3,s3,1

bfc01198 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:65
bfc01198:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:66
bfc0119c:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:67
bfc011a0:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:68
bfc011a4:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n92_tlbwi.S:69
bfc011a8:	00000000 	nop
bfc011ac:	00000000 	nop

bfc011b0 <e3_madd_msub_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:8
bfc011b0:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:9
bfc011b4:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:10
bfc011b8:	24120009 	li	s2,9
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:11
bfc011bc:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:12
bfc011c0:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:15
bfc011c4:	00000013 	mtlo	zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:16
bfc011c8:	00000011 	mthi	zero
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:17
bfc011cc:	24091234 	li	t1,4660
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:18
bfc011d0:	240a5678 	li	t2,22136
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:19
bfc011d4:	712a0000 	0x712a0000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:20
bfc011d8:	712a0000 	0x712a0000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:21
bfc011dc:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:22
bfc011e0:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:23
bfc011e4:	712a0004 	0x712a0004
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:24
bfc011e8:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:25
bfc011ec:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:26
bfc011f0:	2409fff4 	li	t1,-12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:27
bfc011f4:	240a0022 	li	t2,34
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:28
bfc011f8:	01200013 	mtlo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:29
bfc011fc:	01400011 	mthi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:30
bfc01200:	712a0001 	0x712a0001
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:31
bfc01204:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:32
bfc01208:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:33
bfc0120c:	2409fff4 	li	t1,-12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:34
bfc01210:	240a0022 	li	t2,34
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:35
bfc01214:	01200013 	mtlo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:36
bfc01218:	01400011 	mthi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:37
bfc0121c:	712a0000 	0x712a0000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:38
bfc01220:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:39
bfc01224:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:40
bfc01228:	2409fff4 	li	t1,-12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:41
bfc0122c:	240a0022 	li	t2,34
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:42
bfc01230:	01200013 	mtlo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:43
bfc01234:	01400011 	mthi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:44
bfc01238:	712a0005 	0x712a0005
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:45
bfc0123c:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:46
bfc01240:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:47
bfc01244:	2409fff4 	li	t1,-12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:48
bfc01248:	240a0022 	li	t2,34
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:49
bfc0124c:	01200013 	mtlo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:50
bfc01250:	01400011 	mthi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:51
bfc01254:	712a0004 	0x712a0004
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:52
bfc01258:	00004812 	mflo	t1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:53
bfc0125c:	00005010 	mfhi	t2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:57
bfc01260:	26730001 	addiu	s3,s3,1

bfc01264 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:60
bfc01264:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:61
bfc01268:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:62
bfc0126c:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:63
bfc01270:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e3_madd_msub.S:64
bfc01274:	00000000 	nop
	...

bfc01280 <e4_ll_sc>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:8
bfc01280:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:9
bfc01284:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:10
bfc01288:	24120001 	li	s2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:11
bfc0128c:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:12
bfc01290:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:18
bfc01294:	3c088000 	lui	t0,0x8000
bfc01298:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:19
bfc0129c:	240904d2 	li	t1,1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:20
bfc012a0:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:21
bfc012a4:	c10a0004 	ll	t2,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:22
bfc012a8:	254a0004 	addiu	t2,t2,4
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:23
bfc012ac:	e10a0004 	sc	t2,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:25
bfc012b0:	c10a0004 	ll	t2,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:26
bfc012b4:	254a0004 	addiu	t2,t2,4
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:27
bfc012b8:	0000000c 	syscall
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:28
bfc012bc:	e10a0004 	sc	t2,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:30
bfc012c0:	8d0b0004 	lw	t3,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:31
bfc012c4:	240c04d6 	li	t4,1238
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:32
bfc012c8:	156c0002 	bne	t3,t4,bfc012d4 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:33
bfc012cc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:38
bfc012d0:	26730001 	addiu	s3,s3,1

bfc012d4 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:41
bfc012d4:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:42
bfc012d8:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:43
bfc012dc:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:44
bfc012e0:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e4_ll_sc.S:45
bfc012e4:	00000000 	nop
	...

bfc012f0 <e2_clo_clz_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:8
bfc012f0:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:9
bfc012f4:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:10
bfc012f8:	24120009 	li	s2,9
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:11
bfc012fc:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:12
bfc01300:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:15
bfc01304:	3c08e234 	lui	t0,0xe234
bfc01308:	35085678 	ori	t0,t0,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:16
bfc0130c:	71094821 	0x71094821
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:17
bfc01310:	71094820 	0x71094820
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:18
bfc01314:	3c088000 	lui	t0,0x8000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:19
bfc01318:	71094821 	0x71094821
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:20
bfc0131c:	71094820 	0x71094820
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:21
bfc01320:	3c081926 	lui	t0,0x1926
bfc01324:	35080817 	ori	t0,t0,0x817
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:22
bfc01328:	71094821 	0x71094821
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:23
bfc0132c:	71094820 	0x71094820
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:24
bfc01330:	2408000e 	li	t0,14
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:25
bfc01334:	71094821 	0x71094821
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:26
bfc01338:	71094820 	0x71094820
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:30
bfc0133c:	26730001 	addiu	s3,s3,1

bfc01340 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:33
bfc01340:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:34
bfc01344:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:35
bfc01348:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:36
bfc0134c:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e2_clo_clz.S:37
bfc01350:	00000000 	nop
	...

bfc01360 <e9_swl_swr>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:8
bfc01360:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:9
bfc01364:	40805800 	mtc0	zero,$11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:10
bfc01368:	24120001 	li	s2,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:11
bfc0136c:	3c08800d 	lui	t0,0x800d
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:12
bfc01370:	ad120000 	sw	s2,0(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:18
bfc01374:	3c088000 	lui	t0,0x8000
bfc01378:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:19
bfc0137c:	3c088000 	lui	t0,0x8000
bfc01380:	3508d000 	ori	t0,t0,0xd000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:20
bfc01384:	3c091234 	lui	t1,0x1234
bfc01388:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:21
bfc0138c:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:22
bfc01390:	3c0a90ab 	lui	t2,0x90ab
bfc01394:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:23
bfc01398:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:24
bfc0139c:	3c0b1926 	lui	t3,0x1926
bfc013a0:	356b0817 	ori	t3,t3,0x817
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:25
bfc013a4:	a90b0008 	swl	t3,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:26
bfc013a8:	8d0c0008 	lw	t4,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:27
bfc013ac:	3c0d90ab 	lui	t5,0x90ab
bfc013b0:	35adcd19 	ori	t5,t5,0xcd19
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:28
bfc013b4:	158d005e 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:29
bfc013b8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:30
bfc013bc:	3c091234 	lui	t1,0x1234
bfc013c0:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:31
bfc013c4:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:32
bfc013c8:	3c0a90ab 	lui	t2,0x90ab
bfc013cc:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:33
bfc013d0:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:34
bfc013d4:	a90b0005 	swl	t3,5(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:35
bfc013d8:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:36
bfc013dc:	3c0d1234 	lui	t5,0x1234
bfc013e0:	35ad1926 	ori	t5,t5,0x1926
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:37
bfc013e4:	158d0052 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:38
bfc013e8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:39
bfc013ec:	3c091234 	lui	t1,0x1234
bfc013f0:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:40
bfc013f4:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:41
bfc013f8:	3c0a90ab 	lui	t2,0x90ab
bfc013fc:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:42
bfc01400:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:43
bfc01404:	a90b0006 	swl	t3,6(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:44
bfc01408:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:45
bfc0140c:	3c0d1219 	lui	t5,0x1219
bfc01410:	35ad2608 	ori	t5,t5,0x2608
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:46
bfc01414:	158d0046 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:47
bfc01418:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:48
bfc0141c:	3c091234 	lui	t1,0x1234
bfc01420:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:49
bfc01424:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:50
bfc01428:	3c0a90ab 	lui	t2,0x90ab
bfc0142c:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:51
bfc01430:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:52
bfc01434:	a90b0007 	swl	t3,7(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:53
bfc01438:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:54
bfc0143c:	8d0e0008 	lw	t6,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:55
bfc01440:	3c0d90ab 	lui	t5,0x90ab
bfc01444:	35adcdef 	ori	t5,t5,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:56
bfc01448:	15cd0039 	bne	t6,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:57
bfc0144c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:58
bfc01450:	158b0037 	bne	t4,t3,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:59
bfc01454:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:62
bfc01458:	3c091234 	lui	t1,0x1234
bfc0145c:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:63
bfc01460:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:64
bfc01464:	3c0a90ab 	lui	t2,0x90ab
bfc01468:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:65
bfc0146c:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:66
bfc01470:	3c0b1926 	lui	t3,0x1926
bfc01474:	356b0817 	ori	t3,t3,0x817
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:67
bfc01478:	b90b0005 	swr	t3,5(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:68
bfc0147c:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:69
bfc01480:	3c0d2608 	lui	t5,0x2608
bfc01484:	35ad1778 	ori	t5,t5,0x1778
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:70
bfc01488:	158d0029 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:71
bfc0148c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:72
bfc01490:	3c091234 	lui	t1,0x1234
bfc01494:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:73
bfc01498:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:74
bfc0149c:	3c0a90ab 	lui	t2,0x90ab
bfc014a0:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:75
bfc014a4:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:76
bfc014a8:	b90b0006 	swr	t3,6(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:77
bfc014ac:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:78
bfc014b0:	3c0d0817 	lui	t5,0x817
bfc014b4:	35ad5678 	ori	t5,t5,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:79
bfc014b8:	158d001d 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:80
bfc014bc:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:81
bfc014c0:	3c091234 	lui	t1,0x1234
bfc014c4:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:82
bfc014c8:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:83
bfc014cc:	3c0a90ab 	lui	t2,0x90ab
bfc014d0:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:84
bfc014d4:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:85
bfc014d8:	b90b0007 	swr	t3,7(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:86
bfc014dc:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:87
bfc014e0:	3c0d1734 	lui	t5,0x1734
bfc014e4:	35ad5678 	ori	t5,t5,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:88
bfc014e8:	158d0011 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:89
bfc014ec:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:90
bfc014f0:	3c091234 	lui	t1,0x1234
bfc014f4:	35295678 	ori	t1,t1,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:91
bfc014f8:	ad090004 	sw	t1,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:92
bfc014fc:	3c0a90ab 	lui	t2,0x90ab
bfc01500:	354acdef 	ori	t2,t2,0xcdef
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:93
bfc01504:	ad0a0008 	sw	t2,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:94
bfc01508:	b90b0008 	swr	t3,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:95
bfc0150c:	8d0c0004 	lw	t4,4(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:96
bfc01510:	8d0e0008 	lw	t6,8(t0)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:97
bfc01514:	3c0d1234 	lui	t5,0x1234
bfc01518:	35ad5678 	ori	t5,t5,0x5678
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:98
bfc0151c:	15cb0004 	bne	t6,t3,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:99
bfc01520:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:100
bfc01524:	158d0002 	bne	t4,t5,bfc01530 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:101
bfc01528:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:107
bfc0152c:	26730001 	addiu	s3,s3,1

bfc01530 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:110
bfc01530:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:111
bfc01534:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:112
bfc01538:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:113
bfc0153c:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/e9_swl_swr.S:114
bfc01540:	00000000 	nop
	...

bfc01550 <n93_tlbwr_test>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:9
bfc01550:	26100001 	addiu	s0,s0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:10
bfc01554:	2404005d 	li	a0,93

bfc01558 <test_gbit_start>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:13
bfc01558:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:14
bfc0155c:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:15
bfc01560:	3c120011 	lui	s2,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:16
bfc01564:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:17
bfc01568:	3c150011 	lui	s5,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:18
bfc0156c:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:19
bfc01570:	3c071234 	lui	a3,0x1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:20
bfc01574:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:21
bfc01578:	241a0001 	li	k0,1
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:22
bfc0157c:	24084000 	li	t0,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:23
bfc01580:	24094000 	li	t1,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:24
bfc01584:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:30
bfc0159c:	3c08ed08 	lui	t0,0xed08
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:31
bfc015a0:	3508dc16 	ori	t0,t0,0xdc16
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:32
bfc015a4:	14680064 	bne	v1,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:33
bfc015a8:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:34
bfc015ac:	3c120011 	lui	s2,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:35
bfc015b0:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:36
bfc015b4:	8e480000 	lw	t0,0(s2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:37
bfc015b8:	3c071234 	lui	a3,0x1234
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:38
bfc015bc:	34e75867 	ori	a3,a3,0x5867
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:39
bfc015c0:	14e8005d 	bne	a3,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:40
bfc015c4:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:41
bfc015c8:	3c128010 	lui	s2,0x8010
bfc015cc:	36520124 	ori	s2,s2,0x124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:42
bfc015d0:	8e480000 	lw	t0,0(s2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:43
bfc015d4:	14e80058 	bne	a3,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:44
bfc015d8:	00000000 	nop

bfc015dc <test_asid_match>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:46
bfc015dc:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:47
bfc015e0:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:48
bfc015e4:	3c120012 	lui	s2,0x12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:49
bfc015e8:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:50
bfc015ec:	241a0003 	li	k0,3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:51
bfc015f0:	3c150012 	lui	s5,0x12
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:52
bfc015f4:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:53
bfc015f8:	3c07e235 	lui	a3,0xe235
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:54
bfc015fc:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:55
bfc01600:	24084006 	li	t0,16390
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:56
bfc01604:	24094006 	li	t1,16390
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:57
bfc01608:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:63
bfc01620:	3c08ed08 	lui	t0,0xed08
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:64
bfc01624:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:65
bfc01628:	14680043 	bne	v1,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:66
bfc0162c:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:67
bfc01630:	3c150013 	lui	s5,0x13
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:68
bfc01634:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:69
bfc01638:	40955000 	mtc0	s5,$10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:70
bfc0163c:	3c120013 	lui	s2,0x13
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:71
bfc01640:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:72
bfc01644:	24084006 	li	t0,16390
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:73
bfc01648:	24094006 	li	t1,16390
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:74
bfc0164c:	8e480000 	lw	t0,0(s2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:75
bfc01650:	3c07e235 	lui	a3,0xe235
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:76
bfc01654:	34e7e8f7 	ori	a3,a3,0xe8f7
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:77
bfc01658:	14e80037 	bne	a3,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:78
bfc0165c:	00000000 	nop

bfc01660 <test_asid_2>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:80
bfc01660:	3c02ffe8 	lui	v0,0xffe8
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:81
bfc01664:	3442dc03 	ori	v0,v0,0xdc03
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:82
bfc01668:	3c120014 	lui	s2,0x14
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:83
bfc0166c:	3652e124 	ori	s2,s2,0xe124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:84
bfc01670:	241a0003 	li	k0,3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:85
bfc01674:	3c150014 	lui	s5,0x14
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:86
bfc01678:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:87
bfc0167c:	3c07bd86 	lui	a3,0xbd86
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:88
bfc01680:	34e713ac 	ori	a3,a3,0x13ac
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:89
bfc01684:	24084006 	li	t0,16390
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:90
bfc01688:	24094000 	li	t1,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:91
bfc0168c:	ae470000 	sw	a3,0(s2)
	...
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:97
bfc016a4:	3c08ed08 	lui	t0,0xed08
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:98
bfc016a8:	3508dc18 	ori	t0,t0,0xdc18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:99
bfc016ac:	14680022 	bne	v1,t0,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:100
bfc016b0:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:101
bfc016b4:	3c120015 	lui	s2,0x15
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:102
bfc016b8:	3652f124 	ori	s2,s2,0xf124
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:103
bfc016bc:	3c150015 	lui	s5,0x15
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:104
bfc016c0:	36b5e0dc 	ori	s5,s5,0xe0dc
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:105
bfc016c4:	24084000 	li	t0,16384
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:106
bfc016c8:	24094002 	li	t1,16386
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:107
bfc016cc:	241a0003 	li	k0,3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:108
bfc016d0:	8e470000 	lw	a3,0(s2)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:109
bfc016d4:	3c07ed08 	lui	a3,0xed08
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:110
bfc016d8:	34e7dc18 	ori	a3,a3,0xdc18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:111
bfc016dc:	14e30016 	bne	a3,v1,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:112
bfc016e0:	00000000 	nop

bfc016e4 <test_tlbp>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:114
bfc016e4:	3c150011 	lui	s5,0x11
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:115
bfc016e8:	36b5e000 	ori	s5,s5,0xe000
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:116
bfc016ec:	40955000 	mtc0	s5,$10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:117
bfc016f0:	40801000 	mtc0	zero,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:118
bfc016f4:	40801800 	mtc0	zero,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:119
bfc016f8:	42000008 	tlbp
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:120
bfc016fc:	42000001 	tlbr
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:121
bfc01700:	40805000 	mtc0	zero,$10
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:122
bfc01704:	400b1000 	mfc0	t3,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:123
bfc01708:	240c4007 	li	t4,16391
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:124
bfc0170c:	156c000a 	bne	t3,t4,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:125
bfc01710:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:126
bfc01714:	400b1800 	mfc0	t3,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:127
bfc01718:	240c4007 	li	t4,16391
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:128
bfc0171c:	156c0006 	bne	t3,t4,bfc01738 <inst_error>
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:129
bfc01720:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:130
bfc01724:	40801000 	mtc0	zero,$2
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:131
bfc01728:	40801800 	mtc0	zero,$3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:132
bfc0172c:	42000002 	tlbwi
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:133
bfc01730:	00000000 	nop
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:135
bfc01734:	26730001 	addiu	s3,s3,1

bfc01738 <inst_error>:
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:138
bfc01738:	00104e00 	sll	t1,s0,0x18
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:139
bfc0173c:	01334025 	or	t0,t1,s3
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:140
bfc01740:	ae280000 	sw	t0,0(s1)
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:141
bfc01744:	03e00008 	jr	ra
/home/lxb/project-for-linux/loooongson/soft/func_extended/inst/n93_tlbwr.S:142
bfc01748:	00000000 	nop
bfc0174c:	00000000 	nop
bfc01750:	9f3f7f7c 	0x9f3f7f7c
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
  14:	00000a0c 	syscall	0x28
	...
  20:	0000001c 	0x1c
  24:	006b0002 	0x6b0002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc00a10 	0xbfc00a10
  34:	00000114 	0x114
	...
  40:	0000001c 	0x1c
  44:	00e00002 	0xe00002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc00b30 	0xbfc00b30
  54:	0000009c 	0x9c
	...
  60:	0000001c 	0x1c
  64:	015a0002 	0x15a0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc00bd0 	0xbfc00bd0
  74:	00000060 	0x60
	...
  80:	0000001c 	0x1c
  84:	01d70002 	0x1d70002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc00c30 	0xbfc00c30
  94:	00000060 	0x60
	...
  a0:	0000001c 	0x1c
  a4:	024e0002 	0x24e0002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc00c90 	0xbfc00c90
  b4:	00000440 	sll	zero,zero,0x11
	...
  c0:	0000001c 	0x1c
  c4:	02c50002 	0x2c50002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc010d0 	0xbfc010d0
  d4:	000000dc 	0xdc
	...
  e0:	0000001c 	0x1c
  e4:	03390002 	0x3390002
  e8:	00040000 	sll	zero,a0,0x0
  ec:	00000000 	nop
  f0:	bfc011b0 	0xbfc011b0
  f4:	000000c8 	0xc8
	...
 100:	0000001c 	0x1c
 104:	03b00002 	0x3b00002
 108:	00040000 	sll	zero,a0,0x0
 10c:	00000000 	nop
 110:	bfc01280 	0xbfc01280
 114:	00000068 	0x68
	...
 120:	0000001c 	0x1c
 124:	04230002 	bgezl	at,130 <data_size+0x120>
 128:	00040000 	sll	zero,a0,0x0
 12c:	00000000 	nop
 130:	bfc012f0 	0xbfc012f0
 134:	00000064 	0x64
	...
 140:	0000001c 	0x1c
 144:	04980002 	0x4980002
 148:	00040000 	sll	zero,a0,0x0
 14c:	00000000 	nop
 150:	bfc01360 	0xbfc01360
 154:	000001e4 	0x1e4
	...
 160:	0000001c 	0x1c
 164:	050d0002 	0x50d0002
 168:	00040000 	sll	zero,a0,0x0
 16c:	00000000 	nop
 170:	bfc01550 	0xbfc01550
 174:	000001fc 	0x1fc
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00a10 	0xbfc00a10
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00b58 	0xbfc00b58
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00bd0 	0xbfc00bd0
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc00c30 	0xbfc00c30
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc00c90 	0xbfc00c90
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc010d0 	0xbfc010d0
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc011b0 	0xbfc011b0
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc01280 	0xbfc01280
	...
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	bfc012f0 	0xbfc012f0
	...
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f
 120:	bfc01360 	0xbfc01360
	...
 138:	0000001d 	0x1d
 13c:	0000001f 	0x1f
 140:	bfc01550 	0xbfc01550
	...
 158:	0000001d 	0x1d
 15c:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000001e5 	0x1e5
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
 190:	4b4b4b4b 	c2	0x14b4b4b
 194:	4c4b4b4b 	0x4c4b4b4b
 198:	4b4d4b83 	c2	0x14d4b83
 19c:	4b4b4b4b 	c2	0x14b4b4b
 1a0:	4b4b4b4b 	c2	0x14b4b4b
 1a4:	4b4b4b4b 	c2	0x14b4b4b
 1a8:	4b4b4b4b 	c2	0x14b4b4b
 1ac:	834d4b4b 	lb	t5,19275(k0)
 1b0:	4b4b4b4b 	c2	0x14b4b4b
 1b4:	4b4b4c4b 	c2	0x14b4c4b
 1b8:	4b4b4b4b 	c2	0x14b4b4b
 1bc:	4d4b4c4b 	0x4d4b4c4b
 1c0:	834c4b4b 	lb	t4,19275(k0)
 1c4:	4b4c8483 	c2	0x14c8483
 1c8:	4c4b4b4b 	0x4c4b4b4b
 1cc:	4b83834b 	c2	0x183834b
 1d0:	834d4b4d 	lb	t5,19277(k0)
 1d4:	4b4b4b4d 	c2	0x14b4b4d
 1d8:	4b4b4d4d 	c2	0x14b4d4d
 1dc:	4b4b4b4b 	c2	0x14b4b4b
 1e0:	4b4b4b4c 	c2	0x14b4b4c
 1e4:	01000402 	0x1000402
 1e8:	00006a01 	0x6a01
 1ec:	23000200 	addi	zero,t8,512
 1f0:	01000000 	0x1000000
 1f4:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 1f8:	01010100 	0x1010100
 1fc:	00000001 	0x1
 200:	01000001 	0x1000001
 204:	5f386500 	0x5f386500
 208:	5f6c776c 	0x5f6c776c
 20c:	2e72776c 	sltiu	s2,s3,30572
 210:	00000053 	0x53
 214:	05000000 	bltz	t0,218 <data_size+0x208>
 218:	c00a1002 	ll	t2,4098(zero)
 21c:	4b4b19bf 	c2	0x14b19bf
 220:	83504b4b 	lb	s0,19275(k0)
 224:	4b834b83 	c2	0x1834b83
 228:	4b834b83 	c2	0x1834b83
 22c:	4b834b4b 	c2	0x1834b4b
 230:	834b834b 	lb	t3,-31925(k0)
 234:	834b4b4b 	lb	t3,19275(k0)
 238:	4b834b4b 	c2	0x1834b4b
 23c:	4b4b4b83 	c2	0x14b4b83
 240:	834b4b83 	lb	t3,19331(k0)
 244:	4b4b834b 	c2	0x14b834b
 248:	4b834b83 	c2	0x1834b83
 24c:	4b4b4d4f 	c2	0x14b4d4f
 250:	04024b4b 	bltzl	zero,12f80 <data_size+0x12f70>
 254:	5d010100 	0x5d010100
 258:	02000000 	0x2000000
 25c:	00002800 	sll	a1,zero,0x0
 260:	fb010100 	sdc2	$1,256(t8)
 264:	01000d0e 	0x1000d0e
 268:	00010101 	0x10101
 26c:	00010000 	sll	zero,at,0x0
 270:	65000100 	0x65000100
 274:	616d5f36 	0x616d5f36
 278:	64657070 	0x64657070
 27c:	736e695f 	0x736e695f
 280:	532e7274 	beql	t9,t6,1cc54 <data_size+0x1cc44>
 284:	00000000 	nop
 288:	02050000 	0x2050000
 28c:	bfc00b30 	0xbfc00b30
 290:	4c4b4b19 	0x4c4b4b19
 294:	4b4b4b4b 	c2	0x14b4b4b
 298:	4b4b864b 	c2	0x14b864b
 29c:	4b4b4b4c 	c2	0x14b4b4c
 2a0:	4b4b4b83 	c2	0x14b4b83
 2a4:	4b834b4b 	c2	0x1834b4b
 2a8:	834b4b4b 	lb	t3,19275(k0)
 2ac:	4b4b4d4d 	c2	0x14b4d4d
 2b0:	024b4b4b 	0x24b4b4b
 2b4:	01010004 	sllv	zero,at,t0
 2b8:	00000055 	0x55
 2bc:	002b0002 	0x2b0002
 2c0:	01010000 	0x1010000
 2c4:	000d0efb 	0xd0efb
 2c8:	01010101 	0x1010101
 2cc:	01000000 	0x1000000
 2d0:	00010000 	sll	zero,at,0x0
 2d4:	745f3765 	jalx	17cdd94 <data_size+0x17cdd84>
 2d8:	645f626c 	0x645f626c
 2dc:	6c62756f 	0x6c62756f
 2e0:	696d5f65 	0x696d5f65
 2e4:	532e7373 	beql	t9,t6,1d0b4 <data_size+0x1d0a4>
 2e8:	00000000 	nop
 2ec:	02050000 	0x2050000
 2f0:	bfc00bd0 	0xbfc00bd0
 2f4:	4b4c4b18 	c2	0x14c4b18
 2f8:	4b4b4b4b 	c2	0x14b4b4b
 2fc:	4b4b4b4b 	c2	0x14b4b4b
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	4d4c4b4b 	0x4d4c4b4b
 308:	4b4b4b4b 	c2	0x14b4b4b
 30c:	01000402 	0x1000402
 310:	00004e01 	0x4e01
 314:	25000200 	addiu	zero,t0,512
 318:	01000000 	0x1000000
 31c:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 320:	01010100 	0x1010100
 324:	00000001 	0x1
 328:	01000001 	0x1000001
 32c:	5f356500 	0x5f356500
 330:	7a766f6d 	0x7a766f6d
 334:	766f6d5f 	jalx	9bdb57c <data_size+0x9bdb56c>
 338:	00532e6e 	0x532e6e
 33c:	00000000 	nop
 340:	30020500 	andi	v0,zero,0x500
 344:	19bfc00c 	0x19bfc00c
 348:	4b4b4b4b 	c2	0x14b4b4b
 34c:	4b4b4b50 	c2	0x14b4b50
 350:	4b4b4b4b 	c2	0x14b4b4b
 354:	4b834b4b 	c2	0x1834b4b
 358:	4b4b4d4f 	c2	0x14b4d4f
 35c:	04024b4b 	bltzl	zero,1308c <data_size+0x1307c>
 360:	90010100 	lbu	at,256(zero)
 364:	02000000 	0x2000000
 368:	00002500 	sll	a0,zero,0x14
 36c:	fb010100 	sdc2	$1,256(t8)
 370:	01000d0e 	0x1000d0e
 374:	00010101 	0x10101
 378:	00010000 	sll	zero,at,0x0
 37c:	65000100 	0x65000100
 380:	72745f31 	0x72745f31
 384:	745f7061 	jalx	17dc184 <data_size+0x17dc174>
 388:	2e747365 	sltiu	s4,s3,29541
 38c:	00000053 	0x53
 390:	05000000 	bltz	t0,394 <data_size+0x384>
 394:	c00c9002 	ll	t4,-28670(zero)
 398:	4b4b19bf 	c2	0x14b19bf
 39c:	084d4b4b 	j	1352d2c <data_size+0x1352d1c>
 3a0:	f33d083d 	0xf33d083d
 3a4:	083d08f3 	j	f423cc <data_size+0xf423bc>
 3a8:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 3ac:	f33d083d 	0xf33d083d
 3b0:	083d08f3 	j	f423cc <data_size+0xf423bc>
 3b4:	08f3f33d 	j	3cfccf4 <data_size+0x3cfcce4>
 3b8:	f33d083d 	0xf33d083d
 3bc:	083d08f3 	j	f423cc <data_size+0xf423bc>
 3c0:	08f4f33d 	j	3d3ccf4 <data_size+0x3d3cce4>
 3c4:	08e508e5 	j	3942394 <data_size+0x3942384>
 3c8:	08e508e5 	j	3942394 <data_size+0x3942384>
 3cc:	08e508e5 	j	3942394 <data_size+0x3942384>
 3d0:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3d4:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3d8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3dc:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3e0:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3e4:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3e8:	08ad08ad 	j	2b422b4 <data_size+0x2b422a4>
 3ec:	4b4b4db0 	c2	0x14b4db0
 3f0:	04024b4b 	bltzl	zero,13120 <data_size+0x13110>
 3f4:	6b010100 	0x6b010100
 3f8:	02000000 	0x2000000
 3fc:	00002200 	sll	a0,zero,0x8
 400:	fb010100 	sdc2	$1,256(t8)
 404:	01000d0e 	0x1000d0e
 408:	00010101 	0x10101
 40c:	00010000 	sll	zero,at,0x0
 410:	6e000100 	0x6e000100
 414:	745f3239 	jalx	17cc8e4 <data_size+0x17cc8d4>
 418:	6977626c 	0x6977626c
 41c:	0000532e 	0x532e
 420:	00000000 	nop
 424:	10d00205 	beq	a2,s0,c3c <data_size+0xc2c>
 428:	4b1abfc0 	c2	0x11abfc0
 42c:	4b4c4b4c 	c2	0x14c4b4c
 430:	4b4b4b4b 	c2	0x14b4b4b
 434:	4b4b4b4b 	c2	0x14b4b4b
 438:	4b4b4b4b 	c2	0x14b4b4b
 43c:	4b4b4b4b 	c2	0x14b4b4b
 440:	4b4b4b4b 	c2	0x14b4b4b
 444:	4b4b4b4b 	c2	0x14b4b4b
 448:	4b4b4b4b 	c2	0x14b4b4b
 44c:	4b4b4c4b 	c2	0x14b4c4b
 450:	4b4b4b4b 	c2	0x14b4b4b
 454:	4b4b4b4b 	c2	0x14b4b4b
 458:	4c4b4b4b 	0x4c4b4b4b
 45c:	4b4b4b4d 	c2	0x14b4b4d
 460:	0004024b 	0x4024b
 464:	00690101 	0x690101
 468:	00020000 	sll	zero,v0,0x0
 46c:	00000025 	move	zero,zero
 470:	0efb0101 	jal	bec0404 <data_size+0xbec03f4>
 474:	0101000d 	break	0x101
 478:	00000101 	0x101
 47c:	00000100 	sll	zero,zero,0x4
 480:	33650001 	andi	a1,k1,0x1
 484:	64616d5f 	0x64616d5f
 488:	736d5f64 	0x736d5f64
 48c:	532e6275 	beql	t9,t6,18e64 <data_size+0x18e54>
 490:	00000000 	nop
 494:	02050000 	0x2050000
 498:	bfc011b0 	0xbfc011b0
 49c:	4b4b4b19 	c2	0x14b4b19
 4a0:	4b4b4d4b 	c2	0x14b4d4b
 4a4:	4b4b4b4b 	c2	0x14b4b4b
 4a8:	4b4b4b4b 	c2	0x14b4b4b
 4ac:	4b4b4b4b 	c2	0x14b4b4b
 4b0:	4b4b4b4b 	c2	0x14b4b4b
 4b4:	4b4b4b4b 	c2	0x14b4b4b
 4b8:	4b4b4b4b 	c2	0x14b4b4b
 4bc:	4b4b4b4b 	c2	0x14b4b4b
 4c0:	4b4b4b4b 	c2	0x14b4b4b
 4c4:	4b4b4b4b 	c2	0x14b4b4b
 4c8:	4b4b4d4e 	c2	0x14b4d4e
 4cc:	04024b4b 	bltzl	zero,131fc <data_size+0x131ec>
 4d0:	4c010100 	0x4c010100
 4d4:	02000000 	0x2000000
 4d8:	00002100 	sll	a0,zero,0x4
 4dc:	fb010100 	sdc2	$1,256(t8)
 4e0:	01000d0e 	0x1000d0e
 4e4:	00010101 	0x10101
 4e8:	00010000 	sll	zero,at,0x0
 4ec:	65000100 	0x65000100
 4f0:	6c6c5f34 	0x6c6c5f34
 4f4:	2e63735f 	sltiu	v1,s3,29535
 4f8:	00000053 	0x53
 4fc:	05000000 	bltz	t0,500 <data_size+0x4f0>
 500:	c0128002 	ll	s2,-32766(zero)
 504:	4b4b19bf 	c2	0x14b19bf
 508:	83504b4b 	lb	s0,19275(k0)
 50c:	4b4b4b4b 	c2	0x14b4b4b
 510:	4b4b4b4c 	c2	0x14b4b4c
 514:	4b4b4b4c 	c2	0x14b4b4c
 518:	4b4b4d4f 	c2	0x14b4d4f
 51c:	04024b4b 	bltzl	zero,1324c <data_size+0x1323c>
 520:	4c010100 	0x4c010100
 524:	02000000 	0x2000000
 528:	00002300 	sll	a0,zero,0xc
 52c:	fb010100 	sdc2	$1,256(t8)
 530:	01000d0e 	0x1000d0e
 534:	00010101 	0x10101
 538:	00010000 	sll	zero,at,0x0
 53c:	65000100 	0x65000100
 540:	6c635f32 	0x6c635f32
 544:	6c635f6f 	0x6c635f6f
 548:	00532e7a 	0x532e7a
 54c:	00000000 	nop
 550:	f0020500 	0xf0020500
 554:	19bfc012 	0x19bfc012
 558:	4b4b4b4b 	c2	0x14b4b4b
 55c:	4b4b834d 	c2	0x14b834d
 560:	834b4b4b 	lb	t3,19275(k0)
 564:	4b4b4b4b 	c2	0x14b4b4b
 568:	4b4b4d4e 	c2	0x14b4d4e
 56c:	04024b4b 	bltzl	zero,1329c <data_size+0x1328c>
 570:	92010100 	lbu	at,256(s0)
 574:	02000000 	0x2000000
 578:	00002300 	sll	a0,zero,0xc
 57c:	fb010100 	sdc2	$1,256(t8)
 580:	01000d0e 	0x1000d0e
 584:	00010101 	0x10101
 588:	00010000 	sll	zero,at,0x0
 58c:	65000100 	0x65000100
 590:	77735f39 	jalx	dcd7ce4 <data_size+0xdcd7cd4>
 594:	77735f6c 	jalx	dcd7db0 <data_size+0xdcd7da0>
 598:	00532e72 	tlt	v0,s3,0xb9
 59c:	00000000 	nop
 5a0:	60020500 	0x60020500
 5a4:	19bfc013 	0x19bfc013
 5a8:	4b4b4b4b 	c2	0x14b4b4b
 5ac:	83838350 	lb	v1,-31920(gp)
 5b0:	834b834b 	lb	t3,-31925(k0)
 5b4:	4b834b4b 	c2	0x1834b4b
 5b8:	834b834b 	lb	t3,-31925(k0)
 5bc:	834b4b4b 	lb	t3,19275(k0)
 5c0:	4b834b4b 	c2	0x1834b4b
 5c4:	4b4b4b83 	c2	0x14b4b83
 5c8:	834b4b83 	lb	t3,19331(k0)
 5cc:	4b4b834b 	c2	0x14b834b
 5d0:	4b834b4b 	c2	0x1834b4b
 5d4:	834d4b4b 	lb	t5,19275(k0)
 5d8:	834b834b 	lb	t3,-31925(k0)
 5dc:	4b834b4b 	c2	0x1834b4b
 5e0:	834b834b 	lb	t3,-31925(k0)
 5e4:	834b4b4b 	lb	t3,19275(k0)
 5e8:	4b834b4b 	c2	0x1834b4b
 5ec:	4b4b4b83 	c2	0x14b4b83
 5f0:	834b4b83 	lb	t3,19331(k0)
 5f4:	4b4b834b 	c2	0x14b834b
 5f8:	4b834b4b 	c2	0x1834b4b
 5fc:	4d504b4b 	0x4d504b4b
 600:	4b4b4b4b 	c2	0x14b4b4b
 604:	01000402 	0x1000402
 608:	0000b201 	0xb201
 60c:	22000200 	addi	zero,s0,512
 610:	01000000 	0x1000000
 614:	0d0efb01 	jal	43bec04 <data_size+0x43bebf4>
 618:	01010100 	0x1010100
 61c:	00000001 	0x1
 620:	01000001 	0x1000001
 624:	33396e00 	andi	t9,t9,0x6e00
 628:	626c745f 	0x626c745f
 62c:	532e7277 	beql	t9,t6,1d00c <data_size+0x1cffc>
 630:	00000000 	nop
 634:	02050000 	0x2050000
 638:	bfc01550 	0xbfc01550
 63c:	4b4d4b1a 	c2	0x14d4b1a
 640:	4b4b4b4b 	c2	0x14b4b4b
 644:	4b4b4b4b 	c2	0x14b4b4b
 648:	4b4b4b4b 	c2	0x14b4b4b
 64c:	4b4b4b4b 	c2	0x14b4b4b
 650:	4b4b4b4b 	c2	0x14b4b4b
 654:	4b4b4b4b 	c2	0x14b4b4b
 658:	834b4b4b 	lb	t3,19275(k0)
 65c:	4b4c4b4b 	c2	0x14c4b4b
 660:	4b4b4b4b 	c2	0x14b4b4b
 664:	4b4b4b4b 	c2	0x14b4b4b
 668:	4b4b4b4b 	c2	0x14b4b4b
 66c:	4b4b4b4b 	c2	0x14b4b4b
 670:	4b4b4b4b 	c2	0x14b4b4b
 674:	4b4b4b4b 	c2	0x14b4b4b
 678:	4b4b4b4b 	c2	0x14b4b4b
 67c:	4c4b4b4b 	0x4c4b4b4b
 680:	4b4b4b4b 	c2	0x14b4b4b
 684:	4b4b4b4b 	c2	0x14b4b4b
 688:	4b4b4b4b 	c2	0x14b4b4b
 68c:	4b4b4b4b 	c2	0x14b4b4b
 690:	4b4b4b4b 	c2	0x14b4b4b
 694:	4b4b4b4b 	c2	0x14b4b4b
 698:	4b4b4b4b 	c2	0x14b4b4b
 69c:	4b4b4b4b 	c2	0x14b4b4b
 6a0:	4b4b4b4c 	c2	0x14b4b4c
 6a4:	4b4b4b4b 	c2	0x14b4b4b
 6a8:	4b4b4b4b 	c2	0x14b4b4b
 6ac:	4b4b4b4b 	c2	0x14b4b4b
 6b0:	4b4b4b4b 	c2	0x14b4b4b
 6b4:	4b4b4d4c 	c2	0x14b4d4c
 6b8:	04024b4b 	bltzl	zero,133e8 <data_size+0x133d8>
 6bc:	Address 0x00000000000006bc is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000067 	0x67
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc00a0c 	0xbfc00a0c
  18:	72617473 	0x72617473
  1c:	00532e74 	teq	v0,s3,0xb9
  20:	6d6f682f 	0x6d6f682f
  24:	786c2f65 	0x786c2f65
  28:	72702f62 	0x72702f62
  2c:	63656a6f 	0x63656a6f
  30:	6f662d74 	0x6f662d74
  34:	696c2d72 	0x696c2d72
  38:	2f78756e 	sltiu	t8,k1,30062
  3c:	6f6f6f6c 	0x6f6f6f6c
  40:	73676e6f 	0x73676e6f
  44:	732f6e6f 	0x732f6e6f
  48:	2f74666f 	sltiu	s4,k1,26223
  4c:	636e7566 	0x636e7566
  50:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
  54:	65646e65 	0x65646e65
  58:	4e470064 	c3	0x470064
  5c:	53412055 	beql	k0,at,81b4 <data_size+0x81a4>
  60:	312e3220 	andi	t6,t1,0x3220
  64:	30352e38 	andi	s5,at,0x2e38
  68:	71800100 	0x71800100
  6c:	02000000 	0x2000000
  70:	00001400 	sll	v0,zero,0x10
  74:	e9010400 	swc2	$1,1024(t0)
  78:	10000001 	b	80 <data_size+0x70>
  7c:	24bfc00a 	addiu	ra,a1,-16374
  80:	65bfc00b 	0x65bfc00b
  84:	776c5f38 	jalx	db17ce0 <data_size+0xdb17cd0>
  88:	776c5f6c 	jalx	db17db0 <data_size+0xdb17da0>
  8c:	00532e72 	tlt	v0,s3,0xb9
  90:	6d6f682f 	0x6d6f682f
  94:	786c2f65 	0x786c2f65
  98:	72702f62 	0x72702f62
  9c:	63656a6f 	0x63656a6f
  a0:	6f662d74 	0x6f662d74
  a4:	696c2d72 	0x696c2d72
  a8:	2f78756e 	sltiu	t8,k1,30062
  ac:	6f6f6f6c 	0x6f6f6f6c
  b0:	73676e6f 	0x73676e6f
  b4:	732f6e6f 	0x732f6e6f
  b8:	2f74666f 	sltiu	s4,k1,26223
  bc:	636e7566 	0x636e7566
  c0:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
  c4:	65646e65 	0x65646e65
  c8:	6e692f64 	0x6e692f64
  cc:	47007473 	c1	0x1007473
  d0:	4120554e 	0x4120554e
  d4:	2e322053 	sltiu	s2,s1,8275
  d8:	352e3831 	ori	t6,t1,0x3831
  dc:	80010030 	lb	at,48(zero)
  e0:	00000076 	tne	zero,zero,0x1
  e4:	00280002 	0x280002
  e8:	01040000 	0x1040000
  ec:	00000257 	0x257
  f0:	bfc00b30 	0xbfc00b30
  f4:	bfc00bcc 	0xbfc00bcc
  f8:	6d5f3665 	0x6d5f3665
  fc:	65707061 	0x65707061
 100:	6e695f64 	0x6e695f64
 104:	2e727473 	sltiu	s2,s3,29811
 108:	682f0053 	0x682f0053
 10c:	2f656d6f 	sltiu	a1,k1,28015
 110:	2f62786c 	sltiu	v0,k1,30828
 114:	6a6f7270 	0x6a6f7270
 118:	2d746365 	sltiu	s4,t3,25445
 11c:	2d726f66 	sltiu	s2,t3,28518
 120:	756e696c 	jalx	5b9a5b0 <data_size+0x5b9a5a0>
 124:	6f6c2f78 	0x6f6c2f78
 128:	6e6f6f6f 	0x6e6f6f6f
 12c:	6e6f7367 	0x6e6f7367
 130:	666f732f 	0x666f732f
 134:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 138:	655f636e 	0x655f636e
 13c:	6e657478 	0x6e657478
 140:	2f646564 	sltiu	a0,k1,25956
 144:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 148:	554e4700 	bnel	t2,t6,11d4c <data_size+0x11d3c>
 14c:	20534120 	addi	s3,v0,16672
 150:	38312e32 	xori	s1,at,0x2e32
 154:	0030352e 	0x30352e
 158:	00798001 	0x798001
 15c:	00020000 	sll	zero,v0,0x0
 160:	0000003c 	0x3c
 164:	02b80104 	0x2b80104
 168:	0bd00000 	j	f400000 <data_size+0xf3ffff0>
 16c:	0c30bfc0 	jal	c2ff00 <data_size+0xc2fef0>
 170:	3765bfc0 	ori	a1,k1,0xbfc0
 174:	626c745f 	0x626c745f
 178:	756f645f 	jalx	5bd917c <data_size+0x5bd916c>
 17c:	5f656c62 	0x5f656c62
 180:	7373696d 	0x7373696d
 184:	2f00532e 	sltiu	zero,t8,21294
 188:	656d6f68 	0x656d6f68
 18c:	62786c2f 	0x62786c2f
 190:	6f72702f 	0x6f72702f
 194:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 198:	726f662d 	0x726f662d
 19c:	6e696c2d 	0x6e696c2d
 1a0:	6c2f7875 	0x6c2f7875
 1a4:	6f6f6f6f 	0x6f6f6f6f
 1a8:	6f73676e 	0x6f73676e
 1ac:	6f732f6e 	0x6f732f6e
 1b0:	662f7466 	0x662f7466
 1b4:	5f636e75 	0x5f636e75
 1b8:	65747865 	0x65747865
 1bc:	6465646e 	0x6465646e
 1c0:	736e692f 	0x736e692f
 1c4:	4e470074 	c3	0x470074
 1c8:	53412055 	beql	k0,at,8320 <data_size+0x8310>
 1cc:	312e3220 	andi	t6,t1,0x3220
 1d0:	30352e38 	andi	s5,at,0x2e38
 1d4:	73800100 	0x73800100
 1d8:	02000000 	0x2000000
 1dc:	00005000 	sll	t2,zero,0x0
 1e0:	11010400 	beq	t0,at,11e4 <data_size+0x11d4>
 1e4:	30000003 	andi	zero,zero,0x3
 1e8:	90bfc00c 	lbu	ra,-16372(a1)
 1ec:	65bfc00c 	0x65bfc00c
 1f0:	6f6d5f35 	0x6f6d5f35
 1f4:	6d5f7a76 	0x6d5f7a76
 1f8:	2e6e766f 	sltiu	t6,s3,30319
 1fc:	682f0053 	0x682f0053
 200:	2f656d6f 	sltiu	a1,k1,28015
 204:	2f62786c 	sltiu	v0,k1,30828
 208:	6a6f7270 	0x6a6f7270
 20c:	2d746365 	sltiu	s4,t3,25445
 210:	2d726f66 	sltiu	s2,t3,28518
 214:	756e696c 	jalx	5b9a5b0 <data_size+0x5b9a5a0>
 218:	6f6c2f78 	0x6f6c2f78
 21c:	6e6f6f6f 	0x6e6f6f6f
 220:	6e6f7367 	0x6e6f7367
 224:	666f732f 	0x666f732f
 228:	75662f74 	jalx	598bdd0 <data_size+0x598bdc0>
 22c:	655f636e 	0x655f636e
 230:	6e657478 	0x6e657478
 234:	2f646564 	sltiu	a0,k1,25956
 238:	74736e69 	jalx	1cdb9a4 <data_size+0x1cdb994>
 23c:	554e4700 	bnel	t2,t6,11e40 <data_size+0x11e30>
 240:	20534120 	addi	s3,v0,16672
 244:	38312e32 	xori	s1,at,0x2e32
 248:	0030352e 	0x30352e
 24c:	00738001 	0x738001
 250:	00020000 	sll	zero,v0,0x0
 254:	00000064 	0x64
 258:	03630104 	0x3630104
 25c:	0c900000 	jal	2400000 <data_size+0x23ffff0>
 260:	10d0bfc0 	beq	a2,s0,ffff0164 <_etext+0x403ee9fc>
 264:	3165bfc0 	andi	a1,t3,0xbfc0
 268:	6172745f 	0x6172745f
 26c:	65745f70 	0x65745f70
 270:	532e7473 	beql	t9,t6,1d440 <data_size+0x1d430>
 274:	6f682f00 	0x6f682f00
 278:	6c2f656d 	0x6c2f656d
 27c:	702f6278 	0x702f6278
 280:	656a6f72 	0x656a6f72
 284:	662d7463 	0x662d7463
 288:	6c2d726f 	0x6c2d726f
 28c:	78756e69 	0x78756e69
 290:	6f6f6c2f 	0x6f6f6c2f
 294:	676e6f6f 	0x676e6f6f
 298:	2f6e6f73 	sltiu	t6,k1,28531
 29c:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 2a0:	6e75662f 	0x6e75662f
 2a4:	78655f63 	0x78655f63
 2a8:	646e6574 	0x646e6574
 2ac:	692f6465 	0x692f6465
 2b0:	0074736e 	0x74736e
 2b4:	20554e47 	addi	s5,v0,20039
 2b8:	32205341 	andi	zero,s1,0x5341
 2bc:	2e38312e 	sltiu	t8,s1,12590
 2c0:	01003035 	0x1003035
 2c4:	00007080 	sll	t6,zero,0x2
 2c8:	78000200 	0x78000200
 2cc:	04000000 	bltz	zero,2d0 <data_size+0x2c0>
 2d0:	0003f701 	0x3f701
 2d4:	c010d000 	ll	s0,-12288(zero)
 2d8:	c011acbf 	ll	s1,-21313(zero)
 2dc:	32396ebf 	andi	t9,s1,0x6ebf
 2e0:	626c745f 	0x626c745f
 2e4:	532e6977 	beql	t9,t6,1a8c4 <data_size+0x1a8b4>
 2e8:	6f682f00 	0x6f682f00
 2ec:	6c2f656d 	0x6c2f656d
 2f0:	702f6278 	0x702f6278
 2f4:	656a6f72 	0x656a6f72
 2f8:	662d7463 	0x662d7463
 2fc:	6c2d726f 	0x6c2d726f
 300:	78756e69 	0x78756e69
 304:	6f6f6c2f 	0x6f6f6c2f
 308:	676e6f6f 	0x676e6f6f
 30c:	2f6e6f73 	sltiu	t6,k1,28531
 310:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 314:	6e75662f 	0x6e75662f
 318:	78655f63 	0x78655f63
 31c:	646e6574 	0x646e6574
 320:	692f6465 	0x692f6465
 324:	0074736e 	0x74736e
 328:	20554e47 	addi	s5,v0,20039
 32c:	32205341 	andi	zero,s1,0x5341
 330:	2e38312e 	sltiu	t8,s1,12590
 334:	01003035 	0x1003035
 338:	00007380 	sll	t6,zero,0xe
 33c:	8c000200 	lw	zero,512(zero)
 340:	04000000 	bltz	zero,344 <data_size+0x334>
 344:	00046601 	0x46601
 348:	c011b000 	ll	s1,-20480(zero)
 34c:	c01278bf 	ll	s2,30911(zero)
 350:	5f3365bf 	0x5f3365bf
 354:	6464616d 	0x6464616d
 358:	75736d5f 	jalx	5cdb57c <data_size+0x5cdb56c>
 35c:	00532e62 	0x532e62
 360:	6d6f682f 	0x6d6f682f
 364:	786c2f65 	0x786c2f65
 368:	72702f62 	0x72702f62
 36c:	63656a6f 	0x63656a6f
 370:	6f662d74 	0x6f662d74
 374:	696c2d72 	0x696c2d72
 378:	2f78756e 	sltiu	t8,k1,30062
 37c:	6f6f6f6c 	0x6f6f6f6c
 380:	73676e6f 	0x73676e6f
 384:	732f6e6f 	0x732f6e6f
 388:	2f74666f 	sltiu	s4,k1,26223
 38c:	636e7566 	0x636e7566
 390:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 394:	65646e65 	0x65646e65
 398:	6e692f64 	0x6e692f64
 39c:	47007473 	c1	0x1007473
 3a0:	4120554e 	0x4120554e
 3a4:	2e322053 	sltiu	s2,s1,8275
 3a8:	352e3831 	ori	t6,t1,0x3831
 3ac:	80010030 	lb	at,48(zero)
 3b0:	0000006f 	0x6f
 3b4:	00a00002 	0xa00002
 3b8:	01040000 	0x1040000
 3bc:	000004d3 	0x4d3
 3c0:	bfc01280 	0xbfc01280
 3c4:	bfc012e8 	0xbfc012e8
 3c8:	6c5f3465 	0x6c5f3465
 3cc:	63735f6c 	0x63735f6c
 3d0:	2f00532e 	sltiu	zero,t8,21294
 3d4:	656d6f68 	0x656d6f68
 3d8:	62786c2f 	0x62786c2f
 3dc:	6f72702f 	0x6f72702f
 3e0:	7463656a 	jalx	18d95a8 <data_size+0x18d9598>
 3e4:	726f662d 	0x726f662d
 3e8:	6e696c2d 	0x6e696c2d
 3ec:	6c2f7875 	0x6c2f7875
 3f0:	6f6f6f6f 	0x6f6f6f6f
 3f4:	6f73676e 	0x6f73676e
 3f8:	6f732f6e 	0x6f732f6e
 3fc:	662f7466 	0x662f7466
 400:	5f636e75 	0x5f636e75
 404:	65747865 	0x65747865
 408:	6465646e 	0x6465646e
 40c:	736e692f 	0x736e692f
 410:	4e470074 	c3	0x470074
 414:	53412055 	beql	k0,at,856c <data_size+0x855c>
 418:	312e3220 	andi	t6,t1,0x3220
 41c:	30352e38 	andi	s5,at,0x2e38
 420:	71800100 	0x71800100
 424:	02000000 	0x2000000
 428:	0000b400 	sll	s6,zero,0x10
 42c:	23010400 	addi	at,t8,1024
 430:	f0000005 	0xf0000005
 434:	54bfc012 	bnel	a1,ra,ffff0480 <_etext+0x403eed18>
 438:	65bfc013 	0x65bfc013
 43c:	6c635f32 	0x6c635f32
 440:	6c635f6f 	0x6c635f6f
 444:	00532e7a 	0x532e7a
 448:	6d6f682f 	0x6d6f682f
 44c:	786c2f65 	0x786c2f65
 450:	72702f62 	0x72702f62
 454:	63656a6f 	0x63656a6f
 458:	6f662d74 	0x6f662d74
 45c:	696c2d72 	0x696c2d72
 460:	2f78756e 	sltiu	t8,k1,30062
 464:	6f6f6f6c 	0x6f6f6f6c
 468:	73676e6f 	0x73676e6f
 46c:	732f6e6f 	0x732f6e6f
 470:	2f74666f 	sltiu	s4,k1,26223
 474:	636e7566 	0x636e7566
 478:	7478655f 	jalx	1e1957c <data_size+0x1e1956c>
 47c:	65646e65 	0x65646e65
 480:	6e692f64 	0x6e692f64
 484:	47007473 	c1	0x1007473
 488:	4120554e 	0x4120554e
 48c:	2e322053 	sltiu	s2,s1,8275
 490:	352e3831 	ori	t6,t1,0x3831
 494:	80010030 	lb	at,48(zero)
 498:	00000071 	tgeu	zero,zero,0x1
 49c:	00c80002 	0xc80002
 4a0:	01040000 	0x1040000
 4a4:	00000573 	tltu	zero,zero,0x15
 4a8:	bfc01360 	0xbfc01360
 4ac:	bfc01544 	0xbfc01544
 4b0:	735f3965 	0x735f3965
 4b4:	735f6c77 	0x735f6c77
 4b8:	532e7277 	beql	t9,t6,1ce98 <data_size+0x1ce88>
 4bc:	6f682f00 	0x6f682f00
 4c0:	6c2f656d 	0x6c2f656d
 4c4:	702f6278 	0x702f6278
 4c8:	656a6f72 	0x656a6f72
 4cc:	662d7463 	0x662d7463
 4d0:	6c2d726f 	0x6c2d726f
 4d4:	78756e69 	0x78756e69
 4d8:	6f6f6c2f 	0x6f6f6c2f
 4dc:	676e6f6f 	0x676e6f6f
 4e0:	2f6e6f73 	sltiu	t6,k1,28531
 4e4:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 4e8:	6e75662f 	0x6e75662f
 4ec:	78655f63 	0x78655f63
 4f0:	646e6574 	0x646e6574
 4f4:	692f6465 	0x692f6465
 4f8:	0074736e 	0x74736e
 4fc:	20554e47 	addi	s5,v0,20039
 500:	32205341 	andi	zero,s1,0x5341
 504:	2e38312e 	sltiu	t8,s1,12590
 508:	01003035 	0x1003035
 50c:	00007080 	sll	t6,zero,0x2
 510:	dc000200 	ldc3	$0,512(zero)
 514:	04000000 	bltz	zero,518 <data_size+0x508>
 518:	00060901 	0x60901
 51c:	c0155000 	ll	s5,20480(zero)
 520:	c0174cbf 	ll	s7,19647(zero)
 524:	33396ebf 	andi	t9,t9,0x6ebf
 528:	626c745f 	0x626c745f
 52c:	532e7277 	beql	t9,t6,1cf0c <data_size+0x1cefc>
 530:	6f682f00 	0x6f682f00
 534:	6c2f656d 	0x6c2f656d
 538:	702f6278 	0x702f6278
 53c:	656a6f72 	0x656a6f72
 540:	662d7463 	0x662d7463
 544:	6c2d726f 	0x6c2d726f
 548:	78756e69 	0x78756e69
 54c:	6f6f6c2f 	0x6f6f6c2f
 550:	676e6f6f 	0x676e6f6f
 554:	2f6e6f73 	sltiu	t6,k1,28531
 558:	74666f73 	jalx	199bdcc <data_size+0x199bdbc>
 55c:	6e75662f 	0x6e75662f
 560:	78655f63 	0x78655f63
 564:	646e6574 	0x646e6574
 568:	692f6465 	0x692f6465
 56c:	0074736e 	0x74736e
 570:	20554e47 	addi	s5,v0,20039
 574:	32205341 	andi	zero,s1,0x5341
 578:	2e38312e 	sltiu	t8,s1,12590
 57c:	01003035 	0x1003035
 580:	Address 0x0000000000000580 is out of bounds.


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
  c8:	10001101 	b	44d0 <data_size+0x44c0>
  cc:	12011106 	beq	s0,at,44e8 <data_size+0x44d8>
  d0:	1b080301 	0x1b080301
  d4:	13082508 	beq	t8,t0,94f8 <data_size+0x94e8>
  d8:	00000005 	0x5
  dc:	10001101 	b	44e4 <data_size+0x44d4>
  e0:	12011106 	beq	s0,at,44fc <data_size+0x44ec>
  e4:	1b080301 	0x1b080301
  e8:	13082508 	beq	t8,t0,950c <data_size+0x94fc>
  ec:	00000005 	0x5
