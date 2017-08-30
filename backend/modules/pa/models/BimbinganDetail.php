<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "bimbingan_detail".
 *
 * @property integer $id
 * @property integer $bimbingan_id
 * @property string $konsultasi
 * @property string $tanggapan
 * @property integer $jenis_id
 *
 * @property BimbinganPa $bimbingan
 * @property JenisBimbingan $jenis
 */
class BimbinganDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bimbingan_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bimbingan_id', 'jenis_id'], 'integer'],
            [['konsultasi', 'tanggapan'], 'string'],
            [['bimbingan_id'], 'exist', 'skipOnError' => true, 'targetClass' => BimbinganPa::className(), 'targetAttribute' => ['bimbingan_id' => 'id']],
            [['jenis_id'], 'exist', 'skipOnError' => true, 'targetClass' => JenisBimbingan::className(), 'targetAttribute' => ['jenis_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'bimbingan_id' => 'bimbingan_id',
            'konsultasi' => 'Masalah yang dibicarakan',
            'tanggapan' => 'Saran Dosen',
            'kategoriname' => 'Kategori',
            'jenis_id' => 'Kategori',
            'jenisBimbingan.nama' => 'Kategori',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbingan()
    {
        return $this->hasOne(BimbinganPa::className(), ['id' => 'bimbingan_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJenisBimbingan()
    {
        return $this->hasOne(JenisBimbingan::className(), ['id' => 'jenis_id']);
    }
}
