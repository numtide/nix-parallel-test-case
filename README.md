# Nix parallel fetch test case

This repo is used to demonstrate and benchmark nix's fetching speeds.

## Scripts

./bin/fixtures-upload is used to populate the S3 bucket with fixtures

./bin/fixtures-generate-nix is used to generate a nix expression that can
download all the S3 bucket fixtures into the /nix/store

./bin/binary-cache-upload is used to populate the binary cache

