FROM eclipse-temurin:23-jdk-alpine AS builder
COPY Calculator.java /Calculator.java
RUN javac Calculator.java
CMD ["java", "Calculator"]