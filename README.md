Site Name
=================
### Local Dev Setup
This repo uses composer as a base configuration system so for easy configuration install composer http://getcomposer.org/ then run the following command from the directory you have exported to:
```
composer install
```


#### Deployment to staging or live
On the live server or staging server you probably will not want the latest versions of the modules in which case you should use the composer.lock that is contained in the repository by using the following instead of composer update. This will pull the versions of the modules that the site was tested against. It's important to include the ``--no-dev`` flag on any public environment as this does not include tools only needed for development such as Behat, and PHPUnit.
```
composer install --no-dev
```


#### Setup for all locations
You will need to create a folder called ``assets`` in the public folder, this folder must be writable by Apache. As well on some webservers you may need to create a ``silverstripe-cache`` folder (also needs to be writable by Apache) due to how some servers are configured.


### Configuration
In the root of your checked out repo you must create an `.env` file:
```bash
#For development sites use the bellow line
SS_ENVIRONMENT_TYPE="dev"

#For Live, or staging site use the bellow instead
#SS_ENVIRONMENT_TYPE="live"


#Database Configuration
SS_DATABASE_CLASS="MySQLPDODatabase" #Optional, will default to MySQLi for connecting but PDO is faster and more secure
SS_DATABASE_NAME="ss_mysite"
SS_DATABASE_SERVER="dbserver"
SS_DATABASE_USERNAME="dbuser"
SS_DATABASE_PASSWORD="dbpassword"
```


### About the branches
* ``rev-##`` - These branches represent the current dev cycle and are where all "in dev" code goes. This is code that is not yet ready for the staging or live site and should not be merged to ``master`` until the development cycle ends. Code from these branches should not be merged to any branch other than ``master``. These branches are only merged into ``master`` when the revision's development cycle completes and before it gets moved to the staging site. These branches are also normally not protected so rebasing and force pushing is allowed. Before this branch is merged to ``master`` it should always be rebased off of ``master``.

* [master](https://github.com/webbuilders-group/silverstripe-site-template) - The master branch is where all completed code gets moved to, this is normally done at the completion of a revision. As well any hot fixes done to the production site should be also done and committed on this branch. This branch is protected so rebasing and force pushing is not allowed.

* [staging](https://github.com/webbuilders-group/silverstripe-site-template/tree/staging) - The staging branch is for all code ready to the staging site or is already on the staging site but is not yet ready for the live site. No code changes should be done on this branch without being first made and tested on ``master`` then merged to ``staging``. When ready to go live this branch should be merged to the ``production`` branch. This branch is protected so rebasing and force pushing is not allowed. When merging into this branch the originating branch must be up to date with staging and the CI tests must have passed.

* [production](https://github.com/webbuilders-group/silverstripe-site-template/tree/production) - The production branch is for all code ready for the live site or already on live site. No code changes should be done on this branch without being made and tested on ``master``, from there they should be merged to ``staging`` then to ``production``. This branch is protected so rebasing and force pushing is not allowed. When merging into this branch the originating branch must be up to date with production and the CI tests must have passed.
