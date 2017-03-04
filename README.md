# Nix parallel fetch test case

This repo is used to demonstrate and benchmark nix's fetching speeds.

## Files

```
.
├── bin
│   ├── bench                  -- used to run the benchmarks
│   ├── binary-cache-upload    -- used to populate the binary cache
│   ├── docker-build           -- used to populate the binary cache as well
│   ├── fixtures-generate-nix  -- used to generate the ./fixtures.nix file
│   └── fixtures-upload        -- used to upload fixtures to S3
├── config.env                 -- defaults to be sourced in the environment
├── default.nix                -- main derivation to test the download speed
├── Dockerfile                 -- allows to build default.nix using docker
├── fixtures.nix               -- sample files
├── README.md                  -- hi
└── RESULTS.txt                -- benchmark results
```

## Procedure

Run `./bin/bench`
