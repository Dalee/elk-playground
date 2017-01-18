all: vagrant

vagrant:
	curl -XDELETE localhost:9200/*
	curl -X PUT "http://localhost:9200/_template/logstash-error" -d@/etc/logstash/index.d/logstash-error.json
	curl -X PUT "http://localhost:9200/_template/logstash-frontend-access" -d@/etc/logstash/index.d/logstash-frontend-access.json
	curl -X PUT "http://localhost:9200/_template/logstash-frontend-error" -d@/etc/logstash/index.d/logstash-frontend-error.json
	curl -X PUT "http://localhost:9200/_template/logstash-backend" -d@/etc/logstash/index.d/logstash-backend.json
	sudo service kibana restart
	echo "Done!"
