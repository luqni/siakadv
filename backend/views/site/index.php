<?php

use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'SIBA - NF';
?>

<div class="site-index">

    <div>
    <div class="jumbotron" style="background: #f0f0f0; margin-top: 20px; padding-top: 10px; padding-bottom: 10px">
        <h1> Welcome </h1>
        
        <h2>Sistem Informasi Bimbingan Akademik</h2>

        <p><a class="btn btn-lg btn-success" href="http://www.nurulfikri.ac.id">STT Terpadu Nurul Fikri</a></p>
    </div>

    <div class="body-content">
        <div class="row-fluid">
            <div class="col-md-9">
                <?php
                  use yii\widgets\ListView;

                  $this->title = Yii::$app->name;

                    echo ListView::widget([
                        'dataProvider' => $dataProviderArtikel,
                        'layout' => "{items}\n{pager}",
                        'itemOptions' => ['class' => 'item'],
                        'itemView' => '_itemArtikel'
                    ]);
                ?>
     
                </div>

            </div>
                

            <div class="col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-heading">Kategori Artikel</div>
                    <div class="panel-body">
                        <!-- <ul> -->
                            <?php               
                             foreach(common\models\ArticleCategories::topKategori() as $row) : ?> 
                              <li><?= Html::a($row->name, ['/site/view2', 'id' => $row->id]) ?></li>
                             
                        <?php 
                        endforeach; 
                        ?> 
                        
                        <ul>
                    </div>                  
                    </div>
                </div>  
            </div>
    </div>
</div>
</div>

