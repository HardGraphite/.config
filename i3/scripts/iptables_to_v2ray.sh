#!/usr/bin/sh

# 删除设置
#iptables -t nat -F
#iptables -t nat -X GLOBAL_SOCKS

# 新建一个`GLOBAL_SOCKS`链
iptables -t nat -N GLOBAL_SOCKS

# 添加链`GLOBAL_SOCKS`到链`OUTPUT`上
iptables -t nat -A OUTPUT -p tcp --dport 443 -j GLOBAL_SOCKS
iptables -t nat -A OUTPUT -p tcp --dport 80 -j GLOBAL_SOCKS
iptables -t nat -A PREROUTING -p tcp --dport 443 -j GLOBAL_SOCKS
iptables -t nat -A PREROUTING -p tcp --dport 80 -j GLOBAL_SOCKS

# 忽略对你服务器地址的转发
iptables -t nat -A GLOBAL_SOCKS -d 207.246.103.91 -j RETURN

# 忽略本地地址, 按自己的需求改写
iptables -t nat -A GLOBAL_SOCKS -d 127.0.0.1/8 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 192.168.1.0/24 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 192.168.0.1 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 192.168.0.0 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 0.0.0.0 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 8.8.8.8 -j RETURN
iptables -t nat -A GLOBAL_SOCKS -d 114.114.114.114 -j RETURN

# 添加转发tcp, udp 到端口 1080, 这里端口写你在V2Ray中设置的端口
iptables -t nat -A GLOBAL_SOCKS -p tcp -j REDIRECT --to 1080
iptables -t nat -A GLOBAL_SOCKS -p udp -j REDIRECT --to 1080

# 最后显示设置
iptables -t nat -nvL

