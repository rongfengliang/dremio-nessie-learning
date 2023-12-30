FROM dremio/dremio-oss:24.3.0
USER root
COPY dremio-env-profile /opt/dremio/conf/dremio-env
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY dremio.conf /opt/dremio/conf/dremio.conf
COPY jprofiler_linux_14_0.deb /opt/jprofiler_linux_14_0.deb
RUN dpkg -i /opt/jprofiler_linux_14_0.deb
USER dremio