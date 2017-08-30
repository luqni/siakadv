<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "jenis_bimbingan".
 *
 * @property integer $id
 * @property string $nama
 *
 * @property BimbinganDetail[] $bimbinganDetails
 */
class JenisBimbingan extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jenis_bimbingan';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama'], 'string', 'max' => 30],
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
    public function getBimbinganDetails()
    {
        return $this->hasMany(BimbinganDetail::className(), ['jenis_id' => 'id']);
    }
}
