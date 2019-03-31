#################
libmediainfo_cffi
#################

This library provides a convenient CFFI wrapper for `libmediainfo <https://github.com/MediaArea/MediaInfoLib/>`_, a lightweight library that displays information about video and audio files.
Supported attributes `here <https://mediaarea.net/it/MediaInfo/Support/Tags>`_.

Quickstart
==========
Easy enough:

.. code:: Python

    from libmediainfo_cffi import MediaInfo
    data = MediaInfo.read_metadata(path)

You can also pass options, e.g. if you want JSON output:

.. code:: Python

    from libmediainfo_cffi import MediaInfo
    data = MediaInfo.read_metadata(path, Inform='JSON')

Differences between this and `pymediainfo <https://github.com/sbraz/pymediainfo/>`_
===================================================================================
| The main difference is that this library uses the API mode of CFFI, while pymediainfo uses the ABI mode. Libmediainfo_cffi approach is safer and faster but it's a bit more complicated to debug, since you need to wrap the C++ mediainfo library in C to comunicate with Python.

| On the other hand pymediainfo is more tested, Python only (but needs libmediainfo installed, while with this library you don't) and **supports Python 2** (while this library doesn't and won't) and has better crossplatform capabilities (since, again, it uses ABI mode).

Installation
============
``pip install libmediainfo_cffi``

Development
===========
| Download the source, launch ``make setup`` and start tinkering.
| Note: the .cpp and .h file in the libmediainfo_cffi directory are not used directly, but read as strings and fed to CFFI. They are useful only for IDE code hinting. Don't try to compile them with CMake, it won't work.

Licenses
========
Copyright (c) 2019 Alessandro Cerruti

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

This product uses `MediaInfo <https://mediaarea.net/en/MediaInfo>`_ library, Copyright (c) 2002-2019 `MediaArea.net SARL <info@mediaarea.net>`_.