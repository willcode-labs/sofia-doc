## Docker

### run

```
docker run -v {{local-path}}:/home -d -p 8091:4567 --name=SIGA-API-CORE-DOC {{docker-image-id}} /bin/bash -c 'cd /home && bundle install && bundle exec middleman build --clean && bundle exec middleman server'
``'
