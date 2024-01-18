$Title = "RDS Custom Site Template - Demo"
$Description = "Site Design & Site Script to provision a custom site template"
$TenantName = "ecsrds"
$SiteScriptJson = ".\SiteScriptRdsDemo.json"
$ThumbnailUrl = "https://ecsrds.sharepoint.com/Freigegebene%20Dokumente/SiteTemplates/Thumbnails/RdsDemoSite.png"
$PreviewImageUrl = "https://ecsrds.sharepoint.com/Freigegebene%20Dokumente/SiteTemplates/Thumbnails/RdsDemoSite.png"
$SiteScriptJsonContent = Get-Content $SiteScriptJson -Raw

Connect-PnPOnline -Url https://$TenantName-admin.sharepoint.com -Interactive

#Creating a new Site Script & Site Design
$SiteScript = Add-PnPSiteScript -Title $Title -Description $Description -Content $SiteScriptJsonContent
Add-PnPSiteDesign -Title $Title -SiteScriptIds $SiteScript.Id -Description $Description -WebTemplate CommunicationSite

# Update Site Design
Get-PnPSiteDesign
#...

$SiteDesignId = "..."
Set-PnPSiteDesign -Identity $SiteDesignId -PreviewImageUrl $PreviewImageUrl -ThumbnailUrl $ThumbnailUrl