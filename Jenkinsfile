@Library("shared-library-jenkins-cikal@v1.0") _

import jenkins.plugins.git.GitSCMSource;
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
                    hello.world()
                }
            }
        }
    }
}