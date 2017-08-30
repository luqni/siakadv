<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\thesis\models\SeminarTaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Seminar Tas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seminar-ta-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Seminar Ta', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'tgl',
            'ta_id',
            'nilai_akhir',
            'nilai_total_pembimbing',
            // 'nilai_total_penguji1',
            // 'nilai_total_penguji2',
            // 'jenis_seminar_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
