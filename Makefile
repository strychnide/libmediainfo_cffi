.PHONY: setup
setup:
	# https://github.com/pypa/pipenv/issues/2924
	PIPENV_VENV_IN_PROJECT=1 pipenv --python 3.5 && pipenv install pip==18.0 && pipenv install --dev -e .[dev]

.PHONY: lint
lint:
	pipenv run flake8 libmediainfo-cffi

.PHONY: build
build:
	python3 setup.py sdist

.PHONY: build-cffi
build-cffi:
	cd "libmediainfo_cffi" && pipenv run python _cffi.py && cd -

.PHONY: publish
publish:
	twine upload dist/*

.PHONY: clean
clean:
	@rm -r .venv .mypy_cache *.egg-info build dist docs/dist coverage .coverage
