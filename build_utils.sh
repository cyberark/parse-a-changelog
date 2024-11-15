#!/bin/bash

set -euo pipefail

####
# Functions to generate version numbers for this project
####

git_tag() {
  git rev-parse --short HEAD
}

# generate less specific versions, eg. given 1.2.3 will print 1.2 and 1
# (note: the argument itself is not printed, append it explicitly if needed)
gen_versions() {
  local version=$1
  while [[ $version = *.* ]]; do
    version=${version%.*}
    echo $version
  done
}

function tag_and_push() {
  local source="$1"
  shift
  local target="$1"
  shift

  docker tag "${source}" "${target}"
  docker push "${target}"
}

function retrieve_cyberark_ca_cert() {
  # On CyberArk dev laptops, golang module dependencies are downloaded with a
  # corporate proxy in the middle. For these connections to succeed we need to
  # configure the proxy CA certificate in build containers.
  #
  # To allow this script to also work on non-CyberArk laptops where the CA
  # certificate is not available, we update container certificates based on
  # a (potentially empty) certificate directory, rather than relying on the
  # CA file itself.
  mkdir -p "$(repo_root)/build_ca_certificate"

  # Only attempt to extract the certificate if the security
  # command is available.
  #
  # The certificate file must have the .crt extension to be imported
  # by `update-ca-certificates`.
  if command -v security &> /dev/null
  then
    security find-certificate \
      -a -c "CyberArk Root CA" \
      -p > build_ca_certificate/cyberark_root.crt
  fi
}

repo_root() {
  git rev-parse --show-toplevel
}
