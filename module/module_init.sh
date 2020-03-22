#!/bin/bash 
module purge
#module load gcc/5.5.0 
#module load cuda/9.0
#module load mkl/2018-update-2
#module load magma/2.3.0-gcc-5.5.0-mkl-cuda-9.0

module load gcc/5.5.0
module load cuda/10.0
module load openblas/0.2.20-gcc-5.5.0
module load magma/2.5.0-gcc-5.5.0-openblas-cuda-10.0

mkdir -p lib
mkdir -p src/obj 
mkdir -p testing/bin 
mkdir -p testing/obj

export _MAGMA_ROOT_=$MAGMA_ROOT
