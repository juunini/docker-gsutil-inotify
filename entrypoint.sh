/usr/local/gcloud/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file=/creds.json

inotifywait -m -e create -e modify -e delete -r /monitoring |
while read dirname event filename;
do
  path=`echo $dirname | sed 's/\/monitoring\///'`
  sh /inotify.sh $path$filename $event
done
