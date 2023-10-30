# Install required packages
apt-get update && 
apt-get install -y git gh nodejs npm tree &&
npm install -g firebase-tools && 
npm install -g @angular/cli &&

# Log in to Github and prompt the user for the repository to clone
gh auth login &&
gh auth setup-git &&
firebase login &&
echo "Enter a GitHub repository URL to clone an existing repo: " && 
read repo_url && 
if git clone $repo_url . ; then
    # prompt for Angular application root
    echo "Enter the relative path to the Angular application root: " && 
    tree -d
    read app_path && 
    cd $app_path &&
    npm install &&
else
    # prompt for a new repo name
    echo "Enter a name for the new repository: " &&
    read repo_name &&
    mkdir $repo_name &&
    cd $repo_name &&
    ng new
fi
# log into initialize the Firebase and the project
firebase login &&
firebase init &&

# prompt for Angular application root
echo "Enter the relative path to the Angular application root: " && 
tree -d
read app_path && 
cd $app_path &&
npm install angularfire

# Install the application dependencies
npm install &&