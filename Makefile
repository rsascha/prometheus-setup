setup:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update

install:
	kubectl create namespace prometheus
	helm install prometheus prometheus-community/kube-prometheus-stack \
		--namespace prometheus \
		--values values.yaml

uninstall:
	helm uninstall prometheus --namespace prometheus
	kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
	kubectl delete crd alertmanagers.monitoring.coreos.com
	kubectl delete crd podmonitors.monitoring.coreos.com
	kubectl delete crd probes.monitoring.coreos.com
	kubectl delete crd prometheuses.monitoring.coreos.com
	kubectl delete crd prometheusrules.monitoring.coreos.com
	kubectl delete crd servicemonitors.monitoring.coreos.com
	kubectl delete crd thanosrulers.monitoring.coreos.com
	kubectl delete namespace prometheus
 
re-install: uninstall install
 
upgrade:
	helm upgrade prometheus prometheus-community/kube-prometheus-stack \
		--namespace prometheus \
		--values values.yaml
