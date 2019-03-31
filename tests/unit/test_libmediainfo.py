from unittest import TestCase

from libmediainfo_cffi import MediaInfo


class TestMediaInfo(TestCase):
    def setUp(self):
        pass

    def test_read_metadata(self):
        MediaInfo.read_metadata('tests/files/ducks.mp4', Inform='JSON')
