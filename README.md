# Nginx-ingress-controller
/etc/kubernetes/manifests/kube-controller-manager.manifest edit this file and add the parameter like --horizontal-pod-autoscaler-use-rest-clients=false

# weave Network plugin

#kubectl create -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')


 ./test.sh --action deploy-pod-autoscaling  --deployment frontend --namespace production --scaleup 10  --scaledown 9
 
 
 cat /var/log/kube-deploy/kube-frontend-2019-07-18.log
