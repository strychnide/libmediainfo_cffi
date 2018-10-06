.PHONY: setup setup-dev lint test report build build-docs publish clean

setup:
	PIPENV_VENV_IN_PROJECT=1 pipenv install . --python 3.5

setup-dev:
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev -e .[dev] --python 3.5

lint:
	pipenv run flake8 libmediainfo-cffi

build:
	python3 setup.py sdist bdist_wheel

publish:
	twine upload dist/*

clean:
	@rm -r .venv .mypy_cache *.egg-info build dist docs/dist coverage .coverage