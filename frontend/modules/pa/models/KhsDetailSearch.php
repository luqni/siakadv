<?php

namespace frontend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\modules\pa\models\KhsDetail;

/**
 * KhsDetailSearch represents the model behind the search form about `frontend\modules\pa\models\KhsDetail`.
 */
class KhsDetailSearch extends KhsDetail
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'kelas_id', 'khs_id', 'created_by', 'updated_by'], 'integer'],
            [['nilai_akhir', 'bobot'], 'number'],
            [['grade', 'created_at', 'updated_at'], 'safe'],
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
        $query = KhsDetail::find();

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
            'kelas_id' => $this->kelas_id,
            'nilai_akhir' => $this->nilai_akhir,
            'bobot' => $this->bobot,
            'khs_id' => $this->khs_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'grade', $this->grade]);

        return $dataProvider;
    }
}
