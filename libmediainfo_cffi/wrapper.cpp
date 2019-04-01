#include <stdlib.h>

#define STRING_LENGTH 256

#include "MediaInfo.h"

using namespace MediaInfoLib;

extern "C" {
    MediaInfo* New() {
        MediaInfo* mi = new MediaInfo();
        return mi;
    }

    size_t Open (MediaInfo *mi, wchar_t* FileName) {
        std::wstring _FileName(FileName);

        return mi->Open(_FileName);
    }

    void Close(MediaInfo* mi) {
        mi->Close();
        free(mi);
    }

    wchar_t* Inform (MediaInfo* mi) {
        std::wstring retval = mi->Inform();

        return wcsdup(retval.c_str());
    }

    wchar_t* Option(MediaInfoLib::MediaInfo* mi, wchar_t* Option, wchar_t* Value) {
        std::wstring _Option(Option);
        std::wstring _Value(Value);

        std::wstring retval = mi->Option(_Option, _Value);

        return wcsdup(retval.c_str());
    }
}
