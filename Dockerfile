FROM iangelo/nginx 

# Building this image requires baking docker with docker.hcl in parent repo
COPY --from=frontend-base /app/build /usr/share/nginx/html
COPY src /etc/nginx
