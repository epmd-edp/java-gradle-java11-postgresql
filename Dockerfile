FROM openjdk:11-jre-slim

RUN mkdir /app
WORKDIR /app

ADD build/libs/*.jar /app/
EXPOSE 8080

RUN echo "#!/bin/sh \n\
exec /usr/local/openjdk-11/bin/java -jar $(ls /app/*.jar)\n"\
 > /app/entrypoint.sh
RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/bin/sh","/app/entrypoint.sh"]
