# 使用官方 OpenJDK 作为基础镜像
FROM openjdk:11-jre-slim

# 设置工作目录
WORKDIR /usr/src/app

# 将应用的 Jar 包复制到容器中
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# 指定容器启动时的命令
ENTRYPOINT ["java", "-jar", "app.jar"]
