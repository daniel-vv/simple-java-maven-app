pipeline {
    agent any

    environment {
        // Docker 镜像名称
        DOCKER_IMAGE = 'simple-java-maven-app'
        DOCKER_TAG = 'latest'
        // Docker Registry 凭据 ID，稍后需要在 Jenkins 中配置
        REGISTRY_CREDENTIALS = 'github'
        // Maven 工具配置
        MAVEN_HOME = tool name: 'maven', type: 'hudson.tasks.Maven$MavenInstallation'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                // 克隆 GitHub 仓库
                git branch: 'master', url: 'https://github.com/daniel-vv/simple-java-maven-app.git'
            }
        }

        stage('Build with Maven') {
            steps {
                // 使用 Maven 进行构建并生成 .jar 文件
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // 使用 Dockerfile 构建 Docker 镜像
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
    }

    post {
        always {
            // 清理工作区
            cleanWs()
        }
    }
}
