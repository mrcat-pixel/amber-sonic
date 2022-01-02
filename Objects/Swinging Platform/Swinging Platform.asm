; ---------------------------------------------------------------------------
; Swinging platforms(Obj_DEZLiftPad).
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_SwingingPlatform:
		move.l	#Map_Swing_GHZ,$C(a0)
		move.w	#$443,$A(a0)
		move.b	#4,4(a0)
		move.b	#$20,7(a0)
		move.b	#$10,6(a0)
		move.w	#$200,8(a0)
		move.w	$10(a0),$44(a0)
		move.w	$14(a0),$46(a0)
		jsr	(Create_New_Sprite3).w
		bne.s	+
		move.l	#Draw_Sprite,(a1)
		move.l	$C(a0),$C(a1)
		move.w	$A(a0),$A(a1)
		move.b	4(a0),4(a1)
		move.b	#$60,7(a1)
		move.b	#$60,6(a1)
		move.w	#$280,8(a1)
		move.w	$10(a0),d2
		move.w	d2,$10(a1)
		move.w	$14(a0),d3
		move.w	d3,$14(a1)
		bset	#6,4(a1)				; set multi-draw flag
		move.b	$2C(a0),d1
		andi.w	#7,d1
		move.w	d1,$16(a1)
		subq.w	#1,d1
		lea	$18(a1),a2

-		move.w	d2,(a2)+
		move.w	d3,(a2)+
		move.w	#1,(a2)+
		dbf	d1,-
		move.b	#2,$1D(a1)
		move.b	#2,$22(a1)
		move.w	a1,$3E(a0)
+
		move.l	#+,(a0)
+
		move.w	$10(a0),-(sp)
		bsr.s	SwingingPlatform_Move
		move.w	#$18,d1
		move.w	#9,d3
		move.w	(sp)+,d4
		jsr	(SolidObjectTop).w
		move.w	$44(a0),d0
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.w	+
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------
+
		move.w	respawn_addr(a0),d0
		beq.s	+
		movea.w	d0,a2
		bclr	#7,(a2)
+
		movea.w	$3E(a0),a1
		jsr	(Delete_Referenced_Sprite).w
		jmp	(Delete_Current_Sprite).w

; =============== S U B R O U T I N E =======================================

SwingingPlatform_Move:
		moveq	#0,d0
		move.b	(Oscillating_variables+$1A).w,d0
		tst.b	$2C(a0)
		bpl.s	+
		move.b	(Vine_Acceleration).w,d0
+
		btst	#0,$2A(a0)
		beq.s	+
		neg.w	d0
		addi.w	#$80,d0
+
		btst	#1,$2A(a0)
		beq.s	+
		neg.w	d0
+
		jsr	(GetSineCosine).w
		move.w	$46(a0),d2
		move.w	$44(a0),d3
		moveq	#0,d6
		movea.w	$3E(a0),a1
		move.w	$16(a1),d6
		subq.w	#2,d6
		bcs.s	+
		swap	d0
		swap	d1
		asr.l	#4,d0
		asr.l	#4,d1
		moveq	#0,d4
		moveq	#0,d5
		add.l	d0,d4
		add.l	d1,d5
		lea	$1E(a1),a2

-		movem.l	d4-d5,-(sp)
		swap	d4
		swap	d5
		add.w	d2,d4
		add.w	d3,d5
		move.w	d5,(a2)+
		move.w	d4,(a2)+
		movem.l	(sp)+,d4-d5
		add.l	d0,d4
		add.l	d1,d5
		addq.w	#2,a2
		dbf	d6,-
		swap	d4
		swap	d5
		add.w	d2,d4
		add.w	d3,d5
		move.w	d5,$10(a0)
		move.w	d4,$14(a0)
+
		rts
; End of function SwingingPlatform_Move
; ---------------------------------------------------------------------------

		include "Objects/Swinging Platform/Object Data/Map - Swinging Platforms.asm"