#Compile megasync on Ubuntu 16.10 using Docker

This Dockerfile will get a clean ubuntu 16.10 and do all the steps to build megasync
After you can run the container to copy the excutable compiled where you want. In this example it will build the docker image (takes a while)
Then the docker run command connect the host /tmp/mega to the container /install. During the execution of the container, the executable is copied.
All the receipe to build megasync on ubuntu 16.10 is included in the Dockerfile.

```
docker build -t megabuild .
docker run --rm -v /tmp/mega:/install megabuild
mkdir -p ~/bin && cp /tmp/mega/megasync ~/bin/
~/bin/megasync
```

