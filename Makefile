REGGAE_PATH = /usr/local/share/reggae
SERVICES = mysql https://github.com/mekanix/jail-mysql \
	   wordpress https://github.com/mekanix/jail-wordpress \
	   nginx https://github.com/mekanix/jail-nginx

.include <${REGGAE_PATH}/mk/project.mk>

