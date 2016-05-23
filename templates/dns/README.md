# Kube DNS Problem
 
if
 
`kubectl get po --namespace=kube-system -lk8s-app=kube-dns`
```
NAME                 READY     STATUS    RESTARTS   AGE
kube-dns-v10-eqmsl   3/4       Running   0          2m
```
then
`kubectl get secret --namespace=kube-system`
```
NAME                  TYPE                                  DATA      AGE
default-token-jfesv   kubernetes.io/service-account-token   2         3m
```
`kubectl delete secret/default-token-jfesv --namespace=kube-system`
finally
```
kubectl delete -f dns
kubectl create -f dns
```
`kubectl get po --namespace=kube-system -lk8s-app=kube-dns`
```
NAME                 READY     STATUS    RESTARTS   AGE
kube-dns-v10-dbm2l   4/4       Running   0          2m
```