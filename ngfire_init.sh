# Install required packages
apt-get update && 
apt-get install -y git gh nodejs npm tree &&
npm install -g firebase-tools && 
npm install -g @angular/cli &&

# Log in to Github, Firebase and prompt the user for the repository to clone
gh auth login &&
gh auth setup-git &&
firebase login &&
echo "Enter a GitHub repository URL to clone an existing repo (leave blank to create new): " && 
read repo_url && 

# Clone the repository or prompt for a new repo name
if git clone $repo_url ; then
    # prompt for Angular application root
    firebase init &&
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
    echo "Would you like to create the reository in an organization? (enter the org ID if so)" &&
    gh org list &&
    read org_id &&
    if [$org_id]; then
        gh repo create $orgid/$repo_name --clone
    else
        gh repo create $repo_name --clone
    fi
    gh repo create $orgid/--clone 
    firebase init &&
    ng new
    npm install @angluar/fire &&
fi
# log into initialize the Firebase and the project
firebase login &&
firebase init &&

# prompt for Angular application root
echo "Enter the relative path to the Angular application root: " && 
tree -d
read app_path && 
cd $app_path &&
# npm install angularfire &&

# Install the application dependencies
npm install &&