<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "jamke".
 *
 * @property integer $id
 * @property string $kode
 * @property string $mulai
 * @property string $akhir
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property BimbinganPa[] $bimbinganPas
 * @property BimbinganPa[] $bimbinganPas0
 * @property Kelas[] $kelas
 * @property Kelas[] $kelas0
 */
class Jamke extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jamke';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mulai', 'akhir', 'created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['kode'], 'string', 'max' => 5],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'kode' => 'Kode',
            'mulai' => 'Mulai',
            'akhir' => 'Akhir',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbinganPas()
    {
        return $this->hasMany(BimbinganPa::className(), ['jamke_mulai' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbinganPas0()
    {
        return $this->hasMany(BimbinganPa::className(), ['jamke_akhir' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas()
    {
        return $this->hasMany(Kelas::className(), ['jamke_mulai' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas0()
    {
        return $this->hasMany(Kelas::className(), ['jamke_akhir' => 'id']);
    }
}
