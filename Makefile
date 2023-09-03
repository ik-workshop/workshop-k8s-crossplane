.EXPORT_ALL_VARIABLES:

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup dependencies
	@brew bundle

hooks: ## install pre commit.
	@pre-commit install
	@pre-commit gc
	@pre-commit autoupdate

install: ## Install pre-commit hooks
	@pre-commit install
	@pre-commit gc

uninstall: ## Uninstall hooks
	@pre-commit uninstall

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

upgrade-crossplane: ## Upgrade Crossplane
	# @helm dependency build ./config/helm/crossplane/
	@helm upgrade --install -n crossplane-system \
		crossplane ./config/helm/crossplane/ \
		--dependency-update \
		--cleanup-on-fail \
		--create-namespace \
		--atomic \
		--values ./config/helm/crossplane/values.yaml

diff-crossplane: ## Diff Crossplane
	# @helm dependency build ./config/helm/crossplane/
	@helm diff upgrade -n crossplane-system \
		crossplane ./config/helm/crossplane/ \
		--values ./config/helm/crossplane/values.yaml

template-crossplane: ## Template Crossplane
	@helm template crossplane config/helm/crossplane/ --output-dir ./result  \
		--values ./config/helm/crossplane/values.yaml
