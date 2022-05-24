<?php

namespace Starter;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;

/**
 * Class \Starter\ShopData
 *
 * @property string $Title
 * @property string $DotName
 * @property string $Content
 * @property string $ImageAlt
 * @property int $ImageID
 * @property int $ShopID
 * @method \SilverStripe\Assets\Image Image()
 * @method \Starter\Shop Shop()
 */
class ShopData extends DataObject
{
    private static $table_name = 'ShopData';

    private static $db = [
        'Title' => 'Varchar',
        'DotName' => 'Varchar',
        'Content' => 'HTMLText',
        'ImageAlt' => 'Varchar',
    ];

    private static $has_one = [
        'Image' => Image::class,
        'Shop' => Shop::class,
    ];

    private static $owns = [
        'Image',
    ];

    /**
     * @inheritdoc
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Image', $photo = UploadField::create('Image', 'Image'));
        $fields->addFieldToTab('Root.Image', TextField::create('ImageAlt', 'Image Alt')->setCustomValidationMessage('Image Alt is required'));
        $photo->setFolderName('shop-grid-images');

        return $fields;
    }
}
