<?php

namespace Starter;

use SilverStripers\ElementalSearch\Extensions\SiteTreeDocumentGenerator;

/**
 * Class \Starter\RemoveExtension
 *
 * @property \Starter\RemoveExtension $owner
 */
class RemoveExtension extends SiteTreeDocumentGenerator
{
    /**
     * Prevent make_document_for() being run after publish.
     *
     * @return void
     */
    public function onAfterPublish()
    {
    }
}
