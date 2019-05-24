# SpringCloud 微服务 dockerfile，主要是为了方便开发环境频繁更新 jar 包，做成了外挂 jar 包的形式，由于服务众多，为了方便部署和更新，对端口和包名，java 运行参数做了动态环境变量

# 主要的环境变量有以下几个

[服务提供暴露端口] SERVER_PORT_ENV 31005
[jar 包运行参数] JAVA_OPTS_ENV -Xms256m -Xmx512m
[jar 包名称,这里为了统一是 jar 包打包后的 artifactId] JAR_NAME_ENV hy_bus_registration_admin_server
