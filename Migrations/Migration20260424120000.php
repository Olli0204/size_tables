<?php declare(strict_types=1);

namespace Plugin\size_tables\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

class Migration20260424120000 extends Migration implements IMigration
{
    public function up(): void
    {
        $this->execute(
            'CREATE TABLE IF NOT EXISTS `size_tables_data` (
                `id`          INT          NOT NULL AUTO_INCREMENT,
                `name`        VARCHAR(255) NOT NULL,
                `hersteller`  VARCHAR(255) NOT NULL,
                `typ`         VARCHAR(50)  NOT NULL COMMENT "schuhe oder bindung",
                `geschlecht`  VARCHAR(50)  NOT NULL DEFAULT "unisex" COMMENT "unisex, herren oder damen",
                `inhalt`      TEXT         NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
        );
    }

    public function down(): void
    {
        if ($this->doDeleteData()) {
            $this->execute('DROP TABLE IF EXISTS `size_tables_data`');
        }
    }
}
