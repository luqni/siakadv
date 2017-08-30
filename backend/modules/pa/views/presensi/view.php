<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Presensi */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Presensis', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="presensi-view">

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

 <h1> Data Mahasiswa </h1>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id',
            'prodi.nama',
            'ta.nama',
            'smt',
            'prgPendidikan0.nama',
            'kodeRombel.nama',
            'camaba.nama',
            'nim',
            ],
    ]) ?>

<h1> Data Presensi </h1>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'mk.nama',
            'pertemuan1',
            'tgl_pertemuan1',
            'pertemuan2',
            'tgl_pertemuan2',
            'pertemuan3',
            'tgl_pertemuan3',
            'pertemuan4',
            'tgl_pertemuan4',
            'pertemuan5',
            'tgl_pertemuan5',
            'pertemuan6',
            'tgl_pertemuan6',
            'pertemuan7',
            'tgl_pertemuan7',
            'pertemuan8',
            'tgl_pertemuan8',
            'pertemuan9',
            'tgl_pertemuan9',
            'pertemuan10',
            'tgl_pertemuan10',
            'pertemuan11',
            'tgl_pertemuan11',
            'pertemuan12',
            'tgl_pertemuan12',
            'pertemuan13',
            'tgl_pertemuan13',
            'pertemuan14',
            'tgl_pertemuan14',
            'nilai_presensi',
            'status_presensi',
            //'created_at',
            //'updated_at',
            //'created_by',
            //'updated_by',
            
        ],
    ]) ?>

</div>
