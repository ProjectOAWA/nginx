FROM iangelo/nginx

# Building this image requires baking docker with docker.hcl in parent repo
COPY --from=frontend-base /app/build /usr/share/nginx/html
COPY src /etc/nginx

# Entrypoint replaces env variables
COPY --chmod=755 docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
