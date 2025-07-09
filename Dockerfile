FROM docker.io/leg100/otf-agent:0.3.27

RUN apk add --no-cache \
    py3-pip build-base musl-dev python3-dev libffi-dev openssl-dev cargo make

RUN pip install --no-cache-dir --upgrade pip
COPY python-requirements.txt python-requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install --no-cache-dir -r python-requirements.txt