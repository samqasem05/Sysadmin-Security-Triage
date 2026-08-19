$testconnection = Test-Connection -ComputerName FS01 -erroraction silentlycontinue

if($testconnection){

    write-host "Msi can connect" -ForegroundColor Green

} else {

    write-host "MSi Cant conenct" -ForegroundColor Red

}

$pathtest = Test-Path -Path \\FS01\Accounting

if($pathtest){

    write-host "path is reachable" -ForegroundColor Green

} else {

    write-host "Path is Unreachable" -ForegroundColor Red

}


$testdrive = test-path S:

if($testdrive){

    write-host "drive is mapped"

} else {

    write-host "Drive is not mapped" -ForegroundColor Red

}


$testprinter = Test-Connection -ComputerName 10.1.10.55 -ErrorAction SilentlyContinue

if ($testprinter){

    write-host "printer is reachable"

} else { 

    write-host "printer is not reachable"

    }


$checkprinter = Get-Printer 

$printerjob = Get-PrintJob -Name "SALES-PRINTER-01"

$layout = [PSCustomObject]@{

    Printer = $checkprinter

    PrinterJob = $printerjob

}

$layout

$checkservice = get-service -name Spooler

if($checkservice.Status -eq "Running"){

    write-host "printer service is running"

} else {

    write-host "starting spooler..." -ForegroundColor Yellow

    Start-Service -Name Spooler

}
    

