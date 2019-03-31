#include <stdlib.h>

#define STRING_LENGTH 256

#include "MediaInfo.h"

using namespace MediaInfoLib;

extern "C" {
    std::wstring char_to_wstring(char* src, size_t size) {
        wchar_t buffer[size];
        mbstowcs(buffer, src, size);
        return std::wstring(buffer);
    }

    MediaInfo* New() {
        MediaInfo* mi = new MediaInfo();
        return mi;
    }

    size_t Open (MediaInfo *mi, char* FileName) {
        std::wstring _FileName = char_to_wstring(FileName, STRING_LENGTH);

        return mi->Open(_FileName);
    }

    void Close(MediaInfo* mi) {
        mi->Close();
        free(mi);
    }

    char* Inform (MediaInfo* mi) {
        std::wstring retval = mi->Inform();
        std::string retval_narrow(retval.begin(), retval.end());

        return strdup(retval_narrow.c_str());
    }

    char* Option(MediaInfoLib::MediaInfo* mi, char* Option, char* Value) {
        std::wstring _Option = char_to_wstring(Option, STRING_LENGTH);
        std::wstring _Value = char_to_wstring(Value, STRING_LENGTH);

        std::wstring retval = mi->Option(_Option, _Value);
        std::string retval_narrow(retval.begin(), retval.end());

        return strdup(retval_narrow.c_str());
    }
}
