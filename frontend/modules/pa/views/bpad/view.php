<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganPa */

$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Akademik', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title = $model->id;
?>
<div class="bimbingan-pa-view">

  <!--   <h1><?= Html::encode($this->title) ?></h1> -->

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id',
            ['attribute' =>'tanggal',
            'format' => ['date', 'php:d-m-Y'],],
            'waktuBimbingan.nama',
            'mhs.camaba.nama',
            'semester',
            'dosen.nama',
            
            //'created_at',
            //'updated_at',
            //'created_by',
            //'updated_by',
            // 'ruang_id',
            // 'jamke_mulai',
            // 'jamke_akhir',
             
        ],
    ]) ?>

    <!-- INI UNTUK NAMPILIN TABEL KONSULTASI DARI BIMBINGAN DETAILS-->
    <!-- <h3>Detail Bimbingan Akademik Mahasiswa</h3> -->
    
    <?= GridView::widget([
        'dataProvider' => new yii\data\ActiveDataProvider([
                'query' => $model-> getBimbinganDetails(),
                'pagination' => false
            ]),

        'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
            'jenisBimbingan.nama',
            'konsultasi',
            'tanggapan',
            
        

        ['class' => 'yii\grid\ActionColumn',
        'header' => 'Actions',
            'template' => '{view} {update}',
            'controller' => 'bpad-detail'],
        ],
        
        ])?>

    <p>
        <?= Html::a('BACK', ['index'], ['class' => 'btn btn-primary']) ?>
    </p>

</div>
