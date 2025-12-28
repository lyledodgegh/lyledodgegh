Some random tips I've found across the internet that I use on occasion.

*Initiate Teams Chat via web to a bunch of people*

```
https://teams.microsoft.com/l/chat/0/0?users=email1,email2,email3
```

*Configure Nested Virtualization in Hyper-V (for a specific vm) [source](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/nested-virtualization)*

```powershell
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
```

*Split a >4GB iso wim file [source](https://www.neowin.net/forum/topic/1242296-windows-server-2012-r2-dc-edition-uefi-install-nightmare/?do=findComment&comment=596707506)*

```cmd
mkdir \iso
xcopy cdrom:\* \iso /s /e
dism /split-image /imagefile:c:\iso\sources\install.wim /swmfile:c:\iso\sources\install.swm /filesize:4095 /checkintegrity
del \iso\sources\install.wim
xcopy \iso\* thumbdrive:\ /s /e
```

*Bypass Windows 11 Requirements for Hyper-V lab setup*

```
regedit (SHIFT+F10)
HKEY_LOCAL_MACHINE\SYSTEM\Setup -> New Key "LabConfig"
New DWORD (32) with value set to 1 -> BypassTPMCheck, BypassRAMCheck, BypassSecureBootCheck
```

*Update and Install WSL2 when on machines with restrictive group policy*

execute from an elevated PowerShell prompt

```powershell
wsl --update --web-download
wsl --install
```

*Configure WinRM when you get something like the error message below - say Y to the two prompts*

```powershell
WinRM QuickConfig
```

Enter-PSSession: Connecting to remote server **servername** failed with the following error message : WinRM cannot complete the operation. Verify that the specified computer name is valid, that the computer is accessible over the network, and that a firewall exception for the WinRM service is enabled and allows access from this computer. By default, the WinRM firewall exception for public profiles limits access to remote computers within the same local subnet. For more information, see the about_Remote_Troubleshooting Help topic.

*Updating Ubuntu in one line*

```bash
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt auto-clean -y
```
