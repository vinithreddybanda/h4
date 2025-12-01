pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'javac Calculator.java'
            }
        }
        stage('Test') {
            steps {
                // Add unit tests if available
            }
        }
        stage('Docker Build & Push') {
            steps {
                bat 'docker build -t vinithreddybanda/calculator:latest .'
                bat 'docker push vinithreddybanda/calculator:latest'
            }
        }
    }
}