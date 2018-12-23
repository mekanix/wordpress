REGGAE_PATH = /usr/local/share/reggae
NGINX_FSTAB = services/nginx/templates/fstab
SERVICES = mysql https://github.com/mekanix/jail-mysql \
	   wordpress https://github.com/mekanix/jail-wordpress \
	   letsencrypt https://github.com/mekanix/jail-letsencrypt \
	   nginx https://github.com/mekanix/jail-nginx

pre_up:
	@touch ${NGINX_FSTAB}
	@cat templates/fstab.nginx.local ${NGINX_FSTAB} | sort | uniq >${NGINX_FSTAB}

.include <${REGGAE_PATH}/mk/project.mk>
