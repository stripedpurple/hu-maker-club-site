# Makefile for auto deploy of the site

SITENAME    := humaker.club
DEPLOC      := /var/www/humaker.club

.PHONY: all
all: deploy
	
.PHONY: deploy
deploy: