<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganDetail */

$this->title = $model->id;
// $this->params['breadcrumbs'][] = ['label' => 'Bimbingan Details', 'url' => ['#']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-detail-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
     <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id',
            // 'bimbingan_id',
            'jenisBimbingan.nama',
            'konsultasi:ntext',
            'tanggapan:ntext',
            
        ],
    ]) ?>

     <p>
         <?= Html::a('Bimbingan Akademik', ['/pa/bpad/view', 'id'=>$model->bimbingan_id], ['class' => 'btn btn-primary']) ?>
    </p>

</div>
