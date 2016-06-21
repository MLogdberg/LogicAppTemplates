param
(
    [Parameter(Mandatory=$true, HelpMessage="EnvironmentSuffix used when createing the blobb storage container")]
    [string] $environmentsuffix,
	
    [Parameter(Mandatory=$true, HelpMessage="Name of the resourcegroup")]
    [string] $resourceGroupName
)

$storageAccountName = "logicappsdemo" + $environmentsuffix
$containername = "demofiles" + $environmentsuffix
#
# CreateBlobbContainer.ps1
#Check if container exists
$container = Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroup $resourceGroupName  | Get-AzureStorageContainer -Name $containername  -ErrorAction SilentlyContinue
if(!$container) {
	#Create container
	Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroup $resourceGroupName  | New-AzureStorageContainer -Name $containername
}