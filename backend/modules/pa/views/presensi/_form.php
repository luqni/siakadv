<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use dosamigos\datepicker\DatePicker;
use backend\modules\pa\models\Mahasiswa;
use backend\modules\pa\models\Matakuliah;
use backend\modules\pa\models\Camaba;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Presensi */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="row">
    <div class = "col-md-6">
<div class="presensi-form">

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
</div>


    <div class = "col-md-6">
    <?= $form->field($model, 'pertemuan1')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>



    <?= $form->field($model, 'tgl_pertemuan1')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan2')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan2')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan3')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan3')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan4')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan4')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan5')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan5')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan6')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan6')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan7')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan7')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>
</div> </div>
<div class = "col-md-6">
    <?= $form->field($model, 'pertemuan8')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan8')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan9')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan9')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan10')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan10')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan11')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan11')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan12')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan12')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan13')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan13')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'pertemuan14')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\StatusAbsen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Program Pendidikan --']
    ) ?>

    <?= $form->field($model, 'tgl_pertemuan14')->widget( 
         DatePicker::className(), [
                // inline too, not bad
                 'inline' => false, 
                 // modify template for custom rendering
                //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'dd-M-yyyy'
                ]
              ]);
    ?>

    <?= $form->field($model, 'nilai_presensi')->textInput() ?>

    <?= $form->field($model, 'status_presensi')->dropDownList([ 'Baik' => 'Baik', 'Bermasalah' => 'Bermasalah', ], ['prompt' => '']) ?>

    <!-- <?= $form->field($model, 'created_at')->textInput() ?> -->

    <!-- <?= $form->field($model, 'updated_at')->textInput() ?> -->

    <!-- <?= $form->field($model, 'created_by')->textInput() ?> -->

    <!-- <?= $form->field($model, 'updated_by')->textInput() ?> -->

</div.
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
