FROM iangelo/nginx

USER root
RUN apk add --no-cache gettext
USER nginx

# Building this image requires baking docker with docker.hcl in parent repo
COPY --chown=nginx:nginx --from=frontend-base /app/build /usr/share/nginx/html
COPY --chown=nginx:nginx src /etc/nginx

# Embed environment variables
COPY --chmod=755 docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
