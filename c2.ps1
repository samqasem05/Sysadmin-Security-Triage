# this script will find nany outbound c2 
$findtcpconnections = Get-NetTCPconnection -remoteport 4444 -ErrorAction SilentlyContinue
$findtcpconnections

foreach($con in $findtcpconnections){
    $Process = get-process -Id $con.owningprocess

    $layout = [PSCustomObject]@{

               Processid = $con.OwningProcess

               }

        }

$layout | ConvertTo-Json