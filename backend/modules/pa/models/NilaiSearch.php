<?php

namespace backend\modules\pa\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\pa\models\Nilai;

/**
 * NilaiSearch represents the model behind the search form about `backend\modules\pa\models\Nilai`.
 */
class NilaiSearch extends Nilai
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['prodi_id', 'ta_id', 'prgPendidikan', 'mhs_id', 'mk_id', 'islock', 'created_by', 'updated_by', 'camaba_id', 'id'], 'integer'],
            [['smt', 'nim', 'grade', 'keterangan', 'status_nilai', 'created_at', 'updated_at', 'kode_rombel'], 'safe'],
            [['nilai_uas', 'nilai_uts', 'nilai_tugas1', 'nilai_tugas2', 'nilai_tugas3', 'nilai_presentasi', 'nilai_praktik', 'nilai_absensi', 'nilai_akhir'], 'number'],
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
        $query = Nilai::find();

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
            'prodi_id' => $this->prodi_id,
            'ta_id' => $this->ta_id,
            'prgPendidikan' => $this->prgPendidikan,
            'mhs_id' => $this->mhs_id,
            'mk_id' => $this->mk_id,
            'nilai_uas' => $this->nilai_uas,
            'nilai_uts' => $this->nilai_uts,
            'nilai_tugas1' => $this->nilai_tugas1,
            'nilai_tugas2' => $this->nilai_tugas2,
            'nilai_tugas3' => $this->nilai_tugas3,
            'nilai_presentasi' => $this->nilai_presentasi,
            'nilai_praktik' => $this->nilai_praktik,
            'nilai_absensi' => $this->nilai_absensi,
            'islock' => $this->islock,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'camaba_id' => $this->camaba_id,
            'nilai_akhir' => $this->nilai_akhir,
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['like', 'smt', $this->smt])
            ->andFilterWhere(['like', 'nim', $this->nim])
            ->andFilterWhere(['like', 'grade', $this->grade])
            ->andFilterWhere(['like', 'keterangan', $this->keterangan])
            ->andFilterWhere(['like', 'status_nilai', $this->status_nilai])
            ->andFilterWhere(['like', 'kode_rombel', $this->kode_rombel]);

        return $dataProvider;
    }
}
