<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganPaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bimbingan-pa-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'tanggal') ?>

    <?= $form->field($model, 'dosenpa_id') ?>

    <?= $form->field($model, 'mhsid') ?>

    <?= $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'semester') ?>

    <?php // echo $form->field($model, 'ruang_id') ?>

    <?php // echo $form->field($model, 'jamke_mulai') ?>

    <?php // echo $form->field($model, 'jamke_akhir') ?>

     <?php // echo $form->field($model, 'waktu_bimbingan') ?> 

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
