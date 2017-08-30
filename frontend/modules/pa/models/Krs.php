<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "krs".
 *
 * @property integer $id
 * @property string $nim
 * @property integer $jatah_sks
 * @property integer $sks_diambil
 * @property string $semester
 * @property string $tgl_buat
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Mahasiswa $nim0
 * @property KrsDetail[] $krsDetails
 */
class Krs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'krs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['jatah_sks', 'sks_diambil', 'created_by', 'updated_by'], 'integer'],
            [['tgl_buat', 'created_at', 'updated_at'], 'safe'],
            [['nim'], 'string', 'max' => 10],
            [['semester'], 'string', 'max' => 5],
            [['nim'], 'exist', 'skipOnError' => true, 'targetClass' => Mahasiswa::className(), 'targetAttribute' => ['nim' => 'nim']],
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
            'jatah_sks' => 'Jatah Sks',
            'sks_diambil' => 'Sks Diambil',
            'semester' => 'Semester',
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
    public function getNim0()
    {
        return $this->hasOne(Mahasiswa::className(), ['nim' => 'nim']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKrsDetails()
    {
        return $this->hasMany(KrsDetail::className(), ['krs_id' => 'id']);
    }
}
