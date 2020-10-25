# Westpac Kiwisaver Automation Testing

## Introduction

This automation test suite is built for Westpac Kiwisaver screen for the assignment given by Westpac, it covers all the test cases given in the email. This test suite is built using Robot Framework and Python language. This document will help you to install Robot Framework, and other relevant Selenium libraries and also the Python language to run this project. 

## Information on the files in this project

1. [test_sitedata.py](./testing1/test_sitedata.py) - This python file containts the variables with all the xpaths and URLs
2. [tests.robot](./testing1/tests.robot) - This file containts all the BDD test cases for all the scenarios given in the email
3. [test_keywords.robot](./testing1/test_keywords.robot) - This file containts defination for all steps in the test cases


## Installation

1. First, check if your computer already has Python programming language. Open Terminal/Command Prompt and type in:

```bash
python --version
```

2. If Python is not installed, download and install latest version from [Python Downloads](https://www.python.org/downloads/). If installing to Windows, check "Add Python to PATH" in the Python installer.
3. Restart the Terminal/Command Prompt program after Python installation.
4. Next, install Robot Framework and other Selenium libraries:

You first need to install 'pip' if not already installed. 'PIP' is a package management system used to install and manage software packages written in Python.

```bash
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   windows - python get-pip.py
   macOS - easy_install pip
```

Robotframework Installation

```bash
pip install --upgrade pip
pip install robotframework
python -m pip install -U pip
```

Seleneium2Librabry Installation

```bash
pip install robotframework-selenium2library
pip install --upgrade robotframework-selenium2library
```

Pillow Library Installation - Pillow adds image processing features to Python.

```bash
pip install Pillow
```

If installation was succesful, this command prints robot version:

```bash
robot --version
```

Robot Framework should now be installed!

5. Chrome Driver installation

Download Chrome Driver from here - https://sites.google.com/a/chromium.org/chromedriver/downloads
Append 'chrimedriver;' in your envrionment variable



### Troubleshooting installation

If command pip does not work, most probable reason is that Python is not found. There are two options to tackle this:

Option 1: Add Python to PATH. Robot Framework's installation instructions include [in-depth instructions for modifying PATH](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#configuring-path).

Option 2: Or if you use Windows, run Python using command `py -m`:

```bash
py -m pip install robotframework
```

and for checking if installation was succesful:

```bash
py -m robot --version
```

## Clone this git repo

```bash
git clone https://github.com/autoak/Westpackiwisaver.git
```

## Running this project

After cloning the repo, go to the folder and update the 'Runtest.bat'. **Set the 'outputdir' to your local folder path where your repo is cloned**. This is the path where you want your output files for logs and report to be saved

After updating the bat file, run the following command

```bash
Runtest.bat
```

'Runtest.bat' file contains a command to run the test case.

## Viewing test results

You can check details of the test run by opening report.html file.

Running the demo generates the following three result files. These files are linked to pre-executed files available online, but executing the demo creates them locally.

[report.html](./report.html) - Higher level test report.

[log.html](./log.html) - Detailed test execution log.

[output.xml](./output.xml) - Results in machine readable XML format.

