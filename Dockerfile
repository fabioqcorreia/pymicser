FROM ubuntu:16.04

LABEL author="Cintra, Guilherme 'cinguilherme@gmail.com'"

RUN mkdir /home/ubuntu/

WORKDIR /home/ubuntu/

RUN apt-get update -y \
	&& apt-get install -y python-pip python-dev python3-pip python3-dev build-essential gcc zlib1g-dev git wget \
	&& wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz \
	&& tar -xf Python-3.6.4.tgz \
	&& cd Python-3.6.4 \
	&& ./configure --enable-optimizations \
	&& make \
	&& make altinstall

WORKDIR /home/ubuntu/

RUN git clone https://github.com/cinguilherme/pymicser.git \
	&& mkdir user-service-f \
	&& mv /home/ubuntu/pymicser /home/ubuntu/user-service-f

WORKDIR /user-service-f

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3.6","app.py"]