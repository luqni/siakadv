<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "tahun_akademik".
 *
 * @property integer $id
 * @property string $awal
 * @property string $akhir
 * @property string $nama
 * @property integer $aktif
 *
 * @property CamabaProdi[] $camabaProdis
 * @property JadwalPraktikum[] $jadwalPraktikums
 * @property KalendarAkademik[] $kalendarAkademiks
 * @property Kelas[] $kelas
 * @property PaketKelas[] $paketKelas
 * @property PmbNilaiKelulusan[] $pmbNilaiKelulusans
 * @property PmbUjian[] $pmbUjians
 * @property Rombel[] $rombels
 * @property Tarif[] $tarifs
 */
class TahunAkademik extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tahun_akademik';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['awal', 'akhir'], 'safe'],
            [['aktif'], 'integer'],
            [['nama'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'awal' => 'Awal',
            'akhir' => 'Akhir',
            'nama' => 'Nama',
            'aktif' => 'Aktif',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCamabaProdis()
    {
        return $this->hasMany(CamabaProdi::className(), ['idtahun_akademik' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJadwalPraktikums()
    {
        return $this->hasMany(JadwalPraktikum::className(), ['ta_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKalendarAkademiks()
    {
        return $this->hasMany(KalendarAkademik::className(), ['ta_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas()
    {
        return $this->hasMany(Kelas::className(), ['ta_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPaketKelas()
    {
        return $this->hasMany(PaketKelas::className(), ['ta_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPmbNilaiKelulusans()
    {
        return $this->hasMany(PmbNilaiKelulusan::className(), ['thn_akademik_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPmbUjians()
    {
        return $this->hasMany(PmbUjian::className(), ['idtahunajaran' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRombels()
    {
        return $this->hasMany(Rombel::className(), ['ta_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTarifs()
    {
        return $this->hasMany(Tarif::className(), ['idta' => 'id']);
    }
}
