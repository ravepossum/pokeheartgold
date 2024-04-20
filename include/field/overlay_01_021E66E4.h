#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H

#include "heap.h"
#include "sys_task.h"

typedef struct UnkStruct_Overlay01_021E66E4_subC UnkStruct_Overlay01_021E66E4_subC;

typedef struct UnkStruct_Overlay01_021E67BC_template {
    int taskPriority;
    u16 dataSize;
    void (*initFunc)(UnkStruct_Overlay01_021E66E4_subC *a0, u32 a1, void *a2);
    void (*destroyFunc)(UnkStruct_Overlay01_021E66E4_subC *a0, u32 a1, void *a2);
} UnkStruct_Overlay01_021E67BC_template;

struct UnkStruct_Overlay01_021E66E4_subC {
    BOOL inUse;
    SysTask *unk_04;
    SysTask *unk_08;
    const UnkStruct_Overlay01_021E67BC_template *unk_0C;
    void *unk_10;
};

typedef struct UnkStruct_Overlay01_021E66E4 {
    u32 unk_00;
    HeapID heapId;
    int unk_08;
    UnkStruct_Overlay01_021E66E4_subC *unk_0C;
    SysTaskQueue *unk_10;
} UnkStruct_Overlay01_021E66E4;

UnkStruct_Overlay01_021E66E4 *ov01_021E66E4(u32 a0, HeapID heapId, int num);
UnkStruct_Overlay01_021E66E4_subC *ov01_021E67BC(UnkStruct_Overlay01_021E66E4 *a0, const UnkStruct_Overlay01_021E67BC_template *a1);  // Create
void ov01_021E683C(UnkStruct_Overlay01_021E66E4_subC *a0);  // Destroy
void *ov01_021E687C(UnkStruct_Overlay01_021E66E4_subC *a0);  // GetData

#endif //POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
