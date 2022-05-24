<?php
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\View\Requirements;

/**
 * Class \PageController
 *
 * @property \Page dataRecord
 * @method \Page data()
 * @mixin \Page dataRecord
 */
class PageController extends ContentController
{
    protected function init()
    {
        parent::init();
        
        
        if (self::has_curr() && self::curr() instanceof PageController) {
            Requirements::block('silverstripe/admin: thirdparty/jquery/jquery.js');
            Requirements::javascript('silverstripe/admin: thirdparty/jquery/jquery.min.js');
            Requirements::themedJavascript('javascript/Page.js');
        }
    }
}
