FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install \
    build-essential \
    gcc \
    g++ \
    make \
    bc \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    libncurses-dev \
    dwarves \
    pahole \
    ccache \
    dkms \
    libudev-dev \
    kmod \
    cpio \
    tar \
    xz-utils \
    curl \
    wget \
    git \
    gnupg \
    ca-certificates \
    clang \
    lld \
    llvm

RUN curl https://pyenv.run | bash

ENV PYENV_ROOT=/root/.pyenv
ENV PATH=/root/.pyenv/bin:$PATH

RUN source ~/.bashrc && \
    eval "$(pyenv init -)" && \
    pyenv install 2.7.18 && \
    pyenv install 3.12.5 && \
    pyenv global 2.7.18 3.12.5

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc

CMD ["/bin/bash"]
