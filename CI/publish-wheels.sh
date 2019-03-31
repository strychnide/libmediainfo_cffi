#!/bin/bash
set +e

# necessary because pypi returns 400 randomly even if no file exists (...)
for wheel in wheelhouse/*.whl; do
    python -m twine upload $wheel -u $TWINE_USERNAME -p $TWINE_PASSWORD
done