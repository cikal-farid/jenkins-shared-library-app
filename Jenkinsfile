@Library("shared-library-jenkins-cikal@main") _

import cikalcakep.jenkins.Output

pipeline {
    agent any
    stages {
        stage("HTML Build") {
            steps {
                script {
                    html('test')
                }
            }
        }
        stage("Global Variable") {
            steps {
                script {
                    echo(author())
                    echo(author.myname())
                    echo(author.mywife())
                }
            }
        }
        stage("Hello Groovy") {
            steps {
                script {
                    Output.hello(this, "Groovy")
                }
            }
        }
        stage("Hello World") {
            steps {
                script {
                    echo "Hello World"
                }
            }
        }
    }
}
