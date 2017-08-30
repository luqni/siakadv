<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganPa */

//$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Akademik', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-pa-view">

    <h1><?= Html::encode($this->title) ?></h1>

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
    <p>
        <?= Html::a('Create Bimbingan Detail', ['/pa/bimbingan-detail/create', 'idpa'=>$model->id], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => new yii\data\ActiveDataProvider([
                'query' => $model-> getBimbinganDetails(),
                'pagination' => false
            ]),
        'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
             // 'id',
            // 'bimbingan_id',
            'jenisBimbingan.nama',
            'konsultasi',
            'tanggapan',

        ['class' => 'yii\grid\ActionColumn',
        'header' => 'Actions',
            'template' => '{view} {update}',
            'controller' => 'bimbingan-detail'],
        ],
            
        ])?>

    <p align="right">
        <?= Html::a('BACK', ['index'], ['class' => 'btn btn-primary']) ?>
        <!-- <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?> -->
        <!-- <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?> -->
    </p>

</div>
