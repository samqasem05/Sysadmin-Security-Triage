#[FETCH PROCESS NAME AND ID FIRST]

$AllProcess = get-process | select-object name, id 

#[START LOOP]

$layout = foreach($proc in $AllProcess){



#[GET THE PROCESS CIM OBJECT SO WE CAN GET THE PARENT ID AND THEN NAME FORM THE OBJECT]

$getthewin32 = Get-CimInstance win32_process -filter "Processid = $($proc.id)"



$parntid = $getthewin32.ParentProcessId

#[GETTING THE NAME FOR THE PROCESS PARENT AFTER GETTING THE PARENT ID FROM THE OBJECT]

$parentname = (get-process -id $parntid -ErrorAction SilentlyContinue).Name



#[CHECKING WEATHER THE PARENT IS POWERSHELL OR CMD]
   
if($parentname -like "cmd*" -or $parentname -like "powershell*"){

    write-host "CMD or Powershell Parent Process $($parentname)" -ForegroundColor Red

    Get-NetTCPConnection -State Listen | Where-Object {$_.OwningProcess -eq $($proc.id)} | select-object Name, remoteaddress, state, remoteport, owningprocess

    
} else { 

    write-host "Normal PROCESS--------[$($proc.Name)] and normal PARENT-------- [$($parentname)]" -ForegroundColor Green

    }

#CLEAN NORMAL LAYOUT]

[PSCustomObject]@{

        ProcessID = $proc.id
        ProcessName = $proc.name
        Parentid = $parntid
        ParentName = $parentname
        
        }

}

$layout | Out-GridVie
