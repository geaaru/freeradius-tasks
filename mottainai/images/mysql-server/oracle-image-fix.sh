#!/bin/bash
# Author: Daniele Rondina, geaaru@sabayonlinux.org

set -e

echo "Hook for product ${SSBUILDER_BUILD_PRODUCT} running..."

if [ -e "${SSBUILDER_STAGING_DIR}/.distrobuilder" ] ; then
  echo "Found directory ${SSBUILDER_STAGING_DIR}/.distrobuilder. I drop it"
  rm -rfv ${SSBUILDER_STAGING_DIR}/.distrobuilder
fi

echo "All done."

# vim: ts=3 sw=3
