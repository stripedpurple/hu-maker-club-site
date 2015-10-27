# Makefile for auto deploy of the site
# Henry J Schmale

# Deploy settings
SITENAME      := humaker.club
DEPLOC        := /var/www/humaker.club

# List of things to exclude from the rsync deploy
EXCLUDE_LIST  := makefile

.PHONY: all
all: deploy


RSYNC_EXCLUDE_LIST := $(foreach exlus, $(EXCLUDE_LIST), --exclude $exclus)
.PHONY: deploy
deploy:


.PHONY: build
build:
	# TODO: add the jekyll build command here
