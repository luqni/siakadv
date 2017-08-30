<?php

use yii\helpers\Html;
use yii\grid\GridView;
// use yii\bootstrap\Modal;
use yii\helpers\Url;
use Yii;


/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\BimbinganPaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bimbingan Akademik ' ;
// ini yg didalam tanda kurung seharusnya diletakkan di line 14  (. Yii::$app->user->identity->id;)
$user = Yii::$app->user->identity;
$civitas = $user->getCivitas();
//echo $civitas->nim;

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-pa-index">

    <h1 align='center'><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <!-- <?= Html::button('Create Bimbingan', ['value'=>Url::to('bimbingan-pa/create'), 'class' => 'btn btn-success', 'id' => 'modalButton']) ?> -->
        <?= Html::a('Create Bimbingan', ['create'], ['class' => 'btn btn-success'])?>
    </p>

   <!--  <?php
        // Modal::begin([
        //         'header' => '<h4> Bimbingan Akademik </h4>',
        //         'id' => 'modal',
        //         'size' => 'modal-lg', //lg as a larger, bisa sm as a small
        //     ]);

        // echo "<div id='modalContent'></div>";

        // Modal::end();
    ?>     -->

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
            'dosen.nama',
            //'jenisBimbingan.nama',
            
            //'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'semester',
            // 'ruang_id',
            // 'jamke_mulai',
            // 'jamke_akhir',

            ['class' => 'yii\grid\ActionColumn',
            'header' => 'Actions',
            'template' => '{view} {update}',
            'controller' => 'bimbingan-pa'],
        ],
    ]); ?>
</div>
