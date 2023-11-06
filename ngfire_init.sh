# Install required packages
apt-get update && 
apt-get install -y git gh nodejs npm tree &&
npm install -g firebase-tools && 
npm install -g @angular/cli &&
npm install -g @ionic/cli &&


# Log in to Github, Firebase and prompt the user for the repository to clone
gh auth login &&
gh auth setup-git &&
firebase login &&
echo "Enter a GitHub repository URL to clone an existing repo (leave blank to create new): "  
read repo_url && 

# Clone the repository or prompt for a new repo name
if [$repo_url] && git clone $repo_url ; then
    cd "$(basename "$repo_url" .git)" &&
    # prompt for Angular application root
    firebase init &&
    echo "Enter the relative path to the Angular application root (typically /public/{app_name}): "  
    tree -d
    read app_path && 
    cd $app_path &&
    npm install &&
else if [! $repo_url] ; then
    # prompt for a new repo name
    echo "Enter a name for the new repository: " 
    read repo_name &&
    echo "Would you like to create the reository in an organization? (enter the org ID, leave blank otherwise):" 
    gh org list 
    read org_id &&
    if [$org_id]; then
        gh repo create $orgid/$repo_name --clone --private &&
    else
        gh repo create $repo_name --clone --private &&
    fi
    cd $repo_name &&
    firebase init &&
    echo "Enter name the Angular app: " 
    read ng_id &&
    cd "/public" &&
    ng new $ng_id --skip-git &&
    cd $ng_id &&
    npm install @angluar/fire &&
else
    # bad url
    echo "Invalid url. Exiting." 
    exit 1
fi
cd ../..
exit 0