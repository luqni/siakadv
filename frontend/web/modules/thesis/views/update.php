<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\modules\thesis\models\SeminarTa */

$this->title = 'Update Seminar Ta: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Seminar Tas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="seminar-ta-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
