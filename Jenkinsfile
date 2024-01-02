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
                     sh label: '', script: '''rm -rf dockerimg
                            mkdir dockerimg
                            cd dockerimg
//                             cp /var/lib/jenkins/workspace/JenkinsfileJob/webimage:$BUILD_NUMBER .
//                             touch dockerfile
                            // cat <<EOT>>dockerfile
                            // FROM python:3.11-slim
                            // ADD webimage:$BUILD_NUMBER /usr/local/timofei/webapps/
                            // CMD ["main.py", "run"]
                            // EXPOSE 8081
                            // EOT
                            docker container run -itd --name webserver$BUILD_NUMBER -p 8081 webimage:$BUILD_NUMBER'''
                }
            }
    }
}
