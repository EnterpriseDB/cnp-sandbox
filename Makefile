.DEFAULT_GOAL := help

# Credits: https://gist.github.com/prwhite/8168133
.PHONY: help
help: ## Prints help command output
	@awk 'BEGIN {FS = ":.*##"; printf "\ncnp-sandbox CLI\nUsage:\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: generate-docs
generate-docs: ## Updates the auto-generated chart README.md
	@helm-docs || (echo "Please, install https://github.com/norwoodj/helm-docs first" && exit 1)

.PHONY: generate-schema
generate-schema: ## Updates the auto-generated chart values.schema.json
	@helm schema-gen charts/cnp-sandbox/values.yaml > charts/cnp-sandbox/values.schema.json || \
		(@echo "Please, run: helm plugin install https://github.com/karuppiah7890/helm-schema-gen.git" && exit 1)
	@echo "Validation schema generated, location: charts/cnp-sandbox/values.schema.json"

.PHONY: sandbox-deploy
sandbox-deploy: ## Installs cnp-sandbox chart
	helm dependency update charts/cnp-sandbox
	helm upgrade --install cnp-sandbox --atomic charts/cnp-sandbox

.PHONY: sandbox-deploy-dev
sandbox-deploy-dev: ## Installs cnp-sandbox chart with a development version of CNP
	helm dependency update charts/cnp-sandbox
	helm upgrade --install cnp-sandbox --set cloud-native-postgresql.enabled=false --atomic charts/cnp-sandbox

.PHONY: sandbox-uninstall
sandbox-uninstall: ## Uninstalls cnp-sandbox chart if present
	@helm uninstall cnp-sandbox
	@kubectl delete cluster cnp-sandbox
