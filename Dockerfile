# USING UBUNTU AS BASE IMAGE
FROM ubuntu AS tom
RUN apt update && apt install -y git
WORKDIR /app
RUN git clone https://github.com/chaitanya-0799/tomcat-conf.git

FROM tomcat
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/
RUN rm /usr/local/tomcat/conf/tomcat-users.xml && \
    rm /usr/local/tomcat/webapps/manager/META-INF/context.xml && \
    rm /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

COPY --from=tom /app/tomcat-conf/tomcat-users.xml /usr/local/tomcat/conf/
COPY --from=tom /app/tomcat-conf/context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY --from=tom /app/tomcat-conf/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/

EXPOSE 8080
