################################################################################
##      Copyright (C) 2020        Sebastian Francisco Colomar Bauza           ##
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################


################################################################################
FROM	"alpine:3.12.0"	AS bind
################################################################################
RUN									\
	apk add	--no-cache --upgrade bind

################################################################################
RUN									\
	rm -f	/etc/bind/named.conf					&& \
	ln -svT	/run/configs/etc/bind/named.conf			\
		/etc/bind/named.conf					&& \
	rm -rf	/var/bind/master					&& \
	ln -svT	/run/secrets/var/bind/master				\
		/var/bind/master

################################################################################
ENTRYPOINT	["named"]
CMD		["-c", "/etc/bind/named.conf", "-g"]
################################################################################
