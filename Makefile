install:
	# run this under sudo
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	sudo chmod +x /bin/hadolint
	npm install

lint:
	# This is linter for Dockerfiles
	echo "Run lint for dockerfile"
	hadolint Dockerfile
	echo "Run lint for sample project"
	npm run lint
	echo "Run test for sample project"