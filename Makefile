
build:
	@GOOS=linux GOARCH=amd64 go build

bake:
	@docker build -t consul-backup .

tag:
	@docker tag consul-backup:latest bernardovale/consul-backup:v4

push:
	@docker push bernardovale/consul-backup:v4