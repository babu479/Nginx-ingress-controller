# Nginx-ingress-controller
/etc/kubernetes/manifests/kube-controller-manager.manifest edit this file and add the parameter like --horizontal-pod-autoscaler-use-rest-clients=false

#weave Network plugin
#kubectl create -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')
