#!/bin/sh
# This is a sample shell script to demonstrate the commands from the LaTeX document

# Listing Files
echo "Listing Files:"
ls -l

# Copying Files
echo "Copying Files:"
touch source.txt
cp source.txt destination.txt

# Viewing System Processes
echo "Displaying top 5 lines of system processes:"
top -n 1 | head -n 5

# Disk Usage
echo "Showing Disk Usage:"
df -h

# Ping for Network Connectivity (only 2 packets for demonstration)
echo "Ping google.com:"
ping -c 2 google.com

# Create a sample text file for grep and wc
echo "This is a search_term in a file." > file.txt

# Searching within Files
echo "Searching within file.txt for 'search_term':"
grep "search_term" file.txt

# Word Count
echo "Word Count for file.txt:"
wc file.txt

# Updating package list (commented to prevent actual system change)
# echo "Updating package list:"
# sudo apt update

# Upgrading packages (commented to prevent actual system change)
# echo "Upgrading packages:"
# sudo apt upgrade

# handling files and folders in depth

# Create an empty file
touch newfile.txt

# Create a new folder
mkdir newfolder

# Navigate into the new folder
cd newfolder

# Display the current working directory
pwd

# Navigate back to the parent directory
cd ..

# Copy the file into the new folder
cp newfile.txt newfolder/

# Rename the file
mv newfolder/newfile.txt newfolder/renamedfile.txt

# Delete the file
rm newfolder/renamedfile.txt

# List the contents of newfolder
ls newfolder

# Remove the empty directory
rmdir newfolder

# Create a file with permissions to change
touch myfile.txt

# Change file permissions
chmod 755 myfile.txt

# Change file ownership (commented to prevent actual system change)
# sudo chown newowner:newgroup myfile.txt

# Cleanup
rm myfile.txt


# Cleanup
rm source.txt destination.txt file.txt
