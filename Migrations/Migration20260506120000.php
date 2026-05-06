<?php declare(strict_types=1);

namespace Plugin\size_tables\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

class Migration20260506120000 extends Migration implements IMigration
{
    public function up(): void
    {
        $this->execute(
            'ALTER TABLE `size_tables_data`
             ADD COLUMN `kWarengruppe` INT NOT NULL DEFAULT 0
             AFTER `geschlecht`'
        );
    }

    public function down(): void
    {
        $this->execute('ALTER TABLE `size_tables_data` DROP COLUMN `kWarengruppe`');
    }
}
