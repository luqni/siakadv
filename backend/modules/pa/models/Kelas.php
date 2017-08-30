<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "kelas".
 *
 * @property integer $id
 * @property integer $ta_id
 * @property integer $mk_id
 * @property integer $ruang_id
 * @property integer $dosen_id
 * @property integer $asdos_id
 * @property integer $jamke_mulai
 * @property integer $jamke_akhir
 * @property integer $status
 * @property string $hari
 * @property string $semester
 * @property string $kode
 * @property string $abbr
 * @property integer $tm
 * @property integer $prk
 * @property integer $lap
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property AbsenDosen[] $absenDosens
 * @property AbsenMahasiswa[] $absenMahasiswas
 * @property AkadKelas[] $akadKelas
 * @property DetailPaket[] $detailPakets
 * @property ElearningKelas $elearningKelas
 * @property JadwalPraktikum[] $jadwalPraktikums
 * @property KehadiranDosen[] $kehadiranDosens
 * @property KehadiranMahasiswa[] $kehadiranMahasiswas
 * @property Dosen $dosen
 * @property Dosen $asdos
 * @property Jamke $jamkeMulai
 * @property Jamke $jamkeAkhir
 * @property Matakuliah $mk
 * @property Ruang $ruang
 * @property TahunAkademik $ta
 * @property KelasProdi[] $kelasProdis
 * @property KhsDetail[] $khsDetails
 * @property KrsDetail[] $krsDetails
 * @property KuisionerKelas[] $kuisionerKelas
 * @property PaketKelasDetail[] $paketKelasDetails
 * @property PenilaianKelas $penilaianKelas
 * @property PersentaseNilaiKelas[] $persentaseNilaiKelas
 * @property PesertaKelas[] $pesertaKelas
 */
class Kelas extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'kelas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ta_id', 'mk_id', 'ruang_id', 'dosen_id', 'asdos_id', 'jamke_mulai', 'jamke_akhir', 'status', 'tm', 'prk', 'lap', 'created_by', 'updated_by'], 'integer'],
            [['hari'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['semester'], 'string', 'max' => 5],
            [['kode'], 'string', 'max' => 10],
            [['abbr'], 'string', 'max' => 3],
            [['ta_id', 'kode'], 'unique', 'targetAttribute' => ['ta_id', 'kode'], 'message' => 'The combination of Ta ID and Kode has already been taken.'],
            [['dosen_id'], 'exist', 'skipOnError' => true, 'targetClass' => Dosen::className(), 'targetAttribute' => ['dosen_id' => 'id']],
            [['asdos_id'], 'exist', 'skipOnError' => true, 'targetClass' => Dosen::className(), 'targetAttribute' => ['asdos_id' => 'id']],
            [['jamke_mulai'], 'exist', 'skipOnError' => true, 'targetClass' => Jamke::className(), 'targetAttribute' => ['jamke_mulai' => 'id']],
            [['jamke_akhir'], 'exist', 'skipOnError' => true, 'targetClass' => Jamke::className(), 'targetAttribute' => ['jamke_akhir' => 'id']],
            [['mk_id'], 'exist', 'skipOnError' => true, 'targetClass' => Matakuliah::className(), 'targetAttribute' => ['mk_id' => 'id']],
            [['ruang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ruang::className(), 'targetAttribute' => ['ruang_id' => 'id']],
            [['ta_id'], 'exist', 'skipOnError' => true, 'targetClass' => TahunAkademik::className(), 'targetAttribute' => ['ta_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ta_id' => 'Ta ID',
            'mk_id' => 'Mk ID',
            'ruang_id' => 'Ruang ID',
            'dosen_id' => 'Dosen ID',
            'asdos_id' => 'Asdos ID',
            'jamke_mulai' => 'Jamke Mulai',
            'jamke_akhir' => 'Jamke Akhir',
            'status' => 'Status',
            'hari' => 'Hari',
            'semester' => 'Semester',
            'kode' => 'Kode',
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
    public function getAbsenDosens()
    {
        return $this->hasMany(AbsenDosen::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbsenMahasiswas()
    {
        return $this->hasMany(AbsenMahasiswa::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAkadKelas()
    {
        return $this->hasMany(AkadKelas::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetailPakets()
    {
        return $this->hasMany(DetailPaket::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getElearningKelas()
    {
        return $this->hasOne(ElearningKelas::className(), ['id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJadwalPraktikums()
    {
        return $this->hasMany(JadwalPraktikum::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKehadiranDosens()
    {
        return $this->hasMany(KehadiranDosen::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKehadiranMahasiswas()
    {
        return $this->hasMany(KehadiranMahasiswa::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDosen()
    {
        return $this->hasOne(Dosen::className(), ['id' => 'dosen_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAsdos()
    {
        return $this->hasOne(Dosen::className(), ['id' => 'asdos_id']);
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
    public function getMk()
    {
        return $this->hasOne(Matakuliah::className(), ['id' => 'mk_id']);
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
    public function getTa()
    {
        return $this->hasOne(TahunAkademik::className(), ['id' => 'ta_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelasProdis()
    {
        return $this->hasMany(KelasProdi::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKhsDetails()
    {
        return $this->hasMany(KhsDetail::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKrsDetails()
    {
        return $this->hasMany(KrsDetail::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKuisionerKelas()
    {
        return $this->hasMany(KuisionerKelas::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPaketKelasDetails()
    {
        return $this->hasMany(PaketKelasDetail::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPenilaianKelas()
    {
        return $this->hasOne(PenilaianKelas::className(), ['id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersentaseNilaiKelas()
    {
        return $this->hasMany(PersentaseNilaiKelas::className(), ['kelas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPesertaKelas()
    {
        return $this->hasMany(PesertaKelas::className(), ['kelas_id' => 'id']);
    }
}
