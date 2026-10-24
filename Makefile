# NOTE: upstream used $(dir $(abspath ...)). GNU make's $(dir ) re-splits its
# argument on whitespace, so a checkout path containing spaces gets corrupted
# (each word gets its own dir applied, then they're re-joined) and CMake later
# fails to find extension_config.cmake. Resolve the directory in the shell
# instead: $(shell) output is assigned as one string and is never re-split.
PROJ_DIR := $(shell cd "$(dir $(lastword $(MAKEFILE_LIST)))" && pwd)/

# Configuration of extension
EXT_NAME=zeek
EXT_CONFIG=${PROJ_DIR}extension_config.cmake

# Include the Makefile from extension-ci-tools
include extension-ci-tools/makefiles/duckdb_extension.Makefile