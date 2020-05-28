FROM dellelce/mosquitto-base as source

LABEL maintainer="Antonio Dell'Elce"

ENV PATH $PATH:${INSTALLDIR}/sbin:${INSTALLDIR}/bin
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${INSTALLDIR}/lib:${INSTALLDIR}/lib64

VOLUME ${INSTALLDIR}/data

# Note: configuration (if needed) is meant to defined by upstream service
RUN adduser -D -H -S mosquitto && \
    rm -rf ${INSTALLDIR}/include ${INSTALLDIR}/etc ${INSTALLDIR}/*/pkgconfig

EXPOSE 1883

CMD ["/bin/sh", "-c", "${INSTALLDIR}/sbin/mosquitto"]

