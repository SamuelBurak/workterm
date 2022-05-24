<?php

namespace Starter;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\TextField;

use Page;

/**
 * Class \Starter\Shop
 *
 * @property string $CircleTitle
 * @property string $CircleSubtitle
 * @property string $Quote
 * @property int $BannerID
 * @property int $BottomImageID
 * @method \SilverStripe\Assets\Image Banner()
 * @method \SilverStripe\Assets\Image BottomImage()
 * @method \SilverStripe\ORM\DataList|\Starter\ShopData[] ShopData()
 */
class Shop extends Page
{
    private static $table_name = 'Shop';

    private static $db = [
        'CircleTitle' => 'Varchar(25)',
        'CircleSubtitle' => 'Varchar',
        'Quote' => 'Varchar',
    ];

    private static $has_one = [
        'Banner' => Image::class,
        'BottomImage' => Image::class,
    ];

    private static $has_many = [
        'ShopData' => ShopData::class,
    ];

    private static $owns = [
        'Banner',
        'BottomImage',
    ];

    /**
     * @inheritdoc
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('Banner', 'Banner')->setFolderName('shop-images'));
        $fields->addFieldToTab('Root.Attachments', $photo = UploadField::create('BottomImage', 'Bottom Image')->setFolderName('shop-images'));

        $fields->addFieldToTab('Root.Main', TextField::create('CircleTitle', 'Circle Title')->setMaxLength(25), 'Content');
        $fields->addFieldToTab('Root.Main', TextField::create('CircleSubtitle', 'Circle Subtitle'), 'Content');

        $fields->removeByName('SemiTitle');
        $fields->removeByName('Subheader');

        $fields->addFieldToTab(
            'Root.GridContents',
            GridField::create(
                'ShopData',
                'Grid Contents',
                $this->ShopData(),
                $config = GridFieldConfig_RecordEditor::create(10)
            )
        );

        $fields->addFieldToTab('Root.Main', TextField::create('Quote', 'Quote'), 'Metadata');

        // remove content
        $fields->removeByName('Content');

        return $fields;
    }
}
