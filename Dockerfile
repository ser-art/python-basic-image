FROM python:3.8.2-slim-buster

RUN apt-get update && \
    apt-get install -y apt-transport-https build-essential cmake curl gcc g++ git python3-numpy tree sudo unzip wget

RUN python -m venv venv

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN useradd -m user -u 1000 && \
    echo 'user:user' | chpasswd user && \
    echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user && \
    chown -R user /home

USER user