<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'Evaluasi Keuangan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1 align='center'><?= Html::encode($this->title) ?></h1>
    <br>

<div class="col-lg-4 col-lg-offset-8">
    <div class="input-group">
        <input type="text" id = "inp-name" placeholder="Masukan Nama Mahasiswa"
        value="<?=Html::encode($model->camaba->nama); ?>" class="form-control">
        <span class="input-group-btn">
            <button type="button" class="btn btn-primary btn-flat" id="btn-name"> Pilih </button>
        </span>
    </div><br>
</div>

<div class ="row" "col-md-4">
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

 <div class='image' align='center'>
	<img src='/siakadv/frontend/web/uploads/keuangan.png'/>

    
</div>
</div>