<?php

use yii\widgets\ActiveForm;	
use yii\helpers\Html;
use yii\widgets\ListView;
$this->title = Yii::$app->name.' - '. $model->title;

?>

<div >
	<div >
		<h3><?= Html::a($model->title, ['view', 'id' => $model->id]) ?>
			<br> </br>
	</div>
	
	<div >
		Tanggal : <strong><?= date($model->created) ?></strong> 
		
		&nbsp; | &nbsp;
		Oleh : <strong><?= $model->user->username ?></strong>
		
		&nbsp; | &nbsp;
		Kategori : <strong><?= $model->articleCategories->name ?></strong>

		<br> </br>
	
	</div>
	<div ><?= nl2br($model->fulltext) ?></div>
</div>


