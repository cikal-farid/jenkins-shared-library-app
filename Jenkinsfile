@Library("shared-library-jenkins-cikal") _

import cikalcakep.jenkins.Output

pipeline {
    agent any
    stages {
        stage("Hello Groovy") {
            steps {
                script {
                    def output = new Output()
                    output.someMethod() // Pastikan metode ini ada di kelas Output
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
