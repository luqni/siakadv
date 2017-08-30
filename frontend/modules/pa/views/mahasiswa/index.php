<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\MahasiswaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Mahasiswa';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mahasiswa-index">

    <h2><?= Html::encode($this->title) ?></h2>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!-- <p>
       
        <?= Html::a('Create Mahasiswa', ['create'], ['class' => 'btn btn-success']) ?>
    
    </p> -->

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'thn_masuk',
            'nim',
            'camaba.nama',
            'status.nama',
            'prodi.nama',
            // ['attribute' => 'dosen.nama',
            // 'value' => 'dosen.nama'
            // ],

            // 'no_ijazah',
            // 'tgl_lulus',
            // 'camaba_id',
            // 'prodi_id',
            // 'status_id',
            // 'peminatan_id',
            // 'user_id',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

          
            ['class' => 'yii\grid\ActionColumn',
        'header' => 'Actions',
            'template' => '{view} {update}',
            'controller' => 'mahasiswa'],
        ],
    ]); ?>
</div>
