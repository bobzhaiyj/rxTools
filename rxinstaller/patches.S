@---------------------------------------------------------------------------------
@	Patch file format
@
@	0	4	Header - 'PPOR'
@	4	4	offset to index
@
@	index entry
@	0	4	Firmware revision this patch set applies to
@	8	4	Offset in file to patch set
@
@	patch set
@	0	4	Header	- 'PTCH'
@	4	4	Number of patches
@
@	for each patch
@	0	4	size of patch
@	4	4	offset in user settings to patch
@	8	...	patch data
@---------------------------------------------------------------------------------

	.arm
	.text

	.global	_start
@---------------------------------------------------------------------------------
_start:
	.word	0x524f5050
	.word	index

#define	P4_LOAD_ADDRESS		0x00279400
#define	P4_S2_LOAD_ADDRESS	0x002B0000

@---------------------------------------------------------------------------------
patch_m4x_4x_description:
@---------------------------------------------------------------------------------
	.asciz	"4.x    rxTools.dat"

@---------------------------------------------------------------------------------
patch_m4x_4x_1:
@---------------------------------------------------------------------------------

	.word	m4x_4x_1_end - m4x_4x_1_start
	.word	0

@---------------------------------------------------------------------------------
m4x_4x_1_start: @ 0x279400
@---------------------------------------------------------------------------------
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00272BAE  @ r0 "YS:"
	.word 0xBADC0DED  @ r2
	.word 0x0018F19C  @ mount_sd("YS:") -> LDMFD           SP!, {R3-R5,PC}
	.word 0x0010B690  @ r3
	.word 0x00FAB000  @ r4
	.word 0x00200200  @ r5
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00279000  @ r0
	.word 0x00000001  @ r2
	.word 0x001549E1  @ pop_r1
	.word 0x00295E0C  @ r1 Offset for the launcher path string
	.word 0x001B82AC  @ ifile_open(0x00279000, path, 1) -> LDMFD   SP!, {R4-R8,PC}
	.word 0x0018D5DC  @ r4
	.word 0x00278340  @ r5
	.word 0x00100200  @ r6
	.word 0x000048CC  @ r7
	.word 0x00143D60  @ r8
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00279000  @ r0
	.word P4_S2_LOAD_ADDRESS
	.word 0x0010538C  @ pop_r3
	.word 0x00009000  @ r3
	.word 0x001549E1  @ pop_r1
	.word 0x00279020  @ r1
	.word 0x001B3958  @ ifile_read(0x00279000, 0x00279020, 0x002B0000, 0x00009000) -> LDMFD   SP!, {R4-R9,PC}
	.word 0xDEADBEEF  @ r4
	.word 0xDEADBEEF  @ r5
	.word 0xDEADBEEF  @ r6
	.word 0xDEADBEEF  @ r7
	.word 0xDEADBEEF  @ r8
	.word 0xDEADBEEF  @ r9
	.word 0x0010538C  @ pop_r3
	.word (P4_S2_LOAD_ADDRESS - (P4_LOAD_ADDRESS + m4x_4x_1_end - m4x_4x_1_start))
	.word 0x00143D60  @ pivot -> ADD SP, SP, R3        LDR PC, [SP],#4
@---------------------------------------------------------------------------------
m4x_4x_1_end:
@---------------------------------------------------------------------------------

@---------------------------------------------------------------------------------
patch_m4x_92_description:
@---------------------------------------------------------------------------------
	.asciz	"9.x    rxTools.dat"

@---------------------------------------------------------------------------------
patch_m4x_92_1:
@---------------------------------------------------------------------------------

	.word	m4x_92_1_end - m4x_92_1_start
	.word	0

@---------------------------------------------------------------------------------
m4x_92_1_start: @ 0x279400
@---------------------------------------------------------------------------------
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00272BAE  @ r0 "YS:"
	.word 0xBADC0DED  @ r2
	.word 0x0018F19C  @ mount_sd("YS:") -> LDMFD           SP!, {R3-R5,PC}
	.word 0x0010B690  @ r3
	.word 0x00FAB000  @ r4
	.word 0x00200200  @ r5
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00279000  @ r0
	.word 0x00000001  @ r2
	.word 0x001549E1  @ pop_r1
	.word 0x00295E0C  @ r1 Offset for the launcher path string
	.word 0x001B82AC  @ ifile_open(0x00279000, path, 1) -> LDMFD   SP!, {R4-R8,PC}
	.word 0x0018D5DC  @ r4
	.word 0x00278340  @ r5
	.word 0x00100200  @ r6
	.word 0x000048CC  @ r7
	.word 0x00143D60  @ r8
	.word 0x001549E1  @ pop_r1
	.word 0x0000A000  @ r1 2nd stage offset in file
	.word 0x00143D8C  @ pop_r0
	.word 0x00279004  @ r0 handle.offset
	.word 0x0010CCBC  @ str r1, [r0] -> LDMFD   SP!, {R4,PC}
	.word 0x44444444  @ r4
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x00279000  @ r0
	.word P4_S2_LOAD_ADDRESS
	.word 0x0010538C  @ pop_r3
	.word 0xDEADBEEF  @ r3 this(or similar junk pops) has to here for patch_count1
	.word 0x0010538C  @ pop_r3
	.word 0x00009000  @ r3
	.word 0x001549E1  @ pop_r1
	.word 0x00279020  @ r1
	.word 0x001B3958  @ ifile_read(0x00279000, 0x00279020, 0x002B0000, 0x00009000) -> LDMFD   SP!, {R4-R9,PC}
	.word 0x002104E5  @ r4
	.word 0x0019DA00  @ r5
	.word 0x00017500  @ r6
	.word 0x0021DF86  @ r7
	.word 0x001AC100  @ r8
	.word 0x001DDA22  @ r9
	.word 0x0010538C  @ pop_r3
	.word (P4_S2_LOAD_ADDRESS - (P4_LOAD_ADDRESS + m4x_92_1_end - m4x_92_1_start))
	.word 0x00143D60  @ pivot -> ADD SP, SP, R3        LDR PC, [SP],#4
@---------------------------------------------------------------------------------
m4x_92_1_end:
@---------------------------------------------------------------------------------

@---------------------------------------------------------------------------------
patch_m4x_2:
@---------------------------------------------------------------------------------

	.word	m4x_2_end - m4x_2_start
	.word	0x1b4

@---------------------------------------------------------------------------------
m4x_2_start:
@---------------------------------------------------------------------------------
	.word 0x0010F2B9  @ pop_r0_r2
	.word 0x0001FE00  @ r0
	.word 0x00000100  @ r2

	.word 0x001C4FC4  @ pop_r1
	.word P4_LOAD_ADDRESS
	
	.word 0x001334FC  @ eeprom_read(0x0001FE00, 0x00279400, 0x00000100) -> LDMFD           SP!, {R4,PC}
	.word 0xFFFFFFFE  @ r4
	
	.word 0x001549B1  @ pop_r1_r3
	.word 0x001002F9  @ r1
	.word 0x00000000  @ r2
	.word P4_LOAD_ADDRESS
	
	.word 0x00143D8C  @ pop_r0
	.word 0x0000002D  @ r0
	
	.word 0x0010B690  @ SVC 8
	.word 0x002793F0  @ r1
	.word 0x002793E8  @ r4
	
	.word 0x00000000  @ ?
	
	.word 0x0019FB09  @ inf loop

@---------------------------------------------------------------------------------
m4x_2_end:
@---------------------------------------------------------------------------------

@---------------------------------------------------------------------------------
patch_count1:
@---------------------------------------------------------------------------------
	.word	2
	.word	0x70

	.hword	0x51

@---------------------------------------------------------------------------------
patch_count2:
@---------------------------------------------------------------------------------

	.word	2
	.word	0x170

	.hword	0x52

@---------------------------------------------------------------------------------
patch_message_length:
@---------------------------------------------------------------------------------

	.word	2
	.word	0x150

	.hword	0x6e

@---------------------------------------------------------------------------------
patch_m4x_4x:
@---------------------------------------------------------------------------------
	.word	0x50544348
	.word	5
	.word	patch_m4x_4x_1
	.word	patch_m4x_2
	.word	patch_count1
	.word	patch_count2
	.word	patch_message_length

@---------------------------------------------------------------------------------
patch_m4x_92:
@---------------------------------------------------------------------------------
	.word	0x50544348
	.word	5
	.word	patch_m4x_92_1
	.word	patch_m4x_2
	.word	patch_count1
	.word	patch_count2
	.word	patch_message_length

@---------------------------------------------------------------------------------
index:
@---------------------------------------------------------------------------------
	.word	patch_m4x_4x_description
	.word	patch_m4x_4x

	.word	patch_m4x_92_description
	.word	patch_m4x_92