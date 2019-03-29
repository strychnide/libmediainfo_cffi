import os
from unittest import TestCase

from libmediainfo_cffi import get_metadata


class TestBot(TestCase):
    def setUp(self):
        pass

    def test_it_works(self):
        print(os.listdir(os.getcwd()))
        print(get_metadata('sciroppo.mp4'))
