## DESCRIPTION
This is a simple script that can be used to demonstrate using Azure Linux Custom Script extensions to create a new directory, file and adding some content to the new file.

SYNTAX: 
az vm extension set \
  --resource-group <resource-group-name> \
  --vm-name <vm-name> \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --settings '{"fileUris": ["fileUri"],"commandToExecute": "./<script-file>.sh"}'     

OUTPUTS: 
Use the following bash commands on each Linux VM to check that the script works properly.
cat /var/log/tmp/testFile
The \var\log\tmp\testFile, will have the content "This is a test file used to demonstrate executing a very simple script using Azure Linux custom script extensions."

CLEANUP:
rm /var/log/tmp/testFile

REQUIREMENTS:

1. An Azure subscription
2. Linux VMs deployed in your subscription
3. Azure CLI 2.0, used in your subscription as the bash cloud shell

**FEEDBACK**
Feel free to ask questions, provide feedback, file issues, etc. so we can make this even better!