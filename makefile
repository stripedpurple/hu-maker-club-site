# Makefile for auto deploy of the site
# Henry J Schmale

# Deploy settings defines where to deploy the site to
SITENAME      := humaker.club
DEPLOC        := /var/www/humaker.club

# List of things to exclude from the rsync deploy
EXCLUDE_LIST  := makefile

.PHONY: all
all: deploy


RSYNC_EXCLUDE_LIST := $(foreach e, $(EXCLUDE_LIST), --exclude ${e})
.PHONY: deploy
deploy:
	$(info $(RSYNC_EXCLUDE_LIST))
	rsync -v -r ${RSYNC_EXCLUDE_LIST} . "${SITENAME}:${DEPLOC}"

.PHONY: build
build:
	# TODO: add the jekyll build command here
