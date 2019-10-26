## Uninstall previous Docker version if necessary
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y

## Install and enable Docker software
sudo yum install -y yum-utils   device-mapper-persistent-data   lvm2
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

## Add user to Docker group
sudo usermod -aG docker {$USER}

## Download docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# docker-compose --version

## Clone the ELK repo
git clone https://github.com/ddarling85/docker-elk-clone.git
chcon -R system_u:object_r:admin_home_t:s0 docker-elk-clone/
cd docker-elk-clone
