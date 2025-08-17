@Library("shared-library-jenkins-cikal") _

import cikalcakep.jenkins.Output;

pipeline {
    agent any
    stages {
        stage("Hello Groovy") {
            steps {
                script {
                    // Memanggil metode hello dari kelas Output
                    Output.hello("Groovy")
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
