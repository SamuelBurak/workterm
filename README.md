# Work Term Experience

This was a project that was completed for a work term. The work term was required to complete schooling at Nova Scotia Community College. The project uses SilverStripe, which is a content management system similar to WordPress or Drupal. The website design was taken from an Adobe XD file that was not created by me. I also did not complete the worksite's client's actual site. The project was all done locally. The design was followed as carefully as possible. Any and all design based issues that you may see were out of my control for this particular project. Lorem Ipsum text and placeholder images were used on my end during development to anonymise the site. Thank you for taking the time to look at this. It was fun learning how to use a content management system that I had not heard of prior to my work term.

### Local Dev Setup

This repo uses composer as a base configuration system so for easy configuration install composer http://getcomposer.org/ then run the following command from the directory you have exported to:

```
composer install
```

#### Deployment to staging or live

On the live server or staging server you probably will not want the latest versions of the modules in which case you should use the composer.lock that is contained in the repository by using the following instead of composer update. This will pull the versions of the modules that the site was tested against. It's important to include the `--no-dev` flag on any public environment as this does not include tools only needed for development such as Behat, and PHPUnit.

```
composer install --no-dev
```

#### Setup for all locations

You will need to create a folder called `assets` in the public folder, this folder must be writable by Apache. As well on some webservers you may need to create a `silverstripe-cache` folder (also needs to be writable by Apache) due to how some servers are configured.

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
