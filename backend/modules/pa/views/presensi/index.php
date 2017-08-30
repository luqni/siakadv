<?php

use yii\helpers\Html;
use yii\grid\GridView;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\pa\models\PresensiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Presensis';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="presensi-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Presensi', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'rowOptions' => function($model)
                        {
                            if($model->status_presensi=='Bermasalah')
                            {
                                return ['class'=>'danger'];
                            }
                        },
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'prodi.nama',
            'nim',
            'smt',
            //'ta_id',
            //'prgPendidikan',
            'camaba.nama',
            // 'mk_id',
            // 'pertemuan2',
            // 'tgl_pertemuan2',
            // 'pertemuan3',
            // 'tgl_pertemuan3',
            // 'pertemuan4',
            // 'tgl_pertemuan4',
            // 'pertemuan5',
            // 'tgl_pertemuan5',
            // 'pertemuan6',
            // 'tgl_pertemuan6',
            // 'pertemuan7',
            // 'tgl_pertemuan7',
            // 'pertemuan8',
            // 'tgl_pertemuan8',
            // 'pertemuan9',
            // 'tgl_pertemuan9',
            // 'pertemuan10',
            // 'tgl_pertemuan10',
            // 'pertemuan11',
            // 'tgl_pertemuan11',
            // 'pertemuan12',
            // 'tgl_pertemuan12',
            // 'pertemuan13',
            // 'tgl_pertemuan13',
            // 'pertemuan14',
            // 'tgl_pertemuan14',
            // 'nilai_presensi',
            // 'status_presensi',
            // 'created_at',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',
            // 'pertemuan1',
            // 'tgl_pertemuan1',
            // 'kode_rombel',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
