require ["fileinto", "mailbox"];
# fileinto: for putting mail into a imap folder
# mailbox: for creating imap folder if not exists
#

# File compiled by run.sh

if header :contains "X-Spam-Flag" "YES" {
    # move mail into Folder Spam, create folder if not exists
    fileinto :create "Junk";
    stop;
}

if header :contains "X-Amavis-Alert" "INFECTED" {
    # move mail into Folder Spam, create folder if not exists
    fileinto :create "Junk";
    stop;
}

if header :contains "X-Amavis-Alert" "BANNED" {
    # move mail into Folder Spam, create folder if not exists
    fileinto :create "Junk";
    stop;
}