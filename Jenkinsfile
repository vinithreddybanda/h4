pipeline {
    agent any
    environment {
        DOCKERHUB_TOKEN = credentials('DOCKERHUB_TOKEN')
    }
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
        stage('Docker Login') {
            steps {
                bat "docker login -u vinithreddybanda -p %DOCKERHUB_TOKEN%"
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