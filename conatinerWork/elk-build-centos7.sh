sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.2.0-x86_64.rpm
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.2.0-x86_64.rpm
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.2.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.2.0-x86_64.rpm
