<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "mahasiswa".
 *
 * @property integer $mhsid
 * @property string $nim
 * @property integer $thn_masuk
 * @property double $ipk
 * @property integer $total_sks
 * @property string $no_ijazah
 * @property string $tgl_lulus
 * @property integer $camaba_id
 * @property integer $prodi_id
 * @property integer $status_id
 * @property integer $peminatan_id
 * @property string $kode_rombel
 * @property integer $user_id
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property AbsenMahasiswa[] $absenMahasiswas
 * @property BimbinganPa[] $bimbinganPas
 * @property Krs[] $krs
 * @property Prodi $prodi
 * @property Rombel $kodeRombel
 * @property StatusMahasiswa $status
 * @property PesertaKelas[] $pesertaKelas
 * @property Transkrip[] $transkrips
 * @property TugasAkhir[] $tugasAkhirs
 */
class Mahasiswa extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */

    public $dosenpa_id;

    public static function tableName()
    {
        return 'mahasiswa';
    }

    /**get
     * @inheritdoc
     */

    public $file;

    public function rules()
    {
        return [
            [['thn_masuk', 'total_sks', 'camaba_id', 'prodi_id', 'status_id', 'peminatan_id', 'user_id', 'created_by', 'updated_by'], 'integer'],
            [['ipk'], 'number'],
            [['tgl_lulus', 'created_at', 'updated_at'], 'safe'],
            [['nim', 'no_ijazah'], 'string', 'max' => 20],
            [['file'], 'file'],
            [['foto'], 'string', 'max' => 50],
            [['kode_rombel'], 'string', 'max' => 6],
            [['nim'], 'unique'],
            [['prodi_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['prodi_id' => 'id']],
            [['kode_rombel'], 'exist', 'skipOnError' => true, 'targetClass' => Rombel::className(), 'targetAttribute' => ['kode_rombel' => 'kode']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatusMahasiswa::className(), 'targetAttribute' => ['status_id' => 'id']],
        ];
    }


    public function namaLengkap(){
        return $this->getCamaba()->nama;
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'mhsid' => 'Mhsid',
            'nim' => 'NIM',
            'thn_masuk' => 'Tahun Masuk',
            'tahunAkademik.nama' => 'Tahun Masuk',
            'ipk' => 'IPK',
            'total_sks' => 'Total Sks',
            'no_ijazah' => 'No Ijazah',
            'tgl_lulus' => 'Tgl Lulus',
            'camaba_id' => 'Nama Mahasiswa',
            'camaba.nama' => 'Nama Mahasiswa',
            'prodi_id' => 'Program Studi',
            'prodi.nama' => 'Program Studi',
            'status_id' => 'Status Mahasiswa',
            'status.nama' => 'Status Mahasiswa',
            'peminatan_id' => 'Peminatan',
            'peminatanProdi.nama' => 'Peminatan',
            'kode_rombel' => 'Pembimbing Akademik',
            'kodeRombel.nama' => 'Pembimbing Akademik', 
            'user_id' => 'User ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'file' => 'Foto',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbsenMahasiswas()
    {
        return $this->hasMany(AbsenMahasiswa::className(), ['mhsid' => 'mhsid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBimbinganPas()
    {
        return $this->hasMany(BimbinganPa::className(), ['mhsid' => 'mhsid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKrs()
    {
        return $this->hasMany(Krs::className(), ['nim' => 'nim']);
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
    public function getPeminatanProdi()
    {
        return $this->hasOne(PeminatanProdi::className(), ['id' => 'peminatan_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTahunAkademik()
    {
        return $this->hasOne(TahunAkademik::className(), ['id' => 'thn_masuk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRombel()
    {
        return $this->hasOne(Rombel::className(), ['kode' => 'kode_rombel']);
    }

   public function getRombel2()
    {
        //return $this->hasOne(Rombel::className(), ['kode' => 'kode_rombel']);
        $rombel = Rombel::findOne(['kode'=>$this->kode_rombel]);
        return $rombel;
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
    public function getStatus()
    {
        return $this->hasOne(StatusMahasiswa::className(), ['id' => 'status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCamaba()
    {
        return $this->hasOne(Camaba::className(), ['id' => 'camaba_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPesertaKelas()
    {
        return $this->hasMany(PesertaKelas::className(), ['mhs_id' => 'mhsid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTranskrips()
    {
        return $this->hasMany(Transkrip::className(), ['mhs_id' => 'mhsid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTugasAkhirs()
    {
        return $this->hasMany(TugasAkhir::className(), ['mhs_id' => 'mhsid']);
    }

}

