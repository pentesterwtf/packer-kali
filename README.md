# Kali Rolling

Won't be supporting this for much longer - Upstream netboot broke for a few days, and started working again unexplainably

## What

* Minimal Kali Linux Rolling VM, if the docker container for Kali wasn't suitable for your needs
* Small Kali linux (https://www.kali.org/) / for vagrant Libvirt provider (https://github.com/vagrant-libvirt/vagrant-libvirt)
* Produces a vagrant box (https://www.vagrantup.com/) under `builds/`
    * Box uses rsync rather than nfs for syncing `/vagrant`

##  tl;dr

```
root/vagrant
```

## Building

* packer build packer.json
* vagrant box add builds/kali-linux-rolling.box
  * Note libvirt keeps disks, might have to delete from filestore if re-adding
  * --force won't help you

## References

* Thanks https://github.com/tsondt/kali-mini-rolling-packer-vagrant
* https://github.com/offensive-security/kali-linux-preseed
