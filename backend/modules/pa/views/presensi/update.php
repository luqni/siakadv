<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Presensi */

$this->title = 'Update Presensi: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Presensis', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="presensi-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
