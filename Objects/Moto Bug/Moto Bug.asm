; ---------------------------------------------------------------------------
; Object 40 - Moto Bug enemy (GHZ)
; ---------------------------------------------------------------------------

ob2ndRoutMoto	= $38

; =============== S U B R O U T I N E =======================================

Obj_MotoBug:
		jsr	(Obj_WaitOffscreen).l
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Moto_Index(pc,d0.w),d1
		jmp	Moto_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Moto_Index:
		dc.w Moto_Main-Moto_Index
		dc.w Moto_Action-Moto_Index
		dc.w Moto_Animate-Moto_Index
		dc.w Moto_Delete-Moto_Index
; ---------------------------------------------------------------------------

Moto_Main:
		move.l	#Map_Moto,obMap(a0)
		move.w	#$3D4,obGfx(a0)
		cmpi.b	#1,(Current_act).w
		bne.s	+
		move.w	#$3AF,obGfx(a0)
+
		move.b	#4,obRender(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	#$E,y_radius(a0)
		move.b	#$14,x_radius(a0)
		tst.b	obAnim(a0)				; is object a smoke trail?
		bne.s	.smoke				; if yes, branch
		move.b	#$E,obHeight(a0)
		move.b	#$14,obWidth(a0)
		move.b	#$C,obColType(a0)
		jsr	(ObjectFall).l
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notonfloor
		add.w	d1,obY(a0)			; match	object's position with the floor
		move.w	#0,obVelY(a0)
		addq.b	#2,obRoutine(a0)		; goto Moto_Action next
		bchg	#0,obStatus(a0)

.notonfloor:
		rts
; ---------------------------------------------------------------------------

.smoke:
		addq.b	#4,obRoutine(a0)
		bra.w	Moto_Animate
; ---------------------------------------------------------------------------

Moto_Action:	; Routine 2
		moveq	#0,d0
		move.b	ob2ndRoutMoto(a0),d0
		move.w	Moto_ActIndex(pc,d0.w),d1
		jsr	Moto_ActIndex(pc,d1.w)
		lea	(Ani_Moto).l,a1
		jsr	(AnimateSprite).l
		jmp	(Sprite_CheckDeleteTouch).l
; ---------------------------------------------------------------------------

Moto_ActIndex:
		dc.w .move-Moto_ActIndex
		dc.w .findfloor-Moto_ActIndex
; ---------------------------------------------------------------------------

.time			= $2E
.smokedelay		= $3E
; ---------------------------------------------------------------------------

.move:
		subq.w	#1,.time(a0)			; subtract 1 from pause	time
		bpl.s	.wait				; if time remains, branch
		addq.b	#2,ob2ndRoutMoto(a0)
		move.w	#-$100,obVelX(a0)	; move object to the left
		move.b	#1,obAnim(a0)
		bchg	#0,obStatus(a0)
		bne.s	.wait
		neg.w	obVelX(a0)			; change direction

.wait:
		rts
; ---------------------------------------------------------------------------

.findfloor:
		jsr	(SpeedToPos).l
		jsr	(ObjFloorDist).l
		cmpi.w	#-8,d1
		blt.s		.pause
		cmpi.w	#$C,d1
		bge.s	.pause
		add.w	d1,obY(a0)				; match object's position with the floor
		subq.b	#1,.smokedelay(a0)
		bpl.s	.nosmoke
		move.b	#$F,.smokedelay(a0)
		jsr	(Create_New_Sprite3).l
		bne.s	.nosmoke
		move.l	#Obj_MotoBug,(a1)		; load exhaust smoke object
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.b	obStatus(a0),obStatus(a1)
		move.b	#2,obAnim(a1)

.nosmoke:
		rts
; ---------------------------------------------------------------------------

.pause:
		subq.b	#2,ob2ndRoutMoto(a0)
		move.w	#59,.time(a0)				; set pause time to 1 second
		move.w	#0,obVelX(a0)			; stop the object moving
		move.b	#0,obAnim(a0)
		rts
; ---------------------------------------------------------------------------

Moto_Animate:
		lea	(Ani_Moto).l,a1
		jsr	(AnimateSprite).l
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

Moto_Delete:
		jmp	(DeleteObject).l
; ---------------------------------------------------------------------------

		include "Objects/Moto Bug/Object Data/Anim - Moto Bug.asm"
		include "Objects/Moto Bug/Object Data/Map - Moto Bug.asm"