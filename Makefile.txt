format:
	find . -name "*.yaml" -exec yamlformat -write -path "{}" \;
installyamlformat:
	go get github.com/bborbe/yamlformat/bin/yamlformat
deployprod:
	cd app; find . -type d -depth 1 -not -name .git -not -name template -not -name utils -not -name _archive -exec kubectl create -f "{}" --namespace=production \;
deploydev:
	cd app; find . -type d -depth 1 -not -name .git -not -name template -not -name utils -not -name _archive -exec kubectl create -f "{}" --namespace=development \;
deploysystem:
	cd system; find . -type d -depth 1 -not -name .git -not -name template -not -name utils -not -name _archive -exec kubectl create -f "{}" --namespace=kube-system \;
proxy:
	echo "open http://localhost:8080/api/v1/proxy/namespaces/kube-system/services/dashboard/"
	kubectl proxy --port=8080
