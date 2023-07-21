# Deployment Kali Linux w/ systemd

You can deploy Kali Linux with SystemD to your K8s cluster, but if you want to use systemd you need to use in K8s, [cgroupv2](https://kubernetes.io/docs/concepts/architecture/cgroups/)

[Check cgroup version](https://kubernetes.io/docs/concepts/architecture/cgroups/#check-cgroup-version)

Deploy:

```bash
kubectl apply -f deploy.yaml
```