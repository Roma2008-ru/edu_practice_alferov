# Конфигурация устройств 

## R1
```
Current configuration : 1169 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R1
!
!
!
!
!
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX1017OUC9-
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
interface FastEthernet0/0
 ip address 10.1.1.1 255.255.255.0
 ip helper-address 10.23.23.100
 duplex auto
 speed auto
 ipv6 address FE80::1 link-local
 ipv6 address 2001:10:10:10::/64 eui-64
 ipv6 ospf 100 area 1
!
interface FastEthernet0/1
 ip address 10.12.12.1 255.255.255.0
 duplex auto
 speed auto
 ipv6 address 2001:12:12:12::1/64
 ipv6 ospf 100 area 0
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 router-id 1.1.1.1
 log-adjacency-changes
 passive-interface default
 no passive-interface FastEthernet0/1
 network 10.1.1.0 0.0.0.255 area 1
 network 10.12.12.0 0.0.0.255 area 0
!
ipv6 router ospf 100
 router-id 0.0.0.1
 log-adjacency-changes
 passive-interface default
 no passive-interface FastEthernet0/1
!
ip classless
!
ip flow-export version 9
!
!
!
no cdp run
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

---

## R2
```
Current configuration : 1066 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R2
!
!
!
!
!
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10177TKZ-
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
interface FastEthernet0/0
 ip address 10.23.23.2 255.255.255.0
 ip ospf priority 255
 duplex auto
 speed auto
 ipv6 address 2001:23:23:23::2/64
 ipv6 ospf priority 255
 ipv6 ospf 100 area 23
!
interface FastEthernet0/1
 ip address 10.12.12.2 255.255.255.0
 ip ospf priority 255
 duplex auto
 speed auto
 ipv6 address 2001:12:12:12::2/64
 ipv6 ospf priority 255
 ipv6 ospf 100 area 0
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 router-id 0.0.0.2
 log-adjacency-changes
 network 10.23.23.0 0.0.0.255 area 23
 network 10.12.12.0 0.0.0.255 area 0
!
ipv6 router ospf 100
 router-id 0.0.0.2
 log-adjacency-changes
!
ip classless
!
ip flow-export version 9
!
!
!
no cdp run
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

---

## R3
```
Current configuration : 1848 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R3
!
!
!
!
!
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
username R1973 password 0 Cisco123
!
!
license udi pid CISCO2911/K9 sn FTX152495Z9-
license boot module c2900 technology-package securityk9
license boot module c2900 technology-package uck9
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
interface Loopback3
 ip address 3.3.3.3 255.0.0.0
!
interface Loopback33
 ip address 33.33.33.33 255.0.0.0
!
interface GigabitEthernet0/0
 ip address 10.23.23.3 255.255.255.0
 duplex auto
 speed auto
 ipv6 address 2001:23:23:23::3/64
 ipv6 ospf 100 area 23
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 30.30.30.3 255.255.255.0
 encapsulation ppp
 ppp authentication chap
 ipv6 address 2001:30:30:30::3/64
 ipv6 eigrp 100
 clock rate 2000000
!
interface Serial0/3/1
 no ip address
 clock rate 2000000
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 100
 router-id 3.3.3.3
 log-adjacency-changes
 network 10.23.23.0 0.0.0.255 area 23
 network 3.0.0.0 0.255.255.255 area 23
 default-information originate
!
router bgp 3
 bgp log-neighbor-changes
 no synchronization
 neighbor 30.30.30.73 remote-as 1973
 redistribute ospf 100 
!
ipv6 router ospf 100
 router-id 0.0.0.3
 default-information originate
 log-adjacency-changes
!
ipv6 router eigrp 100
 eigrp router-id 0.0.0.3
 no shutdown 
 redistribute ospf 100  metric 10000 10 255 1 1500 
!
ip classless
ip route 0.0.0.0 0.0.0.0 Null0 
!
ip flow-export version 9
!
ipv6 route ::/0 Loopback3
!
!
no cdp run
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

---

## R1973
```
Current configuration : 1334 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R1973
!
!
!
!
!
!
!
!
no ip cef
ipv6 unicast-routing
!
no ipv6 cef
!
!
!
username R3 password 0 Cisco123
!
!
license udi pid CISCO2911/K9 sn FTX1524O73A-
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
interface Loopback0
 ip address 197.3.1.1 255.255.255.0
 ipv6 address 2001:1973::1/64
 ipv6 eigrp 100
!
interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface GigabitEthernet0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 30.30.30.73 255.255.255.0
 encapsulation ppp
 ppp authentication chap
 ipv6 address 2001:30:30:30::73/64
 ipv6 eigrp 100
!
interface Serial0/3/1
 no ip address
 clock rate 2000000
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router bgp 1973
 bgp log-neighbor-changes
 no synchronization
 neighbor 30.30.30.3 remote-as 3
!
ipv6 router eigrp 100
 eigrp router-id 0.0.0.73
 no shutdown 
!
ip classless
ip route 0.0.0.0 0.0.0.0 30.30.30.3 
!
ip flow-export version 9
!
ipv6 route ::/0 Serial0/3/0 2001:30:30:30::3
!
!
no cdp run
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

---

## Switch
```
Current configuration : 1080 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
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
Current configuration : 1149 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
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
ip classless
!
ip flow-export version 9
!
!
!
no cdp run
!
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
!
end
```

---