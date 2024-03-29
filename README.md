# Makefile for deploying Flutter app web app to Github Pages

# Update theese variables
BASE_HREF = '/hugo-web/'
GITHUB_REPO = https://github.com/RobertoLipovan/hugo-web.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying to git repository..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Finished Deploy"

.PHONY: deploy-web