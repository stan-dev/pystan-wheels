####################################
Building and uploading pystan wheels
####################################

NOTE: This repository is no longer used. It was used for building PyStan 2 wheels.

See https://travis-ci.org/MacPython/matplotlib-wheels for details on how this
all works.


## Notes

*Differences from the standard ``multibuild`` instructions are noted in this section.**

Stan version 2.19 and higher requires C++14. In ``env_vars.sh`` we ``export MACOSX_DEPLOYMENT_TARGET=10.9``
so that ``clang`` will use ``libc++`` for the C++ standard library.

We also use a custom `xenial` image because to even test pystan we need a
version of gcc more recent than the one that ships with trusty.
