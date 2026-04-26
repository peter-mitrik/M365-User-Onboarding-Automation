# Import modules
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Identity.DirectoryManagement

# Connect to Graph
Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

# Load config
$config = Get-Content "../config/config.json" | ConvertFrom-Json

# Load CSV
$users = Import-Csv "../data/users-template.csv"

# Loop through users
foreach ($user in $users) {

    Write-Host "Creating user: $($user.DisplayName)"

    try {
        $newUser = New-MgUser -DisplayName $user.DisplayName `
            -UserPrincipalName $user.UserPrincipalName `
            -MailNickname ($user.FirstName + $user.LastName) `
            -AccountEnabled $true `
            -PasswordProfile @{
                ForceChangePasswordNextSignIn = $true
                Password = $user.Password
            } `
            -UsageLocation $user.UsageLocation `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -Department $user.Department `
            -JobTitle $user.JobTitle

        Write-Host "User created: $($user.UserPrincipalName)"

    } catch {
        Write-Host "Error creating user: $($user.UserPrincipalName)"
        Write-Host $_
    }
}