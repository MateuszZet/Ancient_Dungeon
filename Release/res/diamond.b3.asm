;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module diamond_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _diamond
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
_diamond:
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x4f	; 79	'O'
	.db #0x09	; 9
	.db #0x87	; 135
	.db #0x05	; 5
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfa	; 250
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0x23	; 35
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0x23	; 35
	.db #0xfd	; 253
	.db #0x23	; 35
	.db #0xfa	; 250
	.db #0x46	; 70	'F'
	.db #0xf4	; 244
	.db #0x4c	; 76	'L'
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xd2	; 210
	.db #0xb0	; 176
	.db #0xa1	; 161
	.db #0xe0	; 224
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x8f	; 143
	.db #0x09	; 9
	.db #0x27	; 39
	.db #0x05	; 5
	.db #0x43	; 67	'C'
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0x9c	; 156
	.db #0xde	; 222
	.db #0x72	; 114	'r'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x31	; 49	'1'
	.db #0xef	; 239
	.db #0x31	; 49	'1'
	.db #0xde	; 222
	.db #0x62	; 98	'b'
	.db #0xdc	; 220
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x68	; 104	'h'
	.db #0xb1	; 177
	.db #0xd0	; 208
	.db #0xa4	; 164
	.db #0xe0	; 224
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x4f	; 79	'O'
	.db #0x09	; 9
	.db #0x87	; 135
	.db #0x05	; 5
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0x7e	; 126
	.db #0xd2	; 210
	.db #0xbf	; 191
	.db #0x61	; 97	'a'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x61	; 97	'a'
	.db #0xbf	; 191
	.db #0x61	; 97	'a'
	.db #0x7e	; 126
	.db #0xc2	; 194
	.db #0x7c	; 124
	.db #0xc4	; 196
	.db #0x78	; 120	'x'
	.db #0xc8	; 200
	.db #0xf2	; 242
	.db #0x90	; 144
	.db #0xe1	; 225
	.db #0xa0	; 160
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7e	; 126
	.db #0x4b	; 75	'K'
	.db #0xfd	; 253
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0x86	; 134
	.db #0xfd	; 253
	.db #0x86	; 134
	.db #0x7e	; 126
	.db #0x43	; 67	'C'
	.db #0x3e	; 62
	.db #0x23	; 35
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x8f	; 143
	.db #0x09	; 9
	.db #0x27	; 39
	.db #0x05	; 5
	.db #0x43	; 67	'C'
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfe	; 254
	.db #0x52	; 82	'R'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf1	; 241
	.db #0x90	; 144
	.db #0xe4	; 228
	.db #0xa0	; 160
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x7b	; 123
	.db #0x4e	; 78	'N'
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0x7b	; 123
	.db #0x46	; 70	'F'
	.db #0x3b	; 59
	.db #0x26	; 38
	.db #0x1b	; 27
	.db #0x16	; 22
	.db #0x4d	; 77	'M'
	.db #0x0b	; 11
	.db #0x85	; 133
	.db #0x07	; 7
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfe	; 254
	.db #0x52	; 82	'R'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf2	; 242
	.db #0x90	; 144
	.db #0xe1	; 225
	.db #0xa0	; 160
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x5f	; 95
	.db #0x6a	; 106	'j'
	.db #0xbf	; 191
	.db #0xc4	; 196
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xc4	; 196
	.db #0xbf	; 191
	.db #0xc4	; 196
	.db #0x5f	; 95
	.db #0x62	; 98	'b'
	.db #0x2f	; 47
	.db #0x32	; 50	'2'
	.db #0x17	; 23
	.db #0x1a	; 26
	.db #0x8b	; 139
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x07	; 7
	.db #0x43	; 67	'C'
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfe	; 254
	.db #0x52	; 82	'R'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf1	; 241
	.db #0x90	; 144
	.db #0xe4	; 228
	.db #0xa0	; 160
	.db #0xc2	; 194
	.db #0xc0	; 192
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0x84	; 132
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x4f	; 79	'O'
	.db #0x09	; 9
	.db #0x87	; 135
	.db #0x05	; 5
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0xfe	; 254
	.db #0x52	; 82	'R'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf2	; 242
	.db #0x90	; 144
	.db #0xe1	; 225
	.db #0xa0	; 160
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x84	; 132
	.db #0x80	; 128
	.area _CABS (ABS)