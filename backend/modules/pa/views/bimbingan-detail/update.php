<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\BimbinganDetail */

$this->title = 'Update Bimbingan Detail: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="bimbingan-detail-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
