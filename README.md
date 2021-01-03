***smap script V1.2, John Savu, June 2015***

PURPOSE: quickly scan a network and create a xls output

OPERATION:
`sudo python2 smapScript.py`
Time-stamped output files will be created inside the same directory.
Open .csv file for a summary of the scan. Tested in Fedora and Kali.

FILES:
*smapScript.py 		-script that runs nmap and xml transform to .csv file
			-user must be root to successfully run script (nmap is
			 using a syn scan)

*smapTransform.xslt	-template used to transform the standard nmap
			 .xml output into .csv format.
			-only certain information is put into the .csv file

*README-FIRST.txt-this file
