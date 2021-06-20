# Nvidia docker with cuda support 

### What's the fuss

Aim of this repo is to share an example usage of nvidia/cuda docker that enables running python scripts with tensorflow.

### In more details

I am providing here a Dockerfile that uses nvidia/cuda image and python script that implements example from Keras website. It's a simple implementation of Cats vs Dogs classification realised with CNN.

* Keras example: https://keras.io/examples/vision/image_classification_from_scratch/
* Dockerhub nvidia/cuda: https://hub.docker.com/r/nvidia/cuda

### How to buld and run

Tested on Manjaro with 5.10.42-1 kernel

```
docker build . -t keras-nvidia-docker
docker run --rm --gpus all --privileged keras-nvidia-docker 
```

#### Additional config (on arch/manjaro):

* Edit file `/etc/nvidia-container-runtime/config.toml`
    * set `no-cgroups` to true
* Run docker with `--privileged` flag