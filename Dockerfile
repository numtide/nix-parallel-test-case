FROM numtide/nix-builder

# optional nix-builder args
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG S3_BUCKET

ADD . /app
RUN /nix-builder /app
