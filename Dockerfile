#基础镜像：仓库是java，tag是8
FROM 172.16.1.85:8888/hybase/jre8:1.0
# MAINTAINER
MAINTAINER burncode@qq.com
#安装相关命令
RUN apk update && apk add curl bash tree tzdata \

    && mkdir -p /docker_work && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
WORKDIR /docker_work
#环境变量 端口 jar包名称 java运行参数
ARG server_port=8080
ENV SERVER_PORT_ENV=${server_port}
ARG jar_name=app.jar
ENV JAR_NAME_ENV=${jar_name}
ARG java_opts=""
ENV JAVA_OPTS_ENV=${java_opts}
EXPOSE ${SERVER_PORT_ENV}

CMD java ${JAVA_OPTS_ENV} -Djava.security.egd=file:/dev/urandom -Duser.timezone=GMT+8 -Dserver.port=${SERVER_PORT_ENV} -jar ${JAR_NAME_ENV}/${JAR_NAME_ENV}.jar
