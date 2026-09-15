REM Preparing a Virtual Disk for Shrinking Before you can shrink a
REM virtual disk, you must prepare each volume on the disk (C: or
REM D:, for example) for shrinking. To prepare a volume, it must be
REM located on a Windows host. First you must mount the volume. To
REM mount the volume, use the VMware DiskMount Utility, available as
REM a free download from the VMware Web site. For information about
REM downloading and using VMware DiskMount, see Shrinking Virtual
REM Disks with VMware Virtual Disk Manager.
REM 
REM VMware DiskMount mounts individual volumes of a virtual disk. For
REM the best results when you shrink a virtual disk, you should mount
REM all the volumes and shrink them.
REM                                                                                                                         
REM After you mount a virtual disk volume, use the virtual disk manager
REM to prepare the disk for shrinking. To prepare the volume mounted
REM as the M: drive for shrinking, use the following command:

vmware-vdiskmanager -p M:

REM Once the preparations are complete, unmount the volume. Repeat
REM this process for each volume of the virtual disk. After you prepare
REM all the volumes for shrinking, you can shrink the virtual disk.
REM 
REM Shrinking a Virtual Disk To shrink a virtual disk, it must be
REM located on a Windows host. Before you can shrink the virtual disk,
REM make sure you prepare all the volumes of the virtual disk for
REM shrinking. Then use a command like the following:
REM 
vmware-vdiskmanager -k myDisk.vmdk        

C:\Program Files\Oracle\VirtualBox\VBoxHeadless.exe 60eaff78-4bdd-042d-2e72-669728efd737-suplib-3rdchild --comment default --startvm f71aae44-bccf-4fbf-af0a-09c2744c5af7 --vrde config --sup-hardening-log=C:\Users\t.richter\.docker\machine\machines\default\default\Logs\VBoxHardening.log
