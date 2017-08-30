<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "status_absen".
 *
 * @property integer $id
 * @property string $nama
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property AbsenMahasiswa[] $absenMahasiswas
 * @property Presensi[] $presensis
 * @property Presensi[] $presensis0
 * @property Presensi[] $presensis1
 * @property Presensi[] $presensis2
 * @property Presensi[] $presensis3
 * @property Presensi[] $presensis4
 * @property Presensi[] $presensis5
 * @property Presensi[] $presensis6
 * @property Presensi[] $presensis7
 * @property Presensi[] $presensis8
 * @property Presensi[] $presensis9
 * @property Presensi[] $presensis10
 * @property Presensi[] $presensis11
 * @property Presensi[] $presensis12
 */
class StatusAbsen extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'status_absen';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['nama'], 'string', 'max' => 20],
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
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbsenMahasiswas()
    {
        return $this->hasMany(AbsenMahasiswa::className(), ['status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan2' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis0()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan3' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis1()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan4' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis2()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan5' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis3()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan6' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis4()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan7' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis5()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan8' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis6()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan9' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis7()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan10' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis8()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan11' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis9()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan12' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis10()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan13' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis11()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan14' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis12()
    {
        return $this->hasMany(Presensi::className(), ['pertemuan1' => 'id']);
    }
}
