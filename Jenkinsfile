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
                        sh 'docker build -f docker/Dockerfile -t streamlit:$BUILD_NUMBER . '
                }
            }
        }
        stage('Deploy docker container') {
            agent any
                steps {
                    echo "================ start deploy container ================"
                     sh label: '', script: '''rm -rf streamlit:$BUILD_NUMBER
                           docker container run -itd --name streamlit$BUILD_NUMBER -p 8501:8501 streamlit:$BUILD_NUMBER'''
                }
            }
    }
}
