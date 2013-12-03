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


#### Step 1 ####

Download the the Force command-line interface (CLI) tool. You can immediately download the precompiled binararies from the following locations:

* Linux: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-amd64/force)
* OS X: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-amd64/force)
* Windows: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-386/force.exe) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-amd64/force.exe)

Alternatively, you can clone/fork the repository and build the executable yourself. For more information see the post [A Command-line Interface for Force.com](http://www.wadewegner.com/2013/11/a-command-line-interface-for-forcecom/).



Run

````bash
git clone https://github.com/developerforce/df13-devkeynote-s1.git
cd df13-devkeynote-s1
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




