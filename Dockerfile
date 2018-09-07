FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y git python python-pip python-virtualenv \
    && cd /root \
    && git clone https://github.com/OpenNebula/addon-pyone.git 

RUN cd /root/addon-pyone \
    && virtualenv VENV_TEST \
    && bash -c "source VENV_TEST/bin/activate \
        && pip install --upgrade setuptools \
        && pip install -r requirements.txt \
        && make \
        && python setup.py install \
        && python -m unittest discover -v -s tests"
