FROM python:3.10

RUN apt update
RUN apt install -y python3-pip
RUN pip3 install virtualenv

# Needed for postgresql singer dependencies
RUN apt install libpq-dev

WORKDIR /opt

# creating 2 seperate venvs to avoid dependency conflicts
RUN virtualenv ./tap
RUN virtualenv ./target


RUN /bin/bash -c "source ./tap/bin/activate && pip3 install tap-mysql && deactivate"

RUN /bin/bash -c "source ./target/bin/activate && pip3 install singer-target-postgres && deactivate"


COPY file.sh file.sh
COPY mysql mysql
COPY postgres postgres

CMD ["./file.sh"]

