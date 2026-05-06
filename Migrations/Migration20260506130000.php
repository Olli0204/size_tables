<?php declare(strict_types=1);

namespace Plugin\size_tables\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

class Migration20260506130000 extends Migration implements IMigration
{
    public function up(): void
    {
        $this->execute(
            "ALTER TABLE `size_tables_data`
             MODIFY COLUMN `kWarengruppe` VARCHAR(500) NOT NULL DEFAULT ''"
        );
        // Convert legacy single 0 to empty string (no assignment)
        $this->execute(
            "UPDATE `size_tables_data` SET `kWarengruppe` = '' WHERE `kWarengruppe` = '0'"
        );
    }

    public function down(): void
    {
        $this->execute(
            'ALTER TABLE `size_tables_data`
             MODIFY COLUMN `kWarengruppe` INT NOT NULL DEFAULT 0'
        );
    }
}
