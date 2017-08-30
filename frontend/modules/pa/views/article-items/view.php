<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ArticleItems */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Article', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-items-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <br>
    

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            
            'title',
            
            'articleCategories.name',
            'user.username',
            'fulltext:ntext',
            // 'state',
            // 'access',
            // // 'language',
            // // 'ordering',
            // 'hits',
            // 'image:ntext',
            // 'image_caption',
            // 'image_credits',
            // 'video:ntext',
            // 'video_type',
            // 'video_caption',
            // 'video_credits',
            // 'created',
            // 'created_by',
            // 'modified',
            // 'modified_by',
            // 'params:ntext',
            // 'metadesc:ntext',
            // 'metakey:ntext',
            // 'robots',
            // 'author',
            // 'copyright',
        ],
    ]) ?>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
        <?= Html::a('BACK', ['index'], ['class' => 'btn btn-primary']) ?>
    </p>

</div>
