#ifndef POKEHEARTGOLD_HEAP_H
#define POKEHEARTGOLD_HEAP_H

#include "global.h"

typedef enum HeapID {
    HEAP_ID_DEFAULT,
    HEAP_ID_1,
    HEAP_ID_2,
    HEAP_ID_3,
    HEAP_ID_4,
    HEAP_ID_BATTLE,
    HEAP_ID_6,
    HEAP_ID_7,
    HEAP_ID_8,
    HEAP_ID_9,
    HEAP_ID_10,
    HEAP_ID_FIELD,
    HEAP_ID_PARTY_MENU,
    HEAP_ID_20 = 20,
    HEAP_ID_26 = 26,
    HEAP_ID_30 = 30,
    HEAP_ID_32 = 32,
    HEAP_ID_OPTIONS_APP = 38,
    HEAP_ID_OV55 = 40,
    HEAP_ID_CHOOSE_STARTER = 46,
    HEAP_ID_EVOLUTION = 71,
    HEAP_ID_CREDITS = 73,
    HEAP_ID_CERTIFICATES = 82,
    HEAP_ID_89 = 89,
    HEAP_ID_ALPH_PUZZLE = 97,
    HEAP_ID_GAME_BOARD = 110,
    HEAP_ID_BERRY_POTS = 130,
    HEAP_ID_BERRY_POTS_APP = 131,
    HEAP_ID_VOLTORB_FLIP = 160
} HeapID;

typedef struct HeapParam {
    u32 size;         // maximum size of the heap
    OSArenaId arena;  // where to allocate the heap from
} HEAP_PARAM;

void InitHeapSystem(const HEAP_PARAM *templates, u32 nTemplates, u32 totalNumHeaps, u32 pre_size);
BOOL CreateHeap(HeapID parent, HeapID child, u32 size);
BOOL CreateHeapAtEnd(HeapID parent, HeapID child, u32 size);
void DestroyHeap(HeapID heapId);
void * AllocFromHeap(HeapID heapId, u32 size);
void * AllocFromHeapAtEnd(HeapID heapId, u32 size);
void FreeToHeap(void * ptr);
void FreeToHeapExplicit(HeapID heapId, void * ptr);
u32 GF_ExpHeap_FndGetTotalFreeSize(HeapID heapId);
void GF_ExpHeap_FndInitAllocator(NNSFndAllocator * pAllocator, HeapID heapId, int alignment);
void ReallocFromHeap(void *ptr, u32 newSize);
BOOL GF_heap_c_dummy_return_true(HeapID heapId);

#endif //POKEHEARTGOLD_HEAP_H
