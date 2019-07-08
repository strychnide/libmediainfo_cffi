#!/bin/bash
set -e

export LIBMEDIAINFO_PATH="/usr/lib64/libmediainfo.so"

versions=(36 37)

cd /io

yum -y install libmediainfo libmediainfo-devel

python_dist=''
python=''
pip=''
for python_ver in ${versions[@]}; do
    python_dist="/opt/python/cp${python_ver}-cp${python_ver}m/bin"
    python="${python_dist}/python"
    pip="${python_dist}/pip"
    $pip install .[dev]
    $python -m flake8 libmediainfo-cffi
    $python -m flake8 tests/unit
    $python -m unittest discover -s tests/unit/ -p test_*.py
    $python setup.py sdist bdist_wheel
done

for wheel in dist/*.whl; do
    auditwheel repair $wheel
done
