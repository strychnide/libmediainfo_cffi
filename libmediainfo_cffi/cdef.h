typedef struct MediaInfo MediaInfo;

MediaInfo* New();
size_t Open (MediaInfo* mi, char* FileName);
void Close(MediaInfo* mi);
char* Inform(MediaInfo* mi);
char* Option(MediaInfo* mi, char *Option, char* Value);
