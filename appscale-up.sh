#!/usr/bin/expect -f
#
# Installs AppScale.
#

set timeout -1

set EMAIL [lindex $argv 0]
set PASSWORD [lindex $argv 1]

# "appscale up" looks for AppScalefile in current dir, and AppScalefile is created in home dir
cd ~

spawn /var/lib/appscale-tools/bin/appscale up

expect "Enter your desired admin e-mail address:"
send -- "$EMAIL\n"

expect "Enter new password:"
send -- "$PASSWORD\n"

expect "Confirm password:"
send -- "$PASSWORD\n"

expect EOD+