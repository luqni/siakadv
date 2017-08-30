<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\BimbinganPa */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Akademik', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-pa-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Index', ['index'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id',
            'tanggal',
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
        
        
        // $this->title = 'Create Bimbingan Detail';
        // $this->params['breadcrumbs'][] = ['label' => 'Bimbingan Details', 'url' => ['index']];
        
        
        'columns' => [
            'id',
            'bimbingan_id',
            'konsultasi',
            'tanggapan',
            'jenisBimbingan.nama',
        ]
        ])?>

</div>
