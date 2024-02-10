FROM alpine:3.19.1

RUN apk add curl python3 inotify-tools file &&\
    curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz &&\
    mkdir -p /usr/local/gcloud &&\
    tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz &&\
    yes y | /usr/local/gcloud/google-cloud-sdk/install.sh &&\
  rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh
ADD inotify.sh /inotify.sh

CMD ["/bin/sh", "/entrypoint.sh"]
