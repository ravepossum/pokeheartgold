#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0201.h"
#include "msgdata/msg/msg_0478_T05R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05R0201_000
	scrdef scr_seq_T05R0201_001
	scrdef scr_seq_T05R0201_002
	scrdef scr_seq_T05R0201_003
	scrdef scr_seq_T05R0201_004
	scrdef_end

scr_seq_T05R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T05R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T05R0201_002:
	play_cry SPECIES_PSYDUCK, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	wait_cry
	end

scr_seq_T05R0201_003:
	play_cry SPECIES_NIDORINO, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	wait_cry
	end

scr_seq_T05R0201_004:
	play_cry SPECIES_PIDGEY, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	wait_cry
	end
	.balign 4, 0
