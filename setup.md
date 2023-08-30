# Local Environment

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
6. Create a new branch and switch to it using either `git checkout -b <branch-name>` or `git branch <branchname>`
   then, `git checkout <branchname>` (might be `git switch -c <branchname>` for newer git versions)
7. Confirm you are on the right branch `git branch`
8. To see what you have staged in git use `git status` red is un-staged, green is staged
9. To add files to staging `git add .` the dot means all files
10. Use `git status` should all be green now...
11. To commit with a message `git commit -m "my commit message"`
12. To push to GitHub `git push`
13. If you need to retrieve changes someone has made to a branch from GitHub use `git fetch`, then `git pull`

Troubleshooting:
If you used HTTPS instead of SSH you can check `git remote -v` and change to
SSH using `git remote set-url origin git@github.com:username/repo.git`

## Framework

### Flutter

#### Installation

1. Download the zip file and install to C:drive from https://docs.flutter.dev/get-started/install/windows
2. (Optional) Copy your PATH in-case it needs to be reverted back `echo $PATH`
3. Append new path of flutter to PATH env variables: can do in command line `export PATH="${PATH}<new-path>"`
4. Check it has been added correctly `echo $PATH` new path should have been appended

Either in Ubuntu Command Line or In a terminal in the IDE
Can use `flutter --version` in command line to check installation
Command `flutter doctor` will show suggestions for development, may need to install the Android SDK Command Line tools
from listed link (generally comes with Android Studio - under SDK manager)

DevTools Installation:
If dart is on your PATH then `dart devtools` in [command line](https://docs.flutter.dev/tools/devtools/cli)
OR
In [Visual Studio Code](https://docs.flutter.dev/tools/devtools/vscode) install the Dart extension (usually automatic
with Flutter install)

#### Creating a New Flutter Project

1. Go to repo directory `cd <repo-directory-name>`
2. Create app using flutter `flutter create <app-name>` or `flutter create .` to create in current directory
3. Check successful creation `ls` check directory, then `cd <app-directory>`
4. Launch `flutter run`

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


