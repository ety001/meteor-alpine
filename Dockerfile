FROM mhart/alpine-node:4.8.3
ENV BUILD_PACKAGES="python make gcc g++ git libuv bash curl tar bzip2"
VOLUME /app
RUN apk --no-cache add ${BUILD_PACKAGES} \
	&& mkdir -p /root \
	&& mkdir -p /app \
	&& npm install -g npm@4 \
	&& npm install -g node-gyp \
	&& node-gyp install
EXPOSE 80
CMD ["/app/run.sh"]
