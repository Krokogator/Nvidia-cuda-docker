FROM nvidia/cuda:11.3.1-devel-ubuntu20.04
CMD nvidia-smi

# setup docker environment
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl
RUN apt-get -y install libcudnn8
RUN apt-get -y upgrade
RUN apt-get install unzip
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

# download kaggle catsanddogs dataset
RUN curl -O https://download.microsoft.com/download/3/E/1/3E1C3F21-ECDB-4869-8368-6DEBA77B919F/kagglecatsanddogs_3367a.zip
RUN unzip -q kagglecatsanddogs_3367a.zip && mkdir app && mv PetImages app/ && rm kagglecatsanddogs_3367a.zip

# install python libs
COPY requirements.txt /app/requirements_verbose.txt
RUN pip3 install -r /app/requirements_verbose.txt

# copy scirpt and set workdir
COPY main.py /app/
WORKDIR /app

# run python script when executing docker image
CMD ["python3", "main.py"]