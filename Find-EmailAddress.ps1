<#
.SYNOPSIS
    Retrieves Active Directory objects with a specified email address or alias.
.DESCRIPTION
    This script searches Active Directory for objects with a specified email address or alias, and outputs the object's username, display name, email address, and OU location.
.PARAMETER EmailAddress
    The email address or alias to search for in Active Directory.
.EXAMPLE
    .\Find-EmailAddress.ps1 -EmailAddress "test@example.com"
    Searches Active Directory for objects with the email address or alias "test@example.com".
.INPUTS
    String
.OUTPUTS
    PSCustomObject
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $True,
               HelpMessage = 'What e-mail address would you like to find?')]
    [string]$EmailAddress
)

function Get-EmailAddress {
    param (
        [string]$Address
    )

    $adObjects = Get-ADObject -Properties mail, proxyAddresses, DisplayName -Filter "mail -like '*$Address*' -or proxyAddresses -like '*$Address*'"
    
    foreach ($adObject in $adObjects) {
        $ouPathComponents = ($adObject.DistinguishedName -split ",") | Where-Object { $_ -like "OU=*" }
        $ou = ($ouPathComponents -join ",") -replace 'OU=', ''
        
        [PSCustomObject]@{
            UserName = $adObject.Name
            DisplayName = $adObject.DisplayName
            EmailAddress = $Address
            OU = $ou
        }
    }
}


$results = Get-EmailAddress -Address $EmailAddress
$results | Select UserName, DisplayName, EmailAddress, OU | Format-Table -AutoSize
