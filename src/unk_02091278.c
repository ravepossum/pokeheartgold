#include "global.h"
#include "unk_02091278.h"

static const u8 sDexCaughtLanguages[] = {
    LANGUAGE_JAPANESE,
    LANGUAGE_ENGLISH,
    LANGUAGE_FRENCH,
    LANGUAGE_GERMAN,
    LANGUAGE_ITALIAN,
    LANGUAGE_SPANISH,
    0,
    0
};

int LanguageToDexFlag(u32 language) 
{
    int flag;
    for (flag = 0; flag < MAX_CAUGHT_LANGUAGES; flag++) {
        if (language == sDexCaughtLanguages[flag]) {
            break;
        }
    }
    
    return flag;
}

u8 DexFlagToLanguage(int flag) 
{
    GF_ASSERT(flag < MAX_CAUGHT_LANGUAGES);
    return sDexCaughtLanguages[flag];
}
