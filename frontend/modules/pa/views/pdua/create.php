<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\Dosen */

$this->title = 'Create Dosen';
$this->params['breadcrumbs'][] = ['label' => 'Dosens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dosen-create">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
