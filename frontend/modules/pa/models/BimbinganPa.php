<?php

namespace frontend\modules\pa\models;

use Yii;
use yii\db\Expression;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
/**
 * This is the model class for table "bimbingan_pa".
 *
 * @property integer $id
 * @property string $tanggal
 * @property integer $dosenpa_id
 * @property integer $mhsid
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property string $semester
 * @property integer $ruang_id
 * @property integer $jamke_mulai
 * @property integer $jamke_akhir
 * @property integer $waktu_bimbingan
 *
 * @property BimbinganDetail[] $bimbinganDetails
 * @property Jamke $jamkeMulai
 * @property Jamke $jamkeAkhir
 * @property Mahasiswa $mhs
 * @property Ruang $ruang
 * @property WaktuPa $waktuBimbingan 
 * @property DetailBimbinganpa[] $detailBimbinganpas
 */
class BimbinganPa extends \yii\db\ActiveRecord
{
    //use \mdm\widgets\RelationTrait; 
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
            'class' => TimestampBehavior::className(),
            'createdAtAttribute' => 'created_at',
            'updatedAtAttribute' => 'updated_at',
            'value' => new Expression('NOW()'),
            ],

             [
            'class' => BlameableBehavior::className(),
            'createdByAttribute' => 'created_by',
            'updatedByAttribute' => 'updated_by',
            ],
            ];
    }

    public static function tableName()
    {
        return 'bimbingan_pa';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tanggal', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['dosenpa_id', 'mhsid', 'ruang_id', 'jamke_mulai', 'jamke_akhir', 'waktu_bimbingan'], 'integer'],
            [['semester'], 'required'],
            [['semester'], 'string', 'max' => 5],
            [['jamke_mulai'], 'exist', 'skipOnError' => true, 'targetClass' => Jamke::className(), 'targetAttribute' => ['jamke_mulai' => 'id']],
            [['jamke_akhir'], 'exist', 'skipOnError' => true, 'targetClass' => Jamke::className(), 'targetAttribute' => ['jamke_akhir' => 'id']],
            [['mhsid'], 'exist', 'skipOnError' => true, 'targetClass' => Mahasiswa::className(), 'targetAttribute' => ['mhsid' => 'mhsid']],
            [['ruang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ruang::className(), 'targetAttribute' => ['ruang_id' => 'id']],
            [['waktu_bimbingan'], 'exist', 'skipOnError' => true, 'targetClass' => WaktuPa::className(), 'targetAttribute' => ['waktu_bimbingan' => 'id']], 
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tanggal' => 'Date',
            'tanggal' => 'Tanggal',
            'dosenpa_id' => 'Dosen Pembimbing ',
            'dosen.nama' => 'Dosen Pembimbing ',
            'mhsid' => 'Mahasiswa',
            'mhs.camaba.nama' => 'Mahasiswa',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'semester' => 'Semester',
            'ruang_id' => 'Ruangan',
            'jamke_mulai' => 'Jam Mulai Bimbingan',
            'jamke_akhir' => 'Jam Akhir Bimbingan',
            'waktu_bimbingan' => 'Waktu Bimbingan',
            'waktuBimbingan.nama' => 'Waktu Bimbingan',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbinganDetails()
    {
        return $this->hasMany(BimbinganDetail::className(), ['bimbingan_id' => 'id']);
    }

    public function setBimbinganDetails()
    {
        $this->loadRelatted('bimbinganDetails', $value);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJamkeMulai()
    {
        return $this->hasOne(Jamke::className(), ['id' => 'jamke_mulai']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJamkeAkhir()
    {
        return $this->hasOne(Jamke::className(), ['id' => 'jamke_akhir']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMhs()
    {
        return $this->hasOne(Mahasiswa::className(), ['mhsid' => 'mhsid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDosen()
    {
        return $this->hasOne(Dosen::className(), ['id' => 'dosenpa_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRuang()
    {
        return $this->hasOne(Ruang::className(), ['id' => 'ruang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWaktuBimbingan()
    {
        return $this->hasOne(WaktuPa::className(), ['id' => 'waktu_bimbingan']);
    }

    // /**
    //  * @return \yii\db\ActiveQuery
    //  */
    // public function getJenisBimbingan()
    // {
    //     return $this->hasOne(JenisBimbingan::className(), ['id' => 'bimbinganDetails.jenis_id']);
    // }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetailBimbinganpas()
    {
        return $this->hasMany(DetailBimbinganpa::className(), ['bimbinganpa_id' => 'id']);
    }


}
