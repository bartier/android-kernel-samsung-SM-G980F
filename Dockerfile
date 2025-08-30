FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
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

# Install pyenv dependencies
RUN apt -y install \
    libreadline-dev \
    zlib1g-dev \
    python3-pip \
    python-is-python3

# Set up pyenv
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"

# Install pyenv and Python versions
RUN curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc && \
    . ~/.bashrc && \
    pyenv install 2.7.18 && \
    pyenv install 3.12.5 && \
    pyenv global 2.7.18 3.12.5

# Set working directory
WORKDIR /kernel

# Set default command
CMD ["/bin/bash"]
