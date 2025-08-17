@Library("shared-library-jenkins-cikal@main") _

import cikalcakep.jenkins.Output

pipeline {
    agent any

    environment {
        // Tambahkan npm global bin ke PATH
        PATH = "${PATH}:${WORKSPACE}/.npm-global/bin:/usr/local/bin:/usr/bin"
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

                    echo "📍 htmllint global bin dir: $(npm bin -g)"
                    ls -l $(npm bin -g) || true
                '''
            }
        }

        stage("HTML Build") {
            steps {
                script {
                    // Jalankan html.sh dengan PATH yang sudah ditambahkan npm bin -g
                    sh '''
                        export PATH=$(npm bin -g):$PATH
                        chmod +x ./html.sh
                        ./html.sh test
                    '''
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
