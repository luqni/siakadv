<?php

namespace frontend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\modules\pa\models\Kelas;

/**
 * KelasSearch represents the model behind the search form about `frontend\modules\pa\models\Kelas`.
 */
class KelasSearch extends Kelas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'ta_id', 'mk_id', 'ruang_id', 'dosen_id', 'asdos_id', 'jamke_mulai', 'jamke_akhir', 'status', 'tm', 'prk', 'lap', 'created_by', 'updated_by'], 'integer'],
            [['hari', 'semester', 'kode', 'abbr', 'created_at', 'updated_at'], 'safe'],
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
        $query = Kelas::find();

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
            'ta_id' => $this->ta_id,
            'mk_id' => $this->mk_id,
            'ruang_id' => $this->ruang_id,
            'dosen_id' => $this->dosen_id,
            'asdos_id' => $this->asdos_id,
            'jamke_mulai' => $this->jamke_mulai,
            'jamke_akhir' => $this->jamke_akhir,
            'status' => $this->status,
            'tm' => $this->tm,
            'prk' => $this->prk,
            'lap' => $this->lap,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'hari', $this->hari])
            ->andFilterWhere(['like', 'semester', $this->semester])
            ->andFilterWhere(['like', 'kode', $this->kode])
            ->andFilterWhere(['like', 'abbr', $this->abbr]);

        return $dataProvider;
    }
}
