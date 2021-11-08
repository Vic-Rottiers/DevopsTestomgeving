#! /bin/bash
#
# Provisioning script for srv001

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Utility functions
# shellcheck source=/dev/null
source ${PROVISIONING_SCRIPTS}/util.sh
# Actions/settings common to all servers
# shellcheck source=/dev/null
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

#----------------------------
# Docker variables
#----------------------------

# mongodb
#mongoimagename='mongomongo:4.4.10'
mongocontainername='con_mongo'
mongovolume='mongo-data'

# dotnet server app
dotnetimagename='img_europart_server'
dotnetcontainername='con_europart_server'

#----------------------------
# Install Docker
#----------------------------

if ! is_installed docker
then
  log "Installing docker"
  apt-get update -y

  # set up repo
  apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  # add docker official GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  # stable repo
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Install docker engine
  apt-get update 
  apt-get -y install docker-ce docker-ce-cli containerd.io

else
  log "Docker already installed, moving on..."
fi

#----------------------------
# install Docker-Compose
#----------------------------

if ! is_installed docker-compose
then
  log "Installing docker-compose"
  # download release
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

  # make executable
  chmod +x /usr/local/bin/docker-compose
else
  log "Docker-compose already installed, moving on..."
fi

#----------------------------
# setup Docker
#----------------------------
# create mongo volume
if ! is_volume $mongovolume 
then
  log "creating volume: $mongovolume"
  docker volume create $mongovolume 
fi

#----------------------------
# Build/pull Docker images
#----------------------------

# check if image exists
if is_image $dotnetimagename
then
  # image does exist, so delete first
  log "deleting existing image $dotnetimagename"
  sudo docker rmi $dotnetimagename -f
fi

#----------------------------
# Run Docker containers
#----------------------------

if is_container $dotnetcontainername
then
  # container does exist, so delete first
  log "deleting existing container $dotnetcontainername"
  sudo docker rm $dotnetcontainername -f
fi

if is_container $mongocontainername
then
  # container does exist, so delete first
  log "deleting existing container $mongocontainername"
  sudo docker rm $mongocontainername -f
fi

cd /home/vagrant/project

# stop computers
docker-compose stop

# start containers
log "start docker-compose"
cd /home/vagrant/project
docker-compose up -d