<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ArticleItems */

$this->title = 'Update Article: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Article Item', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="article-items-update">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
