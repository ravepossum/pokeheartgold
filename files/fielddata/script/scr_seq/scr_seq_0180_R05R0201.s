#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0201.h"
#include "msgdata/msg/msg_0330_R05R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0201_000
	scrdef_end

scr_seq_R05R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0330_R05R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
