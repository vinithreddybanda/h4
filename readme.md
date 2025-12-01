# Java Calculator CI/CD Pipeline

## Overview
This project demonstrates a simple Java calculator application, automated CI/CD using Jenkins, and containerization with Docker. The final image is deployed to DockerHub.

---

## 1. Create a Calculator Using Java

### Features
- Addition, subtraction, multiplication, division
- Command-line interface

### How to Run Locally
```sh
javac Calculator.java
java Calculator
```

### Example Code
```java
// Calculator.java
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double a = sc.nextDouble();
        System.out.print("Enter operator (+, -, *, /): ");
        char op = sc.next().charAt(0);
        System.out.print("Enter second number: ");
        double b = sc.nextDouble();
        double result = 0;
        switch (op) {
            case '+': result = a + b; break;
            case '-': result = a - b; break;
            case '*': result = a * b; break;
            case '/': result = a / b; break;
            default: System.out.println("Invalid operator"); return;
        }
        System.out.println("Result: " + result);
    }
}
```

---

## 2. Push to GitHub

### Steps
1. Initialize git:
    ```sh
    git init
    git add Calculator.java
    git commit -m "Initial commit: Java calculator"
    ```
2. Create a GitHub repo and push:
    ```sh
    git remote add origin https://github.com/<your-username>/<repo-name>.git
    git push -u origin master
    ```

---

## 3. Create a Pipeline Using Jenkins

### Prerequisites
- Jenkins installed
- GitHub repo URL

### Pipeline Steps
1. **Install Jenkins plugins:** Git, Docker
2. **Create a new Pipeline job**
3. **Sample Jenkinsfile:**
    ```
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
    ```
4. **Configure DockerHub credentials** in Jenkins (`dockerhub-credentials-id`).

---

## 4. Create and Deploy the Image to DockerHub

### Dockerfile Example
```dockerfile
# Dockerfile
FROM openjdk:8-jre-alpine
COPY Calculator.java /Calculator.java
RUN javac Calculator.java
CMD ["java", "Calculator"]
```

### Build and Push Manually (if needed)
```sh
docker build -t <your-dockerhub-username>/java-calculator .
docker login
docker push <your-dockerhub-username>/java-calculator
```

---

## 5. Run the Calculator from DockerHub

```sh
docker run -it <your-dockerhub-username>/java-calculator
```

---

## References

- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [DockerHub](https://hub.docker.com/)
- [GitHub Docs](https://docs.github.com/)

---

## License

MIT