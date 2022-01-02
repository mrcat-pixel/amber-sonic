; ---------------------------------------------------------------------------
; Animation script - Motobug enemy
; ---------------------------------------------------------------------------

Ani_Moto:
		dc.w Moto_stand-Ani_Moto
		dc.w Moto_walk-Ani_Moto
		dc.w Moto_smoke-Ani_Moto

Moto_stand:		dc.b $F, 2, afEnd
		even
Moto_walk:		dc.b 7,	0, 1, 0, 2, afEnd
Moto_smoke:		dc.b 1,	3, 6, 3, 6, 4, 6, 4, 6,	4, 6, 5, afRoutine
		even