<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\Mahasiswa */

// $this->title = $model->nim;
// $this->params['breadcrumbs'][] = ['label' => 'Mahasiswas', 'url' => ['index']];
// $this->params['breadcrumbs'][] = $this->title;
?>
<div class="mahasiswa-view">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <h1> Data Pribadi </h1>
    <div class ="row">
    <div class = "col-md-8">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'nim',
            'camaba.nama',
            'rombel.dosen.nama',
            'foto',
            
        ],
    ]) ?>


    <h1> Data Akademik </h1>
    
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'thn_masuk',
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

    <p>
        <?= Html::a('Index', ['index'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->mhsid], ['class' => 'btn btn-primary']) ?>
        
    </p>

</div>
</div>
</div>
