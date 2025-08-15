pipeline {
    agent none

    environment {
        AUTHOR = "Cikal Muhammad Farid Al Gifari"
        EMAIL = "cikalfarid@gmail.com"
    }
    
    stages {
        stage ("Prepare") {
            agent {
        node {
            label "linux && java17"
        }
    }
            steps {
                echo("Author ${AUTHOR}")
                echo("Email ${EMAIL}")
                echo("Start Job : ${env.JOB_NAME}")
                echo("Start Build : ${env.BUILD_NUMBER}")
                echo("Branch Name : ${env.BRANCH_NAME}")
            }
        }      
        stage ("Build") {
            agent {
        node {
            label "linux && java17"
        }
    }
            steps {
                echo("Hello Build")
            }
        }
        stage ("Test") {
            agent {
        node {
            label "linux && java17"
        }
    }
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
        stage ("Deploy") {
            agent {
        node {
            label "linux && java17"
        }
    }
            steps {
                echo("Hello Deploy")
                sleep(5)
            }
        }
    }

    post {
        always {
            echo "I, will always say Hello again!"
        }
        success {
            echo "Yeay, Sukses"
        }
        failure {
            echo "Oh, no ada error guys"
        }
        cleanup {
            echo "Don't care success or error"
        }
    }
    
}
