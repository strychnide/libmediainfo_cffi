from _mediainfo_cffi import ffi, lib


class MediaInfo:
    def __init__(self):
        self.mediainfo = lib.New()

    def open(self, path: bytes):
        found = lib.Open(self.mediainfo, path)

        if found == 0:
            lib.Close(self.mediainfo)
            raise FileNotFoundError

    def inform(self):
        info = lib.Inform(self.mediainfo)

        return ffi.string(info).decode('utf-8')

    def close(self):
        lib.Close(self.mediainfo)

    def option(self, key: bytes, value: bytes = ''):
        # https://github.com/MediaArea/MediaInfoLib/blob/master/Source/MediaInfo/MediaInfo.h
        # Inform: XML, HTML, JSON, CSV, OLDXML
        lib.Option(self.mediainfo, key, value)

    @classmethod
    def read_metadata(cls, path: str, **kwargs):
        mi = cls()
        mi.open(path.encode())
        for key, value in kwargs.items():
            mi.option(key.encode(), value.encode())
        info = mi.inform()
        mi.close()
        return info
