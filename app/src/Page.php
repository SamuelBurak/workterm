<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TextField;

/**
 * Class \Page
 *
 * @property string $SemiTitle
 * @property string $Header
 * @property string $Subheader
 * @property string $BannerAlt
 * @property int $BannerID
 * @method \SilverStripe\Assets\Image Banner()
 */
class Page extends SiteTree
{
    private static $db = [
        'SemiTitle' => 'Varchar(45)',
        'Header' => 'Varchar',
        'Subheader' => 'Varchar',
        'BannerAlt' => 'Varchar',
    ];

    private static $has_one = [
        'Banner' => Image::class,
    ];

    private static $owns = [
        'Banner'
    ];

    /**
     * @inheritdoc
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Main', TextField::create('SemiTitle', 'Title inside semicircle')->setMaxLength(45), 'Content');
        $fields->addFieldToTab('Root.Main', TextField::create('Header', 'Header'), 'Content');
        $fields->addFieldToTab('Root.Main', TextField::create('Subheader', 'Subheader'), 'Content');
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('Banner', 'Banner'));
        $photo->setFolderName('banner-photos');

        $fields->addFieldToTab('Root.Attachments', TextField::create('BannerAlt', 'Banner Alt Text')->setCustomValidationMessage('Please enter an alt text for the banner image'));

        return $fields;
    }
}
