# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then
        export CC=clang
        export CXX=clang++
    fi
    echo "IN pre_build!"
    SRC_DIR=pystan
    pip install -r $SRC_DIR/requirements.txt
}

function run_tests {
    SRC_DIR=../pystan
    echo "sanity checks"
    python -c "import sys; print('\n'.join(sys.path))"
    python -c "import pystan"
    pip install -r $SRC_DIR/requirements.txt
    # uncomment line after 2.18 released
    # pip install -r $SRC_DIR/test-requirements.txt
    if [ -n "$IS_OSX" ]; then
      # bug affects certain combinations of numpy and scipy on os x
      pip install -U numpy scipy
    fi
    echo "testing"
    # only run one test to avoid exceeding travis time limit
    JOBLIB_MULTIPROCESSING=0 python -m unittest pystan.tests.test_basic_array
}
