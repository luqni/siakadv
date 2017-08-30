<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use Yii;


/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\BimbinganPaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bimbingan Akademik ' ; //Yii::$app->user->identity->id;
$user = Yii::$app->user->identity;
$civitas = $user->getCivitas();
//echo $civitas->nama;
//echo Yii::$app->user->identity->id;


// $this->params['breadcrumbs'][] = $this->title;
$this->params['breadcrumbs'][] = $this->title = 'Bimbingan Akademik '. strtolower($civitas->nama);
?>
<div class="bimbingan-pa-index">

    <h1 align='center'><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!-- MENAMPILKAN POPUP WINDOWS -->
    <?php
        Modal::begin([
                'header' => '<h4> Bimbingan Akademik </h4>',
                'id' => 'modal',
                'size' => 'modal-lg', //lg as a larger, bisa sm as a small
            ]);

        echo "<div id='modalContent'></div>";

        Modal::end();
    ?>    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            // 'id',
            ['attribute' =>'tanggal',
            'format' => ['date', 'php:d-m-Y'],],
            'waktuBimbingan.nama', 
            'mhs.camaba.nama',
            // 'bimbinganDetails.kategori',
            // 'bimbinganDetails.tanggapan',


            ['class' => 'yii\grid\ActionColumn',
            'header' => 'Actions',
            'template' => '{view}'] ,
        ],
    ]); ?>
</div>
