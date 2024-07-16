FROM	ubuntu:24.04@sha256:c920ba4cfca05503764b785c16b76d43c83a6df8d1ab107e7e6610000d94315c

ARG	UID
ARG	UNAME
ARG	GID
ARG	GNAME
ARG	VERSION

#region common to all x11 applications
# userdel is a limitation... to do a good job the user with UID, the user with GID, the
#  the user with UNAME and the user with GNAME should be deleted  before adding new user.
RUN	apt-get update && apt-get install -qqy \
	 x11-apps && \
	userdel ubuntu && \
	  echo "$UNAME:x:$UID:$GID:$UNAME,,,:/home/$UNAME:/bin/bash" >>/etc/passwd && \
	echo "$GNAME:x:$GID:" >>/etc/group && \
	mkdir -p /home/$UNAME && \
	chown $UID:$GID /home/$UNAME
#endregion common to all x11 applications

#region all dbeaver versions
RUN	apt-get install -qqy \
	 libswt-gtk-4-java \
	 libswt-gtk-4-jni && \
        mkdir -p /app/dbeaver
#endregion all dbeaver versions

#region specific dbeaver version
COPY	/tmp/dbeaver-ce-$VERSION.tgz /tmp

RUN	tar xvfz /tmp/dbeaver-ce-$VERSION.tgz --strip-components 1 -C /app/dbeaver && \
        rm /tmp/dbeaver-ce-$VERSION.tgz
#endregion specific dbeaver version

USER	$UNAME:$GNAME
ENTRYPOINT	[ "/app/dbeaver/dbeaver" ]

