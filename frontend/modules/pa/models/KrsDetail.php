<?php

namespace frontend\modules\pa\models;

use Yii;

/**
 * This is the model class for table "krs_detail".
 *
 * @property integer $id
 * @property integer $kelas_id
 * @property integer $status
 * @property integer $krs_id
 * @property string $last_update
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Kelas $kelas
 * @property Krs $krs
 */
class KrsDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'krs_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['kelas_id', 'status', 'krs_id', 'created_by', 'updated_by'], 'integer'],
            [['last_update', 'created_at', 'updated_at'], 'safe'],
            [['kelas_id'], 'exist', 'skipOnError' => true, 'targetClass' => Kelas::className(), 'targetAttribute' => ['kelas_id' => 'id']],
            [['krs_id'], 'exist', 'skipOnError' => true, 'targetClass' => Krs::className(), 'targetAttribute' => ['krs_id' => 'id']],
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
            'status' => 'Status',
            'krs_id' => 'Krs ID',
            'last_update' => 'Last Update',
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
    public function getKrs()
    {
        return $this->hasOne(Krs::className(), ['id' => 'krs_id']);
    }
}
