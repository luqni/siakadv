<?php

namespace backend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\pa\models\Dosen;

/**
 * DosenSearch represents the model behind the search form about `backend\modules\pa\models\Dosen`.
 */
class DosenSearch extends Dosen
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama', 'jk', 'tmp_lahir', 'tgl_lahir', 'alamat', 'noktp', 'email', 'agama', 'telpon', 'created_at', 'updated_at', 'nik', 'gelar_depan', 'gelar_belakang', 'tglmulai_kerja', 'golongan', 'nidn', 'goldikti'], 'safe'],
            [['user_id', 'created_by', 'updated_by', 'orgid', 'aktif', 'id', 'jafung_id', 'statusdosen_id', 'homebase_id'], 'integer'],
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
        $query = Dosen::find();

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
            'tgl_lahir' => $this->tgl_lahir,
            'user_id' => $this->user_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'orgid' => $this->orgid,
            'tglmulai_kerja' => $this->tglmulai_kerja,
            'aktif' => $this->aktif,
            'id' => $this->id,
            'jafung_id' => $this->jafung_id,
            'statusdosen_id' => $this->statusdosen_id,
            'homebase_id' => $this->homebase_id,
        ]);

        $query->andFilterWhere(['like', 'nama', $this->nama])
            ->andFilterWhere(['like', 'jk', $this->jk])
            ->andFilterWhere(['like', 'tmp_lahir', $this->tmp_lahir])
            ->andFilterWhere(['like', 'alamat', $this->alamat])
            ->andFilterWhere(['like', 'noktp', $this->noktp])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'agama', $this->agama])
            ->andFilterWhere(['like', 'telpon', $this->telpon])
            ->andFilterWhere(['like', 'nik', $this->nik])
            ->andFilterWhere(['like', 'gelar_depan', $this->gelar_depan])
            ->andFilterWhere(['like', 'gelar_belakang', $this->gelar_belakang])
            ->andFilterWhere(['like', 'golongan', $this->golongan])
            ->andFilterWhere(['like', 'nidn', $this->nidn])
            ->andFilterWhere(['like', 'goldikti', $this->goldikti]);

        return $dataProvider;
    }
}
