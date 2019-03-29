FROM nginx:alpine
LABEL	maintainer=devops_program@pingidentity.com \
		license="Ping Identity Proprietary" \
		vendor="Ping Identity Corp." \
		name="Ping Identity (alpine/nginx) Image"

COPY dist/ /usr/share/nginx/html/
COPY entrypoint.sh /opt/

ENTRYPOINT [ "/opt/entrypoint.sh" ]
