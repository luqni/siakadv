<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use mdm\widgets\GridInput;
use dosamigos\datepicker\DatePicker;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\BimbinganPa */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="row">
    <div class = "col-md-6">
<div class="bimbingan-pa-form">
  <!--  <table class="table table-stripped"> -->

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tanggal')->widget(DatePicker::className(), [
            'clientOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-m-d'
            ]
        ])
    ?>

    <?= $form->field($model, 'dosenpa_id')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Dosen::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Pembimbing Akademik --']
    ) ?>

    <?= $form->field($model, 'mhsid')->textInput() ?> 

   <!-- ini biar diisi otomatis sama sistem nantinya 
    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>
    -->

    <?= $form->field($model, 'semester')->textInput(['maxlength' => true]) ?>

</div>
</div>

    <div class = "col-md-6">

    <?= $form->field($model, 'waktu_bimbingan')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\WaktuPa::find()->all(),
            'id', 'nama'),
        ['prompt' => '-- Pilih Waktu Bimbingan --']
    ) ?>

    <?= $form->field($model, 'jamke_mulai')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Jamke::find()->all(),
            'id', 'mulai'),
        ['prompt' => '-- Pilih --']
    ) ?>

    <?= $form->field($model, 'jamke_akhir')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Jamke::find()->all(),
            'id', 'akhir'),
        ['prompt' => '-- Pilih --']
    ) ?>

    <?= $form->field($model, 'ruang_id')->dropDownList(
        ArrayHelper::map(
            frontend\modules\pa\models\Ruang::find()->all(),
            'id', 'kode'),
        ['prompt' => '-- Pilih Ruangan --']
    ) ?> 

   </div>
</div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancel', ['index'], ['class' => 'btn btn-danger'])?>
    </div>

    
    <!-- INI UNTUK NAMPILIN TABEL DIBAWAH KOLOM INPUTAN -->
   <!--  <div class="form-group">
        <?= 
            GridInput::widget ([
                'allModels' => $model->bimbinganDetails,
                'model' => \frontend\modules\pa\models\BimbinganDetail::className(),
                'form' => $form,
                'columns' => [
                    ['class' => 'mdm\widgets\SerialColumn'],
                    'konsultasi',
                    'tanggapan',
                    ['class' => 'mdm\widgets\ButtonColumn']
                    ],
                    'hiddens' => ['id']
                
            ]);
        ?>
    </div> -->

    <?php ActiveForm::end(); ?>

</div>
  