<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\ArticleItems */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="article-items-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alias')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'catid')->dropDownList(
        ArrayHelper::map(
            backend\modules\pa\models\ArticleCategories::find()->all(),
            'id', 'name'),
        ['prompt' => '-- Pilih Kategori --']
    ) ?>

    <?= $form->field($model, 'userid')->textInput() ?>

    <?= $form->field($model, 'introtext')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fulltext')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'state')->textInput() ?>

    <?= $form->field($model, 'access')->textInput() ?>

    <?= $form->field($model, 'language')->textInput(['maxlength' => true]) ?>
<!-- 
    <?= $form->field($model, 'ordering')->textInput() ?>

    <?= $form->field($model, 'hits')->textInput() ?>

    <?= $form->field($model, 'image')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'image_caption')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'image_credits')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'video')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'video_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'video_caption')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'video_credits')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'modified')->textInput() ?>

    <?= $form->field($model, 'modified_by')->textInput() ?>

    <?= $form->field($model, 'params')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'metadesc')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'metakey')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'robots')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'author')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'copyright')->textInput(['maxlength' => true]) ?> -->

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
