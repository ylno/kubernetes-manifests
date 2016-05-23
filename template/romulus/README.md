# Romulus

## Debug Vulcand

kubectl get po --namespace=kube-system -lapp=romulus

kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl cluster-health

kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl ls --recursive --sort /vulcand

kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/frontends/aptly.aptly-public.web/frontend
kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/frontends/aptly.aptly-auth-api.web/frontend

kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/backends/aptly.aptly-public.web/backend
kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/backends/aptly.aptly-auth-api.web/backend

kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/backends/aptly.aptly-public.web/servers/aptly.aptly-public.33faf846
kubectl exec ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -- /etcdctl get /vulcand/backends/aptly.aptly-auth-api.web/servers/aptly.aptly-auth-api.38901213

## Logs

kubectl logs ingress-controller-v1-x08p3 --namespace=kube-system -c etcd -f

kubectl logs ingress-controller-v1-x08p3 --namespace=kube-system -c vulcan -f

kubectl logs ingress-controller-v1-x08p3 --namespace=kube-system -c romulus -f
 
