pipeline {
    agent none // Tidak ada agen default

    environment {
        AUTHOR = "Cikal Muhammad Farid Al Gifari"
        EMAIL = "cikalfarid@gmail.com"
    }

    parameters {
        string(name: "NAME", defaultValue: "Guest", description: "What is your name?")
        text(name: "DESCRIPTION", defaultValue: "Guest", description: "Tell me about you")
        booleanParam(name: "DEPLOY", defaultValue: true, description: "Need to Deploy?")
        choice(name: "SOSIAL_MEDIA", choices: ['Instagram', 'Facebook', 'Twitter'], description: "Which Sosial Media?")
        password(name: "SECRET", defaultValue: "", description: "Encrypt Key")
    }

    options {
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'MINUTES')
    }
    
    stages {

        stage("OS Setup") {
            matrix {
                axes {
                    axis {
                        name "OS"
                        values "linux", "windows", "mac"
                    }
                    axis {
                        name "ARC"
                        values "32", "64"
                    }
                }
                excludes {
                    exclude {
                        axis {
                            name "OS"
                            values "mac"
                        }
                        axis {
                            name "ARC"
                            values "32"
                        }
                    }
                }
                stages {
                stage("OS Setup") {
                    agent { label "linux && java17" }
                    steps {
                        echo("Setup ${OS} ${ARC}")
                        }
                    }
                }
            }
        }
        
        stage("Preparation") {
            parallel {
                stage("Prepare Cikal") {
                    agent { label "linux && java17" }
                    steps {
                        echo "Prepare Cikal"
                    }
                }
                stage("Prepare Novi") {
                    agent { label "linux && java17" }
                    steps {
                        echo "Prepare Novi"
                    }
                }
            }
        }
        
        stage("Parameter") {
            agent { label "linux && java17" }
            steps {
                echo "Hello ${params.NAME}"
                echo "Your description is: ${params.DESCRIPTION}"
                echo "Your social media is: ${params.SOSIAL_MEDIA}"
                echo "Need to deploy: ${params.DEPLOY}"
                sh "echo 'Your secret is: ${params.SECRET}' > 'rahasia.txt'" // Perbaikan di sini
            }
        }

        stage("Prepare") {
            agent { label "linux && java17" }
            environment {
                APP = credentials("cikal_cakep")
            }
            steps {
                echo "Author: ${AUTHOR}"
                echo "Email: ${EMAIL}"
                echo "Start Job: ${env.JOB_NAME}"
                echo "Start Build: ${env.BUILD_NUMBER}"
                echo "Branch Name: ${env.BRANCH_NAME}"
                echo "App User: ${APP_USR}"
                sh "echo 'App Password: \$APP_PSW' > 'rahasia.txt'" // Perbaikan di sini
            }
        }

        stage("Build") {
            agent { label "linux && java17" }
            steps {
                echo "Hello Build"
            }
        }

        stage("Test") {
            agent { label "linux && java17" }
            steps {
                script {
                    def data = [
                        "firstName": "Cikal Muhammad Farid",
                        "lastName": "Al Gifari"
                    ]
                    writeJSON(file: "data.json", json: data)
                    
                    // Cek apakah file index.html ada
                    def fileExists = fileExists('index.html')
                    if (fileExists) {
                        echo 'File index.html ditemukan.'

                        // Cek ukuran file
                        def size = sh(script: 'stat -c%s index.html', returnStdout: true).trim()
                        echo "Ukuran file: ${size} bytes"

                        // Cek apakah file dapat dibaca
                        def isReadable = sh(script: 'test -r index.html && echo "true" || echo "false"', returnStdout: true).trim()
                        if (isReadable == 'true') {
                            echo 'File dapat dibaca.'
                        } else {
                            echo 'File tidak dapat dibaca.'
                        }

                        // Cek konten file (misalnya, mencari tag <html>)
                        def hasHtmlTag = sh(script: 'grep -q "<html>" index.html && echo "true" || echo "false"', returnStdout: true).trim()
                        if (hasHtmlTag == 'true') {
                            echo 'File mengandung tag <html>.'
                        } else {
                            echo 'File tidak mengandung tag <html>.'
                        }
                    } else {
                        error 'File index.html tidak ditemukan.'
                    }
                }
            }
        }

        stage("Deploy") {
            agent { label "linux && java17" }
            input {
                message "Can we deploy?"
                ok "Yes of course"
                submitter "cikal"
                parameters {
                    choice(name: "TARGET_ENV", choices: ['DEV', 'QA', 'PROD'], description: "Which Environment?")
                }
            }
            steps {
                echo "Deploy to ${params.TARGET_ENV}"
            }
        }
        
        stage("Release") {
            agent { label "linux && java17" }
            when {
                expression {
                    return params.DEPLOY
                }
            }
            steps {
                echo "Release it"
            }
        }
    }

    post {
        always {
            echo "I will always say Hello again!"
        }
        success {
            echo "Yeay, Sukses"
        }
        failure {
            echo "Oh no, ada error guys"
        }
        cleanup {
            echo "Don't care success or error"
        }
    }
}
