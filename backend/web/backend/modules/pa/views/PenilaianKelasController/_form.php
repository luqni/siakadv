<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\PenilaianKelas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="penilaian-kelas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id')->textInput() ?>

    <?= $form->field($model, 'persen_absen')->textInput() ?>

    <?= $form->field($model, 'persen_uts')->textInput() ?>

    <?= $form->field($model, 'persen_uas')->textInput() ?>

    <?= $form->field($model, 'persen_tugas1')->textInput() ?>

    <?= $form->field($model, 'persen_tugas2')->textInput() ?>

    <?= $form->field($model, 'persen_tugas3')->textInput() ?>

    <?= $form->field($model, 'persen_presentasi')->textInput() ?>

    <?= $form->field($model, 'persen_praktik')->textInput() ?>

    <?= $form->field($model, 'islock')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

    <?= $form->field($model, 'mahasiswa_mhswid')->textInput() ?>

    <?= $form->field($model, 'khs_detail_grade')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'matakuliah_id')->textInput() ?>

    <?= $form->field($model, 'status_nilai')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
