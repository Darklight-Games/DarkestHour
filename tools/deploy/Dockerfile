FROM ubuntu:24.04

RUN apt-get update

# Install Git.
RUN apt-get install -y git

# Install Python.
RUN apt-get install -y python3 python3-pip

# Install steamcmd.
RUN apt-get install -y software-properties-common
RUN add-apt-repository multiverse; dpkg --add-architecture i386
RUN apt-get update
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections
RUN apt-get install -y steamcmd
RUN apt-get install -y python3-virtualenv
RUN apt-get install -y wine

# Install usagi (builds the game), using a Rust toolchain from rustup.
RUN apt-get install -y curl build-essential
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
ENV PATH="$PATH:/root/.cargo/bin"
RUN cargo install usagi-cli --version 0.4.0 --locked

# Run steamcmd once to update it.
RUN /usr/games/steamcmd +exit

# Add steamcmd to the path.
ENV PATH="$PATH:/usr/games"

ENTRYPOINT ["/RedOrchestra/tools/deploy/deploy_internal.sh"]
# ENTRYPOINT ["/bin/bash"]
