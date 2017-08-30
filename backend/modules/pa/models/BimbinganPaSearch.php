<?php

namespace backend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\pa\models\BimbinganPa;

/**
 * BimbinganPaSearch represents the model behind the search form about `backend\modules\pa\models\BimbinganPa`.
 */
class BimbinganPaSearch extends BimbinganPa
{
    /**
     * @inheritdoc
     */
    

    public function rules()
    {
        return [
            [['id', 'dosenpa_id', 'mhsid', 'created_by', 'updated_by', 'ruang_id', 'jamke_mulai', 'jamke_akhir', 'waktu_bimbingan'], 'integer'],
            [['tanggal', 'created_at', 'updated_at', 'semester'], 'safe'],
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
        $query = BimbinganPa::find();

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
            'tanggal' => $this->tanggal,
            'dosenpa_id' => $this->dosenpa_id,
            'mhsid' => $this->mhsid,
          //  'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
            // 'created_by' => $this->created_by,
            // 'updated_by' => $this->updated_by,
            // 'ruang_id' => $this->ruang_id,
            // 'jamke_mulai' => $this->jamke_mulai,
            // 'jamke_akhir' => $this->jamke_akhir,
            'waktu_bimbingan' => $this->waktu_bimbingan,
        ]);

        $query->andFilterWhere(['like', 'semester', $this->semester]);

        return $dataProvider;
    }
}
