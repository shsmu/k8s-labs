# 以管理员身份运行
set-executionpolicy remotesigned

$a = 1,2
foreach($i in $a){

$VMName = "CKA-Node-0" + $i
$VMMAC = "00-00-00-00-02-0" + ($i + 1)
$MemoryStartupBytes = 1483225088
$NewVHDSizeBytes = 222122547200
$SwitchName = "办公"
$VM = @{
    Name = $VMName
    MemoryStartupBytes = $MemoryStartupBytes
    Generation = 1
    NewVHDPath = " D:\Hyper-V\$VMName\Virtual Hard Disks\$VMName.vhdx"
    NewVHDSizeBytes = $NewVHDSizeBytes
#  BootDevice = "VHD"
    BootDevice = "LegacyNetworkAdapter"
    Path = " D:\Hyper-V\$VMName "
#  SwitchName = (get-vmswitch).Name[0]
    SwitchName = $SwitchName
}

New-VM @VM
Set-VM -Name $VMName -ProcessorCount 2
Set-VMNetworkAdapter -VMName $VMName -StaticMacAddress $VMMAC
}
