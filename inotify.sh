#! /bin/sh

mimetype=`file -b --mime-type /monitoring/$1`

if [ $2 = "CREATE" ] || [ $2 = "MODIFY" ]; then
  /usr/local/gcloud/google-cloud-sdk/bin/gsutil -h "Content-Type:$mimetype" cp -r /monitoring/$1 gs://$BUCKET_NAME/$1
elif [ $2 = "DELETE" ]; then
  /usr/local/gcloud/google-cloud-sdk/bin/gsutil rm gs://$BUCKET_NAME/$1
fi
