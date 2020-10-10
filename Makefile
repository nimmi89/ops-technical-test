export GIT_SHA
export VERSION
DOCKER_RUN=docker-compose run --rm
TF_VARS=ops-technical-test.tfvars
TF_PLAN=ops-technical-test.tfplan
GIT_SHA=$(shell git rev-parse --short HEAD)
VERSION=1.0

plan: init ssm-put
	$(DOCKER_RUN) terraform plan -out=$(TF_PLAN)
.PHONY: plan

deploy: init plan
	$(DOCKER_RUN) terraform apply $(TF_PLAN)
.PHONY: deploy

clean:
	$(DOCKER_RUN) terraform destroy
.PHONY: clean

ssm-put:
	bash scripts/ssm-put.sh  

ssm-get:
	echo "Getting your API KEY"
	bash scripts/ssm-get.sh


init:
	$(DOCKER_RUN) terraform init
.PHONY: init

test:
	echo "Running your final tests"
	bash scripts/test.sh
