#!/bin/bash

autoreconf -fvi
./configure
make -j4

# Gen Def
# cd src/.libs
# gendef libJerasure-2.dll