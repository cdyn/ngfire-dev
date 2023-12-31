# ngfire-dev

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/cdyn/ngfire-dev) &emsp; [![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in%20VS%20Code-a010a0.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/cdyn/ngfire-dev)

This is an Angular Firebase dev environment setup and container template that uses the [ubuntu:latest](https://hub.docker.com/_/ubuntu/tags) base image. This script is designed to either configigure a new angularfire app, or clone an existing mono repo project. Included are dev containers and codespace definitions. Also has options to use ionic or capacitor for mobile development, and electron for desktop development. Asuusmes interactive environment for logins etc.

### Dependencies

[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/) [![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com/) [![Angular](https://img.shields.io/badge/angular-%23DD0031.svg?style=for-the-badge&logo=angular&logoColor=white)](https://angular.io/) [![Ionic](https://img.shields.io/badge/Ionic-%233880FF.svg?style=for-the-badge&logo=Ionic&logoColor=white)](https://ionicframework.com/) [![Capacitor](https://img.shields.io/badge/Capacitor-%233880FF.svg?style=for-the-badge&logo=Capacitor&logoColor=white)](https://capacitorjs.com/) [![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/) [![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-a010a0.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)

### Contents

<nobr>&emsp;|— __[ngfire_init.sh](https://github.com/cdyn/ngfire-dev/blob/main/ngfire_init.sh)__ : interactive shell script to setup the environment, can be run standalone, run by the dockerfile <br/></nobr>
<nobr>&emsp;|— __[Dockerfile](https://github.com/cdyn/ngfire-dev/blob/main/Dockerfile)__ : docker container file <br/></nobr>
<nobr>&emsp;|— __[.devcontainer](https://github.com/cdyn/ngfire-dev/blob/main/.devontainer)__ / <br/></nobr>
<nobr>&emsp;|&emsp;&emsp;|— __[devcontainer.json](https://github.com/cdyn/ngfire-dev/blob/main/.devontainer/devcontainer.json)__ : dev container configuration <br/></nobr>

### Notes

The container setup buidls a directory for the repo with the following structure by default

``` bash
.
└── {repo_name} # repo and firebase root
    ├── functions
    │   ├── package.json # npm package file, description of cloud functions code
    │   └── src
    │       └── index.tx # firebase cloud function source file
    ├── public # client side code, can support multiple apps
    │   └── {app_id} # the name af the angular app
    │       ├── dist
    │       │   └── {build_name} # map firebase hosting here to production build
    │       └── src # app source code
    ├── .firebaserc
    ├── README.md
    ├── firebase.json
    ├── firestore.indexes.json
    ├── firestore.rules
    └── storage.rules
```
