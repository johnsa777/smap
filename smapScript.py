#!/usr/bin/python

# Script John Savu June 2015 
# - scans given network address range using nmap, exports results
#   to smapOutput.xml.
# - converts smapOutput<date-time>.xml to smapOutput<date-time>.csv

import os
import subprocess
from time import strftime

#function prints command to standardio and sends it to system for execution
cmdtxt="ls"
def  commandline(cmdtxt):
	print(":::"+cmdtxt)
	os.system(cmdtxt)


#request IP scan range from user
print
print
print("            *******************************************************")
print("            * Welcome to the smap script, this script will use    *")
print("            * nmap to scan the provided network range and output  *")
print("            * a user friendly .csv file                           *")
print("            * You will need to be root to be able to run this scan*")
print("            *******************************************************")
print(":::Please enter ip range in CIDR or octet range")
print(":::ex. 192.168.1.0/24  or 192.168.2.0-40")
iprange = raw_input(":::")

#create custom file name with date stamp but no extension
outputfilename = "nmapOutput_" + str(strftime("%m-%d-%Y_%H-%M"))
#scan using nmap
commandtext="nmap -sS --stats-every 10s -O -oX " + outputfilename + ".xml "+iprange
commandline(commandtext)

#converting nmap .xml output into a .csv file using
#command xsltproc and transform template smapTransform.xslt
print
print(":::converting .xml file into .csv file using smapTransform.xslt template")
commandtext="xsltproc smapTransform.xslt " +outputfilename+ ".xml -output "+outputfilename+".csv"
commandline(commandtext)
print
print(":::ignoring parsing error, keep going...")

print("            *******************************************************")
print("            * Scanning is complete, please see time-stamped .csv  *")
print("            * file for results.                                   *")
print("            *******************************************************")
print(":::Exit.")
