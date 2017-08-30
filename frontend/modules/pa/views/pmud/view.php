<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\modules\pa\models\Mahasiswa */

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
            'thn_masuk',
            'prodi.nama',
            'peminatanProdi.nama',
            'status.nama',
            'total_sks',
            'ipk',
            
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
            'camaba.alamat',
            'camaba.telpon',
            'camaba.email',
            'rombel.dosen.nama',
        ],
    ]) ?>

    <p>
        <?= Html::a('Index', ['index'], ['class' => 'btn btn-primary']) ?>
        
    </p>

</div>
</div>
</div>
