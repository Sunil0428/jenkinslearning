pipeline {
    agent{
        label 'AGENT-1'
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run tests during the build?')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Choose the environment to deploy')
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
        stage ('Print params'){
            steps{
                echo "Building branch: ${params.BRANCH_NAME}"
                echo "Deploying to: ${params.ENVIRONMENT}"
                script {
                    if (params.RUN_TESTS) {
                        echo "Running tests..."
                    } else {
                        echo "Skipping tests..."
                    }
                }
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