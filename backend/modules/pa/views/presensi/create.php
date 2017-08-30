<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Presensi */

$this->title = 'Create Presensi';
$this->params['breadcrumbs'][] = ['label' => 'Presensis', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="presensi-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
