<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widget\Pjax;
use backend\modules\pa\models\Mahasiswa;
use backend\modules\pa\models\Matakuliah;
use backend\modules\pa\models\Camaba;
use backend\modules\pa\models\TahunAkademik;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\NilaiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Nilais';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="nilai-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Nilai', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'rowOptions' => function($model)
                        {
                            if($model->status_nilai=='Bermasalah')
                            {
                                return ['class'=>'danger'];
                            }
                        },
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'prodi.nama',
            'smt',
            //'tahunakademik'
            //'tahunAkademik.nama',
            'nim',
            'camaba.nama',
            //'prgPendidikan',
            //'mhs_id',
            //'mk.nama',
            // 'nilai_uas',
            // 'nilai_uts',
            // 'nilai_tugas1',
            // 'nilai_tugas2',
            // 'nilai_tugas3',
            // 'nilai_presentasi',
            // 'nilai_praktik',
            // 'nilai_absensi',
            //'grade',
            // 'islock',
            // 'keterangan',
            //'status_nilai',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'kode_rombel',
            // 'nilai_akhir',
            // 'id',

            ['class' => 'yii\grid\ActionColumn'],
        ],

    ]); ?>
<?= Html::button('Detail', ['value' =>Url::to('backend\modules\pa\models\mahasiswa ') , 'class' => 'btn btn-success']) ?>
</div>
