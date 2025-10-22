@***
@
@ MusicPlayDef.s (MPlayDef.s) ver1.05
@
@                    Copyright (C) 1999-2001 NINTENDO Co.,Ltd.
@**************************************************************@

@***
@ MML (without running status)
@******************************************************@

	.equ	W00,	0x80		@ WAIT
	.equ	W01,	W00+1		@
	.equ	W02,	W00+2		@
	.equ	W03,	W00+3		@
	.equ	W04,	W00+4		@
	.equ	W05,	W00+5		@
	.equ	W06,	W00+6		@
	.equ	W07,	W00+7		@
	.equ	W08,	W00+8		@
	.equ	W09,	W00+9		@
	.equ	W10,	W00+10		@
	.equ	W11,	W00+11		@
	.equ	W12,	W00+12		@
	.equ	W13,	W00+13		@
	.equ	W14,	W00+14		@
	.equ	W15,	W00+15		@
	.equ	W16,	W00+16		@
	.equ	W17,	W00+17		@
	.equ	W18,	W00+18		@
	.equ	W19,	W00+19		@
	.equ	W20,	W00+20		@
	.equ	W21,	W00+21		@
	.equ	W22,	W00+22		@
	.equ	W23,	W00+23		@
	.equ	W24,	W00+24		@
	.equ	W28,	W00+25		@
	.equ	W30,	W00+26		@
	.equ	W32,	W00+27		@
	.equ	W36,	W00+28		@
	.equ	W40,	W00+29		@
	.equ	W42,	W00+30		@
	.equ	W44,	W00+31		@
	.equ	W48,	W00+32		@
	.equ	W52,	W00+33		@
	.equ	W54,	W00+34		@
	.equ	W56,	W00+35		@
	.equ	W60,	W00+36		@
	.equ	W64,	W00+37		@
	.equ	W66,	W00+38		@
	.equ	W68,	W00+39		@
	.equ	W72,	W00+40		@
	.equ	W76,	W00+41		@
	.equ	W78,	W00+42		@
	.equ	W80,	W00+43		@
	.equ	W84,	W00+44		@
	.equ	W88,	W00+45		@
	.equ	W90,	W00+46		@
	.equ	W92,	W00+47		@
	.equ	W96,	W00+48		@

	.equ	FINE,	0xb1		@ fine
	.equ	GOTO,	0xb2		@ goto
	.equ	PATT,	0xb3		@ pattern play
	.equ	PEND,	0xb4		@ pattern end
	.equ	REPT,	0xb5		@ repeat
	.equ	MEMACC,	0xb9		@ memacc op adr dat ***lib
	.equ	PRIO,	0xba		@ priority
	.equ	TEMPO,	0xbb		@ tempo (BPM/2)
	.equ	KEYSH,	0xbc		@ key shift

@***
@ MML (within running status)
@******************************************************@

	.equ	VOICE,	0xbd		@ voice #
	.equ	VOL,	0xbe		@ volume
	.equ	PAN,	0xbf		@ panpot (c_v+??)
	.equ	BEND,	0xc0		@ pitch bend (c_v+??)
	.equ	BENDR,	0xc1		@ bend range
	.equ	LFOS,	0xc2		@ LFO speed
	.equ	LFODL,	0xc3		@ LFO delay
	.equ	MOD,	0xc4		@ modulation depth
	.equ	MODT,	0xc5		@ modulation type
	.equ	TUNE,	0xc8		@ micro tuning (c_v+??)

	.equ	XCMD,	0xcd		@ extend command  ***lib
	 .equ	xIECV,	0x08		@  imi.echo vol   ***lib
	 .equ	xIECL,	0x09		@  imi.echo len   ***lib

	.equ	EOT,	0xce		@ End of Tie
	.equ	TIE,	0xcf		@
	.equ	N01,	TIE+1		@ NOTE
	.equ	N02,	N01+1		@
	.equ	N03,	N01+2		@
	.equ	N04,	N01+3		@
	.equ	N05,	N01+4		@
	.equ	N06,	N01+5		@
	.equ	N07,	N01+6		@
	.equ	N08,	N01+7		@
	.equ	N09,	N01+8		@
	.equ	N10,	N01+9		@
	.equ	N11,	N01+10		@
	.equ	N12,	N01+11		@
	.equ	N13,	N01+12		@
	.equ	N14,	N01+13		@
	.equ	N15,	N01+14		@
	.equ	N16,	N01+15		@
	.equ	N17,	N01+16		@
	.equ	N18,	N01+17		@
	.equ	N19,	N01+18		@
	.equ	N20,	N01+19		@
	.equ	N21,	N01+20		@
	.equ	N22,	N01+21		@
	.equ	N23,	N01+22		@
	.equ	N24,	N01+23		@
	.equ	N28,	N01+24		@
	.equ	N30,	N01+25		@
	.equ	N32,	N01+26		@
	.equ	N36,	N01+27		@
	.equ	N40,	N01+28		@
	.equ	N42,	N01+29		@
	.equ	N44,	N01+30		@
	.equ	N48,	N01+31		@
	.equ	N52,	N01+32		@
	.equ	N54,	N01+33		@
	.equ	N56,	N01+34		@
	.equ	N60,	N01+35		@
	.equ	N64,	N01+36		@
	.equ	N66,	N01+37		@
	.equ	N68,	N01+38		@
	.equ	N72,	N01+39		@
	.equ	N76,	N01+40		@
	.equ	N78,	N01+41		@
	.equ	N80,	N01+42		@
	.equ	N84,	N01+43		@
	.equ	N88,	N01+44		@
	.equ	N90,	N01+45		@
	.equ	N92,	N01+46		@
	.equ	N96,	N01+47		@

@***
@ Max value of operators
@******************************************************@

	.equ	mxv,	0x7F		@

@***
@ center value of PAN, BEND, TUNE
@******************************************************@

	.equ	c_v,	0x40		@ -64 ~ +63

@***
@ parameter of N??, TIE, EOT
@******************************************************@

	.equ	CnM2,	0		@
	.equ	CsM2,	1		@
	.equ	DnM2,	2		@
	.equ	DsM2,	3		@
	.equ	EnM2,	4		@
	.equ	FnM2,	5		@
	.equ	FsM2,	6		@
	.equ	GnM2,	7		@
	.equ	GsM2,	8		@
	.equ	AnM2,	9		@
	.equ	AsM2,	10		@
	.equ	BnM2,	11		@
	.equ	CnM1,	12		@
	.equ	CsM1,	13		@
	.equ	DnM1,	14		@
	.equ	DsM1,	15		@
	.equ	EnM1,	16		@
	.equ	FnM1,	17		@
	.equ	FsM1,	18		@
	.equ	GnM1,	19		@
	.equ	GsM1,	20		@
	.equ	AnM1,	21		@
	.equ	AsM1,	22		@
	.equ	BnM1,	23		@
	.equ	Cn0,	24		@
	.equ	Cs0,	25		@
	.equ	Dn0,	26		@
	.equ	Ds0,	27		@
	.equ	En0,	28		@
	.equ	Fn0,	29		@
	.equ	Fs0,	30		@
	.equ	Gn0,	31		@
	.equ	Gs0,	32		@
	.equ	An0,	33		@
	.equ	As0,	34		@
	.equ	Bn0,	35		@
	.equ	Cn1,	36		@
	.equ	Cs1,	37		@
	.equ	Dn1,	38		@
	.equ	Ds1,	39		@
	.equ	En1,	40		@
	.equ	Fn1,	41		@
	.equ	Fs1,	42		@
	.equ	Gn1,	43		@
	.equ	Gs1,	44		@
	.equ	An1,	45		@
	.equ	As1,	46		@
	.equ	Bn1,	47		@
	.equ	Cn2,	48		@
	.equ	Cs2,	49		@
	.equ	Dn2,	50		@
	.equ	Ds2,	51		@
	.equ	En2,	52		@
	.equ	Fn2,	53		@
	.equ	Fs2,	54		@
	.equ	Gn2,	55		@
	.equ	Gs2,	56		@
	.equ	An2,	57		@
	.equ	As2,	58		@
	.equ	Bn2,	59		@
	.equ	Cn3,	60		@
	.equ	Cs3,	61		@
	.equ	Dn3,	62		@
	.equ	Ds3,	63		@
	.equ	En3,	64		@
	.equ	Fn3,	65		@
	.equ	Fs3,	66		@
	.equ	Gn3,	67		@
	.equ	Gs3,	68		@
	.equ	An3,	69		@ 440Hz
	.equ	As3,	70		@
	.equ	Bn3,	71		@
	.equ	Cn4,	72		@
	.equ	Cs4,	73		@
	.equ	Dn4,	74		@
	.equ	Ds4,	75		@
	.equ	En4,	76		@
	.equ	Fn4,	77		@
	.equ	Fs4,	78		@
	.equ	Gn4,	79		@
	.equ	Gs4,	80		@
	.equ	An4,	81		@
	.equ	As4,	82		@
	.equ	Bn4,	83		@
	.equ	Cn5,	84		@
	.equ	Cs5,	85		@
	.equ	Dn5,	86		@
	.equ	Ds5,	87		@
	.equ	En5,	88		@
	.equ	Fn5,	89		@
	.equ	Fs5,	90		@
	.equ	Gn5,	91		@
	.equ	Gs5,	92		@
	.equ	An5,	93		@
	.equ	As5,	94		@
	.equ	Bn5,	95		@
	.equ	Cn6,	96		@
	.equ	Cs6,	97		@
	.equ	Dn6,	98		@
	.equ	Ds6,	99		@
	.equ	En6,	100		@
	.equ	Fn6,	101		@
	.equ	Fs6,	102		@
	.equ	Gn6,	103		@
	.equ	Gs6,	104		@
	.equ	An6,	105		@
	.equ	As6,	106		@
	.equ	Bn6,	107		@
	.equ	Cn7,	108		@
	.equ	Cs7,	109		@
	.equ	Dn7,	110		@
	.equ	Ds7,	111		@
	.equ	En7,	112		@
	.equ	Fn7,	113		@
	.equ	Fs7,	114		@
	.equ	Gn7,	115		@
	.equ	Gs7,	116		@
	.equ	An7,	117		@
	.equ	As7,	118		@
	.equ	Bn7,	119		@
	.equ	Cn8,	120		@
	.equ	Cs8,	121		@
	.equ	Dn8,	122		@
	.equ	Ds8,	123		@
	.equ	En8,	124		@
	.equ	Fn8,	125		@
	.equ	Fs8,	126		@
	.equ	Gn8,	127		@

@***
@ parameter of velocity
@******************************************************@

	.equ	v000,	0		@
	.equ	v001,	1		@
	.equ	v002,	2		@
	.equ	v003,	3		@
	.equ	v004,	4		@
	.equ	v005,	5		@
	.equ	v006,	6		@
	.equ	v007,	7		@
	.equ	v008,	8		@
	.equ	v009,	9		@
	.equ	v010,	10		@
	.equ	v011,	11		@
	.equ	v012,	12		@
	.equ	v013,	13		@
	.equ	v014,	14		@
	.equ	v015,	15		@
	.equ	v016,	16		@
	.equ	v017,	17		@
	.equ	v018,	18		@
	.equ	v019,	19		@
	.equ	v020,	20		@
	.equ	v021,	21		@
	.equ	v022,	22		@
	.equ	v023,	23		@
	.equ	v024,	24		@
	.equ	v025,	25		@
	.equ	v026,	26		@
	.equ	v027,	27		@
	.equ	v028,	28		@
	.equ	v029,	29		@
	.equ	v030,	30		@
	.equ	v031,	31		@
	.equ	v032,	32		@
	.equ	v033,	33		@
	.equ	v034,	34		@
	.equ	v035,	35		@
	.equ	v036,	36		@
	.equ	v037,	37		@
	.equ	v038,	38		@
	.equ	v039,	39		@
	.equ	v040,	40		@
	.equ	v041,	41		@
	.equ	v042,	42		@
	.equ	v043,	43		@
	.equ	v044,	44		@
	.equ	v045,	45		@
	.equ	v046,	46		@
	.equ	v047,	47		@
	.equ	v048,	48		@
	.equ	v049,	49		@
	.equ	v050,	50		@
	.equ	v051,	51		@
	.equ	v052,	52		@
	.equ	v053,	53		@
	.equ	v054,	54		@
	.equ	v055,	55		@
	.equ	v056,	56		@
	.equ	v057,	57		@
	.equ	v058,	58		@
	.equ	v059,	59		@
	.equ	v060,	60		@
	.equ	v061,	61		@
	.equ	v062,	62		@
	.equ	v063,	63		@
	.equ	v064,	64		@
	.equ	v065,	65		@
	.equ	v066,	66		@
	.equ	v067,	67		@
	.equ	v068,	68		@
	.equ	v069,	79		@
	.equ	v070,	70		@
	.equ	v071,	71		@
	.equ	v072,	72		@
	.equ	v073,	73		@
	.equ	v074,	74		@
	.equ	v075,	75		@
	.equ	v076,	76		@
	.equ	v077,	77		@
	.equ	v078,	78		@
	.equ	v079,	79		@
	.equ	v080,	80		@
	.equ	v081,	81		@
	.equ	v082,	82		@
	.equ	v083,	83		@
	.equ	v084,	84		@
	.equ	v085,	85		@
	.equ	v086,	86		@
	.equ	v087,	87		@
	.equ	v088,	88		@
	.equ	v089,	89		@
	.equ	v090,	90		@
	.equ	v091,	91		@
	.equ	v092,	92		@
	.equ	v093,	93		@
	.equ	v094,	94		@
	.equ	v095,	95		@
	.equ	v096,	96		@
	.equ	v097,	97		@
	.equ	v098,	98		@
	.equ	v099,	99		@
	.equ	v100,	100		@
	.equ	v101,	101		@
	.equ	v102,	102		@
	.equ	v103,	103		@
	.equ	v104,	104		@
	.equ	v105,	105		@
	.equ	v106,	106		@
	.equ	v107,	107		@
	.equ	v108,	108		@
	.equ	v109,	109		@
	.equ	v110,	110		@
	.equ	v111,	111		@
	.equ	v112,	112		@
	.equ	v113,	113		@
	.equ	v114,	114		@
	.equ	v115,	115		@
	.equ	v116,	116		@
	.equ	v117,	117		@
	.equ	v118,	118		@
	.equ	v119,	119		@
	.equ	v120,	120		@
	.equ	v121,	121		@
	.equ	v122,	122		@
	.equ	v123,	123		@
	.equ	v124,	124		@
	.equ	v125,	125		@
	.equ	v126,	126		@
	.equ	v127,	127		@

@***
@ parameter of gate+
@******************************************************@

	.equ	gtp1,	1		@
	.equ	gtp2,	2		@
	.equ	gtp3,	3		@

@***
@ parameter of MODT, BRET
@******************************************************@

	.equ	mod_vib,0		@ vibrate
	.equ	mod_tre,1		@ tremolo
	.equ	mod_pan,2		@ auto-panpot

@***
@ parameter of MEMACC
@******************************************************@

	.equ	mem_set,0		@
	.equ	mem_add,1		@
	.equ	mem_sub,2		@
	.equ	mem_mem_set,3		@
	.equ	mem_mem_add,4		@
	.equ	mem_mem_sub,5		@
	.equ	mem_beq,6		@
	.equ	mem_bne,7		@
	.equ	mem_bhi,8		@
	.equ	mem_bhs,9		@
	.equ	mem_bls,10		@
	.equ	mem_blo,11		@
	.equ	mem_mem_beq,12		@
	.equ	mem_mem_bne,13		@
	.equ	mem_mem_bhi,14		@
	.equ	mem_mem_bhs,15		@
	.equ	mem_mem_bls,16		@
	.equ	mem_mem_blo,17		@

@***
@ etc.
@******************************************************@

	.equ	reverb_set,0x80		@ SOUND_MODE_REVERB_SET
	.equ	PAM, PAN		@ 

	.equ	Voicegroup_HGSS, 0x915CA70

	.equ	regi_trio_grp, voicegroup000
	.equ	regi_trio_pri, 0
	.equ	regi_trio_rev, 0
	.equ	regi_trio_mvl, 127
	.equ	regi_trio_key, 0
	.equ	regi_trio_tbs, 1
	.equ	regi_trio_exg, 0
	.equ	regi_trio_cmp, 1

	.section .rodata
	.global	regi_trio
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

regi_trio_1:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 160*regi_trio_tbs/2
	.byte		VOICE , 48
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N08   , Cs4 , v116
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte	W08
@ 001   ----------------------------------------
	.byte		        An3 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        An3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
@ 002   ----------------------------------------
	.byte		        Fn3 
	.byte	W08
	.byte		        Cn3 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        Bn2 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        As2 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
	.byte		        An2 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W48
	.byte		VOICE , 56
	.byte		PAN   , c_v-48
	.byte		BEND  , c_v-2
	.byte	W12
	.byte		N36   , Cs4 , v028
	.byte	W36
@ 005   ----------------------------------------
	.byte		N12   , Dn4 
	.byte	W60
	.byte		N36   , Gs3 
	.byte	W36
@ 006   ----------------------------------------
	.byte		N12   , An3 
	.byte	W60
	.byte		N36   , Cs3 
	.byte	W36
@ 007   ----------------------------------------
	.byte		N12   , Dn3 
	.byte	W96
@ 008   ----------------------------------------
	.byte	W24
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W06
@ 009   ----------------------------------------
	.byte	W12
	.byte		        Ds4 
	.byte	W84
@ 010   ----------------------------------------
	.byte	W60
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W12
	.byte		        En3 
	.byte	W18
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W48
@ 012   ----------------------------------------
	.byte	W42
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W06
@ 013   ----------------------------------------
	.byte	W12
	.byte		        Cn4 
	.byte	W18
	.byte		        An3 
	.byte	W66
@ 014   ----------------------------------------
	.byte		VOICE , 48
	.byte		PAN   , c_v-10
	.byte		BEND  , c_v+0
	.byte		TIE   , Cs3 , v104
	.byte	W96
@ 015   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An3 
	.byte	W16
	.byte		N08   , Gs3 
	.byte	W08
@ 016   ----------------------------------------
	.byte		N96   , Bn3 
	.byte	W96
@ 017   ----------------------------------------
regi_trio_1_017:
	.byte		N64   , An3 , v104
	.byte	W64
	.byte		N08   , Gs3 
	.byte	W08
	.byte		N16   , Fs3 
	.byte	W16
	.byte		N08   , An3 
	.byte	W08
	.byte	PEND
@ 018   ----------------------------------------
	.byte		N96   , Gs3 
	.byte	W96
@ 019   ----------------------------------------
	.byte		        Cs3 
	.byte	W96
@ 020   ----------------------------------------
	.byte		PAN   , c_v-10
	.byte		TIE   , Dn3 
	.byte	W96
@ 021   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , As3 
	.byte	W16
	.byte		N08   , An3 
	.byte	W08
@ 022   ----------------------------------------
	.byte		N96   , Cn4 
	.byte	W96
@ 023   ----------------------------------------
	.byte		N64   , As3 
	.byte	W64
	.byte		N08   , An3 
	.byte	W08
	.byte		N16   , Gn3 
	.byte	W16
	.byte		N08   , As3 
	.byte	W08
@ 024   ----------------------------------------
	.byte		N96   , An3 
	.byte	W96
@ 025   ----------------------------------------
	.byte		        Dn4 
	.byte	W96
@ 026   ----------------------------------------
regi_trio_1_026:
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , As2 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
	.byte	PEND
@ 027   ----------------------------------------
	.byte		        61*regi_trio_mvl/mxv
	.byte		N96   , Gn2 
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 028   ----------------------------------------
	.byte		N12   , Fs2 , v112
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_1_026
@ 031   ----------------------------------------
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , Ds3 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 032   ----------------------------------------
	.byte		N12   , Dn3 , v112
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte		TIE   , Cs3 , v104
	.byte	W96
@ 035   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An3 
	.byte	W16
	.byte		N08   , Gs3 
	.byte	W08
@ 036   ----------------------------------------
	.byte		N96   , Bn3 
	.byte	W96
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_1_017
@ 038   ----------------------------------------
	.byte		N96   , Gs3 , v104
	.byte	W96
@ 039   ----------------------------------------
	.byte		        Cs3 
	.byte	W96
@ 040   ----------------------------------------
	.byte		PAN   , c_v-10
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

regi_trio_2:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v-16
	.byte		N24   , Gs4 , v084
	.byte	W48
	.byte		PAN   , c_v+16
	.byte		N24   
	.byte	W48
@ 001   ----------------------------------------
	.byte	W48
	.byte		PAN   , c_v-16
	.byte		N24   
	.byte	W48
@ 002   ----------------------------------------
	.byte	W24
	.byte		PAN   , c_v+16
	.byte		N24   
	.byte	W24
	.byte		PAN   , c_v-16
	.byte		N24   
	.byte	W48
@ 003   ----------------------------------------
	.byte		PAN   , c_v+16
	.byte		N24   
	.byte	W96
@ 004   ----------------------------------------
	.byte		VOICE , 56
	.byte	W24
	.byte		PAN   , c_v-10
	.byte	W12
	.byte		N36   , Cs4 , v112
	.byte	W36
	.byte		N12   , Dn4 
	.byte	W24
@ 005   ----------------------------------------
	.byte	W36
	.byte		N36   , Gs3 
	.byte	W36
	.byte		N12   , An3 
	.byte	W24
@ 006   ----------------------------------------
	.byte	W36
	.byte		N36   , Cs3 
	.byte	W36
	.byte		N12   , Dn3 
	.byte	W24
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W18
	.byte		        Ds4 
	.byte	W12
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W36
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W24
	.byte		        En3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W72
@ 012   ----------------------------------------
	.byte	W18
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W12
@ 013   ----------------------------------------
	.byte	W06
	.byte		        An3 
	.byte	W90
@ 014   ----------------------------------------
	.byte		VOICE , 60
	.byte		PAN   , c_v+0
	.byte		TIE   , Cs2 , v104
	.byte	W96
@ 015   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An2 
	.byte	W16
	.byte		N08   , Gs2 
	.byte	W08
@ 016   ----------------------------------------
	.byte		N96   , Bn2 
	.byte	W96
@ 017   ----------------------------------------
regi_trio_2_017:
	.byte		N64   , An2 , v104
	.byte	W64
	.byte		N08   , Gs2 
	.byte	W08
	.byte		N16   , Fs2 
	.byte	W16
	.byte		N08   , An2 
	.byte	W08
	.byte	PEND
@ 018   ----------------------------------------
	.byte		N96   , Gs2 
	.byte	W96
@ 019   ----------------------------------------
	.byte		        Cs2 
	.byte	W96
@ 020   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte		TIE   , Dn2 
	.byte	W96
@ 021   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , As2 
	.byte	W16
	.byte		N08   , An2 
	.byte	W08
@ 022   ----------------------------------------
	.byte		N96   , Cn3 
	.byte	W96
@ 023   ----------------------------------------
	.byte		N64   , As2 
	.byte	W64
	.byte		N08   , An2 
	.byte	W08
	.byte		N16   , Gn2 
	.byte	W16
	.byte		N08   , As2 
	.byte	W08
@ 024   ----------------------------------------
	.byte		N96   , An2 
	.byte	W96
@ 025   ----------------------------------------
	.byte		        Dn3 
	.byte	W96
@ 026   ----------------------------------------
regi_trio_2_026:
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , Ds3 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
	.byte	PEND
@ 027   ----------------------------------------
	.byte		        61*regi_trio_mvl/mxv
	.byte		N96   , Cn3 
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 028   ----------------------------------------
	.byte		N12   , Dn3 , v112
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_2_026
@ 031   ----------------------------------------
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , Gn3 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 032   ----------------------------------------
	.byte		N12   , Fs3 , v112
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte		TIE   , Cs2 , v104
	.byte	W96
@ 035   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An2 
	.byte	W16
	.byte		N08   , Gs2 
	.byte	W08
@ 036   ----------------------------------------
	.byte		N96   , Bn2 
	.byte	W96
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_2_017
@ 038   ----------------------------------------
	.byte		N96   , Gs2 , v104
	.byte	W96
@ 039   ----------------------------------------
	.byte		        Cs2 
	.byte	W96
@ 040   ----------------------------------------
	.byte		PAN   , c_v+0
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

regi_trio_3:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 36
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		N08   , Cs0 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An0 
	.byte	W08
	.byte		        Gs0 
	.byte	W08
	.byte		        Cs1 
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Gs1 
	.byte	W08
@ 001   ----------------------------------------
	.byte		        Cs2 
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An2 
	.byte	W08
	.byte		        Gs2 
	.byte	W08
	.byte		        Cs1 
	.byte	W08
	.byte		        Gs0 
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        Bn0 
	.byte	W08
	.byte		        Cn1 
	.byte	W08
@ 002   ----------------------------------------
regi_trio_3_002:
	.byte		N08   , Cs1 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Gs1 
	.byte	W08
	.byte		        Cs1 
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Gs1 
	.byte	W08
	.byte	PEND
@ 003   ----------------------------------------
regi_trio_3_003:
	.byte		N08   , Cs1 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Gs1 
	.byte	W08
	.byte		        Cs1 
	.byte	W08
	.byte		        Gs0 
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        Bn0 
	.byte	W08
	.byte		        Cn1 
	.byte	W08
	.byte	PEND
@ 004   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 005   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 006   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 007   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 008   ----------------------------------------
regi_trio_3_008:
	.byte		N08   , Dn1 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Dn1 
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte	PEND
@ 009   ----------------------------------------
regi_trio_3_009:
	.byte		N08   , Dn1 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Dn1 
	.byte	W08
	.byte		        An0 
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        Cn1 
	.byte	W08
	.byte		        Cs1 
	.byte	W08
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 011   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 012   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 013   ----------------------------------------
	.byte		N08   , Dn1 , v120
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Dn1 
	.byte	W08
	.byte		        Dn2 
	.byte	W08
	.byte		        Ds2 
	.byte	W08
	.byte		        As1 
	.byte	W08
	.byte		        Ds2 
	.byte	W08
	.byte		        Cs2 
	.byte	W08
@ 014   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 017   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 018   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 019   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 020   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 021   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 022   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 023   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 026   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 031   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 032   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_008
@ 033   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_009
@ 034   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_3_003
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

regi_trio_4:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 6
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N08   , Cs5 , v068
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An5 
	.byte	W08
	.byte		        Gs5 
	.byte	W08
	.byte		        Cs3 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
@ 001   ----------------------------------------
regi_trio_4_001:
	.byte		N08   , Cs4 , v068
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs5 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An5 
	.byte	W08
	.byte		        Gs5 
	.byte	W08
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_001
@ 003   ----------------------------------------
regi_trio_4_003:
	.byte		N08   , Cs4 , v068
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte	PEND
@ 004   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 005   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 006   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 007   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 008   ----------------------------------------
regi_trio_4_008:
	.byte		N08   , Dn4 , v068
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte	PEND
@ 009   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 010   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 011   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 012   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 014   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 015   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 017   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 018   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 019   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 020   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 021   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 022   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 023   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 026   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 031   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_008
@ 032   ----------------------------------------
	.byte		VOICE , 5
	.byte		PAN   , c_v+48
	.byte		N08   , Dn3 , v068
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Cs3 , v064
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Cn3 
	.byte	W08
	.byte		        Fn3 , v060
	.byte	W08
	.byte		        Bn2 
	.byte	W08
	.byte		        En3 , v056
	.byte	W08
	.byte		        As2 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        An2 , v052
	.byte	W08
	.byte		        Cs3 
	.byte	W08
@ 033   ----------------------------------------
	.byte		        Gs2 , v048
	.byte	W08
	.byte		        Cn3 
	.byte	W08
	.byte		        Gn2 
	.byte	W08
	.byte		        Bn2 , v044
	.byte	W08
	.byte		        Fs2 
	.byte	W08
	.byte		        As2 , v040
	.byte	W08
	.byte		        Fn2 
	.byte	W08
	.byte		        An2 , v036
	.byte	W08
	.byte		        En2 
	.byte	W08
	.byte		        Gs2 
	.byte	W08
	.byte		        Ds2 , v032
	.byte	W08
	.byte		        Gn2 
	.byte	W08
@ 034   ----------------------------------------
	.byte		VOICE , 6
	.byte		PAN   , c_v+0
	.byte		N08   , Cs4 , v068
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_4_003
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

regi_trio_5:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 7
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+48
	.byte		BEND  , c_v-2
	.byte	W08
	.byte		N08   , Cs5 , v040
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An5 
	.byte	W08
	.byte		        Gs5 
	.byte	W08
	.byte		        Cs3 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An3 
	.byte	W08
@ 001   ----------------------------------------
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs5 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An5 
	.byte	W08
@ 002   ----------------------------------------
	.byte		        Gs5 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs5 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An5 
	.byte	W08
@ 003   ----------------------------------------
	.byte		        Gs5 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
@ 004   ----------------------------------------
regi_trio_5_004:
	.byte		N08   , Gs4 , v040
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 008   ----------------------------------------
regi_trio_5_008:
	.byte		N08   , Gs4 , v040
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte	PEND
@ 009   ----------------------------------------
regi_trio_5_009:
	.byte		N08   , An4 , v040
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 011   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 012   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 013   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 014   ----------------------------------------
	.byte		N08   , An4 , v040
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
@ 015   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 016   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 018   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 019   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_008
@ 021   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 022   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 023   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 025   ----------------------------------------
	.byte		N08   , An4 , v040
	.byte	W08
	.byte		N12   , Dn4 
	.byte	W16
	.byte		N12   
	.byte	W16
	.byte		N08   , As4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte		        Dn4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        As4 
	.byte	W08
@ 026   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 029   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_009
@ 031   ----------------------------------------
	.byte		VOICE , 82
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N12   , As2 , v080
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W04
	.byte		VOICE , 83
	.byte		N12   
	.byte	W04
	.byte		VOL   , 66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte		N12   
	.byte	W08
	.byte		VOL   , 72*regi_trio_mvl/mxv
	.byte	W04
	.byte		N12   
	.byte	W04
	.byte		VOL   , 74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte		N12   
	.byte	W08
	.byte		VOL   , 81*regi_trio_mvl/mxv
	.byte	W04
	.byte		N12   
	.byte	W04
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte	W08
	.byte		N12   
	.byte	W12
	.byte		N12   
	.byte	W12
@ 032   ----------------------------------------
	.byte		VOICE , 4
	.byte		PAN   , c_v-48
	.byte		N08   , An4 , v068
	.byte	W08
	.byte		        Dn5 
	.byte	W08
	.byte		        Gs4 , v064
	.byte	W08
	.byte		        Cs5 
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Cn5 , v060
	.byte	W08
	.byte		        Fs4 
	.byte	W08
	.byte		        Bn4 , v056
	.byte	W08
	.byte		        Fn4 
	.byte	W08
	.byte		        As4 
	.byte	W08
	.byte		        En4 , v052
	.byte	W08
	.byte		        Gs4 
	.byte	W08
@ 033   ----------------------------------------
	.byte		        Ds4 , v048
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Dn4 
	.byte	W08
	.byte		        Fs4 , v044
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Fn4 , v040
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        En4 , v036
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        As3 , v032
	.byte	W08
	.byte		        Dn4 
	.byte	W08
@ 034   ----------------------------------------
	.byte		PAN   , c_v+48
	.byte	W08
	.byte		VOICE , 7
	.byte		N08   , Cs4 , v040
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        An4 
	.byte	W08
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_5_004
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

regi_trio_6:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 81
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-1
	.byte		N06   , Gs4 , v056
	.byte	W48
	.byte		N06   
	.byte	W48
@ 001   ----------------------------------------
	.byte	W48
	.byte		N06   
	.byte	W48
@ 002   ----------------------------------------
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W48
@ 003   ----------------------------------------
	.byte		N06   
	.byte	W96
@ 004   ----------------------------------------
	.byte	W36
	.byte		        Cs4 
	.byte	W36
	.byte		        Dn4 
	.byte	W24
@ 005   ----------------------------------------
	.byte	W36
	.byte		        Gs3 
	.byte	W36
	.byte		        An3 
	.byte	W24
@ 006   ----------------------------------------
	.byte	W36
	.byte		        Cs3 
	.byte	W36
	.byte		        Dn3 
	.byte	W24
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W18
	.byte		        Ds4 
	.byte	W12
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W36
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W24
	.byte		        En3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W72
@ 012   ----------------------------------------
	.byte	W18
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W12
@ 013   ----------------------------------------
	.byte	W06
	.byte		        An3 
	.byte	W90
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

regi_trio_7:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		N24   , Cn2 , v120
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        Bn1 
	.byte	W24
@ 001   ----------------------------------------
regi_trio_7_001:
	.byte		N24   , Cn2 , v120
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        Bn1 
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_001
@ 003   ----------------------------------------
	.byte		N24   , Cn2 , v120
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N36   , An2 , v100
	.byte	W48
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W72
	.byte		N16   , Dn1 , v116
	.byte	W16
	.byte		N08   
	.byte	W08
@ 020   ----------------------------------------
regi_trio_7_020:
	.byte	W24
	.byte		N24   , Dn1 , v116
	.byte	W48
	.byte		N24   
	.byte	W24
	.byte	PEND
@ 021   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 022   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 023   ----------------------------------------
regi_trio_7_023:
	.byte	W24
	.byte		N24   , Dn1 , v116
	.byte	W48
	.byte		N16   
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte	PEND
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 025   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 026   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 029   ----------------------------------------
	.byte	W24
	.byte		N24   , Dn1 , v116
	.byte	W40
	.byte		N16   
	.byte	W16
	.byte		N16   
	.byte	W16
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 031   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W72
	.byte		N24   , Dn1 , v116
	.byte	W24
@ 034   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_023
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_7_020
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

regi_trio_8:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 47
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+10
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
regi_trio_8_004:
	.byte		N24   , Cn2 , v116
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        Bn1 
	.byte	W24
	.byte	PEND
@ 005   ----------------------------------------
regi_trio_8_005:
	.byte		N24   , Cn2 , v116
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        Cs2 
	.byte	W24
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_005
@ 008   ----------------------------------------
regi_trio_8_008:
	.byte		N48   , Cn2 , v116
	.byte	W48
	.byte		N48   
	.byte	W48
	.byte	PEND
@ 009   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_008
@ 010   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_008
@ 011   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_008
@ 012   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_008
@ 013   ----------------------------------------
	.byte		N48   , Cn2 , v116
	.byte	W48
	.byte		N24   
	.byte	W32
	.byte		N08   , An1 
	.byte	W08
	.byte		        As1 
	.byte	W08
@ 014   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 015   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 016   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 018   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_004
@ 019   ----------------------------------------
	.byte		N24   , Cn2 , v116
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W48
@ 020   ----------------------------------------
regi_trio_8_020:
	.byte		N24   , Cn2 , v116
	.byte	W48
	.byte		N24   
	.byte	W48
	.byte	PEND
@ 021   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 022   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 023   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 025   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 026   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 029   ----------------------------------------
	.byte		N24   , Cn2 , v116
	.byte	W48
	.byte		N16   
	.byte	W48
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 031   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 032   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_008
@ 033   ----------------------------------------
	.byte		N48   , Cn2 , v116
	.byte	W48
	.byte		N24   
	.byte	W48
@ 034   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_8_020
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 9 (Midi-Chn.9) ****************@

regi_trio_9:
	.byte		VOL   , 127*regi_trio_mvl/mxv
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+42
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W48
	.byte		BEND  , c_v-2
	.byte	W12
	.byte		N36   , Cs4 , v028
	.byte	W36
@ 005   ----------------------------------------
	.byte		N12   , Dn4 
	.byte	W60
	.byte		N36   , Gs3 
	.byte	W36
@ 006   ----------------------------------------
	.byte		N12   , An3 
	.byte	W60
	.byte		N36   , Cs3 
	.byte	W36
@ 007   ----------------------------------------
	.byte		N12   , Dn3 
	.byte	W96
@ 008   ----------------------------------------
	.byte	W24
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W06
@ 009   ----------------------------------------
	.byte	W12
	.byte		        Ds4 
	.byte	W84
@ 010   ----------------------------------------
	.byte	W60
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W12
	.byte		        En3 
	.byte	W18
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W48
@ 012   ----------------------------------------
	.byte	W42
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W06
@ 013   ----------------------------------------
	.byte	W12
	.byte		        Cn4 
	.byte	W18
	.byte		        An3 
	.byte	W66
@ 014   ----------------------------------------
	.byte		BEND  , c_v+0
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	FINE

@**************** Track 10 (Midi-Chn.11) ****************@

regi_trio_10:
	.byte		VOL   , 127*regi_trio_mvl/mxv
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W36
	.byte		N06   , Cs4 , v056
	.byte	W36
	.byte		        Dn4 
	.byte	W24
@ 005   ----------------------------------------
	.byte	W36
	.byte		        Gs3 
	.byte	W36
	.byte		        An3 
	.byte	W24
@ 006   ----------------------------------------
	.byte	W36
	.byte		        Cs3 
	.byte	W36
	.byte		        Dn3 
	.byte	W24
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W18
	.byte		        Ds4 
	.byte	W12
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W36
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W24
	.byte		        En3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W72
@ 012   ----------------------------------------
	.byte	W18
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W12
@ 013   ----------------------------------------
	.byte	W06
	.byte		        An3 
	.byte	W90
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	W24
	.byte	FINE

@**************** Track 11 (Midi-Chn.10) ****************@

regi_trio_11:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		N24   , Cn1 , v124
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        An2 
	.byte	W24
@ 001   ----------------------------------------
regi_trio_11_001:
	.byte		N24   , Cn1 , v124
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		N24   
	.byte	W24
	.byte		        An2 
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_001
@ 003   ----------------------------------------
	.byte		N24   , Cn1 , v124
	.byte		N96   , Cs2 
	.byte	W24
	.byte		N24   , Cn1 
	.byte	W24
	.byte		N36   , An2 
	.byte	W48
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W72
	.byte		N16   , Dn1 , v127
	.byte	W16
	.byte		N08   
	.byte	W08
@ 020   ----------------------------------------
regi_trio_11_020:
	.byte		N24   , Cn1 , v127
	.byte		N96   , Cs2 , v124
	.byte	W24
	.byte		N24   , Dn1 , v127
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte	PEND
@ 021   ----------------------------------------
regi_trio_11_021:
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N18   , Cn1 
	.byte	W18
	.byte		N06   
	.byte	W06
	.byte		N24   , Dn1 
	.byte	W24
	.byte	PEND
@ 022   ----------------------------------------
regi_trio_11_022:
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte	PEND
@ 023   ----------------------------------------
regi_trio_11_023:
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N18   , Cn1 
	.byte	W18
	.byte		N06   
	.byte	W06
	.byte		N16   , Dn1 
	.byte	W16
	.byte		N08   
	.byte	W08
	.byte	PEND
@ 024   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 025   ----------------------------------------
regi_trio_11_025:
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N18   , Cn1 
	.byte	W18
	.byte		N06   
	.byte	W06
	.byte		N24   , Dn1 
	.byte		N24   , An2 
	.byte	W24
	.byte	PEND
@ 026   ----------------------------------------
regi_trio_11_026:
	.byte		N24   , Cn1 , v124
	.byte		N96   , Cs2 
	.byte	W24
	.byte		N24   , Dn1 
	.byte	W24
	.byte		        Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte	PEND
@ 027   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_021
@ 028   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 029   ----------------------------------------
regi_trio_11_029:
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N08   , Cn1 
	.byte	W08
	.byte		N08   
	.byte	W08
	.byte		N16   , Dn1 
	.byte	W16
	.byte		N16   
	.byte	W16
	.byte	PEND
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 031   ----------------------------------------
	.byte		N24   , Cn1 , v127
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N18   , Cn1 
	.byte	W18
	.byte		N06   
	.byte	W06
	.byte		N12   , Dn1 
	.byte	W12
	.byte		N12   
	.byte	W12
@ 032   ----------------------------------------
regi_trio_11_032:
	.byte		N24   , Cn1 , v127
	.byte		N96   , Cs2 
	.byte		N16   , Dn2 
	.byte	W24
	.byte		N24   , Cn1 
	.byte		N08   , Cn2 
	.byte	W08
	.byte		        Bn1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		N24   , Cn1 
	.byte		N08   , Bn1 
	.byte	W08
	.byte		        An1 
	.byte	W08
	.byte		        Gn1 
	.byte	W08
	.byte		N24   , Cn1 
	.byte		N08   , An1 
	.byte	W08
	.byte		        Gn1 
	.byte	W08
	.byte		        Fn1 
	.byte	W08
	.byte	PEND
@ 033   ----------------------------------------
regi_trio_11_033:
	.byte		N08   , Cn2 , v127
	.byte	W08
	.byte		        Bn1 
	.byte	W08
	.byte		N16   , An1 
	.byte	W16
	.byte		        Bn1 , v124
	.byte	W16
	.byte		N08   , An1 
	.byte	W08
	.byte		        Gn1 
	.byte	W08
	.byte		        Fn1 
	.byte	W08
	.byte		N24   , Dn1 
	.byte		N04   , Bn1 
	.byte	W04
	.byte		        An1 
	.byte	W04
	.byte		        Gn1 
	.byte	W04
	.byte		        Cn1 
	.byte		N04   , Fn1 
	.byte	W04
	.byte		        Cn1 
	.byte		N04   , Fn1 
	.byte	W04
	.byte		        Cn1 
	.byte		N04   , Fn1 
	.byte	W04
	.byte	PEND
@ 034   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_020
@ 035   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_021
@ 036   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_023
@ 038   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 039   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_025
@ 040   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_026
@ 041   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_021
@ 042   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 043   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_029
@ 044   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_022
@ 045   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_021
@ 046   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_032
@ 047   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_033
@ 048   ----------------------------------------
	.byte	W24
	.byte		N24   , Dn1 , v124
	.byte	W48
	.byte		        Dn1 , v127
	.byte	W24
@ 049   ----------------------------------------
regi_trio_11_049:
	.byte	W24
	.byte		N24   , Dn1 , v127
	.byte	W48
	.byte		N24   
	.byte	W24
	.byte	PEND
@ 050   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_049
@ 051   ----------------------------------------
	.byte	W24
	.byte		N24   , Dn1 , v127
	.byte	W48
	.byte		N16   
	.byte	W16
	.byte		N08   
	.byte	W08
@ 052   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_049
@ 053   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_11_049
@ 054   ----------------------------------------
	.byte	W48
	.byte	FINE

@**************** Track 12 (Midi-Chn.12) ****************@

regi_trio_12:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N08   , Cs4 , v116
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        As3 
	.byte	W08
@ 001   ----------------------------------------
	.byte		        An3 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        An3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
@ 002   ----------------------------------------
	.byte		        Fn3 
	.byte	W08
	.byte		        Cn3 
	.byte	W08
	.byte		        Fn3 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        Bn2 
	.byte	W08
	.byte		        En3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        As2 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
	.byte		        An2 
	.byte	W08
	.byte		        Dn3 
	.byte	W08
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W48
	.byte		PAN   , c_v-48
	.byte		BEND  , c_v-2
	.byte	W12
	.byte		N36   , Cs4 , v028
	.byte	W36
@ 005   ----------------------------------------
	.byte		N12   , Dn4 
	.byte	W60
	.byte		N36   , Gs3 
	.byte	W36
@ 006   ----------------------------------------
	.byte		N12   , An3 
	.byte	W60
	.byte		N36   , Cs3 
	.byte	W36
@ 007   ----------------------------------------
	.byte		N12   , Dn3 
	.byte	W96
@ 008   ----------------------------------------
	.byte	W24
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W18
	.byte		        Cn4 
	.byte	W06
@ 009   ----------------------------------------
	.byte	W12
	.byte		        Ds4 
	.byte	W84
@ 010   ----------------------------------------
	.byte	W60
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Gs3 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W12
	.byte		        En3 
	.byte	W18
	.byte		        As3 
	.byte	W18
	.byte		        En3 
	.byte	W48
@ 012   ----------------------------------------
	.byte	W42
	.byte		        Fn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Ds4 
	.byte	W24
	.byte		        An3 
	.byte	W06
@ 013   ----------------------------------------
	.byte	W12
	.byte		        Cn4 
	.byte	W18
	.byte		        An3 
	.byte	W66
@ 014   ----------------------------------------
	.byte		PAN   , c_v-10
	.byte		BEND  , c_v+0
	.byte		TIE   , Cs3 , v104
	.byte	W96
@ 015   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An3 
	.byte	W16
	.byte		N08   , Gs3 
	.byte	W08
@ 016   ----------------------------------------
	.byte		N96   , Bn3 
	.byte	W96
@ 017   ----------------------------------------
regi_trio_12_017:
	.byte		N64   , An3 , v104
	.byte	W64
	.byte		N08   , Gs3 
	.byte	W08
	.byte		N16   , Fs3 
	.byte	W16
	.byte		N08   , An3 
	.byte	W08
	.byte	PEND
@ 018   ----------------------------------------
	.byte		N96   , Gs3 
	.byte	W96
@ 019   ----------------------------------------
	.byte		        Cs3 
	.byte	W96
@ 020   ----------------------------------------
	.byte		PAN   , c_v-10
	.byte		TIE   , Dn3 
	.byte	W96
@ 021   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , As3 
	.byte	W16
	.byte		N08   , An3 
	.byte	W08
@ 022   ----------------------------------------
	.byte		N96   , Cn4 
	.byte	W96
@ 023   ----------------------------------------
	.byte		N64   , As3 
	.byte	W64
	.byte		N08   , An3 
	.byte	W08
	.byte		N16   , Gn3 
	.byte	W16
	.byte		N08   , As3 
	.byte	W08
@ 024   ----------------------------------------
	.byte		N96   , An3 
	.byte	W96
@ 025   ----------------------------------------
	.byte		        Dn4 
	.byte	W96
@ 026   ----------------------------------------
regi_trio_12_026:
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , As2 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
	.byte	PEND
@ 027   ----------------------------------------
	.byte		        61*regi_trio_mvl/mxv
	.byte		N96   , Gn2 
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 028   ----------------------------------------
	.byte		N12   , Fs2 , v112
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_12_026
@ 031   ----------------------------------------
	.byte		VOL   , 61*regi_trio_mvl/mxv
	.byte		N96   , Ds3 , v104
	.byte	W08
	.byte		VOL   , 65*regi_trio_mvl/mxv
	.byte	W08
	.byte		        66*regi_trio_mvl/mxv
	.byte	W08
	.byte		        69*regi_trio_mvl/mxv
	.byte	W08
	.byte		        72*regi_trio_mvl/mxv
	.byte	W08
	.byte		        74*regi_trio_mvl/mxv
	.byte	W08
	.byte		        78*regi_trio_mvl/mxv
	.byte	W08
	.byte		        81*regi_trio_mvl/mxv
	.byte	W08
	.byte		        85*regi_trio_mvl/mxv
	.byte	W32
@ 032   ----------------------------------------
	.byte		N12   , Dn3 , v112
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte		TIE   , Cs3 , v104
	.byte	W96
@ 035   ----------------------------------------
	.byte	W72
	.byte		EOT   
	.byte		N16   , An3 
	.byte	W16
	.byte		N08   , Gs3 
	.byte	W08
@ 036   ----------------------------------------
	.byte		N96   , Bn3 
	.byte	W96
@ 037   ----------------------------------------
	.byte	PATT
	 .word	regi_trio_12_017
@ 038   ----------------------------------------
	.byte		N96   , Gs3 , v104
	.byte	W96
@ 039   ----------------------------------------
	.byte		        Cs3 
	.byte	W96
@ 040   ----------------------------------------
	.byte		PAN   , c_v-10
	.byte	FINE

@**************** Track 13 (Midi-Chn.13) ****************@

regi_trio_13:
	.byte	KEYSH , regi_trio_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 85*regi_trio_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N08   , Cs5 , v116
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Cs5 
	.byte	W08
	.byte		        Cn5 
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Cn5 
	.byte	W08
	.byte		        Bn4 
	.byte	W08
	.byte		        Fs4 
	.byte	W08
	.byte		        Bn4 
	.byte	W08
	.byte		        As4 
	.byte	W08
	.byte		        Fn4 
	.byte	W08
	.byte		        As4 
	.byte	W08
@ 001   ----------------------------------------
	.byte		        An4 
	.byte	W08
	.byte		        En4 
	.byte	W08
	.byte		        An4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Dn4 
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Fs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Fs4 
	.byte	W08
@ 002   ----------------------------------------
	.byte		        Fn4 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Fn4 
	.byte	W08
	.byte		        En4 
	.byte	W08
	.byte		        Bn3 
	.byte	W08
	.byte		        En4 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        Dn4 
	.byte	W08
	.byte		        An3 
	.byte	W08
	.byte		        Dn4 
	.byte	W08
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

regi_trio:
	.byte	13	@ NumTrks
	.byte	0	@ NumBlks
	.byte	regi_trio_pri	@ Priority
	.byte	regi_trio_rev	@ Reverb.

	.word	regi_trio_grp

	.word	regi_trio_1
	.word	regi_trio_2
	.word	regi_trio_3
	.word	regi_trio_4
	.word	regi_trio_5
	.word	regi_trio_6
	.word	regi_trio_7
	.word	regi_trio_8
	.word	regi_trio_9
	.word	regi_trio_10
	.word	regi_trio_11
	.word	regi_trio_12
	.word	regi_trio_13

	.end
