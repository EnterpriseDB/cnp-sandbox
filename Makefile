.DEFAULT_GOAL := help

# Credits: https://gist.github.com/prwhite/8168133
.PHONY: help
help: ## Prints help command output
	@awk 'BEGIN {FS = ":.*##"; printf "\ncnp-playground CLI\nUsage:\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: generate-docs
generate-docs: ## Updates the auto-generated chart README.md
	@helm-docs || (echo "Please, install https://github.com/norwoodj/helm-docs first" && exit 1)

.PHONY: generate-schema
generate-schema: ## Updates the auto-generated chart values.schema.json
	@helm schema-gen charts/cnp-playground/values.yaml > charts/cnp-playground/values.schema.json || \
		(@echo "Please, run: helm plugin install https://github.com/karuppiah7890/helm-schema-gen.git" && exit 1)
	@echo "Validation schema generated, location: charts/cnp-playground/values.schema.json"

.PHONY: playground-deploy
playground-deploy: ## Installs cnp-playground chart
	helm dependency update charts/cnp-playground
	helm upgrade --install cnp-playground --atomic charts/cnp-playground

.PHONY: playground-deploy-dev
playground-deploy-dev: ## Installs cnp-playground chart with a development version of CNP
	helm dependency update charts/cnp-playground
	helm upgrade --install cnp-playground --set cloud-native-postgresql.enabled=false --atomic charts/cnp-playground

.PHONY: playground-uninstall
playground-uninstall: ## Uninstalls cnp-playground chart if present
	@helm uninstall cnp-playground
	@kubectl delete cluster cnp-playground
