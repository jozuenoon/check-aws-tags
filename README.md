Add following hook:
```
hooks:
  - manifest: |
      Type=oneshot                    
      ExecStart=/usr/bin/docker run --net host jozuenoon/check-aws-tags
      ExecStartPost=/bin/systemctl restart kubelet.service"
      name: ensure-aws-tags.service
    requires:
    - docker.service
    roles:
    - Node
```