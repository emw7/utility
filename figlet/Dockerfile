ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

# An image that allow to create spring banners as depicted here 
#  https://www.patorjk.com/software/taag/#p=display&f=3D-ASCII&t=ACME

# How to build the image (see build-image.sh):
#  docker build -t 'figlet:<version>' -t figlet:latest .

# How to use:
#  docker run --rm -e TEXT=ciao figlet
#  docker run --rm -e FONT=MyFont-e TEXT=ciao figlet
#                          ^^^ must be one of the installed fonts.

# http://www.figlet.org/
RUN apk add figlet

# Add figlet fonts.
# Source: https://github.com/xero/figlet-fonts/blob/master/.
COPY figlet-fonts/* /usr/share/figlet/fonts/

ENV FONT=Doom
ENV TEXT=ACME

ENTRYPOINT [ "sh", "-c", "/usr/bin/figlet -w 160 -f ${FONT} ${TEXT}" ] 
