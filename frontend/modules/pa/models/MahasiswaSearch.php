<?php

namespace frontend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\modules\pa\models\Mahasiswa;

/**
 * MahasiswaSearch represents the model behind the search form about `frontend\modules\pa\models\Mahasiswa`.
 */
class MahasiswaSearch extends Mahasiswa
{
    public $camabaname;
    public $statusname;
    public $prodiname;
    public $dospemname;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mhsid', 'thn_masuk', 'total_sks', 'camaba_id', 'prodi_id', 'status_id', 'peminatan_id', 'user_id', 'created_by', 'updated_by'], 'integer'],
            [['nim', 'no_ijazah', 'tgl_lulus', 'kode_rombel', 'created_at', 'updated_at'], 'safe'],
            [['ipk'], 'number'],
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
        $query = Mahasiswa::find();

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
            'mhsid' => $this->mhsid,
            'thn_masuk' => $this->thn_masuk,
            'ipk' => $this->ipk,
            'total_sks' => $this->total_sks,
            'tgl_lulus' => $this->tgl_lulus,
            'camaba_id' => $this->camaba_id,
            'prodi_id' => $this->prodi_id,
            'status_id' => $this->status_id,
            'peminatan_id' => $this->peminatan_id,
            'user_id' => $this->user_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'nim', $this->nim])
            ->andFilterWhere(['like', 'no_ijazah', $this->no_ijazah])
            ->andFilterWhere(['like', 'kode_rombel', $this->kode_rombel]);

        return $dataProvider;
    }
}
