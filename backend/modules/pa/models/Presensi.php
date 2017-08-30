<?php

namespace backend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "presensi".
 *
 * @property integer $id
 * @property integer $prodi_id
 * @property integer $ta_id
 * @property string $smt
 * @property integer $prgPendidikan
 * @property integer $camaba_id
 * @property string $nim
 * @property integer $mk_id
 * @property integer $pertemuan2
 * @property string $tgl_pertemuan2
 * @property integer $pertemuan3
 * @property string $tgl_pertemuan3
 * @property integer $pertemuan4
 * @property string $tgl_pertemuan4
 * @property integer $pertemuan5
 * @property string $tgl_pertemuan5
 * @property integer $pertemuan6
 * @property string $tgl_pertemuan6
 * @property integer $pertemuan7
 * @property string $tgl_pertemuan7
 * @property integer $pertemuan8
 * @property string $tgl_pertemuan8
 * @property integer $pertemuan9
 * @property string $tgl_pertemuan9
 * @property integer $pertemuan10
 * @property string $tgl_pertemuan10
 * @property integer $pertemuan11
 * @property string $tgl_pertemuan11
 * @property integer $pertemuan12
 * @property string $tgl_pertemuan12
 * @property integer $pertemuan13
 * @property string $tgl_pertemuan13
 * @property integer $pertemuan14
 * @property string $tgl_pertemuan14
 * @property double $nilai_presensi
 * @property string $status_presensi
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $pertemuan1
 * @property string $tgl_pertemuan1
 * @property string $kode_rombel
 *
 * @property Camaba $camaba
 * @property Matakuliah $mk
 * @property Prodi $prodi
 * @property ProgramPendidikan $prgPendidikan0
 * @property Rombel $kodeRombel
 * @property StatusAbsen $pertemuan20
 * @property StatusAbsen $pertemuan30
 * @property StatusAbsen $pertemuan40
 * @property StatusAbsen $pertemuan50
 * @property StatusAbsen $pertemuan60
 * @property StatusAbsen $pertemuan70
 * @property StatusAbsen $pertemuan80
 * @property StatusAbsen $pertemuan90
 * @property StatusAbsen $pertemuan100
 * @property StatusAbsen $pertemuan110
 * @property StatusAbsen $pertemuan120
 * @property StatusAbsen $pertemuan130
 * @property StatusAbsen $pertemuan140
 * @property StatusAbsen $pertemuan15
 * @property TahunAkademik $ta
 */
class Presensi extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'presensi';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['prodi_id', 'ta_id', 'prgPendidikan', 'camaba_id', 'mk_id', 'pertemuan2', 'pertemuan3', 'pertemuan4', 'pertemuan5', 'pertemuan6', 'pertemuan7', 'pertemuan8', 'pertemuan9', 'pertemuan10', 'pertemuan11', 'pertemuan12', 'pertemuan13', 'pertemuan14', 'created_by', 'updated_by', 'pertemuan1'], 'integer'],
            [['tgl_pertemuan2', 'tgl_pertemuan3', 'tgl_pertemuan4', 'tgl_pertemuan5', 'tgl_pertemuan6', 'tgl_pertemuan7', 'tgl_pertemuan8', 'tgl_pertemuan9', 'tgl_pertemuan10', 'tgl_pertemuan11', 'tgl_pertemuan12', 'tgl_pertemuan13', 'tgl_pertemuan14', 'created_at', 'updated_at', 'tgl_pertemuan1'], 'safe'],
            [['nilai_presensi'], 'number'],
            [['status_presensi'], 'string'],
            [['smt'], 'string', 'max' => 10],
            [['nim'], 'string', 'max' => 20],
            [['kode_rombel'], 'string', 'max' => 6],
            [['camaba_id'], 'exist', 'skipOnError' => true, 'targetClass' => Camaba::className(), 'targetAttribute' => ['camaba_id' => 'id']],
            [['mk_id'], 'exist', 'skipOnError' => true, 'targetClass' => Matakuliah::className(), 'targetAttribute' => ['mk_id' => 'id']],
            [['prodi_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prodi::className(), 'targetAttribute' => ['prodi_id' => 'id']],
            [['prgPendidikan'], 'exist', 'skipOnError' => true, 'targetClass' => ProgramPendidikan::className(), 'targetAttribute' => ['prgPendidikan' => 'id']],
            [['kode_rombel'], 'exist', 'skipOnError' => true, 'targetClass' => Rombel::className(), 'targetAttribute' => ['kode_rombel' => 'kode']],
            [['pertemuan2'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan2' => 'id']],
            [['pertemuan3'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan3' => 'id']],
            [['pertemuan4'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan4' => 'id']],
            [['pertemuan5'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan5' => 'id']],
            [['pertemuan6'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan6' => 'id']],
            [['pertemuan7'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan7' => 'id']],
            [['pertemuan8'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan8' => 'id']],
            [['pertemuan9'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan9' => 'id']],
            [['pertemuan10'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan10' => 'id']],
            [['pertemuan11'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan11' => 'id']],
            [['pertemuan12'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan12' => 'id']],
            [['pertemuan13'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan13' => 'id']],
            [['pertemuan14'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan14' => 'id']],
            [['pertemuan1'], 'exist', 'skipOnError' => true, 'targetClass' => StatusAbsen::className(), 'targetAttribute' => ['pertemuan1' => 'id']],
            [['ta_id'], 'exist', 'skipOnError' => true, 'targetClass' => TahunAkademik::className(), 'targetAttribute' => ['ta_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'prodi.nama',
            
            
            
            
            
            'id' => 'ID',
            'prodi_id' => 'Prodi',
            'prodi.nama' => 'Prodi',
            'ta_id' => 'Tahun Akademik',
            'ta.nama' => 'Tahun Akademik',
            'smt' => 'Semester',
            'prgPendidikan' => 'Program Pendidikan',
            'prgPendidikan0.nama' => 'Program Pendidikan',
            'camaba_id' => 'Nama Mahasiswa',
            'camaba.nama' => 'Nama Mahasiswa',
            'nim' => 'NIM',
            'kode_rombel' => 'Pembimbing Akademik',
            'kodeRombel.nama'=> 'Pembimbing Akademik',
            'mk_id' => 'Mata Kuliah',
            'pertemuan1' => 'Pertemuan 1',
            'tgl_pertemuan1' => 'Tanggal Pertemuan 1',
            'pertemuan2' => 'Pertemuan 2',
            'tgl_pertemuan2' => 'Tanggal Pertemuan 2',
            'pertemuan3' => 'Pertemuan 3',
            'tgl_pertemuan3' => 'Tanggal Pertemuan 3',
            'pertemuan4' => 'Pertemuan 4',
            'tgl_pertemuan4' => 'Tanggal Pertemuan 4',
            'pertemuan5' => 'Pertemuan 5',
            'tgl_pertemuan5' => 'Tanggal Pertemuan 5',
            'pertemuan6' => 'Pertemuan 6',
            'tgl_pertemuan6' => 'Tanggal Pertemuan 6',
            'pertemuan7' => 'Pertemuan 7',
            'tgl_pertemuan7' => 'Tanggal Pertemuan 7',
            'pertemuan8' => 'Pertemuan 8',
            'tgl_pertemuan8' => 'Tanggal Pertemuan 8',
            'pertemuan9' => 'Pertemuan 9',
            'tgl_pertemuan9' => 'Tanggal Pertemuan 9',
            'pertemuan10' => 'Pertemuan 10',
            'tgl_pertemuan10' => 'Tanggal Pertemuan 10',
            'pertemuan11' => 'Pertemuan 11',
            'tgl_pertemuan11' => 'Tanggal Pertemuan 11',
            'pertemuan12' => 'Pertemuan 12',
            'tgl_pertemuan12' => 'Tanggal Pertemuan 12',
            'pertemuan13' => 'Pertemuan 13',
            'tgl_pertemuan13' => 'Tanggal Pertemuan 13',
            'pertemuan14' => 'Pertemuan 14',
            'tgl_pertemuan14' => 'Tanggal Pertemuan 14',
            'nilai_presensi' => 'Nilai Presensi',
            'status_presensi' => 'Status Presensi',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
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
    public function getPertemuan20()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan2']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan30()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan3']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan40()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan4']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan50()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan5']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan60()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan6']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan70()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan7']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan80()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan8']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan90()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan9']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan100()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan10']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan110()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan11']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan120()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan12']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan130()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan13']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan140()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan14']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPertemuan15()
    {
        return $this->hasOne(StatusAbsen::className(), ['id' => 'pertemuan1']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTa()
    {
        return $this->hasOne(TahunAkademik::className(), ['id' => 'ta_id']);
    }
}
