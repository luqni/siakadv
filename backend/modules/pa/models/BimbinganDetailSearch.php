<?php

namespace backend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\pa\models\BimbinganDetail;

/**
 * BimbinganDetailSearch represents the model behind the search form about `backend\modules\pa\models\BimbinganDetail`.
 */
class BimbinganDetailSearch extends BimbinganDetail
{
    public $kategoriname;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'bimbingan_id', 'jenis_id'], 'integer'],
            [['konsultasi', 'tanggapan', 'kategoriname'], 'safe'],
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
        $query = BimbinganDetail::find();
        $query ->joinWith(['jenisBimbingan']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes ['kategoriname'] = [
            'asc' => ['jenis_bimbingan.nama' => SORT_ASC],
            'desc' => ['jenis_bimbingan.nama' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'bimbingan_id' => $this->bimbingan_id,
//            'jenis_id' => $this->jenis_id,
            'kategoriname' => $this->jenisBimbingan,
        ]);

        $query->andFilterWhere(['like', 'konsultasi', $this->konsultasi])
            ->andFilterWhere(['like', 'tanggapan', $this->tanggapan]);

        return $dataProvider;
    }
}
