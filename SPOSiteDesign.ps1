$Title = "RDS Custom Site Template - Demo"
$Description = "Site Design & Site Script to provision a custom site template"
$TenantName = "ecsrds"
$SiteScriptJson = ".\SiteScriptRdsDemo.json"
$SiteScriptJsonContent = Get-Content $SiteScriptJson -Raw

Connect-SPOService -Url https://$TenantName-admin.sharepoint.com -Interactive

#Creating a new Site Script & Site Design
$SiteScript = Add-PnPSiteScript -Title $Title -Description $Description -Content $SiteScriptJsonContent
Add-PnPSiteDesign -Title $Title -SiteScriptIds $SiteScript.Id -Description $Description -WebTemplate CommunicationSite
