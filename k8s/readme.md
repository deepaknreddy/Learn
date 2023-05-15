1.control-plane is the default master node in cluster  
2.the default inbuilt namespaces in kubernetes are,  
default  ,kube-node-lease , kube-public  , kube-system    


### 1.To create a POD with an already existing image:
```
kubectl run pod_name --image image_name
(this command will actually create deployment,rather than  a single pod)
```
```
kubectl run nginx --image=nginx --restart=Never 
(in this command will restart=Never will create a single pod)
```
#### (note: pods created here are not accessible from outside,to access them we have to curl/hit the internal IP of the POD)

