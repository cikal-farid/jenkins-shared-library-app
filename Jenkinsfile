pipeline {
    agent {
        node {
            label "linux && java17"
        }
    }
    stages {
        stage ("Build") {
            steps {
                echo("Hello Build")
            }
        }
        stage ("Test") {
            steps {
                echo("Hello Test")
            }
        }
        stage ("Deploy") {
            steps {
                echo("Hello Deploy")
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
