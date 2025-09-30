#!/bin/sh

# Demonstrating Ubuntu command line operations as per the LaTeX document

echo "### Creating Files and Folders ###"

# Create an empty file
touch newfile.txt
echo "Created an empty file newfile.txt"

# Create a new folder
mkdir newfolder
echo "Created a new folder newfolder"

echo "### Navigating Filesystem ###"

# Navigate into the new folder
cd newfolder
echo "Navigated into newfolder"

# Display the current working directory
pwd
echo "Displayed the current working directory"

# Navigate back to the parent directory
cd ..
echo "Navigated back to the parent directory"

echo "### File Operations ###"

# List files with additional information
ls -l
echo "Listed files with additional information"

# Copy the file into the new folder
cp newfile.txt newfolder/
echo "Copied newfile.txt to newfolder/"

# Rename the file
mv newfolder/newfile.txt newfolder/renamedfile.txt
echo "Renamed newfile.txt to renamedfile.txt"

# Delete the file
rm newfolder/renamedfile.txt
echo "Deleted renamedfile.txt"

echo "### Folder Operations ###"

# List the contents of newfolder
ls newfolder
echo "Listed the contents of newfolder"

# Remove the empty directory
rmdir newfolder
echo "Removed the empty folder newfolder"

echo "### File and Folder Permissions ###"

# Create a file with permissions to change
touch myfile.txt
echo "Created a file myfile.txt"

# Change file permissions
chmod 755 myfile.txt
echo "Changed permissions of myfile.txt to 755"

# Change file ownership (commented to prevent actual system change)
# sudo chown newowner:newgroup myfile.txt
# echo "Changed ownership of myfile.txt"

echo "### System Monitoring ###"

# Display top 5 lines of system processes (commented for brevity)
# top -n 1 | head -n 5
# echo "Displayed top 5 lines of system processes"

# Display disk usage
df -h
echo "Displayed disk usage"

echo "### Networking ###"

# Check network connectivity (only 2 packets for demonstration)
ping -c 2 google.com
echo "Checked network connectivity with google.com"

# Download a file from the internet (commented to prevent actual download)
# wget https://example.com/file.zip
# echo "Downloaded file.zip from example.com"

echo "### Text Processing ###"

# Create a sample text file for grep and wc
echo "This is a search_term in a file." > file.txt
echo "Created a sample text file for grep and wc"

# Search within file.txt
grep "search_term" file.txt
echo "Searched for 'search_term' within file.txt"

# Count lines, words, and characters in file.txt
wc file.txt
echo "Counted lines, words, and characters in file.txt"

echo "### Package Management ###"

# Update package list (commented to prevent actual system change)
# sudo apt update
# echo "Updated the package list"

# Upgrade packages (commented to prevent actual system change)
# sudo apt upgrade
# echo "Upgraded packages"

# Cleanup
rm myfile.txt file.txt
echo "Cleaned up created files"

echo "### Script Execution Complete ###"
