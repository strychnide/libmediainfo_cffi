from _mediainfo_cffi import ffi, lib


def get_metadata(path, path_encoding='utf-8', c_retval_encoding='utf-8'):
    mi = lib.New()
    found = lib.Open(mi, path.encode(path_encoding))

    if found == 0:
        lib.Close(mi)
        raise FileNotFoundError

    inform = lib.Inform(mi, 0)  # MAY leak memory
    lib.Close(mi)

    return ffi.string(inform).decode(c_retval_encoding)


def get_metadata_as_dict(path, *args, **kwargs):
    metadata = get_metadata(path, *args, **kwargs)
    metadata_dict = {}
    curr_var = ''

    for line in metadata.splitlines():
        split_line = line.split(':')
        if len(split_line) > 1:
            metadata_dict[curr_var][split_line[0].strip()] = split_line[1].strip()
        elif split_line[0] != '':
            curr_var = split_line[0]
            metadata_dict[curr_var] = {}

    return metadata_dict


if __name__ == '__main__':
    from sys import argv

    if len(argv) < 2:
        raise Exception('You must specify a file name')

    print(get_metadata_as_dict(argv[1]))
