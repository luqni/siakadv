<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "khs".
 *
 * @property integer $id
 * @property string $nim
 * @property string $semester
 * @property integer $jumlah_sks
 * @property double $ips
 * @property string $tgl_buat
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property KhsDetail[] $khsDetails
 */
class Khs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'khs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['jumlah_sks', 'created_by', 'updated_by'], 'integer'],
            [['ips'], 'number'],
            [['tgl_buat', 'created_at', 'updated_at'], 'safe'],
            [['nim'], 'string', 'max' => 10],
            [['semester'], 'string', 'max' => 5],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nim' => 'Nim',
            'semester' => 'Semester',
            'jumlah_sks' => 'Jumlah Sks',
            'ips' => 'Ips',
            'tgl_buat' => 'Tgl Buat',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKhsDetails()
    {
        return $this->hasMany(KhsDetail::className(), ['khs_id' => 'id']);
    }
}
