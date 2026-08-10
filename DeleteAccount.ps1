$question = read-host -Prompt "Are You Sure You Want To Delete The Account?"

$name = Read-Host -Prompt "Whats the name of the account?"

$accountname = $name

$account = remove-localuser -name $name -Confirm



if ($question -eq "yes"){

            write-host "Account is Deleted"

                $account

        } else {

            write-host "GoodBye gang..."

}
       