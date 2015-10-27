# Makefile for auto deploy of the site
# Henry J Schmale

# Deploy settings defines where to deploy the site to
SITENAME      := humaker.club
DEPLOC        := /var/www/humaker.club
PORT          := 1984

# List of things to exclude from the rsync deploy
EXCLUDE_LIST  := makefile

.PHONY: all
all: deploy


RSYNC_EXCLUDE_LIST := $(foreach e, $(EXCLUDE_LIST), --exclude ${e})
.PHONY: deploy
deploy:
	rsync -avzr -e "ssh -p ${PORT}" \
		${RSYNC_EXCLUDE_LIST} . "${SITENAME}:${DEPLOC}"

.PHONY: build
build:
	# TODO: add the jekyll build command here
