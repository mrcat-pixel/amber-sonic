
; =============== S U B R O U T I N E =======================================

Obj_ForegroundPlant:
		move.l	#Map_FGPlant,mappings(a0)
		ori.b	#4,render_flags(a0)
		move.w	x_pos(a0),$30(a0)
		move.w	y_pos(a0),$32(a0)
		move.b	subtype(a0),d0
		andi.w	#$F,d0
		move.b	d0,mapping_frame(a0)
		add.w	d0,d0
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		lea	word_2C242(pc,d0.w),a1
		move.w	(a1)+,art_tile(a0)
		move.w	(a1)+,priority(a0)
		move.b	(a1)+,width_pixels(a0)
		move.b	(a1)+,height_pixels(a0)
		move.b	subtype(a0),d0
		lsr.w	#2,d0
		andi.w	#$3C,d0
		move.l	off_2C24E(pc,d0.w),address(a0)
		rts
; ---------------------------------------------------------------------------

word_2C242:
		dc.w $C000		; VRAM
		dc.w $80			; Priority
		dc.b 32/2		; Width
		dc.b 256/2		; Height
		dc.w $C000		; VRAM
		dc.w $80			; Priority
		dc.b 32/2		; Width
		dc.b 256/2		; Height
off_2C24E:
		dc.l loc_2C26A
		dc.l loc_2C270
		dc.l loc_2C2A6
		dc.l loc_2C2DC
		dc.l loc_2C312
		dc.l loc_2C348
		dc.l loc_2C37A
; ---------------------------------------------------------------------------

loc_2C26A:
		jmp	(Sprite_OnScreen_Test).w
; ---------------------------------------------------------------------------

loc_2C270:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		asr.w	#4,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		asr.w	#4,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

loc_2C2A6:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		asr.w	#3,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		asr.w	#3,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

loc_2C2DC:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		asr.w	#2,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		asr.w	#2,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

loc_2C312:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		asr.w	#1,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		asr.w	#1,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

loc_2C348:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

loc_2C37A:
		move.w	$30(a0),d1
		move.w	d1,d2
		subi.w	#$A0,d1
		sub.w	(Camera_X_pos).w,d1
		add.w	d1,d1
		add.w	d2,d1
		move.w	d1,$10(a0)
		move.w	$32(a0),d1
		move.w	d1,d2
		subi.w	#$70,d1
		sub.w	(Camera_Y_pos).w,d1
		add.w	d2,d1
		move.w	d1,$14(a0)
		move.w	$30(a0),d0
		jmp	(Sprite_OnScreen_Test2).w
; ---------------------------------------------------------------------------

		include "Objects/Foreground Plant/Object Data/Map - Foreground Plant.asm"