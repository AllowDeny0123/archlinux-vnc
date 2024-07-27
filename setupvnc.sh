#!/sbin/expect

set password [lindex $argv 0];

spawn /usr/bin/vncpasswd $env(HOME)/.vnc/passwd 
expect "Password:"
send "$password\r"
expect "Verify:"
send "$password\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"
spawn /usr/bin/vncserver :1

set timeout -1
expect eof
