<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "dosen".
 *
 * @property string $nama
 * @property string $jk
 * @property string $tmp_lahir
 * @property string $tgl_lahir
 * @property string $alamat
 * @property string $noktp
 * @property string $email
 * @property string $agama
 * @property string $telpon
 * @property integer $user_id
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property string $nik
 * @property integer $orgid
 * @property string $gelar_depan
 * @property string $gelar_belakang
 * @property string $tglmulai_kerja
 * @property integer $aktif
 * @property string $golongan
 * @property integer $id
 * @property string $nidn
 * @property integer $jafung_id
 * @property integer $statusdosen_id
 * @property string $goldikti
 * @property integer $homebase_id
 *
 * @property AbsenDosen[] $absenDosens
 * @property Jafung $jafung
 * @property Prodi $homebase
 * @property StatusDosen $statusdosen
 * @property Kelas[] $kelas
 * @property Kelas[] $kelas0
 * @property Matakuliah[] $matakuliahs
 * @property NilaiSeminar[] $nilaiSeminars
 * @property Rombel[] $rombels
 * @property TugasAkhir[] $tugasAkhirs
 */
class Dosen extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dosen';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama', 'nik'], 'required'],
            [['jk', 'agama'], 'string'],
            [['tgl_lahir', 'created_at', 'updated_at', 'tglmulai_kerja'], 'safe'],
            [['user_id', 'created_by', 'updated_by', 'orgid', 'aktif', 'jafung_id', 'statusdosen_id', 'homebase_id'], 'integer'],
            [['nama'], 'string', 'max' => 50],
            [['tmp_lahir', 'noktp'], 'string', 'max' => 30],
            [['alamat'], 'string', 'max' => 100],
            [['email', 'telpon'], 'string', 'max' => 40],
            [['nik', 'gelar_belakang'], 'string', 'max' => 20],
            [['gelar_depan'], 'string', 'max' => 6],
            [['golongan', 'nidn', 'goldikti'], 'string', 'max' => 10],
            [['jafung_id'], 'exist', 'skipOnError' => true, 'targetClass' => Jafung::className(), 'targetAttribute' => ['jafung_id' => 'id']],
            [['homebase_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['homebase_id' => 'id']],
            [['statusdosen_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatusDosen::className(), 'targetAttribute' => ['statusdosen_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'nama' => 'Nama',
            'jk' => 'Jenis Kelamin',
            'tmp_lahir' => 'Tempat Lahir',
            'tgl_lahir' => 'Tanggal Lahir',
            'alamat' => 'Alamat',
            'noktp' => 'NO.KTP',
            'email' => 'Email',
            'agama' => 'Agama',
            'telpon' => 'Nomor HP',
            'user_id' => 'User',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'nik' => 'NIK',
            'orgid' => 'Organisasi',
            'gelar_depan' => 'Gelar Depan',
            'gelar_belakang' => 'Gelar Belakang',
            'tglmulai_kerja' => 'Tanggal Mulai Kerja',
            'aktif' => 'Aktif',
            'golongan' => 'Golongan',
            'id' => 'ID',
            'nidn' => 'NIDN',
            'jafung_id' => 'Jabatan fungsional',
            'statusdosen_id' => 'Status Dosen',
            'goldikti' => 'Golongan Dikti',
            'homebase_id' => 'Homebase',
            'homebase.nama'  => 'Homebase',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbsenDosens()
    {
        return $this->hasMany(AbsenDosen::className(), ['dosen_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJafung()
    {
        return $this->hasOne(Jafung::className(), ['id' => 'jafung_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHomebase()
    {
        return $this->hasOne(Prodi::className(), ['id' => 'homebase_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatusdosen()
    {
        return $this->hasOne(StatusDosen::className(), ['id' => 'statusdosen_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas()
    {
        return $this->hasMany(Kelas::className(), ['dosen_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKelas0()
    {
        return $this->hasMany(Kelas::className(), ['asdos_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMatakuliahs()
    {
        return $this->hasMany(Matakuliah::className(), ['dosen_pengampu' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNilaiSeminars()
    {
        return $this->hasMany(NilaiSeminar::className(), ['dosen_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRombels()
    {
        return $this->hasMany(Rombel::className(), ['dosenpa_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTugasAkhirs()
    {
        return $this->hasMany(TugasAkhir::className(), ['dosen_pembimbing_id' => 'id']);
    }
}
