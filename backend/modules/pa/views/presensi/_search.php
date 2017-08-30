<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\PresensiSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="presensi-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'prodi_id') ?>

    <?= $form->field($model, 'ta_id') ?>

    <?= $form->field($model, 'smt') ?>

    <?= $form->field($model, 'prgPendidikan') ?>

    <?php // echo $form->field($model, 'camaba_id') ?>

    <?php // echo $form->field($model, 'nim') ?>

    <?php // echo $form->field($model, 'mk_id') ?>

    <?php // echo $form->field($model, 'pertemuan2') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan2') ?>

    <?php // echo $form->field($model, 'pertemuan3') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan3') ?>

    <?php // echo $form->field($model, 'pertemuan4') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan4') ?>

    <?php // echo $form->field($model, 'pertemuan5') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan5') ?>

    <?php // echo $form->field($model, 'pertemuan6') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan6') ?>

    <?php // echo $form->field($model, 'pertemuan7') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan7') ?>

    <?php // echo $form->field($model, 'pertemuan8') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan8') ?>

    <?php // echo $form->field($model, 'pertemuan9') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan9') ?>

    <?php // echo $form->field($model, 'pertemuan10') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan10') ?>

    <?php // echo $form->field($model, 'pertemuan11') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan11') ?>

    <?php // echo $form->field($model, 'pertemuan12') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan12') ?>

    <?php // echo $form->field($model, 'pertemuan13') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan13') ?>

    <?php // echo $form->field($model, 'pertemuan14') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan14') ?>

    <?php // echo $form->field($model, 'nilai_presensi') ?>

    <?php // echo $form->field($model, 'status_presensi') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'pertemuan1') ?>

    <?php // echo $form->field($model, 'tgl_pertemuan1') ?>

    <?php // echo $form->field($model, 'kode_rombel') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
