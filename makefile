# Makefile for auto deploy of the site
# Henry J Schmale
# C: October 26, 2015
# M: October 27, 2015
#
# To Deploy:
# 	make deploy
#
# To build and test:
# 	make
#
# This was choosen, because every invocation of make should not try to
# deploy it, and it is easier to test the builds with just a simple `make`
# command. Also deploys to the server should be explicit when used.

# Deploy settings defines where to deploy the site to
SITENAME      := humaker.club
DEPLOC        := /var/www/humaker.club
PORT          := 1984

# Fix file owner settings
USER   	      := $(shell whoami)
GROUP         := humakerclub
CHOWN         := "${USER}:${GROUP}"

# Directory where jekyll outputs the built site
BUILD_OUT_DIR := ./_site/

# List of things to exclude from the rsync deploy
EXCLUDE_LIST  := makefile
RSYNC_EXCLUDE_LIST := $(foreach e, $(EXCLUDE_LIST), --exclude ${e})

.PHONY: all
all: build

.PHONY: deploy
deploy: build
	rsync -avzrog -e "ssh -p ${PORT}" --chown=${CHOWN} \
		${RSYNC_EXCLUDE_LIST} ${BUILD_OUT_DIR} "${SITENAME}:${DEPLOC}"

.PHONY: build
build:
	jekyll build
	find ${BUILD_OUT_DIR} -type d -exec chmod g+s {} \;
