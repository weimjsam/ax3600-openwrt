# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
grep "10.0.0.1" package/base-files/files/bin/config_generate

# Default SSID
sed -i 's/.ssid=OpenWrt/.ssid=OpenWrt_AX6/' package/kernel/mac80211/files/lib/wifi/mac80211.sh
grep "OpenWrt_AX6" package/kernel/mac80211/files/lib/wifi/mac80211.sh

#NTP server
sed -i "s/0.openwrt.pool.ntp.org/ntp.tuna.tsinghua.edu.cn/g" package/base-files/files/bin/config_generate
sed -i "/add_list system.ntp.server='1.openwrt.pool.ntp.org'/d" package/base-files/files/bin/config_generate
sed -i "/add_list system.ntp.server='2.openwrt.pool.ntp.org'/d" package/base-files/files/bin/config_generate
sed -i "/add_list system.ntp.server='3.openwrt.pool.ntp.org'/d" package/base-files/files/bin/config_generate
grep "system.ntp.server" package/base-files/files/bin/config_generate

sed -i "s#git.openwrt.org/feed#github.com/openwrt#g" feeds.conf.default
sed -i "s#git.openwrt.org/project#github.com/openwrt#g" feeds.conf.default

echo "src-git hickory_dns https://github.com/hingbong/hickory-dns-openwrt.git" >> feeds.conf.default

cat feeds.conf.default

echo "net.core.default_qdisc=fq_pie" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.conf.br-lan.arp_accept=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_slow_start_after_idle=0" >> package/base-files/files/etc/sysctl.conf
cat package/base-files/files/etc/sysctl.conf

