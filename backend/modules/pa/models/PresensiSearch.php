<?php

namespace backend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\pa\models\Presensi;

/**
 * PresensiSearch represents the model behind the search form about `backend\modules\pa\models\Presensi`.
 */
class PresensiSearch extends Presensi
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'prodi_id', 'ta_id', 'prgPendidikan', 'camaba_id', 'mk_id', 'pertemuan2', 'pertemuan3', 'pertemuan4', 'pertemuan5', 'pertemuan6', 'pertemuan7', 'pertemuan8', 'pertemuan9', 'pertemuan10', 'pertemuan11', 'pertemuan12', 'pertemuan13', 'pertemuan14', 'created_by', 'updated_by', 'pertemuan1'], 'integer'],
            [['smt', 'nim', 'tgl_pertemuan2', 'tgl_pertemuan3', 'tgl_pertemuan4', 'tgl_pertemuan5', 'tgl_pertemuan6', 'tgl_pertemuan7', 'tgl_pertemuan8', 'tgl_pertemuan9', 'tgl_pertemuan10', 'tgl_pertemuan11', 'tgl_pertemuan12', 'tgl_pertemuan13', 'tgl_pertemuan14', 'status_presensi', 'created_at', 'updated_at', 'tgl_pertemuan1', 'kode_rombel'], 'safe'],
            [['nilai_presensi'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Presensi::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'prodi_id' => $this->prodi_id,
            'ta_id' => $this->ta_id,
            'prgPendidikan' => $this->prgPendidikan,
            'camaba_id' => $this->camaba_id,
            'mk_id' => $this->mk_id,
            'pertemuan2' => $this->pertemuan2,
            'tgl_pertemuan2' => $this->tgl_pertemuan2,
            'pertemuan3' => $this->pertemuan3,
            'tgl_pertemuan3' => $this->tgl_pertemuan3,
            'pertemuan4' => $this->pertemuan4,
            'tgl_pertemuan4' => $this->tgl_pertemuan4,
            'pertemuan5' => $this->pertemuan5,
            'tgl_pertemuan5' => $this->tgl_pertemuan5,
            'pertemuan6' => $this->pertemuan6,
            'tgl_pertemuan6' => $this->tgl_pertemuan6,
            'pertemuan7' => $this->pertemuan7,
            'tgl_pertemuan7' => $this->tgl_pertemuan7,
            'pertemuan8' => $this->pertemuan8,
            'tgl_pertemuan8' => $this->tgl_pertemuan8,
            'pertemuan9' => $this->pertemuan9,
            'tgl_pertemuan9' => $this->tgl_pertemuan9,
            'pertemuan10' => $this->pertemuan10,
            'tgl_pertemuan10' => $this->tgl_pertemuan10,
            'pertemuan11' => $this->pertemuan11,
            'tgl_pertemuan11' => $this->tgl_pertemuan11,
            'pertemuan12' => $this->pertemuan12,
            'tgl_pertemuan12' => $this->tgl_pertemuan12,
            'pertemuan13' => $this->pertemuan13,
            'tgl_pertemuan13' => $this->tgl_pertemuan13,
            'pertemuan14' => $this->pertemuan14,
            'tgl_pertemuan14' => $this->tgl_pertemuan14,
            'nilai_presensi' => $this->nilai_presensi,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'pertemuan1' => $this->pertemuan1,
            'tgl_pertemuan1' => $this->tgl_pertemuan1,
        ]);

        $query->andFilterWhere(['like', 'smt', $this->smt])
            ->andFilterWhere(['like', 'nim', $this->nim])
            ->andFilterWhere(['like', 'status_presensi', $this->status_presensi])
            ->andFilterWhere(['like', 'kode_rombel', $this->kode_rombel]);

        return $dataProvider;
    }
}
