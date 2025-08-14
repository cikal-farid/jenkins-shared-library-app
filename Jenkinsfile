pipeline {
    agent {
        node {
            label "linux && java17"
        }
    }
    stages {
        stage ("Hello from cikal") {
            steps {
                echo("Hello Pipeline")
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
