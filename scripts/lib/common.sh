#!/bin/bash

LIB_SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

load_shflags(){
    . "${LIB_SCRIPT_DIR}"/shflags

    DEFINE_boolean debug "${FLAGS_FALSE}" "Provide debug messages" "d"
}

# add some commonly-used builder stuff here (vars, functions, etc, etc)