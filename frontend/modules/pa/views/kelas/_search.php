<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\KelasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="kelas-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'ta_id') ?>

    <?= $form->field($model, 'mk_id') ?>

    <?= $form->field($model, 'ruang_id') ?>

    <?= $form->field($model, 'dosen_id') ?>

    <?php // echo $form->field($model, 'asdos_id') ?>

    <?php // echo $form->field($model, 'jamke_mulai') ?>

    <?php // echo $form->field($model, 'jamke_akhir') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'hari') ?>

    <?php // echo $form->field($model, 'semester') ?>

    <?php // echo $form->field($model, 'kode') ?>

    <?php // echo $form->field($model, 'abbr') ?>

    <?php // echo $form->field($model, 'tm') ?>

    <?php // echo $form->field($model, 'prk') ?>

    <?php // echo $form->field($model, 'lap') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
