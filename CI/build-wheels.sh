#!/bin/bash
set -e -x

export LIBMEDIAINFO_PATH="/usr/lib64/libmediainfo.so"

python_ver="35"
python_dir="/opt/python/cp${python_ver}-cp${python_ver}m"
python="${python_dir}/bin/python"
pip="${python_dir}/bin/pip"
packages=(
 "https://mediaarea.net/download/binary/libzen0/0.4.37/libzen0-0.4.37.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libzen0/0.4.37/libzen-devel-0.4.37.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo0-18.05.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo-devel-18.05.x86_64.CentOS_5.rpm"
)

cd /io

yum -y install python-hashlib

for package in ${packages[@]}; do
    curl $package --output package.rpm
    rpm -i package.rpm
done

$pip install .[dev]
$python -m flake8 libmediainfo-cffi
$python -m flake8 tests/unit
$python -m unittest discover -s tests/unit/ -p test_*.py
$python setup.py bdist_wheel
auditwheel repair dist/*.whl
