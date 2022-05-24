<?php

namespace Starter\Extensions;

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;

/**
 * Class \Starter\SiteInfo
 *
 * @property \SilverStripe\SiteConfig\SiteConfig|\Starter\Extensions\SiteInfo $owner
 * @property string $Location
 * @property string $Street
 * @property string $Postal
 * @property string $Phone
 * @property string $Prompt
 * @property string $Email
 * @property string $TollFree
 */
class SiteInfo extends DataExtension
{
    private static $db = [
        'Location' => 'Varchar',
        'Street' => 'Varchar',
        'Postal' => 'Varchar',
        'Phone' => 'Varchar',
        'Prompt' => 'Varchar',
        'Email' => 'Varchar',
        'TollFree' => 'Varchar',
    ];

    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldsToTab('Root.Social', [
            TextField::create('LinkedInLink', 'LinkedIn'),
            TextField::create('TwitterLink', 'Twitter'),
            TextField::create('FacebookLink', 'Facebook'),
        ]);
        $fields->addFieldsToTab('Root.Location', [
            TextField::create('Location', 'Location (example: main office)'),
            TextField::create('Street', 'Street Address (example: 123 main street)'),
            TextField::create('Postal', 'Postal Code (example: Truro, NS B2N 0A4)'),
            TextField::create('Phone', 'Phone Number'),
        ]);
        $fields->addFieldsToTab('Root.Inquiries', [
            TextField::create('Prompt', 'Prompt (example: general inquiries, for all other business)'),
            TextField::create('Email', 'Email'),
            TextField::create('TollFree', 'Toll Free'),
        ]);
    }
}
