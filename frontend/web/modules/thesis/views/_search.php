<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\modules\thesis\models\SeminarTaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="seminar-ta-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'tgl') ?>

    <?= $form->field($model, 'ta_id') ?>

    <?= $form->field($model, 'nilai_akhir') ?>

    <?= $form->field($model, 'nilai_total_pembimbing') ?>

    <?php // echo $form->field($model, 'nilai_total_penguji1') ?>

    <?php // echo $form->field($model, 'nilai_total_penguji2') ?>

    <?php // echo $form->field($model, 'jenis_seminar_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
