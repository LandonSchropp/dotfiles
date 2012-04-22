-- Script file which provides useful handlers for using the Terminal application.

-- load the application script
set applicationScript to run script ("script s" & return & (read alias ("application.applescript" as POSIX file) as «class utf8») & return & "end script" & return & "return s") 

tell applicationScript to closeWindows("Finder")
tell applicationScript to openNewWindows("Finder", 4)