<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "khs_detail".
 *
 * @property integer $id
 * @property integer $kelas_id
 * @property double $nilai_akhir
 * @property string $grade
 * @property double $bobot
 * @property integer $khs_id
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Kelas $kelas
 * @property Khs $khs
 * @property KhsDetailKomponen[] $khsDetailKomponens
 */
class KhsDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'khs_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['kelas_id', 'khs_id', 'created_by', 'updated_by'], 'integer'],
            [['nilai_akhir', 'bobot'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['grade'], 'string', 'max' => 2],
            [['kelas_id'], 'exist', 'skipOnError' => true, 'targetClass' => Kelas::className(), 'targetAttribute' => ['kelas_id' => 'id']],
            [['khs_id'], 'exist', 'skipOnError' => true, 'targetClass' => Khs::className(), 'targetAttribute' => ['khs_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'kelas_id' => 'Kelas ID',
            'nilai_akhir' => 'Nilai Akhir',
            'grade' => 'Grade',
            'bobot' => 'Bobot',
            'khs_id' => 'Khs ID',
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
        return $this->hasOne(Kelas::className(), ['id' => 'kelas_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKhs()
    {
        return $this->hasOne(Khs::className(), ['id' => 'khs_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKhsDetailKomponens()
    {
        return $this->hasMany(KhsDetailKomponen::className(), ['hasil_studi_id' => 'id']);
    }
}
