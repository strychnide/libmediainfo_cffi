#!/bin/bash
set -e

export LIBMEDIAINFO_PATH="/usr/lib64/libmediainfo.so"

packages=(
 "https://mediaarea.net/download/binary/libzen0/0.4.37/libzen0-0.4.37.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libzen0/0.4.37/libzen-devel-0.4.37.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo0-18.05.x86_64.CentOS_5.rpm"
 "https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo-devel-18.05.x86_64.CentOS_5.rpm"
)
versions=(35 36 37)

cd /io

curl -L https://bitbucket.org/squeaky/portable-pypy/downloads/pypy3.6-7.1.0-beta-linux_x86_64-portable.tar.bz2 --output pypy3.tar.bz2

tar -xjf pypy3.tar.bz2
python="pypy3*/bin/python"
$python -m ensurepip

pip="${python} -m pip"

$pip install .[dev]

yum -y install python-hashlib

for package in ${packages[@]}; do
    curl $package --output package.rpm
    rpm -i package.rpm
done

curl -L https://bitbucket.org/squeaky/portable-pypy/downloads/pypy3.6-7.1.0-beta-linux_x86_64-portable.tar.bz2 --output pypy3.tar.bz2
#curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

mkdir pypy3
tar -xjf pypy3.tar.bz2 -C pypy3
ls pypy3
python="pypy3/bin/python"
$python -m ensurepip

#$python get-pip.py
pip="${python} -m pip"

$pip install .[dev]
$python -m flake8 libmediainfo-cffi
$python -m flake8 tests/unit
$python -m unittest discover -s tests/unit/ -p test_*.py
$python setup.py bdist_wheel

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
    $python setup.py bdist_wheel
done



for wheel in dist/*.whl; do
    auditwheel repair $wheel
done
