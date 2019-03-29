#################
libmediainfo_cffi
#################

This library provides a convenient CFFI wrapper for `libmediainfo <https://github.com/MediaArea/MediaInfoLib/>`_, a lightweight library that displays information about video and audio files.
Supported attributes `here <https://mediaarea.net/it/MediaInfo/Support/Tags>`_.

Quickstart
==========
Easy enough:

.. code:: Python

    from libmediainfo_cffi import get_metadata_as_dict
    metadata_dict = get_metadata_as_dict('path/to/file')

And voilà, you get a dict with the following structure:

- keys are track types (General/Audio/Video)
- values are dicts "{tag: tag_value}"

If you want to parse the MediaInfo returned String yourself you can do it with:

.. code:: Python

    from libmediainfo_cffi import get_metadata
    metadata_string = get_metadata(path)

Now you have a formatted string, happy parsing!

You can also call this library from the CLI:

``python libmediainfo_cffi filename``

Differences between this and `pymediainfo <https://github.com/sbraz/pymediainfo/>`_
===================================================================================
| The main difference is that this library uses the API mode of CFFI, while pymediainfo uses the ABI mode. Libmediainfo_cffi approach is safer and faster but it's a bit more complicated to debug, since you need to wrap the C++ mediainfo library in C to comunicate with Python.
| On the other hand pymediainfo is more tested, Python only, so a bit easier to read (don't be mistaken, this library is PyPy compatible too, and it works great!) and **supports Python 2** (while this library doesn't and won't) and has crossplatform capabilities (since it uses ABI mode).

Installation
============
``pip install libmediainfo_cffi``

Note: you need to have libmediainfo installed and the following files:

- /usr/include/MediaInfo/MediaInfo.h
- $PATH/libmediainfo.so

Development
===========
| Download the source, launch ``make setup`` and start tinkering.
| Note: the .cpp and .h file in the libmediainfo_cffi directory are not used directly, but read as strings and fed to CFFI. They are useful only for IDE code hinting. Don't try to compile them with CMake, it won't work.