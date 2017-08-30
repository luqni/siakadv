<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "ruang".
 *
 * @property integer $id
 * @property integer $gedung_id
 * @property string $kode
 * @property integer $kapasitas
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property BimbinganPa[] $bimbinganPas
 * @property JadwalPraktikum[] $jadwalPraktikums
 * @property Kelas[] $kelas
 * @property PmbUjian[] $pmbUjians
 * @property Prasarana $gedung
 */
class Ruang extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ruang';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['gedung_id', 'kapasitas', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['kode'], 'string', 'max' => 10],
            [['kode'], 'unique'],
            [['gedung_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prasarana::className(), 'targetAttribute' => ['gedung_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'gedung_id' => 'Gedung ID',
            'kode' => 'Kode',
            'kapasitas' => 'Kapasitas',
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
        return $this->hasMany(BimbinganPa::className(), ['ruang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJadwalPraktikums()
    {
        return $this->hasMany(JadwalPraktikum::className(), ['ruang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas()
    {
        return $this->hasMany(Kelas::className(), ['ruang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPmbUjians()
    {
        return $this->hasMany(PmbUjian::className(), ['idruang' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGedung()
    {
        return $this->hasOne(Prasarana::className(), ['id' => 'gedung_id']);
    }
}
