    .include "macros/btlcmd.inc"

    .data

_000:
    TryRestoreStatusOnSwitch BATTLER_CATEGORY_PLAYER_SLOT_1, _TRY_RESTORE_SLOT_2
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_PLAYER_SLOT_1, BMON_DATA_STATUS, STATUS_NONE

_TRY_RESTORE_SLOT_2:
    TryRestoreStatusOnSwitch BATTLER_CATEGORY_PLAYER_SLOT_2, _AFTER_RESTORE
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_PLAYER_SLOT_2, BMON_DATA_STATUS, STATUS_NONE

_AFTER_RESTORE:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_TRAINER, _PAY_DAY_PICKUP
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_TRAINER|BATTLE_TYPE_DOUBLES|BATTLE_TYPE_LINK|BATTLE_TYPE_MULTI|BATTLE_TYPE_FRONTIER, _PLAY_WIN_MUSIC
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_LINK, _LINK_WIN_LOSE
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_MULTI, _MULTI_BATTLE_WIN
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_TAG, _MULTI_BATTLE_WIN
    // Player defeated {0} {1}!
    PrintMessage msg_0197_00839, TAG_TRCLASS_TRNAME, BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_CATEGORY_ENEMY_SLOT_1
    Wait 
    WaitButtonABTime 15
    TrainerSlideIn BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_TYPE_SOLO_ENEMY
    Wait 
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_DOUBLES, _TRAINER_LOSE_MSG_MULTI
    PrintTrainerMessage BATTLER_CATEGORY_ENEMY_SLOT_1, TRAINER_MESSAGE_LOSE
    Wait 
    WaitButtonABTime 60
    GoTo _AFTER_LOSE_MSG

_TRAINER_LOSE_MSG_MULTI:
    PrintTrainerMessage BATTLER_CATEGORY_ENEMY_SLOT_1, TRAINER_MESSAGE_LOSE_1
    Wait 
    WaitButtonABTime 60
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_FRONTIER, _AFTER_LOSE_MSG
    PrintTrainerMessage BATTLER_CATEGORY_ENEMY_SLOT_1, TRAINER_MESSAGE_LOSE_2
    Wait 
    WaitButtonABTime 60
    GoTo _AFTER_LOSE_MSG

_PLAY_WIN_MUSIC:
    PlayBGM BATTLER_CATEGORY_PLAYER_SLOT_1, SEQ_GS_WIN1

_MULTI_BATTLE_WIN:
    // Player beat {0} {1} and {2} {3}!
    PrintMessage msg_0197_00953, TAG_TRCLASS_TRNAME_TRCLASS_TRNAME, BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_CATEGORY_ENEMY_SLOT_2, BATTLER_CATEGORY_ENEMY_SLOT_2
    Wait 
    WaitButtonABTime 15
    TrainerSlideIn BATTLER_CATEGORY_ENEMY_SLOT_1, BATTLER_TYPE_SOLO_ENEMY
    Wait 
    PrintTrainerMessage BATTLER_CATEGORY_ENEMY_SLOT_1, TRAINER_MESSAGE_LOSE
    Wait 
    WaitButtonABTime 30
    TrainerSlideOut BATTLER_CATEGORY_ENEMY_SLOT_1
    Wait 
    TrainerSlideIn BATTLER_CATEGORY_ENEMY_SLOT_2, BATTLER_TYPE_SOLO_ENEMY
    Wait 
    PrintTrainerMessage BATTLER_CATEGORY_ENEMY_SLOT_2, TRAINER_MESSAGE_LOSE
    Wait 
    WaitButtonABTime 60
    SetLinkBattleResult 

_AFTER_LOSE_MSG:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_FRONTIER, _FADE_OUT
    PayPrizeMoney 
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, 1, _PRIZE_MONEY_MOM
    // {0} got ${1} for winning!
    PrintMessage msg_0197_00033, TAG_TRNAME_NUM, BATTLER_CATEGORY_PLAYER, BATTLER_CATEGORY_MSG_TEMP
    GoTo _WAIT_PRIZE_MONEY

_PRIZE_MONEY_MOM:
    // {0} got ${1} for winning! Sent some to Mom!
    PrintMessage msg_0197_01275, TAG_TRNAME_NUM, BATTLER_CATEGORY_PLAYER, BATTLER_CATEGORY_MSG_TEMP

_WAIT_PRIZE_MONEY:
    Wait 
    WaitButtonABTime 60

_PAY_DAY_PICKUP:
    GenerateEndOfBattleItem 
    AddPayDayMoney 
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MESSAGE, 0, _FADE_OUT
    // {0} picked up ${1}!
    PrintMessage msg_0197_00341, TAG_TRNAME_NUM, BATTLER_CATEGORY_PLAYER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 60

_FADE_OUT:
    FadeOutBattle 
    Wait 
    End 

_LINK_WIN_LOSE:
    Call BATTLE_SUBSCRIPT_LINK_WIN_LOSE
    End 
