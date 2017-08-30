<?php

use yii\helpers\Html;
use yii\grid\GridView;
use Yii;


/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\BimbinganPaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bimbingan Akademik ' ;
// . Yii::$app->user->identity->id;
$user = Yii::$app->user->identity;
$civitas = $user->getCivitas();
echo $civitas->nim;

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-pa-index">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Bimbingan', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            
            'tanggal',
            'waktuBimbingan.nama', 
            'mhs.camaba.nama',
            'dosen.nama',
            
            
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
            'template' => '{view}',
            'controller' => 'pdum'],
        ],
    ]); ?>
</div>
