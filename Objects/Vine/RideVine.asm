; ---------------------------------------------------------------------------
; Object GHZ RideVine.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_AIZRideVine:
		movea.l	a0,a1
		move.l	#loc_21D28,(a1)
		bsr.w	sub_21D00
		move.b	#$21,$22(a1)
		move.w	$10(a0),d2
		move.w	$14(a0),d3
		moveq	#0,d1
		move.b	$2C(a0),d1
		andi.w	#$7F,d1
		lsl.w	#4,d1
		add.w	d2,d1
		move.w	d1,$46(a0)
		moveq	#3,d1
		addq.w	#1,d1
		jsr	(Create_New_Sprite3).l
		bne.s	loc_21CFE
		move.w	a1,$3E(a0)
		move.l	#loc_21F80,(a1)
		move.w	a0,$3C(a1)
		bra.s	loc_21CD0
; ---------------------------------------------------------------------------

loc_21CB8:
		jsr	(Create_New_Sprite3).l
		bne.s	loc_21CFE
		move.l	#loc_22014,(a1)
		move.w	a2,$3C(a1)
		move.w	a1,$3E(a2)

loc_21CD0:
		movea.l	a1,a2
		bsr.s	sub_21D00
		move.w	d2,$10(a1)
		move.w	d3,$14(a1)
		addi.w	#$10,d3
		addq.w	#1,$36(a0)
		move.w	$36(a0),$36(a1)
		dbf	d1,loc_21CB8
		move.l	#Obj_AIZRideVineHandle,(a1)
		move.b	#$20,$22(a1)
		move.w	a1,$40(a0)

loc_21CFE:
		bra.s	loc_21D28

; =============== S U B R O U T I N E =======================================

sub_21D00:
		move.b	#4,4(a1)
		move.b	#8,7(a1)
		move.b	#8,6(a1)
		move.w	#$200,8(a1)
		move.l	#Map_AIZMHZRideVine,$C(a1)
		move.w	#$451,$A(a1)
		rts
; End of function sub_21D00
; ---------------------------------------------------------------------------

loc_21D28:
		movea.w	$40(a0),a1
		tst.w	$32(a1)
		beq.s	loc_21D48
		move.l	#loc_21D4C,(a0)
		movea.w	$3E(a0),a1
		move.w	#1,$2E(a1)
		move.w	#0,$38(a1)

loc_21D48:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21D4C:
		addi.l	#$80000,$10(a0)
		addi.l	#$20000,$14(a0)
		move.w	$10(a0),d0
		cmp.w	$46(a0),d0
		blo.w	loc_21DEE
		move.l	#loc_21E14,(a0)
		movea.w	$3E(a0),a1
		move.l	#loc_21FE8,(a1)
		move.w	#0,$3A(a1)
		movea.w	$40(a0),a1
		move.w	#1,$30(a1)
		move.w	#0,$26(a0)
		move.w	#$400,$3A(a0)

loc_21DEE:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21E14:
		movea.w	$40(a0),a1
		move.w	$3A(a0),d0
		move.b	$26(a0),d1
		ext.w	d1
		bpl.s	loc_21E26
		neg.w	d1

loc_21E26:
		add.w	d1,d1
		sub.w	d1,d0
		sub.w	d0,$26(a0)
		tst.w	$32(a1)
		bne.s	loc_21E68
		move.b	$26(a0),d0
		addq.b	#8,d0
		cmpi.b	#$10,d0
		bhs.s	loc_21E68
		move.l	#loc_21E6C,(a0)
		move.w	#0,$42(a0)
		move.w	#$FD00,$44(a0)
		move.w	#$1000,$38(a0)
		move.w	#0,$2E(a0)
		movea.w	$40(a0),a1
		move.w	#2,$30(a1)

loc_21E68:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21E6C:
		moveq	#0,d2
		move.b	$38(a0),d2
		move.w	$44(a0),d0
		move.w	#0,d1
		tst.w	$2E(a0)
		bne.s	loc_21EC4
		add.w	d2,d0
		move.w	d0,$44(a0)
		add.w	d0,$42(a0)
		cmp.b	$42(a0),d1
		bgt.s	loc_21EEE
		asr.w	#4,d0
		sub.w	d0,$44(a0)
		move.w	#1,$2E(a0)
		cmpi.w	#$C00,$38(a0)
		beq.s	loc_21EAC
		subi.w	#$40,$38(a0)
		bra.s	loc_21EEE
; ---------------------------------------------------------------------------

loc_21EAC:
		move.l	#loc_21F0A,(a0)
		move.w	#0,$38(a0)
		movea.w	$40(a0),a1
		move.w	#0,$30(a1)
		bra.s	loc_21EEE
; ---------------------------------------------------------------------------

loc_21EC4:
		sub.w	d2,d0
		move.w	d0,$44(a0)
		add.w	d0,$42(a0)
		cmp.b	$42(a0),d1
		ble.s	loc_21EEE
		asr.w	#4,d0
		sub.w	d0,$44(a0)
		move.w	#0,$2E(a0)
		cmpi.w	#$C00,$38(a0)
		beq.s	loc_21EAC
		subi.w	#$40,$38(a0)

loc_21EEE:
		move.w	$42(a0),d0
		move.w	d0,$26(a0)
		asr.w	#3,d0
		move.w	d0,$3A(a0)
		movea.w	$3E(a0),a1
		move.w	$3A(a0),$3A(a1)
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21F0A:
		move.b	$38(a0),d0
		addi.w	#$200,$38(a0)
		jsr	(GetSineCosine).l
		asl.w	#2,d0
		cmpi.w	#$400,d0
		bne.s	loc_21F26
		move.w	#$3FF,d0

loc_21F26:
		move.w	d0,$26(a0)
		move.w	d0,$3A(a0)
		movea.w	$3E(a0),a1
		move.w	$3A(a0),$3A(a1)

loc_21F38:
		move.w	$10(a0),d0
		andi.w	#$FF80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.w	loc_21F52
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_21F52:
		move.w	$36(a0),d2
		subq.w	#1,d2
		bcs.s	loc_21F6E
		movea.w	$3E(a0),a2

loc_21F5E:
		movea.l	a2,a1
		movea.w	$3E(a1),a2
		jsr	(Delete_Referenced_Sprite).l
		dbf	d2,loc_21F5E

loc_21F6E:
		move.w	respawn_addr(a0),d0
		beq.s	loc_21F7A
		movea.w	d0,a2
		bclr	#7,(a2)

loc_21F7A:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_21F80:
		tst.w	$2E(a0)
		bne.s	loc_21FA8
		move.b	$38(a0),d0
		addi.w	#$200,$38(a0)
		jsr	(GetSineCosine).l
		asl.w	#2,d0
		cmpi.w	#$400,d0
		bne.s	loc_21FA2
		move.w	#$3FF,d0

loc_21FA2:
		move.w	d0,$3A(a0)
		bra.s	loc_21FBE
; ---------------------------------------------------------------------------

loc_21FA8:
		move.b	$38(a0),d0
		addi.w	#$100,$38(a0)
		jsr	(GetSineCosine).l
		asl.w	#3,d0
		move.w	d0,$3A(a0)

loc_21FBE:
		move.w	$3A(a0),d0
		move.w	d0,$26(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		movea.w	$3C(a0),a1
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_21FE8:
		movea.w	$3C(a0),a1
		move.w	$26(a1),$26(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		movea.w	$3C(a0),a1
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_22014:
		movea.w	$3C(a0),a1
		move.w	$3A(a1),$3A(a0)
		move.w	$26(a1),d0
		add.w	$3A(a0),d0
		move.w	d0,$26(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		bsr.w	sub_22040
		jmp	(Draw_Sprite).l

; =============== S U B R O U T I N E =======================================

sub_22040:
		movea.w	$3C(a0),a1
		move.b	$26(a1),d0
		addq.b	#4,d0
		andi.b	#-8,d0
		jsr	(GetSineCosine).l
		neg.w	d0
		addi.w	#8,d0
		addi.w	#8,d1
		asr.w	#4,d0
		asr.w	#4,d1
		add.w	$10(a1),d0
		move.w	d0,$10(a0)
		add.w	$14(a1),d1
		move.w	d1,$14(a0)
		rts
; End of function sub_22040
; ---------------------------------------------------------------------------

Obj_AIZRideVineHandle:
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		bsr.w	sub_22040
		cmp.w	$10(a0),d4
		beq.s	loc_2208A
		move.w	d4,$42(a0)

loc_2208A:
		cmp.w	$14(a0),d5
		beq.s	loc_22094
		move.w	d5,$44(a0)

loc_22094:
		lea	$32(a0),a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1_logical).w,d0
		bsr.s	sub_220C2
		tst.w	$32(a0)
		beq.s	loc_220BA
		tst.w	$30(a0)
		bne.s	locret_220C0

loc_220BA:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

locret_220C0:
		rts

; =============== S U B R O U T I N E =======================================

sub_220C2:
		tst.b	(a2)
		beq.w	loc_222F4
		bmi.w	loc_2217E
		tst.b	4(a1)
		bpl.w	loc_22190
		cmpi.b	#4,5(a1)
		bhs.w	loc_22190
		move.b	d0,d1
		andi.b	#$70,d1
		beq.w	loc_221EC
		clr.b	$2E(a1)
		clr.b	(a2)
		cmpi.w	#1,$30(a0)
		beq.s	loc_2215C
		move.w	$10(a0),d1
		sub.w	$42(a0),d1
		asl.w	#7,d1
		move.w	d1,$18(a1)
		move.w	$14(a0),d1
		sub.w	$44(a0),d1
		asl.w	#7,d1
		move.w	d1,$1A(a1)
		move.b	#$3C,2(a2)
		btst	#$A,d0
		beq.s	loc_22124
		move.w	#-$200,$18(a1)

loc_22124:
		btst	#$B,d0
		beq.s	loc_22130
		move.w	#$200,$18(a1)

loc_22130:
		addi.w	#-$380,$1A(a1)

loc_22136:
		bset	#1,$2A(a1)
		move.b	#1,$40(a1)
		move.b	#$E,$1E(a1)
		move.b	#7,$1F(a1)
		move.b	#2,$20(a1)
		bset	#2,$2A(a1)
		rts
; ---------------------------------------------------------------------------

loc_2215C:
		move.b	#$3C,2(a2)
		movea.w	$3C(a0),a3
		move.b	$26(a3),d0
		jsr	(GetSineCosine).l
		asl.w	#3,d1
		move.w	d1,$18(a1)
		asl.w	#3,d0
		move.w	d0,$1A(a1)
		bra.s	loc_22136
; ---------------------------------------------------------------------------

loc_2217E:
		move.w	#$300,$18(a1)
		move.w	#$200,$1A(a1)
		bset	#1,$2A(a1)

loc_22190:
		clr.b	$2E(a1)
		clr.b	(a2)
		move.b	#$3C,2(a2)
		rts
; End of function sub_220C2

; =============== S U B R O U T I N E =======================================

loc_221EC:
		tst.w	$30(a0)
		bne.s	loc_22258
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		addi.w	#$14,$14(a1)
		movea.w	$3C(a0),a3
		moveq	#0,d0
		move.b	$26(a3),d0
		btst	#0,$2A(a1)
		beq.s	loc_2221A
		neg.b	d0

loc_2221A:
		addq.b	#8,d0
		lsr.w	#4,d0
		move.b	byte_22248(pc,d0.w),$22(a1)

loc_22224:
		move.b	$2A(a1),d1
		andi.b	#1,d1
		andi.b	#-4,4(a1)
		or.b	d1,4(a1)
		moveq	#0,d0
		move.b	$22(a1),d0
		move.l	a2,-(sp)
		jsr	(Sonic_Load_PLC2).l
		movea.l	(sp)+,a2
		rts
; ---------------------------------------------------------------------------

byte_22248:
		dc.b $91
		dc.b $91
		dc.b $90
		dc.b $90
		dc.b $90
		dc.b $90
		dc.b $90
		dc.b $90
		dc.b $92
		dc.b $92
		dc.b $92
		dc.b $92
		dc.b $92
		dc.b $92
		dc.b $91
		dc.b $91
; ---------------------------------------------------------------------------

loc_22258:
		movea.w	$3C(a0),a3
		moveq	#0,d0
		move.b	$26(a3),d0
		btst	#0,$2A(a1)
		beq.s	loc_2226C
		neg.b	d0

loc_2226C:
		addi.b	#$10,d0
		lsr.w	#5,d0
		add.w	d0,d0
		move.b	byte_222D4(pc,d0.w),$22(a1)
		move.b	#0,$20(a1)
		andi.w	#-2,d0
		move.b	byte_222E4(pc,d0.w),d2
		move.b	byte_222E5(pc,d0.w),d3
		ext.w	d2
		ext.w	d3
		btst	#0,$2A(a1)
		beq.s	loc_2229A
		neg.w	d2

loc_2229A:
		movea.w	$3C(a0),a3
		move.b	$26(a3),d0
		addq.b	#4,d0
		andi.b	#-8,d0
		jsr	(GetSineCosine).l
		neg.w	d0
		addi.w	#8,d0
		addi.w	#8,d1
		asr.w	#4,d0
		asr.w	#4,d1
		add.w	$10(a3),d0
		add.w	d2,d0
		move.w	d0,$10(a1)
		add.w	$14(a3),d1
		add.w	d3,d1
		move.w	d1,$14(a1)
		bra.w	loc_22224
; ---------------------------------------------------------------------------

byte_222D4:
		dc.b $78
		dc.b $78
		dc.b $7F
		dc.b $7F
		dc.b $7E
		dc.b $7E
		dc.b $7D
		dc.b $7D
		dc.b $7C
		dc.b $7C
		dc.b $7B
		dc.b $7B
		dc.b $7A
		dc.b $7A
		dc.b $79
		dc.b $79
byte_222E4:
		dc.b 0
byte_222E5:
		dc.b $18
		dc.b $EE
		dc.b $13
		dc.b $E8
		dc.b 0
		dc.b $EE
		dc.b $ED
		dc.b 0
		dc.b $E8
		dc.b $12
		dc.b $ED
		dc.b $18
		dc.b 0
		dc.b $12
		dc.b $13
; ---------------------------------------------------------------------------

loc_222F4:
		tst.b	2(a2)
		beq.s	loc_22302
		subq.b	#1,2(a2)
		bne.s	locret_2237C

loc_22302:
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		addi.w	#$10,d0
		cmpi.w	#$20,d0
		bhs.s	locret_2237C
		move.w	$14(a1),d1
		sub.w	$14(a0),d1
		cmpi.w	#$18,d1
		bhs.s	locret_2237C
		tst.b	$2E(a1)
		bne.s	locret_2237C
		cmpi.b	#4,5(a1)
		bhs.s	locret_2237C
		tst.w	(Debug_placement_mode).w
		bne.s	locret_2237C
		clr.w	$18(a1)
		clr.w	$1A(a1)
		clr.w	$1C(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		addi.w	#$14,$14(a1)
		move.b	#$14,$20(a1)
		move.b	#0,$3D(a1)
		move.b	#3,$2E(a1)
		andi.b	#-3,4(a1)
		move.b	#1,(a2)

;		sfx	sfx_Vine,0,0,0

;		moveq	#sfx_Vine,d0
;		jsr	(Play_Sound_2).l

locret_2237C:
		rts
; =============== S U B R O U T I N E =======================================

		include	"Objects/Vine/Object Data/Map - Ride Vine.asm"