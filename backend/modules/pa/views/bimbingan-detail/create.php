<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\BimbinganDetail */

$this->title = 'Create Bimbingan Detail';
$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
