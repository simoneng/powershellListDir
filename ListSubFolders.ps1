$targetfolder = 'C:\users\simon'
$outputFile = 'C:\temp\output.csv'
$dataColl = Get-ChildItem -Force $targetfolder -Directory -ErrorAction SilentlyContinue | ForEach-Object {
   $len = Get-ChildItem -Recurse -Force $_.FullName -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
   $foldername = $_.FullName
   $foldersize = '{0:N2} ' -f ($len/1024)
   [PSCustomObject]@{
       foldersizeKB = $foldersize
       foldername = $foldername
   }
}
$dataColl | Export-Csv -Path $outputFile -NoTypeInformation
