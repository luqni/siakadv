<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\modules\thesis\models\SeminarTa */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="seminar-ta-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tgl')->textInput() ?>

    <?= $form->field($model, 'ta_id')->textInput() ?>

    <?= $form->field($model, 'nilai_akhir')->textInput() ?>

    <?= $form->field($model, 'nilai_total_pembimbing')->textInput() ?>

    <?= $form->field($model, 'nilai_total_penguji1')->textInput() ?>

    <?= $form->field($model, 'nilai_total_penguji2')->textInput() ?>

    <?= $form->field($model, 'jenis_seminar_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
