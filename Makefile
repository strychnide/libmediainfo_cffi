.PHONY: build

setup:
	virtualenv .venv --python=python3.6
	. .venv/bin/activate; pip install -e .[dev]

setup-simple:
	virtualenv .venv --python=python3.6
	. .venv/bin/activate; pip install .

lint:
	. .venv/bin/activate; python -m flake8 libmediainfo-cffi
	. .venv/bin/activate; python -m flake8 tests/unit

test:
	. .venv/bin/activate; python -m unittest discover -s tests/unit/ -p test_*.py

build-docs:
	. .venv/bin/activate; python -m sphinx-build -b html docs/src docs/dist

clean:
	-rm -r .venv *.egg-info build dist docs/dist coverage .coverage _mediainfo_cffi.abi3.so
