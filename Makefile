PORT ?= 8080

.PHONY: serve open dev deploy deploy-prod

## Serve locally on http://localhost:$(PORT)
serve:
	python3 -m http.server $(PORT)

## Open in browser and serve
dev:
	@open http://localhost:$(PORT) 2>/dev/null || xdg-open http://localhost:$(PORT) 2>/dev/null || true
	python3 -m http.server $(PORT)

## Deploy to Vercel preview
deploy:
	vercel

## Deploy to Vercel production
deploy-prod:
	vercel --prod

## Show available targets
help:
	@grep -E '^##' Makefile | sed 's/## //'
