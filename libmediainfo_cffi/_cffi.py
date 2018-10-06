from cffi import FFI

ffibuilder = FFI()

with open('mediainfo_wrapper.h', 'r') as fh:
    wrapper_header = fh.read()

with open("mediainfo_wrapper.cpp", "r") as fh:
    wrapper = fh.read()

ffibuilder.cdef(wrapper_header)

ffibuilder.set_source("_mediainfo_cffi",
                      wrapper,
                      libraries=['mediainfo'],
                      source_extension='.cpp',
                      extra_compile_args=['-D_UNICODE', '-I/usr/include/MediaInfo'])

if __name__ == "__main__":
    ffibuilder.compile(verbose=True)
