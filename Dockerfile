FROM marciodojr/phpstart


ENV PROTOBUF_VERSION=3.6.1
ENV CURAENGINE_VERSION=3.4.1

RUN apk add --no-cache build-base autoconf cmake git python3-dev python3 py3-sip-dev py3-sip protobuf-dev && pip3 install --upgrade pip \
&& pip3 install setuptools \
# PROTOBUF
&& cd ~ && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-python-${PROTOBUF_VERSION}.tar.gz \
&& tar zxf protobuf-python-${PROTOBUF_VERSION}.tar.gz \
&& cd protobuf-${PROTOBUF_VERSION} && cd python && python3 setup.py build && python3 setup.py install \
# LIBARCUS
&& cd ~ && git clone https://github.com/Ultimaker/libArcus.git \
&& cd libArcus && mkdir build && cd build && cmake .. && make && make install \
# CURAENGINE
&& cd ~ && git clone https://github.com/Ultimaker/CuraEngine && cd CuraEngine && git checkout ${CURAENGINE_VERSION} \
&& mkdir build && cd build && cmake .. && make
