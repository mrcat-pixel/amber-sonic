
; =============== S U B R O U T I N E =======================================

Obj_BreakableWall:
		move.b	#4,render_flags(a0)
		move.w	#$280,priority(a0)
		move.l	#loc_21568,(a0)
		move.b	subtype(a0),d0
		move.b	d0,mapping_frame(a0)
		move.l	#Map_BreakableWall,$C(a0)
		move.w	#$4000,art_tile(a0)
		move.b	#$10,width_pixels(a0)
		move.b	#$20,height_pixels(a0)
		move.l	#word_21A7A,$34(a0)
		move.l	#word_21A9A,$38(a0)

loc_21568:
		move.w	(Player_1+x_vel).w,$30(a0)
		moveq	#0,d1
		move.b	7(a0),d1
		addi.w	#$B,d1
		moveq	#0,d2
		move.b	6(a0),d2
		move.w	d2,d3
		addq.w	#1,d3
		move.w	$10(a0),d4
		jsr	(SolidObjectFull).w
		swap	d6
		andi.w	#3,d6
		bne.s	loc_215B2

loc_215AC:
		jmp	(Sprite_OnScreen_Test).w
; ---------------------------------------------------------------------------

loc_215B2:
		lea	(Player_1).w,a1
		move.w	$30(a0),d1
		move.w	d6,d0
		andi.w	#1,d0
		beq.s	loc_215AC
		btst	#4,$2B(a1)
		bne.s	loc_215E0
		btst	#5,$2A(a0)
		beq.s	loc_215AC

loc_215E0:
		cmpi.b	#2,$20(a1)
		bne.s	loc_215AC
		move.w	d1,d0
		bpl.s	loc_215EE
		neg.w	d0

loc_215EE:
		cmpi.w	#$480,d0
		blo.s		loc_215AC
		move.w	d1,$18(a1)
		addq.w	#4,$10(a1)
		movea.l	$34(a0),a4
		move.w	$10(a0),d0
		cmp.w	$10(a1),d0
		blo.s		loc_2167A
		subi.w	#8,$10(a1)
		movea.l	$38(a0),a4

loc_2167A:
		move.w	$18(a1),$1C(a1)
		bclr	#5,$2A(a1)

loc_21686:
		move.l	#loc_21692,(a0)
		bsr.s	sub_216B0

loc_21692:
		jsr	(MoveSprite2).w
		addi.w	#$70,$1A(a0)
		tst.b	4(a0)
		bpl.s	loc_216AA
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

loc_216AE:
		movea.l	$34(a0),a4
		bra.s	loc_21686
; ---------------------------------------------------------------------------

loc_216AA:
		jmp	(Delete_Current_Sprite).w

; =============== S U B R O U T I N E =======================================

sub_216B0:
;		sfx	sfx_BreakWall,0,0,0		; play smashing sound

		move.w	#$80,8(a0)
		moveq	#0,d0
		move.b	$22(a0),d0
		add.w	d0,d0
		movea.l	$C(a0),a3
		adda.w	(a3,d0.w),a3
		move.w	(a3)+,d1
		subq.w	#1,d1
		bset	#5,4(a0)
		move.l	(a0),d4
		move.b	4(a0),d5
		movea.l	a0,a1
		bra.s	loc_216EC
; ---------------------------------------------------------------------------

loc_216E2:
		jsr	(Create_New_Sprite3).w
		bne.s	locret_2172C
		addq.w	#6,a3

loc_216EC:
		move.l	d4,(a1)
		move.l	a3,$C(a1)
		move.b	d5,4(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	$A(a0),$A(a1)
		ori.w	#$8000,$A(a1)
		move.b	8(a0),8(a1)
		move.b	7(a0),7(a1)
		move.b	6(a0),6(a1)
		move.w	(a4)+,$18(a1)
		move.w	(a4)+,$1A(a1)
		dbf	d1,loc_216E2

locret_2172C:
		rts
; End of function sub_216B0
; ---------------------------------------------------------------------------

word_21A7A:
		dc.w $400
		dc.w $FB00
		dc.w $600
		dc.w $FA00
		dc.w $600
		dc.w $FF00
		dc.w $800
		dc.w $FE00
		dc.w $600
		dc.w $100
		dc.w $800
		dc.w $200
		dc.w $400
		dc.w $500
		dc.w $600
		dc.w $600
word_21A9A:
		dc.w $FA00
		dc.w $FA00
		dc.w $FC00
		dc.w $FB00
		dc.w $F800
		dc.w $FE00
		dc.w $FA00
		dc.w $FF00
		dc.w $F800
		dc.w $200
		dc.w $FA00
		dc.w $100
		dc.w $FA00
		dc.w $600
		dc.w $FC00
		dc.w $500
; ---------------------------------------------------------------------------

		include "Objects/Breakable Wall/Object Data/Map - Breakable Wall.asm"
