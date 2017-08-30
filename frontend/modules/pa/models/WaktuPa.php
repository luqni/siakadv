<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "waktu_pa".
 *
 * @property integer $id
 * @property string $nama
 *
 * @property BimbinganPa[] $bimbinganPas
 */
class WaktuPa extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'waktu_pa';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama'], 'string', 'max' => 40],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nama' => 'Nama',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbinganPas()
    {
        return $this->hasMany(BimbinganPa::className(), ['waktu_bimbingan' => 'id']);
    }
}
