<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\ArticleCategoriesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Article Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-categories-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Article Categories', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'alias',
            'description:ntext',
            'parentid',
            // 'state',
            // 'access',
            // 'language',
            // 'ordering',
            // 'image:ntext',
            // 'image_caption',
            // 'image_credits',
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
