<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\thesis\models\SeminarTa */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Seminar Tas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seminar-ta-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
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
            'id',
            'tgl',
            'ta_id',
            'nilai_akhir',
            'nilai_total_pembimbing',
            'nilai_total_penguji1',
            'nilai_total_penguji2',
            'jenis_seminar_id',
        ],
    ]) ?>

</div>
