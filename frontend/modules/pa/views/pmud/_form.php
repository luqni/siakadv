<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\Mahasiswa */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mahasiswa-form">

    <?php $form = ActiveForm::begin(['options'=>[
                                    'enctype'=>'multipart/form-data']
    ]); ?>

    <?= $form->field($model, 'thn_masuk')->textInput() ?>

    <?= $form->field($model, 'prodi_id')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Prodi::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Studi --']
    ) ?>

    <?= $form->field($model, 'peminatan_id')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\PeminatanProdi::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Peminatan --']
    ) ?>

    <?= $form->field($model, 'status_id')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\StatusMahasiswa::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Status Mahasiswa --']
    ) ?>

    <?= $form->field($model, 'ipk')->textInput() ?>

    <?= $form->field($model, 'total_sks')->textInput() ?>

    <?= $form->field($model, 'nim')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'camaba_id')->textInput() ?>

    <?= $form->field($model, 'kode_rombel')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Rombel::find()->all(),
            'kode', 'dosen.nama'),
        ['prompt' => '-- Pilih Pembimbing Akademik --']
    ) ?>

    <?= $form->field($model, 'file')->fileInput() ?>    

    <!-- <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>
    -->

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
