# bluemix
IBM Bluemix Client Docker Image

## build
```shell
docker build -t jhsea3do/bluemix-cli:centos7 .
```

## run
```shell
docker run -it --rm \
  -e BLUEMIX_API_KEY=xxxx_your_api_key_xxxx \
  -v $(pwd)/bootstrap.sh:/tmp/bootstrap.sh \
  -v $(pwd)/profile:/root/.bluemix
  jhsea3do/bluemix-cli:centos7 sh /tmp/bootstrap.sh
```
