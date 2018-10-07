from cffi import FFI

ffi = FFI()

with open('libmediainfo_cffi/mediainfo_wrapper.h', 'r') as fh:
    wrapper_header = fh.read()

with open('libmediainfo_cffi/mediainfo_wrapper.cpp', 'r') as fh:
    wrapper = fh.read()

ffi.cdef(wrapper_header)

ffi.set_source('_mediainfo_cffi',
               wrapper,
               libraries=['mediainfo'],
               source_extension='.cpp',
               extra_compile_args=['-D_UNICODE', '-I/usr/include/MediaInfo'])

if __name__ == "__main__":
    ffi.compile(verbose=True)
