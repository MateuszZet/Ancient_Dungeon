;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module enemy_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _CODE_3
_enemy:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x6f	; 111	'o'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0xe2	; 226
	.db #0xb0	; 176
	.db #0xb7	; 183
	.db #0x70	; 112	'p'
	.db #0xf7	; 247
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0xf2	; 242
	.db #0xd2	; 210
	.db #0xfe	; 254
	.db #0x22	; 34
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x42	; 66	'B'
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x6f	; 111	'o'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0xe2	; 226
	.db #0xb0	; 176
	.db #0xb7	; 183
	.db #0x70	; 112	'p'
	.db #0xf7	; 247
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0xf2	; 242
	.db #0xd2	; 210
	.db #0xfe	; 254
	.db #0x22	; 34
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x42	; 66	'B'
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x62	; 98	'b'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xf2	; 242
	.db #0xe0	; 224
	.db #0xe7	; 231
	.db #0x60	; 96
	.db #0x67	; 103	'g'
	.db #0xf2	; 242
	.db #0xd2	; 210
	.db #0xf2	; 242
	.db #0x22	; 34
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xf2	; 242
	.db #0x42	; 66	'B'
	.db #0xf2	; 242
	.db #0xf2	; 242
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0xef	; 239
	.db #0x0f	; 15
	.db #0xef	; 239
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x4f	; 79	'O'
	.db #0x4b	; 75	'K'
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x4f	; 79	'O'
	.db #0x41	; 65	'A'
	.db #0x4f	; 79	'O'
	.db #0x41	; 65	'A'
	.db #0x4f	; 79	'O'
	.db #0x42	; 66	'B'
	.db #0x4f	; 79	'O'
	.db #0x4f	; 79	'O'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0xf6	; 246
	.db #0x80	; 128
	.db #0xf6	; 246
	.db #0x80	; 128
	.db #0xf6	; 246
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0xf6	; 246
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x4f	; 79	'O'
	.db #0x07	; 7
	.db #0xe7	; 231
	.db #0x07	; 7
	.db #0xe7	; 231
	.db #0x4f	; 79	'O'
	.db #0x4b	; 75	'K'
	.db #0x4f	; 79	'O'
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x4f	; 79	'O'
	.db #0x41	; 65	'A'
	.db #0x4f	; 79	'O'
	.db #0x42	; 66	'B'
	.db #0x4f	; 79	'O'
	.db #0x4f	; 79	'O'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0xf6	; 246
	.db #0x80	; 128
	.db #0xf6	; 246
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x46	; 70	'F'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
