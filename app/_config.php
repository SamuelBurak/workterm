<?php

use SilverLeague\IDEAnnotator\DataObjectAnnotator;
use SilverStripe\Control\Director;
use SilverStripe\Core\Config\Config;
use SilverStripe\Security\Member;
use SilverStripe\Security\PasswordValidator;

// remove PasswordValidator for SilverStripe 5.0
$validator = PasswordValidator::create();
// Settings are registered via Injector configuration - see passwords.yml in framework
Member::set_password_validator($validator);


//Enable DataObjectAnnotator for cli or localhost
if (Director::isDev() && (Director::is_cli() || (array_key_exists('HTTP_HOST', $_SERVER) && preg_match('/^localhost((:\d+)?)$/i', $_SERVER['HTTP_HOST'])))) {
    Config::inst()->update(DataObjectAnnotator::class, 'enabled', true);
}
