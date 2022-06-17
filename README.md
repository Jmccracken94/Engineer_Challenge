# Engineer_Challenge

I decided to use VMware and Windows 10 Pro for my environment as the process for automating it's after install setup using Powershell scripting is what I'm most 
familiar with and it seemed like the easiest to implement in the time provided.

I've worked with this type of automation in my current role so I was able to draw on that experience and my previous work with these types of scripts to plan out
and build a script that fulfills the requirements to the best of my ability. I'm sure if I had more time to research I could have solved some of the requests in a
more effective way or in the case of at least the Bonus requirements been able to complete them to my satisfaction.

I've ensured to include links to the site I found solutions for some of the required changes in the comments of my code.

***********************************************************************************************************************************************************************

Requirements:

configuring it to have the following set (the exact mechanism used here to do this is up to you!):

○ timezone on the machine set to UTC (completed)

○ creating a new admin user and home/user directory (completed)

○ enabling RDP access if Windows, or SSH if Linux/Mac (completed)

○ enabling firewall ports RDP (completed)

○ disabling automatic updates (completed)

○ BONUS: enabling VNC access (not completed)

○ BONUS: the new VM also has all of its system software up to date (not completed)

● add automation to be able to assert that the above configuration changes are set properly in this newly-created VM
archive/disk

○ this assertion automation will output some kind of status (process/shell exit code for example) to indicate whether
it was a pass or fail (completed)

○ BONUS: points if this also calls something else (push notification, external service, e-mail, etc.) to notify you
somehow of its status (not completed)

● keep all of this code in a git repo (completed)

● BONUS: Having this image built and configured inside a pipeline eg. Gitlab CI, GitHub Actions or Jenkins (not completed)

**********************************************************************************************************************************************************************

Instructions for use:

1. Include this repo on a USB and connect it through VMwareto the Windows 10 Pro VM after initial setup
2. Open Powershell as Admin and CD to the USB drive
3. Run Set-ExecutionPolicy Unrestricted
4. Press A and then Enter
5. Run . '.\System Setup.ps1'
6. Enter setup-now and press enter
7. Press Y  and then enter to view the Error log output
