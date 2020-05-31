Write-Host "Package box"
vagrant package --output base-box-ubuntu.box

Write-Host "Increase version"
$file = "lastVersion.info"
$fileVersion = [version](Get-Content $file | Select -First 1)
$newVersion = "{0}.{1}.{2}" -f $fileVersion.Major, $fileVersion.Minor, ($fileVersion.Build + 1)
Write-Host $fileVersion -> $newVersion

vagrant cloud publish tdorosz/base-box-ubuntu $newVersion virtualbox base-box-ubuntu.box

