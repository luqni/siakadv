<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Dosen */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dosen-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nidn')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nama')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telpon')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'homebase_id')->dropDownList(
                ArrayHelper::map(
                    frontend\modules\pa\models\Prodi::find()->all(),
                    'id', 'nama'),
                ['prompt' => '-- Pilih Program Studi --']
            ) ?>
            
    <?= $form->field($model, 'statusdosen_id')->textInput() ?>

    <!--<?= $form->field($model, 'jk')->dropDownList([ 'L' => 'L', 'P' => 'P', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'tmp_lahir')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tgl_lahir')->textInput() ?>

    <?= $form->field($model, 'alamat')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'noktp')->textInput(['maxlength' => true]) ?>

    

    <?= $form->field($model, 'agama')->dropDownList([ 'Islam' => 'Islam', 'Kristen' => 'Kristen', 'Khatolik' => 'Khatolik', 'Hindu' => 'Hindu', 'Budha' => 'Budha', 'KongHuCu' => 'KongHuCu', ], ['prompt' => '']) ?>

    

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

    <?= $form->field($model, 'nik')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'orgid')->textInput() ?>

    <?= $form->field($model, 'gelar_depan')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'gelar_belakang')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tglmulai_kerja')->textInput() ?>

    <?= $form->field($model, 'aktif')->textInput() ?>

    <?= $form->field($model, 'golongan')->textInput(['maxlength' => true]) ?>

    

    <?= $form->field($model, 'jafung_id')->textInput() ?>

    

    <?= $form->field($model, 'goldikti')->textInput(['maxlength' => true]) ?>
-->

    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
