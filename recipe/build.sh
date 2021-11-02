#!/bin/bash

set -ex

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
	echo "CROSS compilation!" 
fi

cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DWITH_TESTS=ON

make -j $CPU_COUNT
make install
make test
