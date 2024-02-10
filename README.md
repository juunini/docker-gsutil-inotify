# Docker Monitoring Directory and Sync to Google Cloud Storage

## Pull

```sh
docker pull juunini/gsutil-inotify
```

## Usage

```sh
docker run -dit \
  -v /path/to/your/creds.json:/creds.json \
  -v /path/to/your/monitoring:/monitoring \
  -e BUCKET_NAME=your-bucket-name \
  --name gcs-watcher \
  juunini/gsutil-inotify
```

## VOLUMES

- /creds.json: Google Cloud Service Account key file
- /monitoring: Watched directory for file changes

## ENVIRONMENTS

- BUCKET_NAME: Google Cloud Storage bucket name; example: `your-bucket-name`  
    If you want to include bucket's path; example) `your-bucket-name/path/to/folder`
