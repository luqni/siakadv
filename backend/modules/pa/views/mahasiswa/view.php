<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Mahasiswa */

// $this->title = $model->nim;
// $this->params['breadcrumbs'][] = ['label' => 'Mahasiswas', 'url' => ['index']];
// $this->params['breadcrumbs'][] = $this->title;
?>
<div class="mahasiswa-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <h1> Data Akademik </h1>
    <div class ="row">
    <div class = "col-md-8">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'tahunAkademik.nama',
            'prodi.nama',
            'peminatanProdi.nama',
            'status.nama',
            'ipk',
            'total_sks',
        ],
    ]) ?>

            <!-- 'mhsid', -->
            <!-- 'no_ijazah', -->
            <!-- 'tgl_lulus', -->
            <!-- 'user_id', -->

    <h1> Data Pribadi </h1>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'nim',
            'camaba.nama',
            'rombel.nama',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

    <p>
        <?= Html::a('Cancel', ['index'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->mhsid], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->mhsid], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

</div>
