REGGAE_PATH = /usr/local/share/reggae
NGINX_FSTAB = services/nginx/templates/fstab
SERVICES = letsencrypt https://github.com/mekanix/jail-letsencrypt \
	   mysql https://github.com/mekanix/jail-mysql \
	   wordpress https://github.com/mekanix/jail-wordpress \
	   nginx https://github.com/mekanix/jail-nginx

post_setup:
.for service url in ${SERVICES}
	@echo "FQDN ?= ${FQDN}" >>services/${service}/vars.mk
.endfor
	@cat templates/fstab.nginx.local ${NGINX_FSTAB} | sort | uniq >${NGINX_FSTAB}

.include <${REGGAE_PATH}/mk/project.mk>
