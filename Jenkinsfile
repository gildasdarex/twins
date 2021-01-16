def getRequestFiles(dir){
    def fileList = "ls ${dir}".execute()
    def files= []
    fileList.text.eachLine {files.add(it)}
    return files
}

pipeline {
         agent any


         stages {
                 stage('One') {
                 steps {
                     script {
                         def vmRequestFiles = getRequestFiles("${workspace}/vm-requests")
                         vmRequestFiles.each {
                             println it.path
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