<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\PenilaianKelasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Penilaian Kelas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="penilaian-kelas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Penilaian Kelas', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'persen_absen',
            'persen_uts',
            'persen_uas',
            'persen_tugas1',
            // 'persen_tugas2',
            // 'persen_tugas3',
            // 'persen_presentasi',
            // 'persen_praktik',
            // 'islock',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'mahasiswa_mhswid',
            // 'khs_detail_grade',
            // 'matakuliah_id',
            // 'status_nilai:boolean',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
