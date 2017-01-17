# ELK Playground

## Usage

Use vagrant to run:

```bash
$ vagrant up
```

Create two indexes after provision
```
$ curl -XDELETE localhost:9200/*

$ curl -X PUT "http://localhost:9200/logstash-nginx-access/" \
    -d@/etc/logstash/index.d/logstash-nginx-access.json

$ curl -X PUT "http://localhost:9200/logstash-nginx-error/" \
    -d@/etc/logstash/index.d/logstash-default.json
```

## Load single event with geoip information

```
$ curl -H "X-Real-Ip: 89.17.48.5" -H "Host: elk.local" 127.1 -v
```

## Kibana Web-interface

[http://elk.local](http://elk.local])


## Sample configuration bundled

 * [NGINX syslog output](build/ansible/roles/configure.vagrant/templates/nginx/kibana.conf.j2)
 * [Parser and Mapping configuration](build/ansible/roles/configure.vagrant/files/)

## Links

- https://www.elastic.co/guide/index.html
- https://habrahabr.ru/company/badoo/blog/280606/
- https://kartar.net/2014/09/when-logstash-and-syslog-go-wrong/
- http://grokdebug.herokuapp.com/