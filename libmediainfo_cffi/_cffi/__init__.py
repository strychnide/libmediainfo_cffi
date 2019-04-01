import os

from cffi import FFI

dir_path = os.path.dirname(os.path.realpath(__file__))
libmediainfo_path = os.environ.get('LIBMEDIAINFO_PATH', '/usr/lib/libmediainfo.so')
ffibuilder = FFI()

with open('%s/cdef.h' % dir_path, 'r') as f:
    cdefs = f.read()

with open('%s/wrapper.cpp' % dir_path, 'r') as f:
    wrapper = f.read()

ffibuilder.cdef(cdefs)

# /usr/lib/libzen.so
ffibuilder.set_source('_mediainfo_cffi',
                      wrapper,
                      extra_objects=[libmediainfo_path],
                      source_extension='.cpp',
                      extra_compile_args=['-D_UNICODE', '-I/usr/include/MediaInfo'])

if __name__ == '__main__':
    ffibuilder.compile(verbose=True)
