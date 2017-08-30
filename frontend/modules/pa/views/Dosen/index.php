<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\DosenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Data Dosen';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dosen-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'nidn',
            'nama',
            'homebase.nama',
            'kode_rombel',
            // 'email:email',
            // 'jk',
            // 'tmp_lahir',
            // 'tgl_lahir',
            // 'alamat',
            
            // 'noktp',
            
            // 'agama',
            // 'telpon',
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
            
            // 'jafung_id',
            // 'statusdosen_id',
            // 'goldikti',
            

            ['class' => 'yii\grid\ActionColumn',
            'header' => 'Actions',
            'template' => '{view} {update}',
            'controller' => 'dosen'],
        ],
    ]); ?>
</div>
