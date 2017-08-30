<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "camaba".
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
 * @property integer $id
 * @property string $asal_sekolah
 * @property string $ayah
 * @property string $ibu
 * @property integer $pilihan1_prodi
 * @property integer $pilihan2_prodi
 * @property integer $pilihan3_prodi
 * @property string $no_ijazah
 * @property double $ratanilai_ijazah
 * @property double $ratanilai_nem
 * @property double $berat
 * @property double $tinggi
 * @property integer $anak_ke
 * @property integer $jumlah_saudara
 * @property string $alamat_ortu
 * @property string $kota_sekolah
 * @property integer $thnlulus_sekolah
 * @property string $nisn
 * @property integer $pekerjaan_ayah
 * @property integer $pekerjaan_ibu
 * @property integer $gaji_ayah
 * @property integer $gaji_ibu
 * @property integer $jalurstudi_id
 * @property integer $pendidikan_ayah_id
 * @property integer $pendidikan_ibu_id
 * @property string $nama_wali
 * @property integer $pendidikan_wali_id
 * @property integer $gaji_wali
 * @property string $tgl_lahir_ayah
 * @property string $tgl_lahir_ibu
 * @property string $tgl_lahir_wali
 * @property integer $pekerjaan_wali
 * @property string $no_camaba
 *
 * @property JalurStudi $jalurstudi
 * @property JenisPekerjaan $pekerjaanAyah
 * @property JenisPekerjaan $pekerjaanIbu
 * @property JenisPekerjaan $pekerjaanWali
 * @property Jenjang $pendidikanAyah
 * @property Jenjang $pendidikanIbu
 * @property Jenjang $pendidikanWali
 * @property Prodi $pilihan1Prodi
 * @property RangeGaji $gajiAyah
 * @property RangeGaji $gajiIbu
 * @property RangeGaji $gajiWali
 * @property CamabaKebutuhanKhusus[] $camabaKebutuhanKhususes
 */
class Camaba extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'camaba';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama'], 'required'],
            [['jk', 'agama'], 'string'],
            [['tgl_lahir', 'created_at', 'updated_at', 'tgl_lahir_ayah', 'tgl_lahir_ibu', 'tgl_lahir_wali'], 'safe'],
            [['user_id', 'created_by', 'updated_by', 'pilihan1_prodi', 'pilihan2_prodi', 'pilihan3_prodi', 'anak_ke', 'jumlah_saudara', 'thnlulus_sekolah', 'pekerjaan_ayah', 'pekerjaan_ibu', 'gaji_ayah', 'gaji_ibu', 'jalurstudi_id', 'pendidikan_ayah_id', 'pendidikan_ibu_id', 'pendidikan_wali_id', 'gaji_wali', 'pekerjaan_wali'], 'integer'],
            [['ratanilai_ijazah', 'ratanilai_nem', 'berat', 'tinggi'], 'number'],
            [['nama', 'asal_sekolah'], 'string', 'max' => 50],
            [['tmp_lahir', 'noktp', 'kota_sekolah'], 'string', 'max' => 30],
            [['alamat', 'alamat_ortu'], 'string', 'max' => 100],
            [['email', 'telpon', 'ayah', 'ibu', 'nama_wali'], 'string', 'max' => 40],
            [['no_ijazah'], 'string', 'max' => 20],
            [['nisn'], 'string', 'max' => 10],
            [['no_camaba'], 'string', 'max' => 7],
            [['jalurstudi_id'], 'exist', 'skipOnError' => true, 'targetClass' => JalurStudi::className(), 'targetAttribute' => ['jalurstudi_id' => 'id']],
            [['pekerjaan_ayah'], 'exist', 'skipOnError' => true, 'targetClass' => JenisPekerjaan::className(), 'targetAttribute' => ['pekerjaan_ayah' => 'id']],
            [['pekerjaan_ibu'], 'exist', 'skipOnError' => true, 'targetClass' => JenisPekerjaan::className(), 'targetAttribute' => ['pekerjaan_ibu' => 'id']],
            [['pekerjaan_wali'], 'exist', 'skipOnError' => true, 'targetClass' => JenisPekerjaan::className(), 'targetAttribute' => ['pekerjaan_wali' => 'id']],
            [['pendidikan_ayah_id'], 'exist', 'skipOnError' => true, 'targetClass' => Jenjang::className(), 'targetAttribute' => ['pendidikan_ayah_id' => 'id']],
            [['pendidikan_ibu_id'], 'exist', 'skipOnError' => true, 'targetClass' => Jenjang::className(), 'targetAttribute' => ['pendidikan_ibu_id' => 'id']],
            [['pendidikan_wali_id'], 'exist', 'skipOnError' => true, 'targetClass' => Jenjang::className(), 'targetAttribute' => ['pendidikan_wali_id' => 'id']],
            [['pilihan1_prodi'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['pilihan1_prodi' => 'id']],
            [['gaji_ayah'], 'exist', 'skipOnError' => true, 'targetClass' => RangeGaji::className(), 'targetAttribute' => ['gaji_ayah' => 'id']],
            [['gaji_ibu'], 'exist', 'skipOnError' => true, 'targetClass' => RangeGaji::className(), 'targetAttribute' => ['gaji_ibu' => 'id']],
            [['gaji_wali'], 'exist', 'skipOnError' => true, 'targetClass' => RangeGaji::className(), 'targetAttribute' => ['gaji_wali' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'nama' => 'Nama',
            'jk' => 'Jk',
            'tmp_lahir' => 'Tmp Lahir',
            'tgl_lahir' => 'Tgl Lahir',
            'alamat' => 'Alamat',
            'noktp' => 'Noktp',
            'email' => 'Email',
            'agama' => 'Agama',
            'telpon' => 'Telpon',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'id' => 'ID',
            'asal_sekolah' => 'Asal Sekolah',
            'ayah' => 'Ayah',
            'ibu' => 'Ibu',
            'pilihan1_prodi' => 'Pilihan1 Prodi',
            'pilihan2_prodi' => 'Pilihan2 Prodi',
            'pilihan3_prodi' => 'Pilihan3 Prodi',
            'no_ijazah' => 'No Ijazah',
            'ratanilai_ijazah' => 'Ratanilai Ijazah',
            'ratanilai_nem' => 'Ratanilai Nem',
            'berat' => 'Berat',
            'tinggi' => 'Tinggi',
            'anak_ke' => 'Anak Ke',
            'jumlah_saudara' => 'Jumlah Saudara',
            'alamat_ortu' => 'Alamat Ortu',
            'kota_sekolah' => 'Kota Sekolah',
            'thnlulus_sekolah' => 'Thnlulus Sekolah',
            'nisn' => 'Nisn',
            'pekerjaan_ayah' => 'Pekerjaan Ayah',
            'pekerjaan_ibu' => 'Pekerjaan Ibu',
            'gaji_ayah' => 'Gaji Ayah',
            'gaji_ibu' => 'Gaji Ibu',
            'jalurstudi_id' => 'Jalurstudi ID',
            'pendidikan_ayah_id' => 'Pendidikan Ayah ID',
            'pendidikan_ibu_id' => 'Pendidikan Ibu ID',
            'nama_wali' => 'Nama Wali',
            'pendidikan_wali_id' => 'Pendidikan Wali ID',
            'gaji_wali' => 'Gaji Wali',
            'tgl_lahir_ayah' => 'Tgl Lahir Ayah',
            'tgl_lahir_ibu' => 'Tgl Lahir Ibu',
            'tgl_lahir_wali' => 'Tgl Lahir Wali',
            'pekerjaan_wali' => 'Pekerjaan Wali',
            'no_camaba' => 'No Camaba',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJalurstudi()
    {
        return $this->hasOne(JalurStudi::className(), ['id' => 'jalurstudi_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPekerjaanAyah()
    {
        return $this->hasOne(JenisPekerjaan::className(), ['id' => 'pekerjaan_ayah']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPekerjaanIbu()
    {
        return $this->hasOne(JenisPekerjaan::className(), ['id' => 'pekerjaan_ibu']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPekerjaanWali()
    {
        return $this->hasOne(JenisPekerjaan::className(), ['id' => 'pekerjaan_wali']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPendidikanAyah()
    {
        return $this->hasOne(Jenjang::className(), ['id' => 'pendidikan_ayah_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPendidikanIbu()
    {
        return $this->hasOne(Jenjang::className(), ['id' => 'pendidikan_ibu_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPendidikanWali()
    {
        return $this->hasOne(Jenjang::className(), ['id' => 'pendidikan_wali_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPilihan1Prodi()
    {
        return $this->hasOne(Prodi::className(), ['id' => 'pilihan1_prodi']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGajiAyah()
    {
        return $this->hasOne(RangeGaji::className(), ['id' => 'gaji_ayah']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGajiIbu()
    {
        return $this->hasOne(RangeGaji::className(), ['id' => 'gaji_ibu']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGajiWali()
    {
        return $this->hasOne(RangeGaji::className(), ['id' => 'gaji_wali']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCamabaKebutuhanKhususes()
    {
        return $this->hasMany(CamabaKebutuhanKhusus::className(), ['camaba_id' => 'id']);
    }
}
