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
                        sh 'docker build -t test-github:latest . '
                        sh 'docker rmi latest'

                }
            }
        }
    }
}