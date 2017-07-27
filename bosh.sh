#!/bin/bash

# BOSH DEPLOYMENT directory
export BD=~/workspace/bosh-deployment

bosh2 create-env $BD/bosh.yml \
  --state=lab09-bosh-init-state.json \
  --vars-store=./creds.yml \
  -o $BD/vsphere/cpi.yml \
  -o $BD/misc/dns.yml \
  -o $BD/vsphere/resource-pool.yml \
  -v director_name=Sravan-test \
  -v internal_cidr=172.28.18.0/24 \
  -v internal_gw=172.28.18.1 \
  -v internal_ip=172.28.18.181 \
  -v network_name="Lab01-NetH" \
  -v vcenter_dc=Lab01-Datacenter01 \
  -v vcenter_ds=nfs-lab01-vol1 \
  -v vcenter_ip=172.29.0.11 \
  -v internal_dns=[172.29.0.5] \
  -v vcenter_user="lab01admin@lab.ecsteam.local" \
  -v vcenter_password="Ecsl@b99" \
  -v vcenter_templates=Sravan-bosh-template \
  -v vcenter_vms=Sravan-bosh-vms \
  -v vcenter_disks=Sravan-bosh-disks \
  -v vcenter_cluster=Lab01-Cluster01 \
  -v vcenter_rp=Sravan-testdirector

bosh2 -e 172.28.18.181 --ca-cert <(bosh2 int ./creds.yml --path /director_ssl/ca) alias-env lab01
