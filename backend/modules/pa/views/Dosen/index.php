<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\DosenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Daftar Dosen';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dosen-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Dosen', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'nidn',
            'nama',
            // 'jk',
            // 'tmp_lahir',
            // 'tgl_lahir',
            // 'alamat',
            'homebase.nama',
            // 'noktp',
            'email:email',
            // 'agama',
            'telpon',
            // 'user_id',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'nik',
            // 'orgid',
            // 'gelar_depan',
            // 'gelar_belakang',
            // 'tglmulai_kerja',
            // 'aktif',
            // 'golongan',
            // 'id',
            // 'nidn',
            // 'jafung_id',
            // 'statusdosen_id',
            // 'goldikti',
            // 'homebase_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
