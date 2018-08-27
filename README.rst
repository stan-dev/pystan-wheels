####################################
Building and uploading pystan wheels
####################################

See https://travis-ci.org/MacPython/matplotlib-wheels for details on how this
all works.


## Notes

*Differences from the standard ``multibuild`` instructions are noted in this section.**

Stan version 2.18 and higher requires C++11. In ``env_vars.sh`` we ``export MACOSX_DEPLOYMENT_TARGET=10.9``
so that ``clang`` will use ``libc++`` for the C++ standard library.
