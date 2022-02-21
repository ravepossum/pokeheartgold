#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0201.h"
#include "msgdata/msg/msg_0456_T02R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02R0201_000
	scrdef scr_seq_T02R0201_001
	scrdef scr_seq_T02R0201_002
	scrdef scr_seq_T02R0201_003
	scrdef_end

scr_seq_T02R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0456_T02R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0456_T02R0201_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_SPEAROW, 0
	npc_msg msg_0456_T02R0201_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_RATTATA, 0
	npc_msg msg_0456_T02R0201_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
