Configuration 111MutlifactorAllAdmins
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsGlobalAdmin
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        AADConditionalAccessPolicy 'Ensure multifactor authentication is enabled for all users in administrative roles'
        {
            BuiltInControls            = @("Mfa")
            ClientAppTypes             = @()
            CloudAppSecurityIsEnabled  = $True
            CloudAppSecurityType       = "MonitorOnly"
            DisplayName                = "111MutlifactorAllAdmins"
            ExcludeApplications        = @()
            ExcludeDevices             = @()
            ExcludeGroups              = @()
            ExcludeLocations           = @()
            ExcludePlatforms           = @()
            ExcludeRoles               = @()
            ExcludeUsers               = @()
            GrantControlOperator       = "OR"
            IncludeApplications        = @("All")
            IncludeDevices             = @("All")
            IncludeGroups              = @()
            IncludeLocations           = @()
            IncludePlatforms           = @()
            IncludeRoles               = @("Global administrator", "Billing administrator", "Exchange administrator", "SharePoint administrator", "Password administrator", "Skype for Business administrator", "Service support administrator", "User administrator", "Dynamics 365 administrator", "Power BI administrator")
            IncludeUserActions         = @()
            IncludeUsers               = @()
            PersistentBrowserIsEnabled = $false
            PersistentBrowserMode      = ""
            SignInFrequencyIsEnabled   = $False
            SignInFrequencyType        = "Hours"
            SignInFrequencyValue       = 5
            SignInRiskLevels           = @()
            State                      = "enabled"
            UserRiskLevels             = @()
            Ensure                     = "Present"
            Credential                 = $credsGlobalAdmin
        }
    }
}
