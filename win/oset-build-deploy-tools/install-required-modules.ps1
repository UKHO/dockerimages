$modulesToInstall = @(
    @{
        Name            = "UKHO.WebsiteDSC"
        RequiredVersion = "4.0.1"
        Repository      = "UKHO.PSGallery"
        DSCResource     = $true
        Usages          = @("Release", "Node")
    },
    @{
        Name            = "xWebAdministration"
        RequiredVersion = "1.19.0.0"
        Repository      = "UKHO.PSGallery"
        DSCResource     = $true
        Usages          = @("Build", "Node")
    },
    @{
        Name           = "sqlserver"
        MinimumVersion = "21.0.17199"
        MaximumVersion = "21.9999.99999"
        Repository     = "UKHO.PSGallery"
        Usages         = @("Node") 
    },
    @{
        Name            = "cNtfsAccessControl"
        RequiredVersion = "1.3.1"
        Repository      = "UKHO.PSGallery"
        DSCResource     = $true
        Usages          = @("Release", "Node")
    },
    @{
        Name           = "UKHO.PSModuleInstaller"
        MinimumVersion = "1.4.114283"
        MaximumVersion = "1.9999.99999"
        Repository     = "UKHO.PSGallery"
        Usages         = @("")
    },
    @{
        Name           = "UKHO.Operations.BuildDeployTools"
        MinimumVersion = "3.7.12"
        MaximumVersion = "3.9999.99999"
        Repository     = "UKHO.PSGallery"
        Usages         = @("Build", "Release")
    },
    @{
        Name           = "UKHO.BuildAndDeploy"
        MinimumVersion = "7.1.0"
        MaximumVersion = "7.9999.99999"
        Repository     = "UKHO.PSGallery"
        Usages         = @("Release", "Node")
    }
)

Import-Module UKHO.PSModuleInstaller -Force
Install-PSModules -PSModules $modulesToInstall -InstallUserScope AllUsers -Verbose