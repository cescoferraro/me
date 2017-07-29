FROM kyma/docker-nginx
COPY docs/ /var/www
CMD 'nginx'
