require ["fileinto"];

if header :contains "X-Spam-Flag" "YES" {
    fileinto "Junk";
    stop;
}

if header :contains "X-Amavis-Alert" "INFECTED" {
    # move mail into Folder Spam, create folder if not exists
    fileinto "Junk";
    stop;
}

if header :contains "X-Amavis-Alert" "BANNED" {
    # move mail into Folder Spam, create folder if not exists
    fileinto "Junk";
    stop;
}