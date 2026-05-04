<?php declare(strict_types=1);

namespace Plugin\size_tables\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

class Migration20260504120000 extends Migration implements IMigration
{
    public function up(): void
    {
        $this->execute(
            "UPDATE tplugineinstellungen
             SET cWert = 'Y'
             WHERE cName IN ('size_tables_active', 'size_tables_mobile_active', 'size_tables_name_active')
               AND cWert = 'on'"
        );
    }

    public function down(): void
    {
        $this->execute(
            "UPDATE tplugineinstellungen
             SET cWert = 'on'
             WHERE cName IN ('size_tables_active', 'size_tables_mobile_active', 'size_tables_name_active')
               AND cWert = 'Y'"
        );
    }
}
