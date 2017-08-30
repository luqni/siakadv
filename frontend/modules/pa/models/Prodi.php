<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "prodi".
 *
 * @property string $visi
 * @property string $misi
 * @property string $alamat
 * @property string $website
 * @property string $telpon
 * @property string $email
 * @property string $nama
 * @property integer $idorg
 * @property string $kode
 * @property integer $parent_orgid
 * @property string $pejabat
 * @property string $nik_pejabat
 * @property string $nama_jabatan
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $id
 * @property string $akreditasi
 * @property string $nosk_banpt
 * @property string $tglsk_banpt
 * @property string $tglakhirsk_banpt
 * @property string $gelar
 * @property integer $jenjang_id
 * @property integer $fakultas_id
 *
 * @property AbsenMahasiswa[] $absenMahasiswas
 * @property Camaba[] $camabas
 * @property Dosen[] $dosens
 * @property Formulir[] $formulirs
 * @property KalendarAkademik[] $kalendarAkademiks
 * @property KelasProdi[] $kelasProdis
 * @property KurikulumMatakuliah[] $kurikulumMatakuliahs
 * @property Mahasiswa[] $mahasiswas
 * @property PeminatanProdi[] $peminatanProdis
 * @property Jenjang $jenjang
 * @property Rombel[] $rombels
 */
class Prodi extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'prodi';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['visi', 'misi'], 'string'],
            [['parent_orgid', 'created_by', 'updated_by', 'jenjang_id', 'fakultas_id'], 'integer'],
            [['created_at', 'updated_at', 'tglsk_banpt', 'tglakhirsk_banpt'], 'safe'],
            [['alamat'], 'string', 'max' => 100],
            [['website', 'email'], 'string', 'max' => 40],
            [['telpon', 'nik_pejabat'], 'string', 'max' => 20],
            [['nama'], 'string', 'max' => 60],
            [['kode'], 'string', 'max' => 10],
            [['pejabat', 'nama_jabatan', 'nosk_banpt'], 'string', 'max' => 30],
            [['akreditasi'], 'string', 'max' => 1],
            [['gelar'], 'string', 'max' => 6],
            [['jenjang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Jenjang::className(), 'targetAttribute' => ['jenjang_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'visi' => 'Visi',
            'misi' => 'Misi',
            'alamat' => 'Alamat',
            'website' => 'Website',
            'telpon' => 'Telpon',
            'email' => 'Email',
            'nama' => 'Nama',
            'idorg' => 'Idorg',
            'kode' => 'Kode',
            'parent_orgid' => 'Parent Orgid',
            'pejabat' => 'Pejabat',
            'nik_pejabat' => 'Nik Pejabat',
            'nama_jabatan' => 'Nama Jabatan',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'id' => 'ID',
            'akreditasi' => 'Akreditasi',
            'nosk_banpt' => 'Nosk Banpt',
            'tglsk_banpt' => 'Tglsk Banpt',
            'tglakhirsk_banpt' => 'Tglakhirsk Banpt',
            'gelar' => 'Gelar',
            'jenjang_id' => 'Jenjang ID',
            'fakultas_id' => 'Fakultas ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbsenMahasiswas()
    {
        return $this->hasMany(AbsenMahasiswa::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCamabas()
    {
        return $this->hasMany(Camaba::className(), ['pilihan1_prodi' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDosens()
    {
        return $this->hasMany(Dosen::className(), ['homebase_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFormulirs()
    {
        return $this->hasMany(Formulir::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKalendarAkademiks()
    {
        return $this->hasMany(KalendarAkademik::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelasProdis()
    {
        return $this->hasMany(KelasProdi::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKurikulumMatakuliahs()
    {
        return $this->hasMany(KurikulumMatakuliah::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMahasiswas()
    {
        return $this->hasMany(Mahasiswa::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeminatanProdis()
    {
        return $this->hasMany(PeminatanProdi::className(), ['prodi_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJenjang()
    {
        return $this->hasOne(Jenjang::className(), ['id' => 'jenjang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRombels()
    {
        return $this->hasMany(Rombel::className(), ['prodi_id' => 'id']);
    }
}
