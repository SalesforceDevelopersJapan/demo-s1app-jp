# DF13 Dev Keynote Salesforce1 App #

---
<a name="overview" />
## Overview ##


<a name="technologies" />
### Key Technologiues ###


<a name="setup-and-configuration" />
### Setup and Configuration ###

This is the metadata for setting up your developer edition to run the Opinionator app. Please make sure you have installed the Force CLI first.

Installation
Clone this repo in to a new folder. Change to the new folder and then simply run the importschema.sh shell script.

#### Step 1: Setup a Developer Edition organization ####

If you are not already a member of the Force.com developer community, go to [http://developer.force.com/join](http://developer.force.com/join) and follow the instructions for signing up for a Developer Edition organization. Even if you already have Enterprise Edition, Unlimited Edition, or Performance Edition, use Developer Edition for developing, staging, and testing your solutions against sample data to protect your organization’s live data. This is especially true for applications that insert, update, or delete data (as opposed to simply reading data).

If you already have a Developer Edition organization, verify that you have the “API Enabled” permission. This permission is enabled by default, but may have been changed by an administrator. For more information, see the help in the Salesforce user interface.

#### Step 2: Setup the Force CLI tool ####

Download the the Force command-line interface (CLI) tool. You can immediately download the precompiled binararies from the following locations:

* Linux: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-amd64/force)
* OS X: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-amd64/force)
* Windows: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-386/force.exe) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-amd64/force.exe)

Alternatively, you can clone/fork the repository and build the executable yourself. For more information see the post [A Command-line Interface for Force.com](http://www.wadewegner.com/2013/11/a-command-line-interface-for-forcecom/).

Once you have the executable, ensure you can run it from the command. For example, you can create the folder ~/bin for the force executable. Add the bin folder to your path with the following command (or update your .bash_profile):

````bash
export PATH=~/bin:$PATH
````

You may also need to update the permissions on the force executable in order to run it. To do so, run the following command:

````bash
chmod 755 force
````

#### Step 3: Clone the repository ####

Clone this repository.

````bash
git clone https://github.com/developerforce/demo-df13-devkeynote-s1app.git
````

#### Step 4: Import the schema into your org ####

````bash
cd demo-df13-devkeynote-s1app
cd setup
. importschema.sh
````

You objects, layouts, application, pages and quick action should now exist in your org.

Opinionator Node.js App

````bash
cd df13kn
npm install
heroku apps:create appname
heroku config:set DATABASE_URL=<your heroku connect database connection>
heroku config:set NODE_ENV=<test or development>
git push heroku master
````




<a name="demo" />
## Demo ##




