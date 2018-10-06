typedef struct MediaInfo MediaInfo;

MediaInfo* New();
size_t Open (MediaInfo* mi, char* FileName);
void Close(MediaInfo* mi);
char* Inform (MediaInfo* mi, size_t Reserved);
char* Option(MediaInfo* mi, char *Option, char* Value);