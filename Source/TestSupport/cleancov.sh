#!/bin/sh
source envcov.sh

# Clean out the old data
"${LCOV_PATH}/lcov" -d "${OBJ_DIR}" --zerocounters
