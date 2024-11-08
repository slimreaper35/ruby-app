#!/bin/bash

set -e

source ~/cachi2/venv/bin/activate

cachi2 fetch-deps bundler
cachi2 inject-files --for-output-dir /tmp/cachi2-output cachi2-output
cachi2 generate-env --for-output-dir /tmp/cachi2-output --output cachi2.env cachi2-output

podman build . \
  --volume "$(realpath ./cachi2-output)":/tmp/cachi2-output:Z \
  --volume "$(realpath ./cachi2.env)":/tmp/cachi2.env:Z \
  --network none \
  --no-cache \
  --tag bundler-tmp
