<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\BimbinganDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bimbingan-detail-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'bimbingan_id')->textInput() ?>

    <?= $form->field($model, 'konsultasi')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'tanggapan')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'jenis_id')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\JenisBimbingan::find()->all(),
            'id', 'nama'),
        ['prompt' => '- Pilih Kategori -']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
