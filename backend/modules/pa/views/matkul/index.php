<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
?>
<h1>Matkul</h1>
<ul>
<?php foreach ($matakuliahs as $matakuliah): ?>
    <li>
        <?= Html::encode("{$matakuliah->name} ({$matakuliah->code})") ?>:
        <?= $matakuliah->population ?>
    </li>
<?php endforeach; ?>
</ul>


<?= LinkPager::widget(['pagination' => $pagination]) ?>