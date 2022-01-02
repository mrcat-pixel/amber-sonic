; ---------------------------------------------------------------------------
; Object GHZ vine.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_AIZGiantRideVine:
		movea.l	a0,a1
		move.l	#loc_22442,(a1)
		bsr.w	sub_21D00
		move.b	#$21,$22(a1)
		move.w	$10(a0),d2
		move.w	$14(a0),d3
		move.b	$2C(a0),d1
		andi.w	#$F,d1
		jsr	(Create_New_Sprite3).l
		bne.s	loc_22442
		move.w	#-$1B0,$44(a1)
		move.w	#$800,$38(a1)
		move.w	a1,$3E(a0)
		move.l	#loc_2248A,(a1)
		move.w	a0,$3C(a1)
		move.b	$2C(a0),d0
		andi.b	#-$10,d0
		move.b	d0,$42(a1)
		bra.s	loc_223EA
; ---------------------------------------------------------------------------

loc_223D2:
		jsr	(Create_New_Sprite3).l
		bne.s	loc_22442
		move.l	#loc_2251E,(a1)
		move.w	a2,$3C(a1)
		move.w	a1,$3E(a2)

loc_223EA:
		movea.l	a1,a2
		bsr.w	sub_21D00
		move.w	d2,$10(a1)
		move.w	d3,$14(a1)
		addi.w	#$10,d3
		addq.w	#1,$36(a0)
		move.w	$36(a0),$36(a1)
		dbf	d1,loc_223D2
		move.l	#loc_2257E,(a1)
		move.b	#$20,$22(a1)
		move.w	a1,$40(a0)

loc_22442:
		move.w	$10(a0),d0
		andi.w	#$FF80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.w	loc_2245C
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_2245C:
		move.w	$36(a0),d2
		subq.w	#1,d2
		bcs.s	loc_22478
		movea.w	$3E(a0),a2

loc_22468:
		movea.l	a2,a1
		movea.w	$3E(a1),a2
		jsr	(Delete_Referenced_Sprite).l
		dbf	d2,loc_22468

loc_22478:
		move.w	respawn_addr(a0),d0
		beq.s	loc_22484
		movea.w	d0,a2
		bclr	#7,(a2)

loc_22484:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_2248A:
		tst.b	(a0)
		bne.s	loc_224BC
		move.b	(Vine_Acceleration).w,d0
		add.b	$42(a0),d0
		jsr	(GetSineCosine).l
		muls.w	#$2C,d0
		move.w	d0,$26(a0)
		asr.w	#3,d0
		move.w	d0,$3A(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_224BC:
		moveq	#0,d2
		move.b	$38(a0),d2
		move.w	$44(a0),d0
		move.w	#0,d1
		tst.w	$2E(a0)
		bne.s	loc_224E8
		add.w	d2,d0
		move.w	d0,$44(a0)
		add.w	d0,$42(a0)
		cmp.b	$42(a0),d1
		bgt.s	loc_224FE
		move.w	#1,$2E(a0)
		bra.s	loc_224FE
; ---------------------------------------------------------------------------

loc_224E8:
		sub.w	d2,d0
		move.w	d0,$44(a0)
		add.w	d0,$42(a0)
		cmp.b	$42(a0),d1
		ble.s	loc_224FE
		move.w	#0,$2E(a0)

loc_224FE:
		move.w	$42(a0),d0
		move.w	d0,$26(a0)
		asr.w	#3,d0
		move.w	d0,$3A(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_2251E:
		movea.w	$3C(a0),a1
		move.w	$3A(a1),$3A(a0)
		move.w	$26(a1),d0
		add.w	$3A(a0),d0
		move.w	d0,$26(a0)
		move.b	$26(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,$22(a0)
		bsr.w	sub_2254A
		jmp	(Draw_Sprite).l

; =============== S U B R O U T I N E =======================================

sub_2254A:
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
; End of function sub_2254A
; ---------------------------------------------------------------------------

loc_2257E:
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		bsr.w	sub_2254A
		cmp.w	$10(a0),d4
		beq.s	loc_22594
		move.w	d4,$42(a0)

loc_22594:
		cmp.w	$14(a0),d5
		beq.s	loc_2259E
		move.w	d5,$44(a0)

loc_2259E:
		lea	$32(a0),a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1_logical).w,d0
		bsr.w	sub_220C2
		tst.w	$32(a0)
		beq.s	loc_225C8
		tst.w	$30(a0)
		bne.s	locret_225CE

loc_225C8:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

locret_225CE:
		rts