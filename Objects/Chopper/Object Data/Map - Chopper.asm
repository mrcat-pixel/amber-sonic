Map_Chop:
	dc.w	.mouthshut-Map_Chop
	dc.w	.mouthopen-Map_Chop

.mouthshut:	dc.w 1
	dc.w $F00F, 0, $FFF0

.mouthopen:	dc.w 1
	dc.w $F00F, $10, $FFF0

	even