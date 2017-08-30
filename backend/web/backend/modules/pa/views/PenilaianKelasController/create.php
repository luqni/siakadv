<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\PenilaianKelas */

$this->title = 'Create Penilaian Kelas';
$this->params['breadcrumbs'][] = ['label' => 'Penilaian Kelas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="penilaian-kelas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>