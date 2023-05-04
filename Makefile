REGGAE_PATH = /usr/local/share/reggae
USE = letsencrypt mysql wordpress nginx
FQDN ?= example.com
BACKEND != reggae get-config BACKEND
CBSD_WORKDIR != sysrc -s cbsd -n cbsd_workdir 2>/dev/null || true

.include <${REGGAE_PATH}/mk/use.mk>

post_setup:
.for service url in ${ALL_SERVICES}
	@echo "FQDN ?= ${FQDN}" >>services/${service}/project.mk
.endfor
.if ${BACKEND} == base
	@echo "\$${base}/letsencrypt/usr/local/etc/dehydrated/certs \$${path}/etc/certs nullfs ro 0 0" >services/nginx/templates/fstab
	@echo "\$${base}/wordpress/usr/local/www/wordpress \$${path}/usr/local/www/wordpress nullfs ro 0 0" >>services/nginx/templates/fstab
.elif ${BACKEND} == cbsd
	@echo "${CBSD_WORKDIR}/jails-data/letsencrypt-data/usr/local/etc/dehydrated/certs /etc/certs nullfs ro 0 0" >services/nginx/templates/fstab
	@echo "${CBSD_WORKDIR}/jails-data/wordpress-data/usr/local/www/wordpress /usr/local/www/wordpress nullfs ro 0 0" >>services/nginx/templates/fstab
.endif

.include <${REGGAE_PATH}/mk/project.mk>
