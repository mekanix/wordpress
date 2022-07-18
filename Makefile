REGGAE_PATH = /usr/local/share/reggae
USE = letsencrypt mysql nginx
NGINX_FSTAB = services/nginx/templates/fstab
SERVICES = wordpress https://github.com/mekanix/jail-wordpress
.include <${REGGAE_PATH}/mk/use.mk>

post_setup:
.for service url in ${ALL_SERVICES}
	@echo "FQDN ?= ${FQDN}" >>services/${service}/project.mk
.endfor
	@cat templates/fstab.nginx.local ${NGINX_FSTAB} | sort | uniq >${NGINX_FSTAB}

.include <${REGGAE_PATH}/mk/project.mk>
