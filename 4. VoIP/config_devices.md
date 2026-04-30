# Конфигурация устройств 

## CMERouter
```
Current configuration : 1650 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname CMERouter
!
!
!
!
ip dhcp excluded-address 10.30.2.1
ip dhcp excluded-address 10.40.2.1
!
ip dhcp pool VOICE
 network 10.30.2.0 255.255.255.0
 default-router 10.30.2.1
 option 150 ip 10.30.2.1
ip dhcp pool DATA
 network 10.40.2.0 255.255.255.0
 default-router 10.40.2.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2811/K9 sn FTX10179162-
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
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/1.1
 encapsulation dot1Q 40
 ip address 10.40.2.1 255.255.255.0
!
interface FastEthernet0/1.2
 encapsulation dot1Q 30
 ip address 10.30.2.1 255.255.255.0
!
interface Serial0/3/0
 ip address 82.115.34.210 255.255.255.252
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
router eigrp 100
 network 10.0.0.0
 network 82.0.0.0
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
dial-peer voice 1 voip
 destination-pattern 1...
 session target ipv4:82.115.34.209
!
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 10.30.2.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 2001
!
ephone-dn 2
 number 2002
!
ephone 1
 device-security-mode none
 mac-address 0001.64A2.76C3
 type 7960
 button 1:1
!
ephone 2
 device-security-mode none
 mac-address 0001.64D3.0635
 type 7960
 button 1:2
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

## RemoteRouter
```
Current configuration : 1787 bytes
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname RemoteRouter
!
!
!
!
ip dhcp excluded-address 10.30.1.1
ip dhcp excluded-address 10.40.1.1
!
ip dhcp pool VOICE
 network 10.30.1.0 255.255.255.0
 default-router 10.30.1.1
 option 150 ip 10.30.1.1
ip dhcp pool DATA
 network 10.40.1.0 255.255.255.0
 default-router 10.40.1.1
 option 150 ip 10.40.1.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
license udi pid CISCO2911/K9 sn FTX15249MID-
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
interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
!
interface GigabitEthernet0/0.1
 encapsulation dot1Q 40
 ip address 10.40.1.1 255.255.255.0
!
interface GigabitEthernet0/0.2
 encapsulation dot1Q 30
 ip address 10.30.1.1 255.255.255.0
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
!
interface GigabitEthernet0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/3/0
 ip address 82.115.34.209 255.255.255.252
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
interface Vlan30
 mac-address 00e0.f956.e201
 no ip address
!
router eigrp 100
 network 10.0.0.0
 network 82.0.0.0
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
dial-peer voice 1 voip
 destination-pattern 2...
 session target ipv4:82.115.34.210
!
telephony-service
 max-ephones 5
 max-dn 5
 ip source-address 10.30.1.1 port 2000
 auto assign 4 to 6
 auto assign 1 to 5
!
ephone-dn 1
 number 1001
!
ephone 1
 device-security-mode none
 mac-address 000A.F3E8.CAC2
 type 7960
 button 1:1
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

## CMESwitch
```
Current configuration : 1354 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname CMESwitch
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
 switchport access vlan 40
 switchport voice vlan 30
 spanning-tree portfast
!
interface FastEthernet0/2
 switchport access vlan 40
 switchport voice vlan 30
 spanning-tree portfast
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
 switchport trunk encapsulation dot1q
 switchport mode trunk
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

## RemoteSwitch
```
Current configuration : 1405 bytes
!
version 12.2(37)SE1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname RemoteSwitch
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
no ip domain-lookup
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
 switchport access vlan 40
 switchport voice vlan 30
 spanning-tree portfast
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
 switchport trunk encapsulation dot1q
 switchport mode trunk
 spanning-tree portfast
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
!
!
!
!
!
line con 0
 password Cisco
 logging synchronous
 login
!
line aux 0
!
line vty 0 4
 password cisco
 logging synchronous
 login
!
!
!
!
end
```

---