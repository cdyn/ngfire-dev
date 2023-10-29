# Install required packages
apt-get update && 
apt-get install -y git gh nodejs npm &&
npm install -g firebase-tools && 
npm install -g @angular/cli &&

# Prompt the user for the GitHub repository to clone
gh auth login &&
gh auth setup-git &&
echo "Enter the GitHub repository URL to clone:" && 
read repo_url && 
git clone $repo_url . || git repo create &&

# initialize the Firebase project
firebase login &&
firebase init &&

# prompt for Angular application root
echo "Enter the relative path to the Angular application root:" && 
read app_path && 
cd $app_path &&

# Install the application dependencies
npm install &&