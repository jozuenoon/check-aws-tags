Add following hook to cluster definition:
```
  hooks:
  - manifest: |
      Type=oneshot                    
      ExecStart=/usr/bin/docker run --net host jozuenoon/check-aws-tags
      ExecStartPost=/bin/systemctl restart kubelet.service
    name: ensure-aws-tags.service
    requires:
    - docker.service
    roles:
    - Node
```

The file should be placed under path `/lib/systemd/system/ensure-aws-tags.service`

Reference:

[1] - https://github.com/kubernetes/kops/issues/3605