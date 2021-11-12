FROM registry.ci.openshift.org/ocp/builder:rhel-8-base-openshift-4.10

COPY packages-list.txt removal-list.txt prepare-image.sh /tmp
RUN /tmp/prepare-image.sh && \
    rm -f /tmp/{packages-list.txt,removal-list.txt,prepare-image.sh}
