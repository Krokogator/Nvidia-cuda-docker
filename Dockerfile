#FROM nvidia/cuda:10.2-base
FROM nvidia/cuda:11.3.1-devel-ubuntu20.04
CMD nvidia-smi

#set up environmentdocke
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl
RUN apt-get -y install libcudnn8
RUN apt-get -y upgrade
RUN apt-get install unzip
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

COPY requirements.txt /app/requirements_verbose.txt

RUN pip3 install -r /app/requirements_verbose.txt

#copies the applicaiton from local path to container path
COPY main.py /app/
COPY PetImages /app/PetImages
WORKDIR /app

#ENV NUM_EPOCHS=10
#ENV MODEL_TYPE='EfficientDet'
#ENV DATASET_LINK='HIDDEN'
#ENV TRAIN_TIME_SEC=100
CMD ["python3", "main.py"]