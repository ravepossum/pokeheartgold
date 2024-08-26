#include "global.h"
#include "pokedex_language.h"
#include "unk_020912AC.h"

// this appears to be an array of game languages like
// the one in pokedex_language.c, but at this point it's
// unclear what exactly the difference is
static const u8 unk_02106060[] = {
    1,
    2,
    3,
    4,
    5,
    0,
    0,
    0
};

int sub_020912AC(int a0) {
    GF_ASSERT(a0 < 6);

    if (a0 < 6) {
        return unk_02106060[a0];
    }
    else {
        return LanguageToDexFlag(LANGUAGE_ENGLISH);
    }
}

s16 sub_020912D0(u32 a0, u32 a1) {
    u32 i;
    for (i = 0; i < 6; i++) {
        if (unk_02106060[i] == a0) {
            u32 v1 = a1 + 6;
            i += v1;
            i %= 6;
            
            return unk_02106060[i];
        }
    }

    return LanguageToDexFlag(LANGUAGE_ENGLISH);
}
