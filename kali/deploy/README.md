# Deployment Kali Linux w/ systemd

You can deploy Kali Linux with systemd to your K8s cluster, but if you want to use systemd you need to use in K8s, [cgroupv2](https://kubernetes.io/docs/concepts/architecture/cgroups/)

[Check cgroup version](https://kubernetes.io/docs/concepts/architecture/cgroups/#check-cgroup-version)

Deploy:

```bash
kubectl apply -f deploy.yaml
```

## Local cluster PoC (kind)

Demonstrates local Kubernetes cluster deployment to test a Kali Linux deployment with the systemd support

Firstly you need to create a local cluster, I recommend to use a [kind](https://kind.sigs.k8s.io), Kind [releases](https://github.com/kubernetes-sigs/kind/releases)

```bash
kind create cluster
```

Deploy a Kali Linux systemd deployment to your local Kubernetes cluster created via kind

```bash
kubectl apply -f deploy -n <namespace>
```

For deleting a local kubernetes cluster in kind you can use

```bash
kind delete cluster
```

Or

```
kind delete clusters <name>
```