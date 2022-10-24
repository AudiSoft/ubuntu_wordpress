# ubuntu_wordpress

Create and configure WordPress on Ubuntu Linux with nginx, PHP and mysql

## VirtualBox

### Virtual machine configuration

Parameter                   |Value
----------------------------|-----------------------------------------
Name                        |WordPress
Folder                      |C:\VM\VBox
ISO Image                   |D:\ubuntu-22.10-live-server-amd64.iso
Skip Unattended Installation|Yes
Expert Mode                 |No
Memory                      |4096 MB
Processors                  |2
Enable EFI                  |Yes
Hard disk size              |100.00 GB
Pre-allocate Full Size      |No
Settings->Network->Adapter1 |Bridget Adapter->Wireless Network Adapter

### Linux installation

Windows              |Parameter      |Value                                  |Default
---------------------|---------------|---------------------------------------|-------
GNU Grub             |               |Try or Install Ubuntu Server           |Default
Welcome              |Language       |English                                |Default
Keyboard             |Layout         |English (US)                           |Default
Keyboard             |Variant        |English (US) - English (US, alt, intl.)
Type of install      |Base           |Ubuntu Server (minimized)
Type of install      |Search         |                                       |Default
Network              |Interface      |enp0s3 eth -                           |Default
Network              |DHCPv4         |192.168.80.17/24                       |Default
Proxy                |Address        |                                       |Default
Mirror               |Address        |<http://co.archive.ubuntu.com/ubuntu>  |Default
Storage              |Use entire disk|X                                      |Default
Storage              |Set LVM group  |X                                      |Default
Storage              |Encrypt LVM    |                                       |Default
Storage configuration|               |                                       |Default
Profile setup        |Your name      |Jorge Arbelaez
Profile setup        |Server name    |henutsen-vbox
Profile setup        |Username       |audisoft
Profile setup        |Password       |Henutsen123+
SSH setup            |OpenSSH Server |X
SSH setup            |Import SSH id  |No                                     |Default
Featured server snaps|               |                                       |Default

## Linux configuration

We used [this site][reference] as reference.

[reference]: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04

```bash
# Upgrade installed packages
sudo apt update
sudo apt upgrade
# Install git
sudo apt install git
git --version
# Clone repository
git clone https://github.com/AudiSoft/ubuntu_wordpress.git
# Allow scripts to run
cd ubuntu_wordpress
chmod 700 *.sh
# Install nginx
./install_nginx.sh
```
