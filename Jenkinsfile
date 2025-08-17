@Library("shared-library-jenkins-cikal@main") _

import cikalcakep.jenkins.Output

pipeline {
    agent any

    environment {
        // pastikan /usr/local/bin ikut di PATH
        PATH = "/usr/local/bin:$PATH"
    }

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

                    echo "📍 htmllint location: $(which htmllint)"
                '''
            }
        }

        stage("HTML Build") {
            steps {
                script {
                    // ini akan jalanin ./html.sh test
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
