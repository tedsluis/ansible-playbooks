# Deploy kubernetes

## create roles/kubernetes/files/git-ssh-secret.yaml

Create a secret with your private key to access git 

https://kubernetes.io/docs/concepts/configuration/secret/#use-case-pod-with-ssh-keys

```bash
apiVersion: v1
data:
  git-ssh-secret: <--- base64 hashed private key --->
kind: Secret
metadata:
  name: git-ssh-secret
  namespace: argocd
type: Opaque

```

Use *ansible-vault encrypt roles/kubernetes/files/git-ssh-secret.yaml* before adding it to git.

## create roles/kubernetes/files/vault-sealed-secrets-key-secret.yaml

Create your own rsa key pair to seal secrets.

https://github.com/bitnami-labs/sealed-secrets/blob/main/docs/bring-your-own-certificates.md#used-your-recently-created-public-key-to-seal-your-secret

Store the keypair in your .ssh directory. You will need the public key to create sealed-secrets later.

```bash
---
apiVersion: v1
kind: Secret
type: kubernetes.io/tls
metadata:
  namespace: sealed-secrets
  name: sealed-secrets-key
  labels:
    sealedsecrets.bitnami.com/sealed-secrets-key: active
data:
  tls.crt: >-
    <--- base64 hashed public key --->
  tls.key: >-
    <--- base64 hashed private key --->
```

Use *ansible-vault encrypt roles/kubernetes/files/vault-sealed-secrets-key-secret.yaml* before adding it to git.

## Deploy cluster

```bash
$ ansible-playbook -l fed120 kubernetes.yaml
```

## Argocd

Once the cluster is cluster is deployed, it may take more than a few minutes, you can access argocd. 
When ready, create a port-forward to access argocd using the browser https://localhost:8443/

```bash
$ kubectl -n argocd port-forward service/argocd-server 8443:443
```

User admin uses this password:

```bash
$ kubectl -n argocd get secret argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d
```


## Create sealed-secrets

Once the cluster is deployed, you can create sealed-secrets.

Use your own sealed-secrets public key ~/.ssh/sealed_secrets_tls.crt to create sealed secrets.

ingress-tls Sealed-secret:

```bash
$ kubectl -n awx create secret tls ingress-tls --cert=/var/lib/certs/fullchain.pem --key=/var/lib/certs/privkey.pem --dry-run=server -o yaml | kubeseal --cert ~/.ssh/sealed_secrets_tls.crt --controller-namespace=kube-system --controller-name=sealed-secrets-controller --format=yaml > roles/kubernetes/files/argocd/awx/ingress-tls.yml
```

## Remove cluster

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#tear-down

```bash
# sudo kubeadm reset
```
