# Makefile for deploying Flutter app web app to Github Pages

BASE_HREF = '/hugo-web/'
GITHUB_WEB_REPO = https://github.com/RobertoLipovan/hugo-web.git
GITHUB_MAIN_REPO = https://github.com/RobertoLipovan/hugo.git
BUILD_VERSION := $(shell type pubspec.yaml | findstr /R "version: [0-9]*\.[0-9]*\.[0-9]*" | findstr /E /V "version:" | findstr /R "[0-9]*\.[0-9]*\.[0-9]*" | findstr /R "[0-9]*\.[0-9]*\.[0-9]*\+[0-9]*")

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
	git remote add origin $(GITHUB_WEB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Finished Deploy"

	@echo "Updating main repo"
	git add . && \
	git commit -m "Deploy $(BUILD_VERSION)" && \
	git branch -M main && \
	git push
	

.PHONY: deploy-web