#!/bin/bash
# author yuxi hong 2020-03-19
PROJ_DIR=$(pwd)
rm -rf ~/git_codes/cub
git clone https://github.com/NVlabs/cub.git ~/git_codes/cub
cd ~/git_codes/cub && git checkout c3cceac115c072fb63df1836ff46d8c60d9eb304
cd $PROJ_DIR


