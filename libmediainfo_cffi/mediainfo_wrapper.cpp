#include <locale>
#include <codecvt>
#include <string>
#include <cstddef>
#include <iostream>

#include "MediaInfo.h"

using namespace MediaInfoLib;

std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;

extern "C" {
    MediaInfo* New() {
        MediaInfo* mi = new MediaInfo();
        return mi;
    }

    size_t Open (MediaInfo *mi, char* FileName) {
        std::wstring _FileName = converter.from_bytes(FileName);
        return mi->Open(_FileName);
    }

    void Close(MediaInfo* mi) {
        mi->Close();
        free(mi);
    }

    char* Inform (MediaInfo* mi, size_t Reserved=0) {
        std::wstring retval = mi->Inform(Reserved);
        std::string retval_narrow = converter.to_bytes(retval);

        return strdup(retval_narrow.c_str());
    }

    char* Option(MediaInfoLib::MediaInfo* mi, char *Option, char* Value) {
        std::wstring _Option = converter.from_bytes(Option);
        std::wstring _Value = converter.from_bytes(Value);

        std::wstring retval = mi->Option(_Option, _Value);
        std::string retval_narrow = converter.to_bytes(retval);

        return strdup(retval_narrow.c_str());
    }

                        }