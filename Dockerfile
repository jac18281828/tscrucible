FROM jac18281828/tsdev:latest

# unzip is required for bun
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -y -q --no-install-recommends \
  unzip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*



ARG PROJECT=tscrucible
WORKDIR /workspace/${PROJECT}
COPY --chown=tsdev:tsdev . .
USER tsdev
ENV PATH=${PATH}:/go/bin

# Install Bun
ADD --chown=${USER}:${USER} --chmod=555 https://bun.sh/install /bun/install.sh

RUN /bun/install.sh && \
    sudo rm -rf /bun

ENV PATH=${PATH}:/home/tsdev/.bun/bin
