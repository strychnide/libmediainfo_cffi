typedef struct MediaInfo MediaInfo;

MediaInfo* New();
size_t Open (MediaInfo* mi, wchar_t* FileName);
void Close(MediaInfo* mi);
wchar_t* Inform(MediaInfo* mi);
wchar_t* Option(MediaInfo* mi, wchar_t *Option, wchar_t* Value);
