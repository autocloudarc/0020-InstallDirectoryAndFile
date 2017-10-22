#!/bin/bash
<<HEADER
DESCRIPTION: This is a simple script that can be used to demonstrate using Azure Linux Custom Script extensions to create a new directory, file and adding some content to the new file.
REQUIREMENTS: The test was written for the Ubuntu LTS 16.04 and CentOS 7.3 distributions.
ARGUMENTS: NA
OUTPUTS: \var\log\tmp\testFile, which will have the content "This is a test file used to demonstrate executing a very simple script using Azure Linux custom script extensions."
EXAMPLE: NA
SYNTAX: 
az vm extension set \
  --resource-group <resource-group-name> \
  --vm-name <vm-name> \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --settings '{"fileUris": ["fileUri"],"commandToExecute": "./<script-file>.sh"}'     	
KEYWORDS: Azure, Custom, Script, Extension, Linux

LICENSE:
MIT License

Copyright (c) 2017 Preston K. Parsard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the SoftwSare is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
S
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

LEGAL DISCLAIMER:
This Sample Code is provided for the purpose of illustration only and is not intended to be used in a production environment.� 
THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.� 
We grant You a nonexclusive, royalty-free right to use and modify the Sample Code and to reproduce and distribute the object code form of the Sample Code, provided that You agree: 
(i) to not use Our name, logo, or trademarks to market Your software product in which the Sample Code is embedded; 
(ii) to include a valid copyright notice on Your software product in which the Sample Code is embedded; and 
(iii) to indemnify, hold harmless, and defend Us and Our suppliers from and against any claims or lawsuits, including attorneys� fees, that arise or result from the use or distribution of the Sample Code.
This posting is provided "AS IS" with no warranties, and confers no rights.

REFERENCES:
1. https://docs.microsoft.com/en-us/azure/virtual-machines/linux/extensions-customscript
HEADER

# INITIALIZE VALUES
targetDir="/var/log/tmp"
testFile="$targetDir/testFile"
testMessage="This is a test file used to demonstrate executing a very simple script using Azure Linux custom script extensions."

# MAIN
# Create download and installation for OMI Server
if [ ! -d "$targetDir" ]; then
    mkdir "$targetDir"
fi
touch $testFile
echo $testMessage > $testFile

# FOOTER
# To check for file and remove
# cat /var/log/tmp/testFile
# rm /var/log/tmp/testFile