<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\modules\pa\models\Nilai */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Nilais', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="nilai-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <h1 align="center"><b> Evaluasi Nilai Mahasiswa </b></h1>

   <!--  <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p> -->

    <!-- <h1> Data Mahasiswa </h1> -->
    <table width="100%">
        <tr>
            <td width="50%">
                <?= DetailView::widget([
                    'model' => $model,
                    'attributes' => [

                        'camaba.nama',
                        'nim',
                        'prodi.nama',
                        //'ta.nama',
                        // 'smt',
                        // 'prgPendidikan0.nama',
                        // //'mhs_id',
                        // 'kode_rombel',
                        
                        ],
                ]) ?>
            </td>
            <td width="50%">
                 <?= DetailView::widget([
                    'model' => $model,
                    'attributes' => [
                    'smt',
                        'prgPendidikan0.nama',
                        //'mhs_id',
                        'kode_rombel',
                        
                        ],
                ]) ?>
            </td>
        </tr>
    </table>

    <!-- <h1> Data Nilai </h1> -->
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'mk.nama',
            'nilai_uas',
            'nilai_uts',
            'nilai_tugas1',
            'nilai_tugas2',
            'nilai_tugas3',
            'nilai_presentasi',
            'nilai_praktik',
            'nilai_absensi',
            'grade',
            //'islock',
            //'keterangan',
            'status_nilai',
            //'created_at',
            //'updated_at',
            //'created_by',
            //'updated_by',
            //'nilai_akhir',
            'id',
        ],
    ]) ?>
    

</div>
