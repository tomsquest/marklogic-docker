FROM centos:centos6.6
MAINTAINER Thomas Queste <tom@tomsquest.com>

# Pre-requisites
RUN yum -y install glibc.i686 gdb.x86_64 redhat-lsb.x86_64

# Install MarkLogic
ADD MarkLogic-8.0-4.x86_64.rpm /tmp/MarkLogic.rpm
RUN yum -y install /tmp/MarkLogic.rpm

# Include MarkLogic's libs
ENV LD_LIBRARY_PATH /opt/MarkLogic/lib

# Expose MarkLogic Server ports
# 8000 : Query console
# 8001 : Admin
# 8002 : Management/monitoring
# 8010 : (custom database) Rest api
# 8011 : (custom database) Xcc connector (deploiment...)
EXPOSE 8000 8001 8002 8010 8011

# Run and don't stop
CMD /opt/MarkLogic/bin/MarkLogic && tail -f /var/opt/MarkLogic/Logs/ErrorLog.txt