<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Artikel';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-items-index">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Article', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            
            'title',
            'alias',
            'cat.name',
            'user.username',
            // 'introtext:ntext',
            // 'fulltext:ntext',
            // 'state',
            // 'access',
            // 'language',
            // 'ordering',
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
