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
        stage('Who Am I') {
    steps {
        bat 'whoami'
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