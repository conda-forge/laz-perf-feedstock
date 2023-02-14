#!/bin/bash

set -ex


cmake ${CMAKE_ARGS} -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DWITH_TESTS=ON

make -j $CPU_COUNT
make install
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
	make test
fi
