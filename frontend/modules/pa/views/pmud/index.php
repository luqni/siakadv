<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\MahasiswaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */


$user = Yii::$app->user->identity;
$civitas = $user->getCivitas();


$this->params['breadcrumbs'][] = $this->title = 'Pembimbing Akademik = '. strtolower($civitas->nama);

?>

<div class="col-lg-4 col-lg-offset-8">
    <div class="input-group">
        <input type="text" id = "inp-name" placeholder="Masukan Tahun Akademik"
        value="<?=Html::encode($model->thn_masuk); ?>" class="form-control">
        <span class="input-group-btn">
            <button type="button" class="btn btn-primary btn-flat" id="btn-name"> Pilih </button>
        </span>
    </div><br>
</div>

<div class="mahasiswa-index">

    <h1 align='center'> Daftar Mahasiswa Bimbingan </h1> <br>
    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'thn_masuk',
            'nim',
            'camaba.nama',
            'status.nama',
            'prodi.nama',
            ['attribute' => 'dosenpa_id',
            'value' => 'rombel.dosen.nama',
            'header' => "Pembimbing Akademik"],
            
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
            'template' => '{view}'] ,
        ],
    ]); ?>
</div>
