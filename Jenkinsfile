#!groovy
// Run docker build
properties([disableConcurrentBuilds()])

pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        timestamps()
    }
    stages {
        stage("create docker image") {
            steps {
                echo "================ start building image ================"
                // sh 'docker container stop $(docker container ls -q)'
                // sh 'docker rm $(docker ps --filter status=exited -q)'
                sh 'docker image prune -a --force'
                sh 'docker build -t streamlit:$BUILD_NUMBER . '
            }
        }
        stage('Deploy docker container') {
            agent any
                steps {
                    echo "================ start deploy container ================"
                     sh label: '', script: '''rm -rf streamlit:$BUILD_NUMBER
                           docker container run -itd --restart=always --name streamlit$BUILD_NUMBER -p 8501:8501 streamlit:$BUILD_NUMBER
                           docker image prune -a --force'''
                }
            }
    }
}
