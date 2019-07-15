FROM alpine:3.9
ARG VERSION
ARG VCS_REF
ARG BUILD_DATE
ENV NAMED_UID=1001
ENV NAMED_GID=101
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.version="$VERSION" \
      org.label-schema.maintainer="https://github.com/capybara1/" \
      org.label-schema.url="https://github.com/capybara1/Docker-DNS" \
      org.label-schema.name="dns" \
      org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/capybara1/Docker-DNS" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.dockerfile="/Dockerfile"
RUN set -x; \
    apk --no-cache add bind
VOLUME /etc/bind
EXPOSE 53
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/etc/bind/named.conf"]
