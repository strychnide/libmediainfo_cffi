from _mediainfo_cffi import ffi, lib


class MediaInfo:
    def __init__(self):
        self.mediainfo = lib.New()

    def open(self, path: str):
        _path = ffi.new("wchar_t[]", path)
        found = lib.Open(self.mediainfo, _path)

        if found == 0:
            lib.Close(self.mediainfo)
            raise FileNotFoundError

    def inform(self):
        info = lib.Inform(self.mediainfo)

        return ffi.string(info)

    def close(self):
        lib.Close(self.mediainfo)

    def option(self, key: str, value: str = ''):
        # https://github.com/MediaArea/MediaInfoLib/blob/master/Source/MediaInfo/MediaInfo.h
        # Inform: XML, HTML, JSON, CSV, OLDXML
        _key = ffi.new("wchar_t[]", key)
        _value = ffi.new("wchar_t[]", value)
        lib.Option(self.mediainfo, _key, _value)

    @classmethod
    def read_metadata(cls, path: str, **kwargs):
        mi = cls()
        mi.open(path)
        for key, value in kwargs.items():
            mi.option(key, value)
        info = mi.inform()
        mi.close()
        return info
