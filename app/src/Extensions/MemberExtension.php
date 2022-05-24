<?php
namespace SiteTemplate\Extensions;

use SilverStripe\ORM\DataExtension;
use SilverStripe\SessionManager\Services\GarbageCollectionService;

/**
 * Class \SiteTemplate\Extensions\MemberExtension
 *
 * @property \SilverStripe\Security\Member|\SiteTemplate\Extensions\MemberExtension $owner
 */
class MemberExtension extends DataExtension
{
    /**
     * Runs the Garbage Collection for silverstripe/session-manager on login
     * @see GarbageCollectionService::collect()
     */
    public function afterMemberLoggedIn()
    {
        GarbageCollectionService::singleton()->collect();
    }
}
