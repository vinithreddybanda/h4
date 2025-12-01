# Dockerfile
FROM openjdk:8-jre-alpine
COPY Calculator.java /Calculator.java
RUN javac Calculator.java
CMD ["java", "Calculator"]