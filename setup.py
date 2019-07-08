from setuptools import find_packages, setup

with open("README.rst", "r") as fh:
    long_description = fh.read()

setup(
    name='libmediainfo_cffi',
    version='2.1.5',
    author='Alessandro Cerruti',
    author_email='thereap3r97@gmail.com',
    description='CFFI interface for libmediainfo',
    long_description=long_description,
    long_description_content_type='text/x-rst',
    url='https://github.com/strychnide/libmediainfo_cffi',
    license='MIT',
    project_urls={
        'Source': 'https://github.com/strychnide/libmediainfo_cffi',
        'Issues': 'https://github.com/strychnide/libmediainfo_cffi/issues'
    },
    python_requires='>=3.5',
    setup_requires=['cffi'],
    cffi_modules=['libmediainfo_cffi/_cffi/__init__.py:ffibuilder'],
    install_requires=[
        'cffi'
    ],
    extras_require={
        'dev': [
            'flake8',
            'flake8-import-order',
            'flake8-quotes',
            'flake8-bugbear',
        ]
    },
    packages=find_packages(exclude=['*._cffi'])
)
