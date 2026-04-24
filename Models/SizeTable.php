<?php declare(strict_types=1);

namespace Plugin\size_tables\Models;

use Exception;
use JTL\Model\DataAttribute;
use JTL\Model\DataModel;

/**
 * @property int    $id
 * @method   int    getId()
 * @method   void   setId(int $value)
 * @property string $name
 * @method   string getName()
 * @method   void   setName(string $value)
 * @property string $hersteller
 * @method   string getHersteller()
 * @method   void   setHersteller(string $value)
 * @property string $typ
 * @method   string getTyp()
 * @method   void   setTyp(string $value)
 * @property string $geschlecht
 * @method   string getGeschlecht()
 * @method   void   setGeschlecht(string $value)
 * @property string $inhalt
 * @method   string getInhalt()
 * @method   void   setInhalt(string $value)
 */
final class SizeTable extends DataModel
{
    public function getTableName(): string
    {
        return 'size_tables_data';
    }

    public function setKeyName($keyName): void
    {
        throw new Exception(__METHOD__ . ': setting of keyname is not supported', self::ERR_DATABASE);
    }

    public function getAttributes(): array
    {
        static $attributes = null;
        if ($attributes !== null) {
            return $attributes;
        }

        $id = DataAttribute::create('id', 'int', null, false, true);
        $id->getInputConfig()->setModifyable(false);

        $attributes = [
            'id'          => $id,
            'name'        => DataAttribute::create('name', 'varchar', null, false),
            'hersteller'  => DataAttribute::create('hersteller', 'varchar', null, false),
            'typ'         => DataAttribute::create('typ', 'varchar', null, false),
            'geschlecht'  => DataAttribute::create('geschlecht', 'varchar', null, false),
            'inhalt'      => DataAttribute::create('inhalt', 'text', null, false),
        ];

        return $attributes;
    }
}
