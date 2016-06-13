#!/bin/bash
  yum -y install nfs-utils
  systemctl start nfs
  systemctl start rpcbind
  mkdir /xiazhao-logging-1
  mkdir /xiazhao-metrics-1
  chown -R nfsnobody:nfsnobody /xiazhao-logging-1
  chown -R nfsnobody:nfsnobody /xiazhao-metrics-1
  echo '/xiazhao-logging-1 *(rw,all_squash)' >> /etc/exports
  echo '/xiazhao-metrics-1 *(rw,all_squash)' >> /etc/exports
  chmod 777 /xiazhao-logging-1
  chmod 777 /xiazhao-metrics-1
  exportfs -a
  setsebool -P virt_use_nfs 1

