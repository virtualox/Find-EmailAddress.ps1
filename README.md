# Find-EmailAddress
Find-EmailAddress is a PowerShell script that retrieves Active Directory objects by searching for a specified email address or alias. The script then outputs the object's username, display name, email address, and the Organizational Unit (OU) location.

## Requirements
The script requires PowerShell 3.0 or later and the Active Directory module to be installed on your system. To check the PowerShell version on your system, run the following command:
```powershell
$PSVersionTable.PSVersion
```
If you have an earlier version of PowerShell, consider upgrading to a newer version for better compatibility and security. You can download the latest version of PowerShell from the [official GitHub repository](https://github.com/PowerShell/PowerShell).

To install the Active Directory module, you can follow the instructions in this [Microsoft guide](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-7.1#installing-the-active-directory-module).

## Installation
1. Download the **`Find-EmailAddress.ps1`** script.
2. Save it to a convenient location on your computer or server.

## Usage
Open a PowerShell terminal and navigate to the directory where you saved the script. Run the script with the desired email address or alias as an argument:

```powershell
.\Find-EmailAddress.ps1 -EmailAddress "test@example.com"
```

The script will output a table with the columns **`UserName`**, **`DisplayName`**, **`EmailAddress`**, and **`OU`**.

For help and more information about the script, run:
```powershell
Get-Help .\Find-EmailAddress.ps1 -Detailed
```

## Contributing
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Push your changes to your fork.
5. Open a pull request.
