

export | grep ID_LI /etc/os-release
$OSNAME=`grep ID_LI /etc/os-release`

source docker-elk-clone/.env

case $OSNAME in
redhat)
    curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-$ELK_VERSION-x86_64.rpm
    curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$ELK_VERSION-x86_64.rpm
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$ELK_VERSION-x86_64.rpm
    sudo rpm -vi *.rpm
    ;;
debian)
    curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-$ELK_VERSION-amd64.deb
    curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$ELK_VERSION-amd64.deb
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$ELK_VERSION-amd64.deb
    sudo dpkg -i *.deb
    ;;
*)
esac


sudo sed -i 's/STRING_TO_REPLACE/STRING_TO_REPLACE_IT/g' /etc/auditbeat/auditbeat.yml
sudo sed -i 's/STRING_TO_REPLACE/STRING_TO_REPLACE_IT/g' /etc/metricbeat/metricbeat.yml
sudo sed -i 's/STRING_TO_REPLACE/STRING_TO_REPLACE_IT/g' /etc/filebeat/filebeat.yml


metricbeat setup
filebeat setup
auditbeat setup


sudo systemctl enable metricbeat
sudo systemctl enable auditbeat
sudo systemctl enable filebeat

