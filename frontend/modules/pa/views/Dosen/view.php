<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\Dosen */

//$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Dosens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dosen-view">

    <h1 ><?= Html::encode($this->title) ?></h1>

    <h1 > Data Dosen </h1>
    <br>

    <div class ="row" >
    <div class = "col-md-8">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'nidn',
            'nama',
            'telpon',
            'homebase.nama',
            'kode_rombel',
            'email:email',

            // 'jk',
            // 'tmp_lahir',
            // 'tgl_lahir',
            // 'alamat',
            // 'noktp',
            
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

    <p>
        <?= Html::a('BACK', ['index'], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
    </p>


</div>
</div>
</div>
