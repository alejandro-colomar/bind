################################################################################
##      Copyright (C) 2020        Sebastian Francisco Colomar Bauza           ##
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################


################################################################################
ARG	tag="1.19.0-alpine"
ARG	digest="sha256:3b3f647d2d99cac772ed64c4791e5d9b750dd5fe0b25db653ec4976f7b72837c"
################################################################################
FROM	"alpine:${tag}@${digest}"	AS bind
################################################################################

RUN	apk add	--no-cache --upgrade bind

RUN	ln -svT	/run/configs/etc/bind/named.conf	/etc/bind/named.conf &&\
	ln -svT	/run/secrets/var/bind/master		/var/bind/master

################################################################################
ENTRYPOINT	["named"]
CMD		["-c", "/etc/bind/named.conf", "-g"]
################################################################################
