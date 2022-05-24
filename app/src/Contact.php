<?php

namespace Starter;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use Page;

/**
 * Class \starter\Contact
 *
 * @property string $Prompt
 * @property string $PhotoAlt
 * @property int $PhotoID
 * @method \SilverStripe\Assets\Image Photo()
 */
class Contact extends Page
{
    private static $table_name = 'Contact';

    private static $db = [
        'Prompt' => 'Varchar(100)',
        'PhotoAlt' => 'Varchar',
    ];

    private static $has_one = [
        'Photo' => Image::class,
    ];

    private static $owns = [
        'Photo'
    ];

    /**
     * @inheritdoc
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('Photo', 'Photo'));
        $fields->addFieldToTab('Root.Attachments', TextField::create('PhotoAlt', 'Photo Alt')->setCustomValidationMessage('Please enter an alt text for the photo'));
        $photo->setFolderName('contact-photo');

        $fields->addFieldToTab('Root.Main', TextField::create('Prompt', 'Prompt'), 'Content');

        return $fields;
    }
}
