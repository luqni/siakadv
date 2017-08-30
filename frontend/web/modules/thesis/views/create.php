<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\modules\thesis\models\SeminarTa */

$this->title = 'Create Seminar Ta';
$this->params['breadcrumbs'][] = ['label' => 'Seminar Tas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seminar-ta-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
