<?php

use yii\helpers\Html;
use common\models\ArticleItems;

$this->title = Yii::$app->name.' - '. $model->id;

?>

 <div>
	<div>
		<h3><?= Html::a($model->article->title, ['view2', 'id' => $model->id]) ?>
			<br> </br>
	</div>
	
	<div>
		Tanggal : <strong><?= date($model->article->created) ?></strong> 
		
		&nbsp; | &nbsp;
		Oleh : <strong><?= $model->article->user->username ?></strong>
		
		&nbsp; | &nbsp;
		Kategori : <strong><?= $model->name ?></strong>
	
	</div>

	<div>
		<?php

		use yii\widgets\ListView;

        $this->title = Yii::$app->name;

		echo ListView::widget([
                        'dataProvider' => $dataProviderKategori,
                        'layout' => "{items}\n{pager}",
                        'itemOptions' => ['class' => 'item'],
                        'itemView' => '_itemArtikel'
                    ]);
        ?>

		<?= ($model->article->fulltext) ?></div>
</div>
 