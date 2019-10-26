echo '## Uninstall previous Docker version if necessary... \n\n'
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update

echo '## Install Docker requirements and adding repo... \n\n'
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"

echo '## Install and enable Docker software... \n\n'
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

echo '## Add user to Docker group... \n\n'
sudo usermod -aG docker $USER

echo '## Download docker-compose... \n\n'
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# docker-compose --version

echo '## Clone the ELK repo... \n\n'
git clone https://github.com/ddarling85/docker-elk-clone.git
chcon -R system_u:object_r:admin_home_t:s0 docker-elk-clone/
cd docker-elk-clone

echo '## Add required volume mount points for elasticsearch containers... \n\n'
sudo mkdir -p /srv/elasticsearch/es01_logs /srv/elasticsearch/es01_data /srv/elasticsearch/es02_data /srv/elasticsearch/es02_logs
sudo chown -R 1000:1000 /srv/elasticsearch

echo '## Add required vm.max_map_count for elasticsearch containers... \n\n'
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -p

