<?php

use yii\helpers\Html;

?>

<div>
	<div>
		<h3><?= Html::a($model->title, ['view', 'id' => $model->id]) ?>
	</div>
	
	<div>
		Tanggal : <strong><?= date($model->created) ?></strong> 
		&nbsp; | &nbsp;
		Oleh : <strong><?= $model->user->username ?></strong>
		
		&nbsp; | &nbsp;
		Kategori : <strong><?= $model->articleCategories->name ?></strong>
	</div>

	<div>
		<p style="text-align: justify"><?= substr(strip_tags($model->introtext), 0, 300) ?></p>
		<?= Html::a('Selengkapnya', ['/site/view', 'id'=>$model->id], ['class' => 'btn btn-sm btn-primary']) ?>
		<br> </br>
		
	</div>
</div>