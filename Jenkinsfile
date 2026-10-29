pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Student: Abdiraman Yerasyl'
                echo 'Student ID: 38133'
                echo 'Group: IT-2310'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Spring Boot with Java 17'
                sh '''
                    docker run --rm \
                      --user root \
                      -v "$PWD:/workspace" \
                      -w /workspace \
                      gradle:9.2.1-jdk17 \
                      bash -c "chmod +x gradlew && ./gradlew clean bootJar --no-daemon"
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests with Java 17'
                sh '''
                    docker run --rm \
                      --user root \
                      -v "$PWD:/workspace" \
                      -w /workspace \
                      gradle:9.2.1-jdk17 \
                      bash -c "./gradlew test --no-daemon"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                sh 'docker build -t abdiraman-yerasyl-student-api:v1.0-abdiraman-yerasyl .'
            }
        }

        stage('Verify Image') {
            steps {
                echo 'Verifying Docker image'
                sh 'docker image inspect abdiraman-yerasyl-student-api:v1.0-abdiraman-yerasyl'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: Abdiraman Yerasyl Student API Pipeline completed'
        }
        failure {
            echo 'FAILED: Check Jenkins console output'
        }
    }
}
