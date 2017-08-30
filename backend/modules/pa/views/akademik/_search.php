<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\NilaiSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nilai-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'prodi_id') ?>

    <?= $form->field($model, 'ta_id') ?>

    <?= $form->field($model, 'smt') ?>

    <?= $form->field($model, 'prgPendidikan') ?>

    <?= $form->field($model, 'mhs_id') ?>

    <?php // echo $form->field($model, 'nim') ?>

    <?php // echo $form->field($model, 'mk_id') ?>

    <?php // echo $form->field($model, 'nilai_uas') ?>

    <?php // echo $form->field($model, 'nilai_uts') ?>

    <?php // echo $form->field($model, 'nilai_tugas1') ?>

    <?php // echo $form->field($model, 'nilai_tugas2') ?>

    <?php // echo $form->field($model, 'nilai_tugas3') ?>

    <?php // echo $form->field($model, 'nilai_presentasi') ?>

    <?php // echo $form->field($model, 'nilai_praktik') ?>

    <?php // echo $form->field($model, 'nilai_absensi') ?>

    <?php // echo $form->field($model, 'grade') ?>

    <?php // echo $form->field($model, 'islock') ?>

    <?php // echo $form->field($model, 'keterangan') ?>

    <?php // echo $form->field($model, 'status_nilai') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'camaba_id') ?>

    <?php // echo $form->field($model, 'kode_rombel') ?>

    <?php // echo $form->field($model, 'nilai_akhir') ?>

    <?php // echo $form->field($model, 'id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
