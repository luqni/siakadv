<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "matakuliah".
 *
 * @property integer $id
 * @property string $kode
 * @property string $nama
 * @property integer $sks
 * @property string $kodemk_syarat
 * @property string $deskripsi
 * @property integer $dosen_pengampu
 * @property string $capaian_belajar
 * @property integer $kategori_id
 * @property string $abbr
 * @property integer $tm
 * @property integer $prk
 * @property integer $lap
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Kelas[] $kelas
 * @property KurikulumMatakuliah[] $kurikulumMatakuliahs
 * @property Dosen $dosenPengampu
 * @property KategoriMatakuliah $kategori
 * @property PenilaianKelas[] $penilaianKelas
 * @property RencanaStudi[] $rencanaStudis
 * @property Transkrip[] $transkrips
 */
class Matakuliah extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'matakuliah';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sks', 'dosen_pengampu', 'kategori_id', 'tm', 'prk', 'lap', 'created_by', 'updated_by'], 'integer'],
            [['deskripsi', 'capaian_belajar'], 'string'],
            [['abbr'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['kode'], 'string', 'max' => 10],
            [['nama'], 'string', 'max' => 100],
            [['kodemk_syarat'], 'string', 'max' => 20],
            [['abbr'], 'string', 'max' => 4],
            [['kode'], 'unique'],
            [['dosen_pengampu'], 'exist', 'skipOnError' => true, 'targetClass' => Dosen::className(), 'targetAttribute' => ['dosen_pengampu' => 'id']],
            [['kategori_id'], 'exist', 'skipOnError' => true, 'targetClass' => KategoriMatakuliah::className(), 'targetAttribute' => ['kategori_id' => 'id']],
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
            'nama' => 'Nama',
            'sks' => 'Sks',
            'kodemk_syarat' => 'Kodemk Syarat',
            'deskripsi' => 'Deskripsi',
            'dosen_pengampu' => 'Dosen Pengampu',
            'capaian_belajar' => 'Capaian Belajar',
            'kategori_id' => 'Kategori ID',
            'abbr' => 'Abbr',
            'tm' => 'Tm',
            'prk' => 'Prk',
            'lap' => 'Lap',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas()
    {
        return $this->hasMany(Kelas::className(), ['mk_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKurikulumMatakuliahs()
    {
        return $this->hasMany(KurikulumMatakuliah::className(), ['matkul_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDosenPengampu()
    {
        return $this->hasOne(Dosen::className(), ['id' => 'dosen_pengampu']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKategori()
    {
        return $this->hasOne(KategoriMatakuliah::className(), ['id' => 'kategori_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPenilaianKelas()
    {
        return $this->hasMany(PenilaianKelas::className(), ['matakuliah_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRencanaStudis()
    {
        return $this->hasMany(RencanaStudi::className(), ['matakuliah_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTranskrips()
    {
        return $this->hasMany(Transkrip::className(), ['mk_id' => 'id']);
    }
}
