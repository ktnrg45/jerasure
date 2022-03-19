#!/bin/bash

autoreconf -fvi
./configure
make -j4
