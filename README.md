# ELK Playground

## Usage

```bash
$ vagrant up
$ vagrant ssh
$ cd /home/web/elk
$ make vagrant
```

This will install template mappings for the following indexes (logstash automatic mapping 
management is disabled): 
 * `logstash-frontend-access-*`
 * `logstash-frontend-error-*`
 * `logstash-backend-*`
 * `logstash-error-*`

So, what those mappings all about?

`logstash-frontend-*` - indices for `access_log` and `error_log` NGINX configuration parameters.
`log_format` is described in bundled configuration sample:
```
log_format logstash '$remote_addr "$host" '
                    '$request_method "$request_uri" '
                    '"$http_referer" "$http_user_agent" '
                    '$status $bytes_sent '
                    '$geoip_country_code $geoip_latitude $geoip_longitude';
```

`logstash-backend-*` - indices for [dalee-logger](https://github.com/Dalee/node-logger) library

`logstash-error-*` - indices for logstash `_grokparsefailure` events  

## Load single event with geoip information

```
$ curl -H "X-Real-Ip: 89.17.48.5" -H "Host: elk.local" 127.1 -v
```

## Kibana Web-interface

[http://elk.local](http://elk.local])

## Bundled configurations

Few sample configurations for frontend (nginx) and backend (right now, only node.js)

 * [Parser and Mapping configuration](build/ansible/roles/configure.vagrant/files/)
 * [Sample NGINX config](build/ansible/roles/configure.vagrant/templates/nginx/kibana.conf.j2)
 * [Backend logging library](https://github.com/Dalee/node-logger)

## Links

- https://www.elastic.co/guide/index.html
- https://habrahabr.ru/company/badoo/blog/280606/
- https://kartar.net/2014/09/when-logstash-and-syslog-go-wrong/
- http://grokdebug.herokuapp.com/