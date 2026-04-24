<?php declare(strict_types=1);
/**
 * dynamic data source for selectbox2 with articles
 *
 * return value of these functions has to be an array of objects
 * where every object should have the members cWert, cName and optional nSort
 *
 * @package jtl_test
 */

return \JTL\Shop::Container()->getDB()->query(
    'SELECT kWarengruppe AS cWert, cName FROM twarengruppe',
    \JTL\DB\ReturnType::ARRAY_OF_OBJECTS
);