; ---------------------------------------------------------------------------
; Object 2B - Chopper enemy (GHZ)
; ---------------------------------------------------------------------------

origY := $3E

Obj_Chopper:
		move.l	#Map_Chop,obMap(a0)
		move.w	#$3F1,obGfx(a0)
		cmpi.b	#1,(Current_act).w
		bne.s	+
		move.w	#$2F8,obGfx(a0)
+
		move.b	#4,obRender(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	#9,obColType(a0)
		move.b	#$10,obWidth(a0)
		move.b	#$10,obHeight(a0)
		move.w	#-$700,obVelY(a0)	; set vertical speed
		move.w	obY(a0),origY(a0)
		move.l	#Obj2B_ChgSpeed,(a0)

Obj2B_ChgSpeed:
		lea	(Ani_Chop).l,a1
		jsr	(AnimateSprite).l
		jsr	(Sprite_CheckDeleteTouch).l
		jsr	(SpeedToPos).l
		addi.w	#$18,obVelY(a0)		; reduce speed
		move.w	origY(a0),d0
		cmp.w	obY(a0),d0
		bcc.s	.chganimation
		move.w	d0,obY(a0)
		move.w	#-$700,obVelY(a0)	; set vertical speed

.chganimation:
		move.b	#1,obAnim(a0)		; use fast animation
		subi.w	#$C0,d0
		cmp.w	obY(a0),d0
		bcc.s	.nochg
		move.b	#0,obAnim(a0)		; use slow animation
		tst.w	obVelY(a0)			; is Chopper at its highest point?
		bmi.s	.nochg				; if not, branch
		move.b	#2,obAnim(a0)		; use stationary animation

.nochg:
		rts
; ---------------------------------------------------------------------------

		include "Objects/Chopper/Object Data/Anim - Chopper.asm"
		include "Objects/Chopper/Object Data/Map - Chopper.asm"