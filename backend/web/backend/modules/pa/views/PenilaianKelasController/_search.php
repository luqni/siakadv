<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\PenilaianKelasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="penilaian-kelas-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'persen_absen') ?>

    <?= $form->field($model, 'persen_uts') ?>

    <?= $form->field($model, 'persen_uas') ?>

    <?= $form->field($model, 'persen_tugas1') ?>

    <?php // echo $form->field($model, 'persen_tugas2') ?>

    <?php // echo $form->field($model, 'persen_tugas3') ?>

    <?php // echo $form->field($model, 'persen_presentasi') ?>

    <?php // echo $form->field($model, 'persen_praktik') ?>

    <?php // echo $form->field($model, 'islock') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'mahasiswa_mhswid') ?>

    <?php // echo $form->field($model, 'khs_detail_grade') ?>

    <?php // echo $form->field($model, 'matakuliah_id') ?>

    <?php // echo $form->field($model, 'status_nilai')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
