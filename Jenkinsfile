pipeline {
    agent any

    environment {
        IMAGE_NAME = 'abdiraman-yerasyl-student-api:v1.0-abdiraman-yerasyl'
    }

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
                    docker create --name student-api-gradle-build \
                      gradle:9.2.1-jdk17 sleep infinity

                    docker cp . student-api-gradle-build:/workspace
                    docker start student-api-gradle-build

                    docker exec -w /workspace student-api-gradle-build \
                      bash -c 'chmod +x gradlew && ./gradlew clean bootJar --no-daemon'
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running Gradle tests'
                sh '''
                    docker exec -w /workspace student-api-gradle-build \
                      ./gradlew test --no-daemon
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                sh '''
                    docker cp student-api-gradle-build:/workspace/build ./build
                    docker build -t "$IMAGE_NAME" .
                '''
            }
        }

        stage('Verify Image') {
            steps {
                sh 'docker image inspect "$IMAGE_NAME"'
            }
        }
    }

    post {
        always {
            sh 'docker rm -f student-api-gradle-build || true'
        }

        success {
            echo 'SUCCESS: Abdiraman Yerasyl Student API Pipeline completed'
        }

        failure {
            echo 'FAILED: Check Jenkins console output'
        }
    }
}
