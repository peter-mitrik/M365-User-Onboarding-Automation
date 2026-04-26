# M365 User Onboarding Automation

PowerShell-based automation for Microsoft 365 user onboarding using CSV input and Microsoft Graph API.

## Features

- Bulk user creation from CSV
- Automatic license assignment (planned)
- Standardized onboarding process
- Logging and error handling
- Easy to use for IT administrators

## Requirements

- PowerShell 7+
- Microsoft Graph PowerShell SDK
- Microsoft 365 tenant

## Setup

1. Install Graph module:
   Install-Module Microsoft.Graph

2. Connect to Microsoft Graph:
   Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

3. Edit CSV file:
   data/users-template.csv

4. Run script:
   ./scripts/New-User-Onboarding.ps1

## CSV Format

See data/users-template.csv

## Future Improvements

- License assignment
- Group membership automation
- Teams provisioning
- SharePoint permissions
- Offboarding automation