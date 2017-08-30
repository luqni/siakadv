<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\pa\models\BimbinganDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bimbingan Details';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-detail-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Bimbingan Detail', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
            'attribute' => 'kategoriname',
            'value' => 'jenisBimbingan.nama',
            ],
            'konsultasi:ntext',
            'tanggapan:ntext',
            

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
