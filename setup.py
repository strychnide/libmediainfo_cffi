from setuptools import find_packages, setup

with open("README.rst", "r") as fh:
    long_description = fh.read()

setup(
    name='libmediainfo-cffi',
    version='1.0.0',
    author='Alessandro Cerruti',
    author_email='thereap3r97@gmail.com',
    description='CFFI interface for libmediainfo',
    long_description=long_description,
    long_description_content_type='text/x-rst',
    url='https://github.com/strychnide/libmediainfo-cffi',
    license='MIT',
    project_urls={
        'Source': 'https://github.com/strychnide/libmediainfo-cffi',
        'Issues': 'https://github.com/strychnide/libmediainfo-cffi/issues'
    },
    python_requires='>=3.5',
    setup_requires=["cffi"],
    install_requires=[
        'cffi'
    ],
    extras_require={
        'dev': [
            'flake8',
            'flake8-sorted-keys',
            'flake8-import-order',
            'flake8-quotes',
            'flake8-bugbear',
            'sphinx',
            'sphinx-autodoc-typehints',
            'sphinx_rtd_theme',
            'coverage'
        ]
    },
    packages=find_packages()
)



# cffi_modules=["piapprox_build:ffibuilder"], # "filename:global"
