pipeline {
         agent any

         load "/Users/tdarex/Documents/dev/projects/ibm/Automation-master/vm-managment/.envvars/sphere-dev.groovy"

         stages {
                 stage('One') {
                 steps {
                     echo "Hi, this is Zulaikha from ${TF_VAR_cluster_name}"
                 }
                 }
                 stage('Two') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 stage('Three') {
                 when {
                       not {
                            branch "master"
                       }
                 }
                 steps {
                       echo "Darex"
                 }
                 }
                 stage('Four') {
                 parallel {
                            stage('Unit Test') {
                           steps {
                                echo "Running the unit test..."
                           }
                           }
                            stage('Integration test') {
                              agent {
                                    docker {
                                            reuseNode true
                                            image 'ubuntu'
                                           }
                                    }
                              steps {
                                echo "Running the integration test..."
                              }
                           }
                           }
                           }
              }
}