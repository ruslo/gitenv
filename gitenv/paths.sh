#!/bin/bash

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# Load some extra paths and scripts from GITENV_ROOT
# Note: This file is sourced from bashrc

if [ "${GITENV_VERBOSE}" != "0" ];
then
  [ -t 0 ] && export GITENV_VERBOSE=1
fi

if [ -n "${GITENV_ROOT}" ];
then
  if [ "${SHELL}" = "/bin/bash" ];
  then
    if [ -r "${GITENV_ROOT}/git/contrib/completion/git-completion.bash" ];
    then
      [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] add git-completion.bash"
      source "${GITENV_ROOT}/git/contrib/completion/git-completion.bash"
    fi
  fi

  if [ -r "${GITENV_ROOT}/ruslo/sugar/cmake/Sugar" ];
  then
    export SUGAR_ROOT="${GITENV_ROOT}/ruslo/sugar"
    [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] set SUGAR_ROOT to '${SUGAR_ROOT}'"
    if [ -r "${SUGAR_ROOT}/python" ];
    then
      [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] add '${SUGAR_ROOT}/python' directory to PATH"
      export PATH="${SUGAR_ROOT}/python":${PATH}
    fi
  fi

  if [ -r "${GITENV_ROOT}/ruslo/polly/utilities/polly_common.cmake" ];
  then
    [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] add '${GITENV_ROOT}/ruslo/polly/bin' directory to PATH"
    export PATH="${GITENV_ROOT}/ruslo/polly/bin":${PATH}
  fi

  if [ -r "${GITENV_ROOT}/ruslo/hunter/cmake/Hunter" ];
  then
    export HUNTER_ROOT="${GITENV_ROOT}/ruslo/hunter"
    [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] set HUNTER_ROOT to '${HUNTER_ROOT}'"
  fi

  asan="${GITENV_ROOT}/llvm/compiler-rt/lib/asan/scripts"
  if [ -r "${asan}/asan_symbolize.py" ];
  then
    [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] add '${asan}' directory to PATH"
    export PATH="${asan}":${PATH}
  fi

  cmake_path="${GITENV_ROOT}/cmake/_install/default/bin"
  if [ -r "${cmake_path}/cmake" ];
  then
    [ "${GITENV_VERBOSE}" = "1" ] && echo "[gitenv] add '${cmake_path}' directory to PATH"
    export PATH="${cmake_path}":${PATH}
  fi
fi
