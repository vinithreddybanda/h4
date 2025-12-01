FROM openjdk:8-jdk-alpine
COPY Calculator.java /Calculator.java
RUN javac Calculator.java
CMD ["java", "Calculator"]