#!groovy
// Run docker build
properties([disableConcurrentBuilds()])

pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("create docker image") {
            steps {
                echo "================ start building image ================"
                dir ('docker') {
                        sh 'docker build -t webimage:$BUILD_NUMBER . '
                }
            }
        }
        stage('Deploy') {
            agent any
                steps {
                    echo "================ start deploy container ================"
                    sh 'docker container run -itd --name webserver$BUILD_NUMBER -p 8081 webimage:$BUILD_NUMBER'
                }
            }
    }
}
