# DF13 Dev Keynote Salesforce1 App #

<a name="setup-and-configuration" />
## Setup and Configuration ##

Using the following steps you can setup all prerequisites for running the Dreamforce 13 developer keynote Salesforce1 demo application.

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

#### Step 4: Import the schema into your Developer Edition organization ####

````bash
cd demo-df13-devkeynote-s1app
cd setup
. importschema.sh
````

Your objects, layouts, application, pages and quick action should now exist in your org.

#### Step 5: Setup a Heroku account ####

You will need a Heroku account for the opinionator application. You can sign up for a free account at [https://id.heroku.com/signup](https://id.heroku.com/signup).

Once you have an account, setup the Heroku CLI and tools. Follow the instructions at [https://devcenter.heroku.com/articles/heroku-command](https://devcenter.heroku.com/articles/heroku-command) or download the toolbelt at [https://toolbelt.herokuapp.com/](https://toolbelt.herokuapp.com/).

Confirm the Heroku CLI is installed by running the following command:

````bash
heroku version
````

You should see version output similar to this: heroku-toolbelt/2.39.5 (x86_64-darwin10.8.0) ruby/1.9.3

#### Step 6: Setup Node.js and npm ####

Confirm you have Node.js and npm installed and configured on your machine. The easiest way to do so is by running the following command from the bash:

````bash
npm version
````

If the response is "npm: command not found" you need to install npm. Try the following from the command line:

````bash
brew install node
````

If you don't have homebrew installed you can do so with the following command:

````bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)" 
````

Once Node.js and npm are installed, run the following commands:

#### Step 7: Deploy Opinionator to Heroku ####

Now that you have all the prerequisites installed, you need to deploy the **opinionator** application to Heroku.

````bash
cd ../src/opinionator
npm install
heroku apps:create [choose_an_appname]
heroku config:set DATABASE_URL=<your heroku connect database connection>
heroku config:set NODE_ENV=<test or development>
git push heroku master
````


