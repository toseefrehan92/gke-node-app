

# Telepresence

This Project is a service which is used to test telepresence interceptor.


## Installation


Ton install Telepresence run following command:


```bash
telepresence uninstall --everything brew install datawire/blackbird/telepresence
```


## Usage


To run telepresence in a shell run following command:

```node
telepresence --run-shell
```

 
This will start shell and you could run telepresence command e.g swap development etc.


To Intercept a service deployed in a cluster you first need to be connected to that cluster in your shell, so that you are in the same `context` with respect to cluster and telepresence could intercept service you want to.

After you are in `context` of cluster where your required service is running, initiate telepresence command to swap development of service e.g. I want to expose a service name `hello-app` in the cluster and port I want to expose is `8080` (port on which my local service is running), I will run following command

```bash
telepresence --swap-deployment hello-app --expose 8080 --run bash
```

After running the above command, and if everything goes well you will see responce like this 

```bash
Launching Telepresence User Daemon
Connected to context gke_emerald-ellipse-337309_us-east1-b_hello-app (https://34.75.119.76)
Using Deployment hello-app
intercepted
    Intercept name    : hello-app
    State             : ACTIVE
    Workload kind     : Deployment
    Destination       : 127.0.0.1:8080
    Volume Mount Error: sshfs is not installed on your local machine
    Intercepting      : all TCP connections

The default interactive shell is now zsh.
```

If you see this you are good to go. Now you can access public IP of your service and you will see traffic will be coming to your local machine for that specific service.

To close the interceptor while the telepresence shell is open just type `exit`. This will not only close `telepresence` shell but also interceptor will be killed as well.

## Issues:

In case of sleep mode or internet disconnected you will lose control of intercept (Active issue might be solved when you are reading this)

In this case you need to uninstall and install telpresence cluster again using following commands

```bash
telepresence uninstall --everything brew install datawire/blackbird/telepresence

telepresence quit
```
This will close all interceptor .

This working on it will write more to it. 


