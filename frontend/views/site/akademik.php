<?php

namespace frontend\models;
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;
use miloschuman\highcharts\Highcharts;

$this->title = 'Evaluasi Akademik';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="col-lg-4 col-lg-offset-8">
    <div class="input-group">
        <input type="text" id = "inp-name" placeholder="Masukan Nama Mahasiswa"
        value="<?=Html::encode($model->camaba->nama); ?>" class="form-control">
        <span class="input-group-btn">
            <button type="button" class="btn btn-primary btn-flat" id="btn-name"> Pilih </button>
        </span>
    </div><br>
</div>


    <h1 align = 'center'><?= Html::encode($this->title) ?></h1>
    <br>

<div class ="row" >
<div "col-md-4">
    <table class="table">
        <th>  Nama Mahasiswa </th>
        <td>: </td>
        <td>Henny Anggraeni </td>
        </tr>
    
    <th>  NIM 
        <td>: </td>
        <td>0110112007 </td>
        </tr>
    <th>  Program Studi 
        <td>: </td>
        <td> Sistem Informasi </td>
    </tr>

    </table>
</div>
</div>

<div class="col-md-6" width="50%">
<div class='image'>
    <br>
<img src='/siakadv/frontend/web/uploads/akademik.png'/>
</div>
</div>

 <div class="col-md-6">
    <?php
    echo Highcharts::widget([
    'options' => [
        'title' => ['text' => 'Grafik IP dan IPK'],
        'xAxis' => ['categories' => ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII']
        ],

        'yAxis' => [
            'title' => ['text' => 'Skala (0-4)']            
        ],

        'series' => [
            ['name' => 'IP', 'data' => [3, 3.24, 3.41, 3.84, 3.79, 3.80]],
            ['name' => 'IPK', 'data' => [3, 3.10, 3.24, 3.62, 3.68, 3.71]]
        ]
    ]
    ]);
    ?>

</div>
</div>
</div>