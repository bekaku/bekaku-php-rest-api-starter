<?php

namespace application\model;

use application\core\BaseModel;
class Role extends BaseModel
{
    public static $tableName = 'role';
    public function __construct(\stdClass $jsonData = null, $uid = null, $isUpdate = false)
    { 
        /* init data type for field*/
        $this->setTableField(array(
            'id' => self::TYPE_AUTO_INCREMENT,
            'description' => self::TYPE_STRING,
            'name' => self::TYPE_STRING,
            'status' => self::TYPE_BOOLEAN,
        )); 
 
        /* init data type for field use in update mode*/
        $this->setTableFieldForEdit(array(
            'description' => self::TYPE_STRING,
            'name' => self::TYPE_STRING,
            'status' => self::TYPE_BOOLEAN,
            'updated_user' => self::TYPE_INTEGER,
            'updated_date' => self::TYPE_DATE_TIME
        ));

        /* init optional field*/
        $this->setTableOptionalField(array(
            //'field_name_option',
        ));

        $this->populate($jsonData, $this, $uid, $isUpdate);
    }

    public static function getTableName()
    {
        return self::$tableName;
    }

}