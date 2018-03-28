FROM alpine:latest
#feeding REDIS_URL through environmental
ENV REDIS_URL=redis://hostname:6379
RUN apk update && apk add wget ca-certificates && cd /sbin && wget https://s3.amazonaws.com/ml-sreracha/sreracha
#Giving permissions to the application
RUN chmod 755 /sbin/sreracha
EXPOSE 80
#running as root
USER root
ENTRYPOINT /sbin/sreracha
FROM alpine:latest
#feeding REDIS_URL through environmental
ENV REDIS_URL=redis://hostname:6379
RUN apk update && apk add wget ca-certificates && cd /sbin && wget https://s3.amazonaws.com/ml-sreracha/sreracha
#Giving permissions to the application
RUN chmod 755 /sbin/sreracha
EXPOSE 80
#running as root
USER root
ENTRYPOINT /sbin/sreracha
