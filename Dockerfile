FROM ghcr.io/jac18281828/tsdev:latest

ARG PROJECT=tscrucible
WORKDIR /workspace/${PROJECT}
COPY --chown=tsdev:tsdev . .
USER tsdev
ENV PATH=${PATH}:/go/bin:/home/tsdev/.bun/bin
