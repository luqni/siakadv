<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use backend\modules\pa\models\Mahasiswa;
use backend\modules\pa\models\Matakuliah;
use backend\modules\pa\models\Camaba;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Nilai */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nilai-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'prodi_id')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\Prodi::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Studi --']
    ) ?>

    <?= $form->field($model, 'ta_id')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\TahunAkademik::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Tahun Akademik --']
    ) ?>

    <?= $form->field($model, 'smt')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'prgPendidikan')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\ProgramPendidikan::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'kode_rombel')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\Rombel::find()->all(),
            'kode', 'nama'),
        ['prompt' => '-- Pilih Pembimbing Akademik --']
    ) ?>

    <?= $form->field($model, 'camaba_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Camaba::find()->all(), 'id', 'nama'),
        'language' => 'en',
        'options' => ['placeholder' => '-- Pilih Nama Mahasiswa --'],
        'pluginOptions' => [
        'allowClear' => true
        ],
    ]); ?>

    <?= $form->field($model, 'nim')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mk_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Matakuliah::find()->all(), 'id', 'nama'),
        'language' => 'en',
        'options' => ['placeholder' => '-- Pilih Mata Kuliah --'],
        'pluginOptions' => [
        'allowClear' => true
        ],
    ]); ?>

    <?= $form->field($model, 'nilai_uas')->textInput() ?>

    <?= $form->field($model, 'nilai_uts')->textInput() ?>

    <?= $form->field($model, 'nilai_tugas1')->textInput() ?>

    <?= $form->field($model, 'nilai_tugas2')->textInput() ?>

    <?= $form->field($model, 'nilai_tugas3')->textInput() ?>

    <?= $form->field($model, 'nilai_presentasi')->textInput() ?>

    <?= $form->field($model, 'nilai_praktik')->textInput() ?>

    <?= $form->field($model, 'nilai_absensi')->textInput() ?>

    <?= $form->field($model, 'grade')->textInput(['maxlength' => true]) ?>

    <!-- <?= $form->field($model, 'keterangan')->textInput(['maxlength' => true]) ?> -->

    <?= $form->field($model, 'status_nilai')->dropDownList([ 'Baik' => 'Baik', 'Bermasalah' => 'Bermasalah', ], ['prompt' => 'Status Nilai']) ?>


    <!-- <?= $form->field($model, 'islock')->textInput() ?> -->

    <!-- <?= $form->field($model, 'created_at')->textInput() ?> -->

    <!-- <?= $form->field($model, 'updated_at')->textInput() ?> -->

    <!-- <?= $form->field($model, 'created_by')->textInput() ?> -->

    <!-- <?= $form->field($model, 'updated_by')->textInput() ?> -->

    <!-- <?= $form->field($model, 'nilai_akhir')->textInput() ?> -->


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
