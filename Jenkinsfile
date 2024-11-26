pipeline {
    agent{
        label 'AGENT-1'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
    post{
        always{
            echo 'this section always runs'
            deleteDir()
        }
        success{
            echo 'this section runs when the pipeline is success'
        }
    }
}