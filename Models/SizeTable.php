<?php declare(strict_types=1);

namespace Plugin\size_tables\Models;

use Exception;
use JTL\Model\DataAttribute;
use JTL\Model\DataModel;
use JTL\Model\InputConfig;
use JTL\Plugin\Admin\InputType;

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
        $id->getInputConfig()->setHidden(true);

        $typ = DataAttribute::create('typ', 'varchar', null, false);
        $typConfig = new InputConfig();
        $typConfig->setInputType(InputType::SELECT);
        $typConfig->setAllowedValues(['bindung' => 'Bindung', 'boot' => 'Boot']);
        $typ->setInputConfig($typConfig);

        $geschlecht = DataAttribute::create('geschlecht', 'varchar', null, false);
        $geschlechtConfig = new InputConfig();
        $geschlechtConfig->setInputType(InputType::SELECT);
        $geschlechtConfig->setAllowedValues(['herren' => 'Herren', 'damen' => 'Damen', 'kinder' => 'Kinder']);
        $geschlecht->setInputConfig($geschlechtConfig);

        $inhalt = DataAttribute::create('inhalt', 'text', null, false);
        $inhalt->getInputConfig()->setInputType(InputType::TEXTAREA);

        $attributes = [
            'id'         => $id,
            'name'       => DataAttribute::create('name', 'varchar', null, false),
            'hersteller' => DataAttribute::create('hersteller', 'varchar', null, false),
            'typ'        => $typ,
            'geschlecht' => $geschlecht,
            'inhalt'     => $inhalt,
        ];

        return $attributes;
    }
}
