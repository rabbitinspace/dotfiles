# Arch Instatllation

Fresh Arch installation with `btrfs`, `dm-crypt` and `systemd-boot` (UEFI only).

Resources:

- Official Installation Guide [1](https://wiki.archlinux.org/index.php/Installation_guide)
- This cool guy [2](https://austinmorlan.com/posts/arch_linux_install/)
- System configuration for `dm-crypt` [3](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration)
- Stuff about encryption [4](https://thej.github.io/know-to/linux/encrypt_system_ssd/)
- Another guide [5](https://wiki.archlinux.org/index.php/User:Altercation/Bullet_Proof_Arch_Install)

## Prepare

Do all steps from the official guide [1] that before disk partitioning.

## Partitioning

There will be two partitions: `/efi` and `/`.

```
gdisk /dev/nvme0n1
o (Create a new empty GUID partition table (GPT))
Proceed? Y
n (Add a new partition)
Partition number 1
First sector (default)
Last sector +512M
Hex code EF00
n (Add a new partition)
Partition number 2
First sector (default)
Last sector (press Enter to use remaining disk)
Hex code 8300
w
Y
```

## Encryption

Create LUKS container (luks2, aes-xts-plain64, sha512 / 2 (because of aes-xtc)):

```bash
cryptsetup --key-size 512 --align-payload 4096 --verify-passphrase luksFormat /dev/nvme0n1p2

# 'system' here is a name of mapped device: /dev/mapper/system
cryptsetup open /dev/nvme0n1p2 system
```

## Formatting

First, format partitions:

```bash
# FAT32 but backward compatible or something
mkfs.vfat -F32 /dev/nvme0n1p1
mkfs.btrfs -s 4096 /dev/mapper/system
```

Then, create and mount btrfs subvolumes:

```bash
opts=ssd,compress=lzo,noatime,nodiratime

# mount temporary to create subvolumes
mount -o $opts /dev/mapper/system /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
umount /mnt

# mount subvolumes
mount -o subvol=@,$opts /dev/mapper/system /mnt
mkdir /mnt/{boot,home,.snapshots}
mount -o subvol=@home,$opts /dev/mapper/system /mnt/home
mount -o subvol=@snapshots,$opts /dev/mapper/system /mnt/.snapshots
mount /dev/nvme0n1p1 /mnt/boot
```

## Installation

Now go to official installatoin guide [1] and follow it. On `pacstrap` step some additional packages are required: `amd-ucode`, `btrfs-progs`, `neovim`, `base-devel`, `sudo`, `man`. Get back on `initramfs` step.

Next modify `mkinitcpio.conf` to include to have `systemd` hooks (including `sd-encrypt`), `amdgpu` module and `btrfs` binary:

```
MODULES=(amdgpu)
BINARIES=(/usr/bin/btrfs)
FILES=()
HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block sd-encrypt filesystems fsck)
```

Check with [3] just in case of updates.

Regenerate this stuff:

```bash
mkinitcpio -P
```

## Bootloader

Install `systemd-boot`:

```bash
bootctl --path=/boot install
```

Grap UUID of LUKS partition:

```bash
blkid
```

Create `/boot/loader/entries/arch.conf` to have this stuff:

```
title Arch Linux
linux /vmlinuz-linux
initrd /amd-ucode.img
initrd /initramfs-linux.img
options rd.luks.name=<UUID>=system root=/dev/mapper/system rootflags=subvol=@ rd.luks.options=discard
```

The `options` are mostly from [3] to decrypt disk before boot (<UUID> partition will be decrypted and mapped to `/dev/mapper/system`).

Edit `/boot/loader/loader.conf` to have this stuff:

```
default arch
```

Set root password:

```bash
passwd
```

Reboot after that:

```bash
exit
umount -R /mnt
reboot
```

Arch is now installed!

Don't forget to do post-installation steps like setup network, add new user, setup `sudo`, etc.

# FAQ

- **No internet**
Need to setup DHCP client and local DNS. Can be done by configuring and enabling two systemd services: `systemd-networkd` and `systemd-resolved`. More info in the [Wiki](https://wiki.archlinux.org/index.php/Systemd-networkd).

- **What about TRIM?**  
Automatic TRIM is not enabled (no `discard` option in `/etc/fstab`). But mapping device (`/dev/mapper/system`) will redirect TRIM events to real SSD since we've specified `rd.luks.options=discard` kernel option. You need to issue TRIM events via `fstrim` service: [see this article](https://wiki.archlinux.org/index.php/Solid_state_drive#Periodic_TRIM).

- **What about Swap?**  
Not needed.

