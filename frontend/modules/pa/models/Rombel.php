<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "rombel".
 *
 * @property string $kode
 * @property integer $dosenpa_id
 * @property string $nama
 * @property integer $prodi_id
 * @property integer $ta_id
 * @property integer $paket_kelas_id
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Mahasiswa[] $mahasiswas
 * @property Dosen $dosenpa
 * @property PaketKelas $paketKelas
 * @property Prodi $prodi
 * @property TahunAkademik $ta
 */
class Rombel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rombel';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['kode'], 'required'],
            [['dosenpa_id', 'prodi_id', 'ta_id', 'paket_kelas_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['kode'], 'string', 'max' => 6],
            [['nama'], 'string', 'max' => 30],
            [['dosenpa_id'], 'exist', 'skipOnError' => true, 'targetClass' => Dosen::className(), 'targetAttribute' => ['dosenpa_id' => 'id']],
            [['paket_kelas_id'], 'exist', 'skipOnError' => true, 'targetClass' => PaketKelas::className(), 'targetAttribute' => ['paket_kelas_id' => 'id']],
            [['prodi_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['prodi_id' => 'id']],
            [['ta_id'], 'exist', 'skipOnError' => true, 'targetClass' => TahunAkademik::className(), 'targetAttribute' => ['ta_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'kode' => 'Kode',
            'dosenpa_id' => 'Dosenpa ID',
            'nama' => 'Nama',
            'prodi_id' => 'Prodi ID',
            'ta_id' => 'Ta ID',
            'paket_kelas_id' => 'Paket Kelas ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMahasiswas()
    {
        return $this->hasMany(Mahasiswa::className(), ['kode_rombel' => 'kode']);
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
    public function getPaketKelas()
    {
        return $this->hasOne(PaketKelas::className(), ['id' => 'paket_kelas_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProdi()
    {
        return $this->hasOne(Prodi::className(), ['id' => 'prodi_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTa()
    {
        return $this->hasOne(TahunAkademik::className(), ['id' => 'ta_id']);
    }
}
