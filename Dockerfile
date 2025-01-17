# 使用官方 Playwright 镜像，它已经包含浏览器依赖和 Java
FROM mcr.microsoft.com/playwright/java:v1.47.0-noble

# 指定工作目录
WORKDIR /app

# 将项目的所有源码复制到容器中
COPY . /app

# 使用 Maven 打包项目
RUN mvn clean package -DskipTests

# 将构建好的 JAR 文件复制到指定位置 (假设打包后 JAR 文件位于 target/ 目录)
RUN mv target/*.jar /app/app.jar

# 容器启动时执行的命令，运行 Java 应用
ENTRYPOINT ["java", "-Xms512m", "-Xmx512m", "-jar", "/app/app.jar"]

# 如果应用运行在特定端口，使用 EXPOSE 指定端口
EXPOSE 8080
