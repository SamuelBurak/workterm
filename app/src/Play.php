<?php

namespace Starter;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use Page;

/**
 * Class \Starter\Play
 *
 * @property string $SubheaderContent
 * @property string $Image1Title
 * @property string $Image1Description
 * @property string $Image1Alt
 * @property string $MiddleTitle
 * @property string $MiddleContent
 * @property string $Quote
 * @property string $Image2Title
 * @property string $Image2Alt
 * @property string $Image2Description
 * @property int $Image1ID
 * @property int $Image2ID
 * @method \SilverStripe\Assets\Image Image1()
 * @method \SilverStripe\Assets\Image Image2()
 */
class Play extends Page
{
    private static $table_name = 'Play';

    private static $db = [
        'SubheaderContent' => 'Text',
        'Image1Title' => 'Varchar',
        'Image1Description' => 'Text',
        'Image1Alt' => 'Varchar',
        'MiddleTitle' => 'Varchar',
        'MiddleContent' => 'Text',
        'Quote' => 'Text',
        'Image2Title' => 'Varchar',
        'Image2Alt' => 'Varchar',
        'Image2Description' => 'Text',
    ];

    private static $has_one = [
        'Image1' => Image::class,
        'Image2' => Image::class,
    ];

    private static $owns = [
        'Image1',
        'Image2',
    ];

    /**
     * @inheritdoc
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('Image1', 'Image below header content (320x320px)')->setFolderName('play-photos'));
        $fields->addFieldToTab('Root.Attachments', TextField::create('Image1Alt', 'Image Alt Text')->setCustomValidationMessage('Please enter an alt text for the image'));
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('Image2', 'Image at the bottom of the page (320x320px)')->setFolderName('play-photos'));
        $fields->addFieldToTab('Root.Attachments', TextField::create('Image2Alt', 'Image Alt Text')->setCustomValidationMessage('Please enter an alt text for the image'));

        $fields->addFieldToTab('Root.Main', TextField::create('SubheaderContent', 'Content below header'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('Image1Title', 'First image title'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('Image1Description', 'First image description'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('MiddleTitle', 'Middle block title'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('MiddleContent', 'Middle block content'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('Quote', 'Quote'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('Image2Title', 'Bottom image title'), 'Metadata');
        $fields->addFieldToTab('Root.Main', TextField::create('Image2Description', 'Bottom image description'), 'Metadata');

        // remove content and subheader
        $fields->removeByName('Content');
        $fields->removeByName('Subheader');

        return $fields;
    }
}
