# Cron_Images

Cron Images is a super simple set of scripts (PHP, PS1, xml, and htaccess) that work together to randomaly change images at set intervals.  This is primarily for those with webservers that do not have cron options available to customer but would also work for those that want to have local granular control. This was created to use with ebay auctions but should work in just about any application.

## Description

- htaccess - redirects "image.jpg" via a RewriteRule to the random image set by cron.php
- cron.php - Randomly picks an image from a given path and rewrites the htaccess file to reflect this change. 
- bg_cron.ps1 - Accesses the image url to get current image, then initiates cron.php to pick a new image. It then compares the new image to the old and accesses cron.php again if the new image is the same as the current.
- bg_cron.xml - Windows Task Scheduler job to run cron_bg.ps1 at user given intervals.

This utilizes a local Powershell script (bg_cron.ps1) that is initiated by Windows Task Schedule (bg_cron.xml) that accesses a PHP script (cron.php) that randomly chooses a new image and then rewrites the htaccess file located in the images directory to reflect that change.

## Requirements

A Windows PC that is on according to your given schedule

## Install

* Edit all files to reflect your paths and URLs.  
* Find these lines in bg_cron.xml and edit to fit your setup:
-   \<Author\>\*\*\*USERNAME\*\*\*\</Author\>    - Your windows Username
-   \<URI\>\*\*\*SCHEDULED_TASK_LOCATION\*\*\*\</URI\>  - You can likely use "/" minus the quotes
-   \<UserId\>\*\*\*USERID\*\*\*\</UserId\>    - Enter the SID of the Windows account this will be running from
-   \<Arguments\>-NoProfile -Executionpolicy bypass -file "\*\*\*PATH\*\*\*\\bg_cron.ps1"\</Arguments\>    - Enter the Local Path to bg_cron.ps1
* Import the Task into Windows Task Scheduler
* Once Imported, change the timing to your needs (current setting is 5 minutes)
* Upload htaccess (be sure to rename to .htaccess) and cron.php to webhost

