#!/bin/bash
set -e -x

export LIBMEDIAINFO_PATH="/usr/lib64/libmediainfo.so"
export PYTHON="/opt/python/cp36-cp36m/bin/python"
export PIP="/opt/python/cp36-cp36m/bin/pip"

cd /io

yum -y install python-hashlib

curl https://mediaarea.net/download/binary/libzen0/0.4.37/libzen0-0.4.37.x86_64.CentOS_5.rpm --output libzen.rpm
rpm -i libzen.rpm
curl https://mediaarea.net/download/binary/libzen0/0.4.37/libzen-devel-0.4.37.x86_64.CentOS_5.rpm --output libzen-devel.rpm
rpm -i libzen-devel.rpm
curl https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo0-18.05.x86_64.CentOS_5.rpm --output libmediainfo.rpm
rpm -i libmediainfo.rpm
curl https://mediaarea.net/download/binary/libmediainfo0/18.05/libmediainfo-devel-18.05.x86_64.CentOS_5.rpm --output libmediainfo-devel.rpm
rpm -i libmediainfo-devel.rpm

${PIP} install .[dev]
${PYTHON} -m flake8 libmediainfo-cffi
${PYTHON} setup.py sdist bdist_wheel
auditwheel repair dist/*.whl

