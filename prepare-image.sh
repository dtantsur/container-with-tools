set -eux

to_install=$(grep -vE '^(#|$)' /tmp/packages-list.txt | tr '\n' ' ')
to_remove=$(grep -vE '^(#|$)' /tmp/removal-list.txt | tr '\n' ' ')

echo "install_weak_deps=False" >> /etc/dnf/dnf.conf
echo "tsflags=nodocs" >> /etc/dnf/dnf.conf

dnf upgrade -y
dnf install -y $to_install
dnf clean all
dnf remove -y --setopt protected_packages="$to_install" $to_remove
rm -rf /var/cache/{yum,dnf}/*
