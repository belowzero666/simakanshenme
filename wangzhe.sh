#!/bin/bash
#蓝底白字
echo -e "\033[44;37m 欢迎使用0℃-ICE王者shell防封 \033[0m"
echo -e "\033[44;37m 云端构建时间:4.2 \033[0m"
echo -e "\033[44;37m 版本号:0℃-w17\033[0m"
echo -e "\033[45;37m 开始清理iptables规则 \033[0m"
iptables -F
iptables -t nat -F 
iptables -X
iptables -Z
ip6tables -F
ip6tables -X
ip6tables -Z
ip6tables=/system/bin/ip6tables
iptables=/system/bin/iptables
echo -e "\033[45;37m 自动捕获王者uid \033[0m"
uid=`cat /data/system/packages.list | grep com.tencent.tmgp.sgame | awk '{print $2}'`
echo -e "\033[45;37m 禁止王者荣耀获取tcp+udp网络状态 \033[0m"
iptables -t filter -A OUTPUT -m owner --uid-owner=$uid -j DROP
ip6tables -A OUTPUT -j DROP
echo -e "\033[41;37m 0℃防封开始加载 \033[0m"
sleep 1
#防封主体结构
#ip防封
echo -e "\033[46;30m 0℃修复三方环境异常 \033[0m"
#修复第三方环境异常
echo 16384 > /proc/sys/fs/inotify/max_queued_events
echo 128 > /proc/sys/fs/inotify/max_user_instances
echo 8192 > /proc/sys/fs/inotify/max_user_watches
echo 修复成功啦
sleep 1
echo -e "\033[46;30m修复特权验证异常\033[0m"
iptables -I OUTPUT -m owner --uid-owner=$uid -d priv.igame.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d lbs.map.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d apis.map.qq.com -j ACCEPT
echo -e "\033[46;30m 大厅封号数据 \033[0m"
#qq大厅联网ip
iptables -I OUTPUT -m owner --uid-owner=$uid -d 109.244.230.132 -j ACCEPT
#微信大厅联网ip
iptables -I OUTPUT -m owner --uid-owner=$uid -d 109.244.230.137 -j ACCEPT
echo -e "\033[46;30m 处理战斗封号服务器 \033[0m"
#udp
#对局域名qq
#特殊
#微信大厅联网
echo "微信大厅（①/②）"
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d njawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gzawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjawx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iwx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iwxcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqiwx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d njiwx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gziwx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjiwx.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iwxft.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d awxcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d awxft.smoba.qq.com -j ACCEPT
echo "QQ大厅（②/②）"
#QQ区大厅联网
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqqcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqqft.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d njaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gzaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjaqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iqqcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d cqiqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d njiqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d gziqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d tjiqq.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d aqqcs.smoba.qq.com -j ACCEPT
iptables -I OUTPUT -m owner --uid-owner=$uid -d iqqft.smoba.qq.com -j ACCEPT
echo -e "\033[41;37m 外部交流q群: 1151698121 \033[0m"
echo -e "\033[47;30m 0℃-ICE-VIPshell主体框架防封加载完毕"
echo -e "\033[46;30m加载验证地址\033[0m"
echo 浏览器访问
echo 验证地址：www.baidu.com
echo 无法进入即防封生效
iptables -I OUTPUT -p all -m string --string "m.baidu.com" --algo bm -j DROP
iptables -I OUTPUT -p all -m string --string "www.baidu.com" --algo bm -j DROP
echo "-----------------------------------------------------"
endDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "★[$endDate] 0℃-北京时间"
echo "-----------------------------------------------------"
echo -e "\033[46;30m 0℃获取机型\033[0m"
echo "请检查防禁网改机型模块是否生效"
echo -n "你的设备："
getprop ro.product.brand
echo -n "设备类型："
getprop ro.product.model
echo -e "\033[46;30m 0℃反三方禁网循环\033[0m"
sleep 1
rm -r /data/user/0/com.tencent.tmgp.sgame/files/ano_tmp/*
echo "调用本机最大线程反保护开始ing……"
echo "看到此消息后等待3s左右可点击开始游戏按钮了"
while
do
rm -rf /data/user/0/com.tencent.tmgp.sgame/files/ano_tmp/*
rm -rf /data/data/com.tencent.tmgp.sgame/files/ano_tmp/*
rm -rf filedir /data/data/com.tencent.tmgp.sgame/shared_prefs/igame_priority_sdk_pref_priority_info.xml
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/cache/GameJoyRecorder
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/cache/GCloudSDKLog
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/logs
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/midas/log
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/Pandora/logs
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/tencent/mobileqq/opensdk/logs
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/TGPA/Log
rm -rf filedir /storage/emulated/0/Android/data/com.tencent.tmgp.sgame/files/TGPA/Log
rm -rf filedir  /data/user/0/com.tencent.tmgp.sgame/files/ano_tm
echo 16384 > /proc/sys/fs/inotify/max_queued_events
echo 128 > /proc/sys/fs/inotify/max_user_instances
echo 8192 > /proc/sys/fs/inotify/max_user_watches
done
