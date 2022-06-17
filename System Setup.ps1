function setup-now{
    <#
    .SYNOPSIS
    Setup New Computer

    .DESCRIPTION
    This is the first command that should be run on a new computer when it arrives.
    This command does the following:
    #1 Set time zone to UTC
    #2 Create new admin user and home directory
    #3 Enable RDP Access
    #4 Disable Automatic updates
    #5 Windows up to date
    #6 Returns completion status
    
    .EXAMPLE
    setup-now

    This runs the command and will ask to display any errors that occured
    #>

    setup-Time
    setup-Admin
    setup-RDP
    setup-AutoOff
    setup-Up2Date
    setup-Errors
    }

function setup-Time{

    Set-TimeZone -Id "UTC"
<#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-timezone?view=powershell-7.2#>
}

function setup-Admin{

    net user NewAdmin password123 /Add /expires:never
    net localgroup Administrators NewAdmin /Add
    net localgroup Users NewAdmin /delete
<#reused code I had from previous script#>
}

function setup-RDP{

    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
<#https://pureinfotech.com/enable-remote-desktop-powershell-windows-10/#>
}

function setup-AutoOff{

    sc.exe config wuauserv start= disabled
    sc.exe stop wuauserv
    sc.exe start wuauserv
<#https://nucuta.com/how-to-disable-automatic-updates-on-windows-10/#>
}