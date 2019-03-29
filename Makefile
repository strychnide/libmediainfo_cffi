.PHONY: build

setup:
	virtualenv .venv --python=python3.6
	. .venv/bin/activate; pip install -e .[dev]

setup-simple:
	virtualenv .venv --python=python3.6
	. .venv/bin/activate; pip install .

lint:
	. .venv/bin/activate; python3 -m flake8 libmediainfo-cffi
#	. .venv/bin/activate; python3 -m flake8 tests/unit

test:
	make clean
	make setup-simple
	. .venv/bin/activate; python3 -m unittest discover -s tests/unit/ -p test_*.py
	make clean
#	. .venv/bin/activate; python3 -m coverage run -m unittest discover -s tests/unit/ -p test_*.py
#	. .venv/bin/activate; python3 -m coverage html

build:
	. .venv/bin/activate; python3 setup.py bdist_wheel

build-docs:
	. .venv/bin/activate; python3 -m sphinx-build -b html docs/src docs/dist

clean:
	-rm -r .venv *.egg-info build dist docs/dist coverage .coverage _mediainfo_cffi.abi3.so
