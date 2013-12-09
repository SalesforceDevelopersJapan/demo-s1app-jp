# Dreamforce 13 Developer Keynote - Salesforce1 App Demo Setup #

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
cd assets
chmod 755 *.sh
. importschema.sh
````

Your objects, layouts, application, pages and quick action should now exist in your org.

#### Step 5: Import the data into your Developer Edition organization ####

````bash
cd demo-df13-devkeynote-s1app
cd assets
. importdata.sh
````

#### Step 6: Enable Chatter and Publisher Actions in your organization ####

In this demo we will use Chatter and Publisher Actions. Consequently, we need to enable this functionality within the Developer Edition (DE) org.

1. Log into Salesforce: [https://login.salesforce.com/](https://login.salesforce.com) using the same Developer Organization you used during the [setup]().

2. Choose **Setup** | **App Setup** | **Customize** | **Chatter** | **Settings**.

3. Click **Edit** then **Enable**.

4. Under **Publisher Actions** click **Enable Publisher Actions** then click **Save**.

5. Choose **Setup** | **App Setup** | **Customize** | **Chatter** | **Feed Tracking**.

6. Select **Opinion**, **Opinion Question**, and **Opinion Answer** in turn and **Enable Feed Tracking**. Be sure to click **Save**.

You have now enabled Chatter and Publisher Actions for your org and enabled Chatter feeds on your custom objects.

You are now ready to [start the demo](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md).

