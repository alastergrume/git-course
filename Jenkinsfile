// #!groovy
// // Run docker build
// properties([disableConcurrentBuilds()])
//
// pipeline {
//     agent any
//
//     options {
//         buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
//         timestamps()
//     }
//     stages {
//         stage("create docker image") {
//             steps {
//                 echo "================ start building image ================"
//                 dir ('docker') {
//                         sh 'docker build . '
//                 }
//             }
//         }
//     }
// }

#!groovy

pipeline {

    agent {
        docker {
            image 'node'
            args '-u root'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'npm test'
            }
        }
    }
}