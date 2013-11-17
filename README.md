df13-devkeynote-s1
==================

This is the metadata for setting up your developer edition to run the Opinionator app. Please make sure you have installed the Force CLI first.

Installation
Clone this repo in to a new folder. Change to the new folder and then simply run the importschema.sh shell script.

Run
---

``` bash
git clone https://github.com/developerforce/df13-devkeynote-s1.git
cd df13-devkeynote-s1
. importschema.sh

```

You objects, layouts, application, pages and quick action should now exist in your org.

Opinionator Node.js App
-----------------------

``` bash
cd df13kn
npm install
heroku apps:create appname
heroku config:set DATABASE_URL=<your heroku connect database connection>
heroku config:set NODE_ENV=<test or development>
git push heroku master

```

