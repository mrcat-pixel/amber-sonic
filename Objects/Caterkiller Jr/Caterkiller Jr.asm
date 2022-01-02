
; =============== S U B R O U T I N E =======================================

Obj_CaterKillerJr:
		jsr	(Obj_WaitOffscreen).w
		moveq	#0,d0
		move.b	5(a0),d0
		move.w	off_876E2(pc,d0.w),d1
		jsr	off_876E2(pc,d1.w)
		jmp	(Sprite_CheckDeleteTouch).w
; ---------------------------------------------------------------------------

off_876E2: offsetTable
		offsetTableEntry.w loc_876EC
		offsetTableEntry.w loc_87728
		offsetTableEntry.w loc_87728
		offsetTableEntry.w loc_87758
		offsetTableEntry.w loc_8777A
; ---------------------------------------------------------------------------

loc_876EC:
		lea	ObjDat3_87862(pc),a1
		jsr	(SetUp_ObjAttributes).w
		move.w	#-$100,$18(a0)
		lea	ChildObjDat_87898(pc),a2
		jsr	(CreateChild3_NormalRepeated).w

loc_87702:
		move.b	#4,5(a0)
		move.b	#3,$39(a0)
		move.w	#$80,d0
		move.w	d0,$3E(a0)
		move.w	d0,$1A(a0)
		move.w	#8,$40(a0)
		bclr	#0,$38(a0)
		rts
; ---------------------------------------------------------------------------

loc_87728:
		jsr	(Swing_UpAndDown_Count).w
		bne.s	loc_87738
		jsr	(MoveSprite2).w
		bra.w	loc_8783E
; ---------------------------------------------------------------------------

loc_87738:
		move.b	#6,5(a0)
		move.w	#$100,d0
		move.w	d0,$3E(a0)
		move.w	d0,$1A(a0)
		move.w	#8,$40(a0)
		bclr	#0,$38(a0)
		rts
; ---------------------------------------------------------------------------

loc_87758:
		jsr	(Swing_UpAndDown).w
		tst.w	d3
		beq.s	loc_87770
		move.b	#8,5(a0)
		neg.w	$18(a0)
		bchg	#0,4(a0)

loc_87770:
		jsr	(MoveSprite2).w
		bra.w	loc_8783E
; ---------------------------------------------------------------------------

loc_8777A:
		jsr	(Swing_UpAndDown).w
		tst.w	d3
		bne.s	loc_87702
		jsr	(MoveSprite2).w
		bra.w	loc_8783E
; ---------------------------------------------------------------------------

loc_8778C:
		moveq	#0,d0
		move.b	5(a0),d0
		move.w	off_877A2(pc,d0.w),d1
		jsr	off_877A2(pc,d1.w)
		moveq	#0,d0
		jmp	(Child_DrawTouch_Sprite_FlickerMove).w
; ---------------------------------------------------------------------------

off_877A2: offsetTable
		offsetTableEntry.w loc_877AC
		offsetTableEntry.w loc_877D8
		offsetTableEntry.w loc_87728
		offsetTableEntry.w loc_87758
		offsetTableEntry.w loc_8777A
; ---------------------------------------------------------------------------

loc_877AC:
		moveq	#0,d0
		move.b	$2C(a0),d0
		move.w	off_877C6(pc,d0.w),d1
		lea	off_877C6(pc,d1.w),a1
		lsr.w	#1,d0
		move.b	byte_877D2(pc,d0.w),$2F(a0)
		jmp	(SetUp_ObjAttributes).w
; ---------------------------------------------------------------------------

off_877C6: offsetTable
		offsetTableEntry.w ObjDat3_8786E
		offsetTableEntry.w ObjDat3_8786E
		offsetTableEntry.w ObjDat3_8786E
		offsetTableEntry.w ObjDat3_8787A
		offsetTableEntry.w ObjDat3_87886
		offsetTableEntry.w ObjDat3_87886
byte_877D2:
		dc.b $B
		dc.b $17
		dc.b $23
		dc.b $2F
		dc.b $37
		dc.b $3F
; ---------------------------------------------------------------------------

loc_877D8:
		subq.w	#1,$2E(a0)
		bmi.s	loc_877E0
		rts
; ---------------------------------------------------------------------------

loc_877E0:
		move.b	#4,5(a0)
		moveq	#$40,d1
		moveq	#0,d0
		move.b	$2C(a0),d0
		addq.w	#2,d0
		lsl.w	#2,d0
		sub.w	d0,d1
		move.w	d1,$2E(a0)
		move.l	#loc_87854,$34(a0)
		move.w	#-$100,$18(a0)
		bra.w	loc_87702
; ---------------------------------------------------------------------------

loc_8780A:
		lea	word_87892(pc),a1
		jsr	(SetUp_ObjAttributes3).w
		move.l	#loc_8782C,(a0)
		move.l	#Go_Delete_Sprite,$34(a0)
		bset	#4,$2B(a0)
		jmp	(Child_Draw_Sprite).w
; ---------------------------------------------------------------------------

loc_8782C:
		jsr	(Refresh_ChildPositionAdjusted).w
		lea	AniRaw_878A8(pc),a1
		jsr	(Animate_RawNoSSTMultiDelay).w
		jmp	(Child_Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_8783E:
		cmpi.l	#loc_8778C,(a0)
		bne.s	locret_87852
		cmpi.b	#6,$2C(a0)
		bhs.s	locret_87852
		jsr	(Obj_Wait).w

locret_87852:
		rts
; ---------------------------------------------------------------------------

loc_87854:
		move.w	#$1A,$2E(a0)
		lea	ChildObjDat_878A0(pc),a2
		jmp	(CreateChild1_Normal).w

; =============== S U B R O U T I N E =======================================

ObjDat3_87862:
		dc.l Map_CaterKillerJr
		dc.w $A55F
		dc.w $280
		dc.b 8
		dc.b 8
		dc.b 0
		dc.b $17
ObjDat3_8786E:
		dc.l Map_CaterKillerJr
		dc.w $A55F
		dc.w $280
		dc.b 8
		dc.b $C
		dc.b 1
		dc.b $97
ObjDat3_8787A:
		dc.l Map_CaterKillerJr
		dc.w $A55F
		dc.w $280
		dc.b 8
		dc.b 8
		dc.b 2
		dc.b $97
ObjDat3_87886:
		dc.l Map_MonkeyDude
		dc.w $A548
		dc.w $280
		dc.b 4
		dc.b 4
		dc.b 3
		dc.b $98
word_87892:
		dc.w $200
		dc.b $10
		dc.b $10
		dc.b 3
		dc.b 0
ChildObjDat_87898:
		dc.w 6-1
		dc.l loc_8778C
		dc.b 0, 0
ChildObjDat_878A0:
		dc.w 1-1
		dc.l loc_8780A
		dc.b 0, 0
AniRaw_878A8:
		dc.b    3,   2
		dc.b    3,   2
		dc.b    4,   3
		dc.b    5,   4
		dc.b  $F4,   0

; =============== S U B R O U T I N E =======================================

		include "Objects/Caterkiller Jr/Object Data/Map - Caterkiller Jr.asm"
		include "Objects/Caterkiller Jr/Object Data/Map - Monkey Dude.asm"
