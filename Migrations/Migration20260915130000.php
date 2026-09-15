<?php declare(strict_types=1);

namespace Plugin\size_tables\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

/**
 * Ab 1.3.6 sind die drei Aktiv-Schalter wieder Checkboxen. JTL speichert dafuer 'on' (angehakt)
 * bzw. '' (abgewaehlt). Die Selectboxen aus 1.2.x bis 1.3.5 haben 'Y'/'N' gespeichert.
 */
class Migration20260915130000 extends Migration implements IMigration
{
    private const SETTINGS = "('size_tables_active', 'size_tables_mobile_active', 'size_tables_name_active')";

    public function up(): void
    {
        $this->execute(
            "UPDATE tplugineinstellungen SET cWert = 'on' WHERE cName IN " . self::SETTINGS . " AND cWert = 'Y'"
        );
        $this->execute(
            "UPDATE tplugineinstellungen SET cWert = '' WHERE cName IN " . self::SETTINGS . " AND cWert = 'N'"
        );
    }

    public function down(): void
    {
        $this->execute(
            "UPDATE tplugineinstellungen SET cWert = 'Y' WHERE cName IN " . self::SETTINGS . " AND cWert = 'on'"
        );
        $this->execute(
            "UPDATE tplugineinstellungen SET cWert = 'N' WHERE cName IN " . self::SETTINGS . " AND cWert = ''"
        );
    }
}
