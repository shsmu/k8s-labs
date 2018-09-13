set-executionpolicy remotesigned

$a = 10,11,20,21,30,31,40,41,50,51
foreach($i in $a){

$VMName = "CKA-" + $i
$VMMAC = "00-00-00-00-00-" + $i
$MemoryStartupBytes = 2147483648
$NewVHDSizeBytes = 53687091200
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
