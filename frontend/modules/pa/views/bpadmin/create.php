<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganPa */

$this->title = 'Create Bimbingan';
$this->params['breadcrumbs'][] = ['label' => 'Bimbingan Akademik', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bimbingan-pa-create">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
