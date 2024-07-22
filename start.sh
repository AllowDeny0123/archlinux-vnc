#!/usr/bin/expec

spawn /usr/bin/vncpasswd 
expect "Password:"
send "$env(password)\r"
expect "Verify:"
send "$env(password)\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"
spawn /usr/bin/vncserver :1

set timeout -1
expect eof
