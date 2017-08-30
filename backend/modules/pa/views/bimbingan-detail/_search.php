<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\BimbinganDetailSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bimbingan-detail-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'bimbingan_id') ?>

    <?= $form->field($model, 'konsultasi') ?>

    <?= $form->field($model, 'tanggapan') ?>

    <?= $form->field($model, 'jenis_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
