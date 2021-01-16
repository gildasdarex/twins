def getRequestFiles(dir){
    def fileList = "ls ${dir}".execute()
    def files= []
    fileList.text.eachLine {files.add(it)}
    return files
}

def loadValuesYaml(request_yaml){
    def valuesYaml = readYaml (file: request_yaml)
    return valuesYaml;
}

pipeline {
    agent any


    stages {
        stage('One') {
            steps {
                script {
                    def vmRequestFiles = getRequestFiles("${workspace}/vm-requests")
                    vmRequestFiles.each {
                        def request_yaml = "${workspace}/vm-requests/${it}"
                        def data_yaml = loadValuesYaml(request_yaml)
                        println data_yaml.computer_name
                    }
                }

                sh "ls ${workspace}"
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