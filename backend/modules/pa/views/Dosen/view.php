<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Dosen */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Dosens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dosen-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

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
            'nidn',
            'gelar_depan', 'nama', 'gelar_belakang',
            'telpon',
            'homebase_id',

            // 'jk',
            // 'tmp_lahir',
            // 'tgl_lahir',
            // 'alamat',
            // 'noktp',
            // 'email:email',
            // 'agama',
            
            // 'user_id',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'nik',
            // 'orgid',
           
            // 'tglmulai_kerja',
            // 'aktif',
            // 'golongan',
            // 'id',
            
            // 'jafung_id',
            // 'statusdosen_id',
            // 'goldikti',
            
        ],
    ]) ?>

</div>
