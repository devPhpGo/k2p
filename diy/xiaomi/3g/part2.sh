#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 1.修改默认ip
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 2.修改主机名
sed -i 's/OpenWrt/xiaomi R3G/g' package/base-files/files/bin/config_generate

# 4.修改版本号
sed -i "s/OpenWrt /0012h build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt（lede） /g" package/lean/default-settings/files/zzz-default-settings

# 5.修改默认主题
sed -i ' s/luci-theme-bootstrap/luci-theme-argon/g ' feeds/luci/collections/luci/Makefile

# 6.设置ttyd免登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' /etc/config/ttyd

# 7.修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 8.设置Timezone
sed -i '/timezone='\''UTC'\''/a\\t\tset system.@system[-1].zonename='\''Asia/Shanghai'\''' package/base-files/files/bin/config_generate
sed -i '/timezone='\''UTC'\''/s/UTC/CST-8/' package/base-files/files/bin/config_generate

# 9.开起wifi
#sed -i '/set wireless.radio${devidx}.disabled=1/d' package/kernel/mac80211/files/lib/wifi/mac80211.sh
