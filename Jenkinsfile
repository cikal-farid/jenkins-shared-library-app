@Library("shared-library-jenkins-cikal@v1.0") _

import cikalcakep.jenkins.Output;

pipeline {
    agent any
    stages {
        stage("Hello Groovy") {
            steps {
                script {
                    Output.hello("Groovy")
                }
            }
        }
        stage("Hello World") {
            steps {
                script {
                    hello.world()
                }
            }
        }
    }
}