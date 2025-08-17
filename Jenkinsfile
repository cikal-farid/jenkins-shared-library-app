@Library("shared-library-jenkins-cikal@main") _

import cikalcakep.jenkins.Output

pipeline {
    agent any

    stages {
        stage("Setup Tools") {
            steps {
                sh '''
                    echo "🔍 Checking if htmllint is installed..."
                    if ! command -v htmllint >/dev/null 2>&1; then
                      echo "⚡ Installing htmllint..."
                      npm install -g htmllint
                    else
                      echo "✅ htmllint already installed"
                    fi
                '''
            }
        }

        stage("HTML Build") {
            steps {
                script {
                    // jalankan html.sh dengan parameter "test"
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
