<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\KhsDetail */

$this->title = 'Create Khs Detail';
$this->params['breadcrumbs'][] = ['label' => 'Khs Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="khs-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
