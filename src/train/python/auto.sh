#!/bin/bash
echo "DEBUG: PROJECT_ROOT=$PROJECT_ROOT"

rm -f $PROJECT_ROOT/src/train/python/mrelbp*
mkdir  $PROJECT_ROOT/src/cpp/build
cd $PROJECT_ROOT/src/cpp/build
cmake ..
make 
cd -
cp  $PROJECT_ROOT/src/cpp/build/mrelbp* $PROJECT_ROOT/src/train/python/
python3 $PROJECT_ROOT/src/train/python/train.py

