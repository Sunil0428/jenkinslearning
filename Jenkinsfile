pipeline {
    agent{
        label 'Agent-1'
    }
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run tests during the build?')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Choose the environment to deploy')
    }

    options{
        timeout(time:40, unit: 'SECONDS')
        disableConcurrentBuilds()
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'sleep 5'
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
                        echo "Running tests"
                    } else {
                        echo "Skipping tests"
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