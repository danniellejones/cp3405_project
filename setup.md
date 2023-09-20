# Local Environment

## Quick Start Guide

### Visual Studio Code

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Go to Extensions
3. Search for Flutter (by Dart Code)
4. Install Flutter Plugin
5. Close Visual Studio Code

### Git 
1. Install [Git](https://git-scm.com/downloads)

### GitHub SSH Keys OR HTTPS
Use one of the following setups to connect to GitHub:

**SSH Key**
1. Open git bash
2. In users/user create new directory `mkdir .ssh` and `cd .ssh`
3. Generate key pair `ssh-keygen -t ed25519 -C "youremail@example.com"`
4. If pass phrase is not desired just press enter
5. Name the key
6. View contents of public key `type <key-name.pub>`
7. Copy public key and add to GitHub (SSH under account settings) or Deploy Keys in repository
8. In git bash: start ssh agent command includes back ticks >> eval `ssh-agent -s`
9. Add private key to ssh agent `ssh-add ~/.ssh/key-name` or `ssh-add ~/key-name` if already in directory
10. Go to GitHub: copy SSH link
11. In git bash: `git clone <ssh-link>`
Advantages: More secure connection
Disadvantages: Requires use of git bash terminal and above steps for each session

**HTTPS**
In GitHub:
1. GitHub > Clone > Copy HTTPS link
In command line: 
Go to desired project directory `cd <path>`
Clone repository `git clone <https-link>`
Advantages: Faster and easier to Access
Disadvantages: Less Secure

### Flutter Setup
1. Download the [Windows zip file](https://docs.flutter.dev/get-started/install/windows)
2. Create directory in C: drive called Flutter
3. Navigate to the bin directory and copy the path
4. In start search type 'env' and select Edit System Environment Variables
3. Click Environment Variables
4. In the top user section, click on path, edit and new add in the copied path
5. Open a command line and Check installation worked `flutter --version`
6. Check `flutter doctor` to check other requirements: Chrome Browser, Android Studio provides SDK manager and virutal device manager

### Browser and Android Studio
1. Install Google Chrome, Firefox and Edge for testing - most development will occur in Chrome
2. Install Android Studio
3. Open Android Studio
4. Under more options at the home screen click SDK Manager to check installs
5. Go back to the home and under more options click Virtual Device Manager
6. Create a device (Pixel 5 or higher) and install API 33 Tiramisu
7. Run the device and it should be automatically available in Visual Studio Code

### Creating a New Flutter Project

1. Go to repo directory `cd <repo-directory-name>`
2. Create app using flutter either `flutter create <app-name>` to create app sub-directory or `flutter create .` to create in current directory

### Run Flutter Project
1. Open command terminal or terminal in Visual Studio Code
4. Launch `flutter run`

### Use Git Commands
1. The following can be done in commands as below or using GitHub Desktop for a GUI interface
2. Go to GitHub and copy either HTTPS or SSH link
3. Git to clone the repo `git clone <url>`
4. Go to your new project `cd <repo-directory-name>`
5. Check your current branch `git branch`
6. Create a new branch and switch to it using either `git checkout -b <branch-name> <branch-to-base-off>` or `git branch <branchname> <branch-to-base-off> `
   then, `git checkout <branchname>` (might be `git switch -c <branchname>` for newer git versions)
7. Confirm you are on the right branch `git branch`
8. To see what you have staged in git use `git status` red is un-staged, green is staged
9. To add files to staging `git add .` the dot means all files
10. Use `git status` should all be green now...
11. To commit with a message `git commit -m "my commit message"`
12. To push to GitHub `git push`, may need to use `git push -u origin <branch-name>` to set upstream the first time
13. If you need to retrieve changes someone has made to a branch from GitHub use `git fetch`, then `git pull`

**Merging Branches:**

Merge Commands for Merge into Development (without branch projection rules):
1. Commit to your branch `git status` to check what files are staged. Then, `git add .` to add all files. Commit, `git commit -m "My commit message"`.
2. Push to GitHub `git push`
3. Switch to development `git checkout development` 
4. Check that development tracks origin/development `git branch -vv`
5. Update development with the latest changes from remote `git fetch` then, `git pull`
6. Merge your branch into development `git merge your-branch`
7. You may or may not need to do another commit (dependency files may require it) `git commit -m "Your commit message"` and then you need to `git push`
8. Test development branch to make sure everything is working as expected
9. If everything works, then go to GitHub and make a pull request into main

Merge into Main from Development (through GitHub with protection rules):
Pull Request (with branch projection rules)
1. In GitHub, select the branch then Compare and create pull request
2. Check that branch destinations are correct (left-most is what will be merged into) (right-most is from which branch)
3. Write a commet and create
4. Pull Request to be reviewed by another developer from Pull Requests tab
5. Select the pull request
6. Near the bottom > Add your Review
7. Approve with comments
8. Add a comment and approve
9. Original developer goes to pull requests
10. Open approved pull request
11. Click merge
12. If own branch (not developement or main) you may opt to delete branch

**Updating Your Branch After Merges**
Once others have merged into development, you can follow these steps to update your own branches. 

STEP 1
You will need to update the **development branch** with the latest changes.
To start, switch to your development branch `git checkout development`, get the latest changes to the branch  `git fetch` and  update the branch with those changes `git pull` from origin/development.

STEP 2
Update **your branch** with the latest changes from development. 

Option A
Merge development into your branch (it is the opposite direction to the merging into development), `git checkout your-branch`, then `git merge development`. 

OR 

Option B
**Recommended:  if your confused about git merge and how it works** delete your branch by first switching to development `git checkout development`,  then deleting your branch `git branch -d <your-branch>` and re-make a new branch to track origin/development (`git checkout -b new-branch-name origin/development`).
//-------------------------------------------------------------------------------------------------

## Integrated Development Environment (IDE)

### Visual Studio Code

#### Installation and Setup

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Go to Extensions
3. Search for Flutter (by Dart Code)
4. Install Flutter Plugin
5. Close Visual Studio Code

#### Creating a New Flutter Project

1. Go to repo directory `cd <repo-directory-name>`
2. Create app using flutter `flutter create <app-name>`
3. Check successful creation `ls` check directory, then `cd <app-directory>`
4. Launch `flutter run`

#### Opening a Project

In Ubuntu command line:

1. Go to the app in the repo directory `cd <path-to-app-directory>`
2. Check directory listing `ls`
3. Open project in visual studio code `code .`

#### Run a project file

Open in Browser:

1. Right-click and run without debugging (use default browser or make selection)

Open in Emulator:

1. Go to Android Studio
2. On welcome page go to more actions
3. Click Virtual Device Manager
4. Create Device
5. Select a device with appropriate API Level
6. Go back to Visual Studio Code and select newly created emulator in same way browser was accessed

## Windows Subsystem (WSL) and Version Control

Assumes that git is already installed on your device. Go to git and download if this has not been installed yet.
`<substitute>` indicates fields that you are to complete, these are unique to yourself e.g. `myfilename`.

Install Windows Linux Subsystem (WSL)

1. Install [wsl](https://learn.microsoft.com/en-us/windows/wsl/install) subsystem to get Ubuntu terminal `wsl --install`
2. Check successful installation `wsl -l -v` to see a list of versions of installed wsl
3. Recommended (optional) install Windows Terminal
4. Open Ubuntu command line terminal

Install Git In Linux Environment:

1. Check that git is installed in your Linux environment `git --version`
2. If not installed, install git on Linux subsystem `sudo apt update` then, `sudo apt install git`
3. Check git installed correctly `git --version`
4. Set global config for git `git config --global user.email "email@example.com"`
   and `git config --global user.name "username"`

SetUp Command Line/Git to GitHub with SSH:

1. Create keygen `ssh-keygen -t ed25519 -C "your_email@example.com"`
2. Enter key name for filename of the key
3. (Optional) Add passphrase or press enter
4. Create directory `mkdir .ssh`
5. Move public and private key to directory `mv <./filename> ./.ssh`
6. Copy public key from the .pub file `cat keyname.pub`
7. Paste public key into Version Control settings under SSH Keys section (Deploy Keys)

Add Key to Terminal Session:

1. In wsl root directory view hidden .ssh folder `ls -a`
2. Run agent `eval $(ssh-agent -s)`
3. Add ssh private key `ssh-add ~/.ssh/keyname`
4. Check agent state `ssh-add -l`

To add to all terminal sessions:

1. In wsl root directory view hidden file .bashrc `ls -a`
2. Go to text editor `nano .bashrc`
3. Navigate to the bottom using arrow keys
4. Add lines `eval $(ssh-agent -s)` and `ssh-add ~/.ssh/keyname` to the bottom
5. CTRL + O to write out and CTRL + X to Exit
6. Open/close terminal or `source .bashrc`

Set Up Project Directory:

1. Create a directory for projects in the wsl directory (NOT windows) `mkdir <directory-name>`
2. Go to directory `cd <directory-name>`

Clone Project and Use Git Commands:

1. Ensure you are in the wsl directory in the folder you made for projects
2. Go to GitHub and copy the SSH to clone
3. In Ubuntu terminal, wse Git to clone the repo `git clone ssh:<url>`
4. Go to your new project `cd <repo-directory-name>` (can use `ls` to see files and `ls -a` to see hidden files)
5. Check your branch `git branch`
6. Create a new branch and switch to it using either `git checkout -b <branch-name> <branch-to-base-off>` or `git branch <branchname> <branch-to-base-off> `
   then, `git checkout <branchname>` (might be `git switch -c <branchname>` for newer git versions)
7. Confirm you are on the right branch `git branch`
8. To see what you have staged in git use `git status` red is un-staged, green is staged
9. To add files to staging `git add .` the dot means all files
10. Use `git status` should all be green now...
11. To commit with a message `git commit -m "my commit message"`
12. To push to GitHub `git push`, may need to use `git push -u origin <branch-name>` to set upstream the first time
13. If you need to retrieve changes someone has made to a branch from GitHub use `git fetch`, then `git pull`

Merging Development Into Main:
1. Check out main branch `git checkout main`
2. Update main by fetch and pull changes `git fetch` and `git pull`
3. Update main with development `git merge development` with branch rules use GitHub interface Create Pull Request

**Opening applications in WSL Ubuntu Command line:**

Need to use the application path <path>/<application>.exe
For example: `notepad.exe newfile.py` will use notepad to create a Python file called newfile

(Optional)Set Up Aliases in shell config file:
Add the following lines to the .bashrc in /home `ls -a` and `nano .bashrc`
Note: Your path may vary
`alias studio="/mnt/c/Program\ Files/Android/Android\ Studio/bin/studio64.exe"`
Using `studio` in command line would allow you to use Android Studio

**Troubleshooting:**
If you used HTTPS instead of SSH you can check `git remote -v` and change to
SSH using `git remote set-url origin git@github.com:username/repo.git`

## Framework

Selected Framework: Flutter

### Flutter

#### Installation

1. Download the LINUX zip file from https://docs.flutter.dev/get-started/install/linux#update-your-path
2. Create directory in wsl /home called Flutter, `cd <flutter-directory>` and extract zip `tar xf flutter_linux_3.13.2-stable.tar.xz`
3. Navigate to the bin directory `ls -a` and `cd <path-to-bin>`
4. Print out directory path `pwd` and copy it (right-click)
3. To install: Append new path of flutter bin to PATH env variables: can do in command line for the terminal session or add to .bashrc in /home (`cd` to return to root) `nano .bashrc` for permanent `export PATH="${PATH}:<result-from-pwd-command>"` in wsl this should start from home/ and windows will be /mnt/c/...
4. Check it has been added correctly `echo $PATH` new path should have been appended
5. Check installation worked `flutter --version`
6. Check `flutter doctor` to check other requirements, may need to install the Android SDK Command Line tools
from listed link (generally comes with Android Studio - under SDK manager)
7. Install Linux tools `sudo apt install clang ninja-build cmake pkg-config libgtk-3-dev`
8. Chrome Browser: to use windows application `cmd.exe /C start chrome` to open using wsl, add `export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"` to .bashrc or install [google-chrome on wsl](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps#install-support-for-linux-gui-apps)
9. Set Android SDK - may automatically work, if it doesn't follow the instructions below

**Android SDK**

Update with your path to Android SDK (Usually located in Users/User/AppData/Local...)

In Windows Powershell (as Admin):
1. Create `ANDROID_HOME` environment variable `[System.Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\YourUsername\AppData\Local\Android\Sdk", [System.EnvironmentVariableTarget]::Machine)`
2. Add ANDROID_HOME to PATH `$env:Path += ";%ANDROID_HOME%\tools"`

In Ubuntu Terminal:
1. Create ANDROID_HOME variable via shell config file `echo 'export ANDROID_HOME="/mnt/c/Users/YourUsername/AppData/Local/Android/Sdk"' >> ~/.bashrc`
2. Add ANDROID_HOME to PATH tools `echo 'export PATH="$PATH:$ANDROID_HOME/tools"' >> ~/.bashrc`
3. Add ANDROID_HOME to PATH platform-tools `echo 'export PATH="$PATH:$ANDROID_HOME/platform-tools"' >> ~/.bashrc`
3. Execute shell config file `source ~/.bashrc`

**DevTools Installation:**
If dart is on your PATH then `dart devtools` in [command line](https://docs.flutter.dev/tools/devtools/cli)
OR
In [Visual Studio Code](https://docs.flutter.dev/tools/devtools/vscode) install the Dart extension (usually automatic
with Flutter install)

#### Creating a New Flutter Project

1. Go to repo directory `cd <repo-directory-name>`
2. Create app using flutter `flutter create <app-name>` or `flutter create .` to create in current directory
3. Check successful creation `ls` check directory, then `cd <app-directory>`
4. Launch `flutter run`

### Run Project
1. Open and run the following commands in Ubuntu terminal
2. Go to Flutter app directory `cd <path-to-flutter-app>`
3. Open in Visual Studio Code `code .`
4. To see available devices for run `flutter devices`

Run Flutter from Command Line:
* Open Flutter app in linux environment `flutter run` or run through lib/main.dart
* Open [Flutter in web](https://docs.flutter.dev/platform-integration/web/building) `flutter run -d web`
* Open in Emulator: Open android studio using alias `studio`, then go to device manager and create a device, run the device and then in vsc terminal `flutter run -d <device-name>`

Run Flutter app from VSC:
* Click bottom right corner and select Linux, web server or emulator
* Right-click main.dart file and run without/with debugging
* In wsl the emulator may not be available
	1. In Ubuntu, check for install `adb --version` if not installed install adb `sudo apt install adb`
	2. Open Android Studio device manager and run an emulator
	3. Go to Windows Powershell and see running emulator `adb devices`
	4. Go to Ubuntu terminal `adb devices`

**ISSUES!!!**
Instructions to connect via adb between wsl and windows have not been successful.
Instructions to use Android Studio installation in wsl are unsuccessful as requires virtualization which is not available in wsl without a VM.
Potential solution: Local development in Windows for Flutter?

#### Integration with Firebase

1. Create Firebase Project
2. Go to Firebase Console
3. Add Project and setup
4. Add app to Firebase: select project, add app and choose platform
5. Configure Firebase
    * For Android: Download the google-services.json file and place it in the android/app directory of your Flutter
      project.
    * For iOS: Download the GoogleService-Info.plist file and add it to the root directory of your Xcode project.
6. Set up Dependencies: Firebase Plugin to the `pubspec.yaml` file, `flutter pub get` to fetch packages

```
    dependencies:
        flutter:
        sdk: flutter
        firebase_core: ^latest_version
        firebase_auth: ^latest_version
        cloud_firestore: ^latest_version
   ```

7. Initilize Firebase in main (main.dart) call `Firebase.initializeApp()`
   Example:

```
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

8. Set up Firebase services in app e.g. Firebase Authentication, Firestore, Cloud, Storage

### React

#### Installation using nvm:

1. Install nvm (node version manager) `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
2. Reload shell `source ~/.bashrc` or close and reopen terminal
3. Install node `nvm install node`
4. Install devtools extension
   on [Google Chrome Browser](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)

#### Create New Project:

1. Command line `npx create-react-app <app-name>`
2. Go to app `cd <app-name>`
3. Start development server `npm start`

#### Firebase Integration

1. Firebase Console - Add Project
2. Install firebase SDK `npm install --save firebase`
3. Import and configure firebase in the app in the main JavaScript file (App.js)
   Example:

```
import firebase from 'firebase/app';
import 'firebase/auth'; // Import any Firebase services you need

const firebaseConfig = {
apiKey: 'YOUR_API_KEY',
authDomain: 'YOUR_AUTH_DOMAIN',
projectId: 'YOUR_PROJECT_ID',
storageBucket: 'YOUR_STORAGE_BUCKET',
messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
appId: 'YOUR_APP_ID'
};

firebase.initializeApp(firebaseConfig);
```

Use firebase services in app such as Firestore (NoSQL Database) or UI Integration
Example of Firestore:

```
import firebase from 'firebase/app';
import 'firebase/firestore';

const db = firebase.firestore();

// Example: Adding data to Firestore
db.collection('users').add({
name: 'John Doe',
email: 'johndoe@example.com',
});
```

## Programming Language

Selected Programming Language: Dart

### Dart Programming Language

#### Setup

1. (Optional) Install Dart or use (Recommended) Dart Plugin in VSC

#### Key Points

* Object-Oriented Program
* Front and Back-End Development
* Cross-platform for mobile and web applications (web is different from Flutter Desktop)
* Just-in-Time (for development) and Ahead-of-Time Compilation (for production)
* Supports inheritance, interfaces, classes and mixins
* Built-in support for asynchronous programming (keywords `async` and `await`)
* Package manager `pub` and package repository `pub.dev`
* Has UI library components

#### Syntax

* Statically typed, but support dynamic - can declare variable types, but can also be inferred
* Uses {} for blocks
* Semicolons for statements can be used, but are optional
* Variables: `var`, `final` (immutable after initialise), `const` (compile-time constants)
* Strings Interpolation: `"Hello ${variableName}"`
* Multi-Line String: `'''Multi-line string'''`
* Named and optional parameters allowed
* Fat arrow functions - anonymous functions `=>`
* Cascades `..` perform multiple operations on an object without repeating object name
* List `[1, 2, 3]`, Set `{1, 2, 3}`, Map/Dictionary `{'one':1, 'two':2}`
* Spread operator to combine collections `...`
* Null-safety `?`
* Asynchronous `async` and `await`
* Classes `class`, constructor `constructorName()`
* Getters and setters: `get` and `set`
* Import `import`, Export `export`
* Underscore at the front of variable or function name indicates private _variableName

#### Code Segments

* Main function `void main()` app start executing
* Flutter material library `import 'package:flutter/material.dart'`
* `runApp(MyApp())` runs the app, takes widgets as arguments (root of hierarchy)
* Define new widget from stateless widget (interface has no mutable state) or stateful widget (interface needs to
  manage/update mutable state) `class MyApp extends StatelessWidget`
* Required for stateless widget to return widget `build(BuildContext context)`
* Home page for app `return MaterialApp(...)`
* `createState()` method creates and returns a mutable state object associated with the widget
* `Scaffold` is a basic skeletal structure for a page in a Flutter app (app bar, body, drawers, floating action buttons)
* `AppBar` top bar that displays title
* `Text` displays text
* `ElevatedButton` is a button widget
* `print` to display to console

### JavaScript Language

#### Syntax
* Case sensitive
* Semicolons at end of line, but using react negates this
* {} for blocks, function bodies, loops and conditional statements
* Variables: `var` (function scope), `let`, `const` (block scope)
* Hooks: useState, useEffect, useRef
* Import: `import React from 'react'`
* Function: `function myFunction() { }`
* Objects with key-value pairs `Person { name: "Jane", age: "34" }`
* Array/List [], index starts at zero


