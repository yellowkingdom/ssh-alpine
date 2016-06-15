# maintainer yellowkingdom

FROM alpine:3.4
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk add --no-cache openssh
COPY . /app/sshrun/
RUN chmod +x /app/sshrun/run.sh
WORKDIR /app/sshrun/

RUN addgroup ssh
#RUN useradd -m /bin/bash -g ssh ssh
RUN adduser ssh -D -s /bin/sh -G ssh


EXPOSE 22 38123
#USER ssh
ENTRYPOINT ["./run.sh"]
#CMD ["./run.sh"]
