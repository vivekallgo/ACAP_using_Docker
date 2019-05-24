# Docker installation manuals


## Commands

- docker build .
- docker run -it -v E:/Docker/temp:/temp axis_acap

- root@e5ee3d729933:/temp# tar zxf AXIS_Embedded_Development_SDK_2_0_3.tar.tz.gz

- ./install-sdk-2_0_3.bin (Type yes to accept the term and conditions)

- cd /axis/emb-app-sdk_2_0_3/tools


## Check the Camera Architecture

- VAPIX command to enable SSH（Default Disable）
	- http://camera/axis-cgi/param.cgi?action=update&Network.SSH.Enabled=yes

-	# ssh root@{camera-ip}
-	$ ls 
-	$ free
-	$ cat /proc/meminfo
-	$ cat /proc/cpuinfo

```bat
root@axis-accc8eaea5ad:~# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 1 (v7l)
BogoMIPS        : 1062.50
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x4
CPU part        : 0xc09
CPU revision    : 1

processor       : 1
model name      : ARMv7 Processor rev 1 (v7l)
BogoMIPS        : 1062.50
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x4
CPU part        : 0xc09
CPU revision    : 1

Hardware        : Axis ARTPEC-6 Platform
Revision        : 0000
Serial          : 0000000000000000


```


## Run your first program

-	Inside SDK folder

```bat
$ ls
RELEASENOTES  apps  docs  init_env  libs  licenses.txt  partner  target  tools

-- Set environment parameters --
$ source init_env

-- analyze Sample folder --
$ cd apps/hello_glib

-- Compiler Application Package --
$ create-package.sh architecture

-- Install script  --
$ eap-install.sh camera-ip password install 

```

## VAPIX to know 

-	http://{{Camera_IPAddress}}/axis-cgi/param.cgi?action=list&responseformat=rfc

-	root.Properties.System.Architecture=armv7hf



