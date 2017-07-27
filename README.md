# bosh-concourse_deployment
clone https://github.com/cloudfoundry/bosh-deployment
look at the bosh.sh script to create bosh instance
upload cloud-config.yml
bosh upload release concourse_release( from concourse.ci website)
bosh upload release garden_release( from concourse.ci website)
bosh upload stemcell lastest_stemcell_specific_to_Iaas( from bosh.io website)
create concourse-manifest.yml file
do a bosh deploy
