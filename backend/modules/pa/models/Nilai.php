<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "nilai".
 *
 * @property integer $_id
 * @property integer $ta_id
 * @property string $smt
 * @property integer $prgPendidikan
 * @property integer $mhs_id
 * @property string $nim
 * @property integer $mk_id
 * @property double $nilai_uas
 * @property double $nilai_uts
 * @property double $nilai_tugas1
 * @property double $nilai_tugas2
 * @property double $nilai_tugas3
 * @property double $nilai_presentasi
 * @property double $nilai_praktik
 * @property double $nilai_absensi
 * @property string $grade
 * @property integer $islock
 * @property string $keterangan
 * @property string $status_nilai
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $camaba_id
 * @property string $kode_rombel
 * @property double $nilai_akhir
 * @property integer $id
 *
 * @property Camaba $camaba
 * @property Mahasiswa $mhs
 * @property Mahasiswa $nim0
 * @property Matakuliah $mk
 * @property Prodi $prodi
 * @property ProgramPendidikan $prgPendidikan0
 * @property Rombel $kodeRombel
 * @property TahunAkademik $ta
 */
class Nilai extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'nilai';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['prodi_id', 'ta_id', 'prgPendidikan', 'mhs_id', 'mk_id', 'islock', 'created_by', 'updated_by', 'camaba_id'], 'integer'],
            [['nilai_uas', 'nilai_uts', 'nilai_tugas1', 'nilai_tugas2', 'nilai_tugas3', 'nilai_presentasi', 'nilai_praktik', 'nilai_absensi', 'nilai_akhir'], 'number'],
            [['status_nilai'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['smt'], 'string', 'max' => 10],
            [['nim', 'keterangan'], 'string', 'max' => 20],
            [['grade'], 'string', 'max' => 2],
            [['kode_rombel'], 'string', 'max' => 6],
            [['camaba_id'], 'exist', 'skipOnError' => true, 'targetClass' => Camaba::className(), 'targetAttribute' => ['camaba_id' => 'id']],
            [['mhs_id'], 'exist', 'skipOnError' => true, 'targetClass' => Mahasiswa::className(), 'targetAttribute' => ['mhs_id' => 'mhsid']],
            [['nim'], 'exist', 'skipOnError' => true, 'targetClass' => Mahasiswa::className(), 'targetAttribute' => ['nim' => 'nim']],
            [['mk_id'], 'exist', 'skipOnError' => true, 'targetClass' => Matakuliah::className(), 'targetAttribute' => ['mk_id' => 'id']],
            [['prodi_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['prodi_id' => 'id']],
            [['prgPendidikan'], 'exist', 'skipOnError' => true, 'targetClass' => ProgramPendidikan::className(), 'targetAttribute' => ['prgPendidikan' => 'id']],
            [['kode_rombel'], 'exist', 'skipOnError' => true, 'targetClass' => Rombel::className(), 'targetAttribute' => ['kode_rombel' => 'kode']],
            [['ta_id'], 'exist', 'skipOnError' => true, 'targetClass' => TahunAkademik::className(), 'targetAttribute' => ['ta_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'prodi_id' => 'Prodi',
            'prodi.nama' => 'Prodi',
            'ta_id' => 'Tahun Akademik',
            'ta' => 'Tahun Akademik',
            'smt' => 'Semester',
            'prgPendidikan' => 'Program Pendidikan',
            'prgPendidikan0.nama' => 'Program Pendidikan',
            'mhs_id' => 'Nama Mahasiswa',
            'nim' => 'NIM',
            'mk_id' => 'Mata Kuliah',
            'nilai_uas' => 'Nilai UAS',
            'nilai_uts' => 'Nilai UTS',
            'nilai_tugas1' => 'Nilai Tugas 1',
            'nilai_tugas2' => 'Nilai Tugas 2',
            'nilai_tugas3' => 'Nilai Tugas 3',
            'nilai_presentasi' => 'Nilai Presentasi',
            'nilai_praktik' => 'Nilai Praktik',
            'nilai_absensi' => 'Nilai Absensi',
            'grade' => 'Grade',
            'islock' => 'Islock',
            'keterangan' => 'Keterangan',
            'status_nilai' => 'Status Nilai',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'camaba_id' => 'Nama Mahasiswa',
            'camaba.nama' => 'Nama Mahasiswa',
            'kode_rombel' => 'Kode Rombel',
            'nilai_akhir' => 'Nilai Akhir',
            'id' => 'ID',
        ];
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
    public function getMhs()
    {
        return $this->hasOne(Mahasiswa::className(), ['mhsid' => 'mhs_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNim0()
    {
        return $this->hasOne(Mahasiswa::className(), ['nim' => 'nim']);
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
    public function getProdi()
    {
        return $this->hasOne(Prodi::className(), ['id' => 'prodi_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPrgPendidikan0()
    {
        return $this->hasOne(ProgramPendidikan::className(), ['id' => 'prgPendidikan']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKodeRombel()
    {
        return $this->hasOne(Rombel::className(), ['kode' => 'kode_rombel']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTa()
    {
        return $this->hasOne(TahunAkademik::className(), ['id' => '
            ']);
    }
}
