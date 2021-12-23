# README
SonarQube 的 Docker 配置 Docker for SonarQube

## 使用 
`docker pull sonarnextnext/sonarqube`

[sonarnextnext/sonarqube](https://hub.docker.com/r/sonarnextnext/sonarqube)

## 使用 docker-compose 启动

复制 `docker-compose.yml` 文件到本地，然后修改 `POSTGRES_PASSWORD` 和 `SONARQUBE_JDBC_PASSWORD` 为你自己的密码。

Postgresql 数据库的数据默认会挂载在执行目录下

### 启动 

`docker-compose up -d `




