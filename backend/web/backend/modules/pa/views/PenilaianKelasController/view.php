<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\PenilaianKelas */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Penilaian Kelas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="penilaian-kelas-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'persen_absen',
            'persen_uts',
            'persen_uas',
            'persen_tugas1',
            'persen_tugas2',
            'persen_tugas3',
            'persen_presentasi',
            'persen_praktik',
            'islock',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
            'mahasiswa_mhswid',
            'khs_detail_grade',
            'matakuliah_id',
            'status_nilai:boolean',
        ],
    ]) ?>

</div>
