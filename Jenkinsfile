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
                sleep(5)
            }
        }
        stage ("Test") {
            steps {
                echo("Hello Test")
                sleep(5)
            }
        }
        stage ("Deploy") {
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
