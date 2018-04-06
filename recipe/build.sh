#!/bin/bash

set -ex

cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DWITH_TESTS=ON

make -j $CPU_COUNT
make install
make test
