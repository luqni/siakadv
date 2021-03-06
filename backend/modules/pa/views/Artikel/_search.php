<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\ArticleItemsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="article-items-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'alias') ?>

    <?= $form->field($model, 'catid') ?>

    <?= $form->field($model, 'userid') ?>

    <?php // echo $form->field($model, 'introtext') ?>

    <?php // echo $form->field($model, 'fulltext') ?>

    <?php // echo $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'access') ?>

    <?php // echo $form->field($model, 'language') ?>

    <?php // echo $form->field($model, 'ordering') ?>

    <?php // echo $form->field($model, 'hits') ?>

    <?php // echo $form->field($model, 'image') ?>

    <?php // echo $form->field($model, 'image_caption') ?>

    <?php // echo $form->field($model, 'image_credits') ?>

    <?php // echo $form->field($model, 'video') ?>

    <?php // echo $form->field($model, 'video_type') ?>

    <?php // echo $form->field($model, 'video_caption') ?>

    <?php // echo $form->field($model, 'video_credits') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'modified') ?>

    <?php // echo $form->field($model, 'modified_by') ?>

    <?php // echo $form->field($model, 'params') ?>

    <?php // echo $form->field($model, 'metadesc') ?>

    <?php // echo $form->field($model, 'metakey') ?>

    <?php // echo $form->field($model, 'robots') ?>

    <?php // echo $form->field($model, 'author') ?>

    <?php // echo $form->field($model, 'copyright') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
