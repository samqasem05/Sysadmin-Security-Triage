# This script will find any suspisious login attempts

$events = get-winevent -FilterHashtable @{logname='security'; id=4625}

$layout = foreach($event in $events){

# A Clean Output of the results

[PSCustomObject]@{

Logname = $event.logname

ID = $event.Id

Properties = $event.properties

TimeCreated = $event.timecreated

UserID = $event.UserId

}
}

# Converting to Json depth 5 for clean results

$layout | ConvertTo-Json -Depth 5
