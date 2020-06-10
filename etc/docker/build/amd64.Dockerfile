################################################################################
##      Copyright (C) 2020        Sebastian Francisco Colomar Bauza           ##
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################


################################################################################
ARG	tag="3.12.0"
ARG	digest="sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65"
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
