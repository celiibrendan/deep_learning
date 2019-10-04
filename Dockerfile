FROM tensorflow/tensorflow:latest-py3-jupyter
LABEL maintainer="Brendan Celii"
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils

RUN pip3 install jupyterlab scipy

RUN pip3 install datajoint --upgrade

RUN apt-get -y install vim


WORKDIR /src

RUN pip3 install jupyterlab scipy

RUN mkdir -p /scripts
ADD ./jupyter/run_jupyter_unix.sh /scripts/
ADD ./jupyter/jupyter_notebook_config.py /root/.jupyter/
ADD ./jupyter/custom.css /root/.jupyter/custom/
RUN chmod -R a+x /scripts
ENTRYPOINT ["/scripts/run_jupyter_unix.sh"]
