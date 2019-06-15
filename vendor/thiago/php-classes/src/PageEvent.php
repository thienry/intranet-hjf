<?php

namespace Thiago;

class PageEvent extends Page {
    public function __construct($opts = array(), $tpl_dir = "/views/file-events/event/") {
        parent::__construct($opts, $tpl_dir);
    }
    
}
