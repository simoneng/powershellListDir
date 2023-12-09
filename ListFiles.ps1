$targetfolder = 'C:\Users\esg\Documents\Virtual Machines'
$outputFile = 'C:\users\esg\Desktop\simon2.csv'
$dataColl = Get-ChildItem -Recurs -Force $targetfolder -ErrorAction SilentlyContinue | ForEach-Object {
   $len = Get-ChildItem -Recurse -Force $_.FullName -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
   $filename = $_.FullName
   $filesize = '{0:F2}' -f ($len/1024)
   [PSCustomObject]@{
       sizeKB = $filesize
       name = $filename
   }
}
$dataColl | Export-Csv -Path $outputFile -NoTypeInformation -Delimiter ‘;’
#set-content $outputFile ((get-content $outputFile) -replace '"')

