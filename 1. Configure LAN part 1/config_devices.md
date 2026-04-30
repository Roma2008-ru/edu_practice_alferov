# Конфигурация устройств 

## rus-nsk-r1
```
Current configuration : 2434 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-r1
!
!
!
!
ip dhcp excluded-address 1.0.0.1 1.0.0.99
ip dhcp excluded-address 1.0.0.200 1.0.0.255
ip dhcp excluded-address 2.0.0.1 2.0.0.99
ip dhcp excluded-address 3.0.0.1 3.0.0.99
ip dhcp excluded-address 4.0.0.1 4.0.0.99
ip dhcp excluded-address 2.0.0.200 2.0.0.255
ip dhcp excluded-address 3.0.0.200 3.0.0.255
ip dhcp excluded-address 4.0.0.200 4.0.0.255
!
ip dhcp pool vlan1
 network 1.0.0.0 255.0.0.0
 default-router 1.0.0.1
 domain-name nsk.local
ip dhcp pool vlan2
 network 2.0.0.0 255.0.0.0
 default-router 2.0.0.1
 domain-name nsk.local
ip dhcp pool vlan3
 network 3.0.0.0 255.0.0.0
 default-router 3.0.0.1
 domain-name nsk.local
ip dhcp pool vlan4
 network 4.0.0.0 255.0.0.0
 default-router 4.0.0.1
 domain-name nsk.local
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX101760JJ-
!
!
!
!
!
!
!
!
!
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface Loopback1
 ip address 192.168.101.1 255.255.255.0
!
interface Tunnel1
 ip address 200.200.200.1 255.255.255.0
 mtu 1476
 tunnel source FastEthernet0/0
 tunnel destination 12.0.0.3
!
!
interface FastEthernet0/0
 ip address 40.40.40.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/1.1
 encapsulation dot1Q 1 native
 ip address 1.0.0.1 255.0.0.0
!
interface FastEthernet0/1.2
 encapsulation dot1Q 2
 ip address 2.0.0.1 255.0.0.0
!
interface FastEthernet0/1.3
 encapsulation dot1Q 3
 ip address 3.0.0.1 255.0.0.0
!
interface FastEthernet0/1.4
 encapsulation dot1Q 4
 ip address 4.0.0.1 255.0.0.0
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 40.0.0.0
 network 10.0.0.0
 network 11.0.0.0
 network 12.0.0.0
!
router rip
 version 2
 passive-interface Loopback1
 network 192.168.101.0
 no auto-summary
!
ip classless
ip route 192.168.103.0 255.255.255.0 200.200.200.3 
!
ip flow-export version 9
!
!
!
banner motd ^CThe work was done by Roman Alferov, a student in the 9CA-321 group, in the journal under the number 1!^C
!
!
!
!
logging trap debugging
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

---

## rus-msk-r2
```
Current configuration : 1457 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-r2
!
!
!
!
!
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10179944-
!
!
!
!
!
!
!
!
!
ip ftp username cisco
ip ftp password cisco
ip domain-name msk.local
ip host standby 10.0.0.3 
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 10.0.0.2 255.0.0.0
 ip access-group 102 in
 duplex auto
 speed auto
 standby 1 ip 10.0.0.1
 standby 1 priority 110
 standby 1 preempt
 standby 1 track FastEthernet0/1
!
interface FastEthernet0/1
 ip address 11.0.0.2 255.0.0.0
 ip access-group 102 in
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 10.0.0.0
 network 11.0.0.0
!
ip classless
!
ip flow-export version 9
!
!
access-list 101 permit tcp host 2.0.0.100 host 10.0.0.100 eq www
access-list 101 deny tcp 2.0.0.0 0.255.255.255 host 10.0.0.100 eq www
access-list 101 permit ip any any
access-list 102 deny icmp any any echo
access-list 102 permit ip any any
!
banner motd ^CThe work was done by Roman Alferov, a student in the 9CA-321 group, in the journal under the number 1!^C
!
!
!
snmp-server community cisco RO
!
logging trap debugging
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

---

## rus-msk-r3
```
Current configuration : 2150 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-r3
!
!
!
!
!
!
!
aaa new-model
!
aaa authentication login default group radius local 
aaa authentication enable default group radius enable 
!
!
!
!
!
!
!
no ip cef
no ipv6 cef
!
!
!
username backup secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
username new_user secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
license udi pid CISCO2811/K9 sn FTX1017K7IT-
!
!
!
!
!
!
!
!
!
ip domain-name msk.local
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface Loopback3
 ip address 192.168.103.3 255.255.255.0
!
interface Tunnel3
 ip address 200.200.200.3 255.255.255.0
 mtu 1476
 tunnel source FastEthernet0/1
 tunnel destination 40.40.40.1
!
!
interface FastEthernet0/0
 ip address 10.0.0.3 255.0.0.0
 ip access-group 102 in
 duplex auto
 speed auto
 standby 1 ip 10.0.0.1
 standby 1 preempt
!
interface FastEthernet0/1
 ip address 12.0.0.3 255.0.0.0
 ip access-group 101 in
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 100
 network 10.0.0.0
 network 12.0.0.0
 network 11.0.0.0
!
router rip
 version 2
 passive-interface Loopback3
 network 12.0.0.0
 network 192.168.103.0
 no auto-summary
!
ip classless
ip route 192.168.101.0 255.255.255.0 200.200.200.1 
!
ip flow-export version 9
!
!
access-list 102 deny icmp any any echo
access-list 102 permit ip any any
access-list 101 permit tcp host 2.0.0.100 host 10.0.0.100 eq www
access-list 101 deny tcp 2.0.0.0 0.255.255.255 host 10.0.0.100 eq www
access-list 101 permit ip any any
!
banner motd ^CThe work was done by Roman Alferov, a student in the 9CA-321 group, in the journal under the number 1!^C
!
radius server 10.0.0.100
 address ipv4 10.0.0.100 auth-port 1645
 key cisco
!
!
snmp-server community cisco RO
!
logging trap debugging
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login authentication default
 transport input telnet
line vty 5 15
 login authentication default
 transport input telnet
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

---

## rus-nsk-sw1
```
Current configuration : 2359 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-sw1
!
!
!
ip ssh version 2
ip domain-name nsk.local
!
username nsk secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface Port-channel1
 switchport mode trunk
!
interface FastEthernet0/1
!
interface FastEthernet0/2
 switchport access vlan 2
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 000B.BE82.6369
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/3
 switchport access vlan 3
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 0050.0FB5.EC14
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/4
 switchport access vlan 4
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 000C.8567.C14C
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
 switchport mode trunk
!
interface GigabitEthernet0/1
 switchport mode trunk
 channel-group 1 mode desirable
!
interface GigabitEthernet0/2
 switchport mode trunk
 channel-group 1 mode desirable
!
interface Vlan1
 ip address 1.0.0.50 255.0.0.0
 shutdown
!
ip default-gateway 1.0.0.1
!
banner motd ^CThis rus-nsk-sw1^C
!
!
!
line con 0
 logging synchronous
 login local
 history size 256
 exec-timeout 0 0
!
line vty 0 4
 exec-timeout 0 0
 login local
 transport input ssh
line vty 5 15
 exec-timeout 0 0
 login local
 transport input ssh
!
!
!
!
end
```

---

## rus-nsk-sw2
```
Current configuration : 2474 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-nsk-sw2
!
!
!
ip ssh version 2
ip domain-name nsk.local
!
username nsk secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface Port-channel1
 switchport mode trunk
!
interface FastEthernet0/1
!
interface FastEthernet0/2
 switchport access vlan 2
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 0060.3E3D.6C40
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/3
 switchport access vlan 3
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 00E0.F7B3.2C05
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/4
 switchport access vlan 4
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
 switchport port-security mac-address sticky 0001.426E.6973
 no cdp enable
 spanning-tree portfast
 spanning-tree bpduguard enable
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
 switchport mode trunk
 channel-group 1 mode auto
!
interface GigabitEthernet0/2
 switchport mode trunk
 channel-group 1 mode auto
!
interface Vlan1
 no ip address
 shutdown
!
interface Vlan2
 ip address 2.0.0.50 255.0.0.0
!
ip default-gateway 2.0.0.1
!
banner motd ^CThis rus-nsk-sw2^C
!
!
!
access-list 10 permit host 10.0.0.100
access-list 10 permit host 2.0.0.100
line con 0
 logging synchronous
 login local
 history size 256
 exec-timeout 0 0
!
line vty 0 4
 access-class 10 in
 exec-timeout 0 0
 login local
 transport input ssh
line vty 5 15
 access-class 10 in
 exec-timeout 0 0
 login local
 transport input ssh
!
!
!
!
end
```

---

## rus-msk-r1
```
Current configuration : 1110 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname rus-msk-sw1
!
!
!
ip domain-name msk.local
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
!
interface FastEthernet0/2
!
interface FastEthernet0/3
!
interface FastEthernet0/4
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 no ip address
 shutdown
!
!
!
!
line con 0
!
line vty 0 4
 login
line vty 5 15
 login
!
!
!
!
end
```

---

## MLS
```
Current configuration : 2074 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname MLS
!
!
!
!
!
!
ip routing
!
!
!
!
!
!
!
!
!
!
!
!
!
ip domain-name msk.local
!
!
spanning-tree mode pvst
!
!
!
!
!
!
interface FastEthernet0/1
 no switchport
 ip address 11.0.0.50 255.0.0.0
 duplex auto
 speed auto
!
interface FastEthernet0/2
 no switchport
 ip address 12.0.0.50 255.0.0.0
 duplex auto
 speed auto
!
interface FastEthernet0/3
 no switchport
 ip address 40.40.40.50 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/4
 switchport access vlan 100
 switchport mode access
 switchport nonegotiate
!
interface FastEthernet0/5
 switchport access vlan 200
 switchport mode access
 switchport nonegotiate
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 no ip address
 shutdown
!
interface Vlan100
 mac-address 0001.6397.9a01
 ip address 100.0.0.50 255.0.0.0
!
interface Vlan200
 mac-address 0001.6397.9a02
 ip address 200.0.0.50 255.255.255.0
!
router eigrp 100
 network 11.0.0.0
 network 12.0.0.0
 network 100.0.0.0
 network 200.0.0.0
 network 40.0.0.0
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 10.0.0.0
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
!
!
!
!
!
!
logging trap debugging
logging 10.0.0.100
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
ntp authentication-key 1 md5 0822455D0A16 7
ntp authenticate
ntp trusted-key 1
ntp server 10.0.0.100 key 1
!
end
```

---