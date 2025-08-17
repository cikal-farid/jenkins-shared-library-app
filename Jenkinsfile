@Library("shared-library-jenkins-cikal@v1.0") _

// import cikalcakep.jenkins.Output

pipeline {
    agent any
    stages {
        stage("Hello Groovy") {
            steps {
                script {
                    // Menggunakan kelas dari pustaka bersama
                    def output = new Output()
                    output.someMethod() // Ganti dengan metode yang sesuai
                }
            }
        }
        stage("Hello World") {
            steps {
                script {
                    // Menggunakan langkah echo untuk mencetak "Hello World"
                    echo "Hello World"
                }
            }
        }
    }
}
