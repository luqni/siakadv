<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ArticleItems */

$this->title = 'Create Article';
$this->params['breadcrumbs'][] = ['label' => 'Article', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-items-create">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
