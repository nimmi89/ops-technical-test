export GIT_SHA
export VERSION
export API_URL
DOCKER_RUN=docker-compose run --rm
TF_VARS=ops-technical-test.tfvars
TF_PLAN=ops-technical-test.tfplan
GIT_SHA=$(shell git rev-parse --short HEAD)
VERSION=1.0
API_URL = $(shell $(DOCKER_RUN) terraform output api_endpoint)

plan: init ssm-put
	$(DOCKER_RUN) terraform plan -out=$(TF_PLAN)
.PHONY: plan

deploy: init plan
	$(DOCKER_RUN) terraform apply $(TF_PLAN)
.PHONY: deploy

ssm-put:
	echo "Storing GIT_SHA and VERSION of your application"
	bash scripts/ssm-put.sh  

init:
	$(DOCKER_RUN) terraform init
.PHONY: init


test:   
	bash scripts/test.sh

clean:
	$(DOCKER_RUN) terraform destroy
.PHONY: clean
