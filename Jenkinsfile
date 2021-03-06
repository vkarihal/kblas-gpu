pipeline {
/*
 * Defining where to run
 */
//// Any:
// agent any
//// By agent label:
//      agent { label 'sandybridge' }

    agent { label 'jenkinsfilegpu' }
    triggers {
        pollSCM('H/10 * * * *')
    }
    environment {
        CC="gcc"
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '50'))
        timestamps()
    }

    stages {
        stage ('cuda-7.0') {
            steps {
                sh '''#!/bin/bash -le
                    module load old-modules
                    module load gcc/4.8.5
                    module load cuda/7.0
                    module load intel/16
                    module list
                    set -x
                    export _MAGMA_ROOT_=/opt/ecrc_old/magma/2.2.0-intel-16-mkl-cuda-7.0/
                    export _CUB_DIR_=$PWD/cub
                    if [ -d cub ]
                    then
                        cd cub; git pull; cd ..
                    else
                        git clone https://github.com/NVLABS/cub cub
                    fi
                    make clean
                    make
                    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$_MAGMA_ROOT_/lib
                    sed -i s/STEP_DIM=.*/STEP_DIM=1024/ ./test-scripts/kblas-test-l2.sh
                    sed -i s/STOP_DIM=.*/STOP_DIM=4096/ ./test-scripts/kblas-test-l2.sh
                    ./test-scripts/kblas-test-l2.sh
                    sed -i s/"ranges = "/"ranges=\\[\\"--range 128:1024:128\\"\\]\\nranges = "/ ./test-scripts/kblas-test-l3.py
                    sed -i "/ranges = /,/\\]/d" ./test-scripts/kblas-test-l3.py
                    ./test-scripts/kblas-test-l3.py
                    sed -i 's/defaultBatchCount =.*/defaultBatchCount = 10/' test-scripts/kblas-test-batch-parallel.py
                    ./test-scripts/kblas-test-batch-parallel.py
                '''
            }
        }
        stage ('cuda-7.5') {
            steps {
                sh '''#!/bin/bash -le
                    module load old-modules
                    module load gcc/4.8.5
                    module load cuda/7.5
                    module load intel/16
                    module list
                    set -x
                    export _MAGMA_ROOT_=/opt/ecrc_old/magma/2.2.0-intel-16-mkl-cuda-7.5
                    export _CUB_DIR_=$PWD/cub
                    if [ -d cub ]
                    then
                        cd cub; git pull; cd ..
                    else
                        git clone https://github.com/NVLABS/cub cub
                    fi
                    make clean
                    make
                    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$_MAGMA_ROOT_/lib
                    #export CUDA_VISIBLE_DEVICES=0
                    export NGPUS=1
                    sed -i s/STEP_DIM=.*/STEP_DIM=1024/ ./test-scripts/kblas-test-l2.sh
                    sed -i s/STOP_DIM=.*/STOP_DIM=4096/ ./test-scripts/kblas-test-l2.sh
                    ./test-scripts/kblas-test-l2.sh
                    sed -i s/"ranges = "/"ranges=\\[\\"--range 128:1024:128\\"\\]\\nranges = "/ ./test-scripts/kblas-test-l3.py
                    sed -i "/ranges = /,/\\]/d" ./test-scripts/kblas-test-l3.py
                    ./test-scripts/kblas-test-l3.py
                    sed -i 's/defaultBatchCount =.*/defaultBatchCount = 10/' test-scripts/kblas-test-batch-parallel.py
                    ./test-scripts/kblas-test-batch-parallel.py
                '''
            }
        }
        stage ('cuda-8.0') {
            steps {
                sh '''#!/bin/bash -le
                    module load old-modules
                    module load gcc/4.8.5
                    module load cuda/8.0
                    module load intel/16
                    module list
                    set -x
                    export _MAGMA_ROOT_=/opt/ecrc_old/magma/2.2.0-intel-16-mkl-cuda-8.0
                    export _CUB_DIR_=$PWD/cub
                    if [ -d cub ]
                    then
                        cd cub; git pull; cd ..
                    else
                        git clone https://github.com/NVLABS/cub cub
                    fi
                    make clean
                    make
                    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$_MAGMA_ROOT_/lib
                    #export CUDA_VISIBLE_DEVICES=0
                    export NGPUS=1
                    sed -i s/STEP_DIM=.*/STEP_DIM=1024/ ./test-scripts/kblas-test-l2.sh
                    sed -i s/STOP_DIM=.*/STOP_DIM=4096/ ./test-scripts/kblas-test-l2.sh
                    ./test-scripts/kblas-test-l2.sh
                    sed -i s/"ranges = "/"ranges=\\[\\"--range 128:1024:128\\"\\]\\nranges = "/ ./test-scripts/kblas-test-l3.py
                    sed -i "/ranges = /,/\\]/d" ./test-scripts/kblas-test-l3.py
                    ./test-scripts/kblas-test-l3.py
                    sed -i 's/defaultBatchCount =.*/defaultBatchCount = 10/' test-scripts/kblas-test-batch-parallel.py
                    ./test-scripts/kblas-test-batch-parallel.py
                '''
            }
        }
        stage ('cuda-9.0') {
            steps {
                sh '''#!/bin/bash -le
                    module load mkl/2018-initial
                    module load gcc/5.5.0
                    module load cuda/9.0
                    module load magma/2.3.0-gcc-5.5.0-mkl-cuda-9.0
                    module list
                    set -x
                    export _MAGMA_ROOT_=$MAGMA_ROOT
                    export _CUB_DIR_=$PWD/cub
                    if [ -d cub ]
                    then
                        cd cub; git pull; cd ..
                    else
                        git clone https://github.com/NVLABS/cub cub
                    fi
                    make clean
                    make
                    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$_MAGMA_ROOT_/lib
                    #export CUDA_VISIBLE_DEVICES=0
                    export NGPUS=1
                    sed -i s/STEP_DIM=.*/STEP_DIM=1024/ ./test-scripts/kblas-test-l2.sh
                    sed -i s/STOP_DIM=.*/STOP_DIM=4096/ ./test-scripts/kblas-test-l2.sh
                    ./test-scripts/kblas-test-l2.sh
                    sed -i s/"ranges = "/"ranges=\\[\\"--range 128:1024:128\\"\\]\\nranges = "/ ./test-scripts/kblas-test-l3.py
                    sed -i "/ranges = /,/\\]/d" ./test-scripts/kblas-test-l3.py
                    ./test-scripts/kblas-test-l3.py
                    sed -i 's/defaultBatchCount =.*/defaultBatchCount = 10/' test-scripts/kblas-test-batch-parallel.py
                    ./test-scripts/kblas-test-batch-parallel.py
                '''
            }
        }
        stage ('Documentation') {
            steps {
                sh '''#!/bin/bash -ex
cd $WORKSPACE
rm -rf   cppcheckhtml
cppcheck --enable=all --xml --xml-version=2 src/ testing/ -I include/ 2> cppcheck.xml
cppcheck-htmlreport --source-encoding="iso8859-1" --title="KBLAS" --source-dir=. --report-dir=cppcheckhtml --file=cppcheck.xml
'''
                publishHTML( target: [allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'cppcheckhtml', reportFiles: 'index.html', reportName: 'CppCheckReport', reportTitles: ''] )
            }
        }
    }
    // Post build actions
    post {
        //always {
        //}
        //success {
        //}
        //unstable {
        //}
        //failure {
        //}
        unstable {
                emailext body: "${env.JOB_NAME} - Please go to ${env.BUILD_URL}", subject: "Jenkins Pipeline build is UNSTABLE", recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']]
        }
        failure {
                emailext body: "${env.JOB_NAME} - Please go to ${env.BUILD_URL}", subject: "Jenkins Pipeline build FAILED", recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']]
        }
    }
}
