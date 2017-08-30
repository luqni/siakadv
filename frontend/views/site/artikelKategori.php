<?php
namespace frontend\models;

use yii\bootstrap\Nav;
/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>

<div class="site-index">

    <div>
        <h1>Yii Tutorials!</h1>

        <p class="lead">Let's Fun Learn Yii Framework Version 2.0.</p>

        <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Are You Ready?</a></p>
    </div>

    <div class="body-content">
        <div class="row">
            <div class="col-lg-9">
				<?php
				$first=true;
				foreach($artikel as $artikel){
					if($first){
						echo '<h2>Post under category "'.$articleCategories->name.'"</h2>';
						$first=false;
					}
					echo '<div>';
					echo '<h2>'.$artikel->title.'</h2>';
					echo '<p><small>Posted by '.$artikel->user->username.' at '.date('F j, Y, g:i a',$artikel->created).'</small></p>';
					echo '<p>'.substr($artikel->introtext,0,300).'...</p>';
					
					echo '<p><a class="btn btn-default" href="'.\Yii::$app->urlManager->createUrl(['site/artikel-single', 'id' => $artikel->id]).'">readmore &raquo;</a></p>';
					echo '</div>';
				}
				?>                
            </div>
            <div class="col-lg-3">
                <h2>Category</h2>
				<?php				
				$items=[];	
				foreach($kategori as $kategori){
					$items[]=['label' => $kategori->name , 'url' => '#'];
				}
				echo Nav::widget([
					'items' => $items,
				]);
				?>                
            </div>
        </div>
    </div>
</div>
