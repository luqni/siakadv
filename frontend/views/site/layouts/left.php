<?php
use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this \yii\web\View */
/* @var $content string */
?>

<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <?php

              $identity = Yii::$app->user->identity;
              $username = $identity->username;
              $foto = $identity->foto;

              $file_foto = (!empty($foto))?'@web/uploads/'.$foto:$directoryAsset.'/img/user2-160x160.jpg';
            ?>
            
            <div class="pull-left image">
                <img src="<?= Url::to($file_foto)?>" class="user-image" alt="User Image"/>
                <span class="hidden-xs"> <?=$username?> </span>
            </div>
            <div class="pull-left info">
                <p>  <?=$username?> </p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    ['label' => 'Signup', 'url' => ['/site/signup']],
                    ['label' => 'Login', 'url' => ['/mimin/user/login'], 'visible' => Yii::$app->user->isGuest],
                    ['label' => 'Menu Utama', 
                    'items' => [
                         ['label' => 'Bimbingan Akademik', 'icon' => 'fa fa-circle-o', 'url' => ['/pa/bimbingan-pa'],],
                         ['label' => 'Bimbingan Details', 'icon' => 'fa fa-circle-o', 'url' => ['/pa/bimbingan-detail'],],
                         [
                            'label' => 'Profile',
                            'icon' => 'fa fa-share',
                            'url' => '#',
                                'items' => [
                                     ['label' => 'Profil Mahasiswa', 'icon' => 'fa fa-circle-o', 'url' => ['/pa/mahasiswa'],],
                                     ['label' => 'Profil Dosen', 'icon' => 'fa fa-circle-o', 'url' => ['/pa/dosen'],],
                                ],
                        ],
                    ],
                    ],

                    [
                        'label' => 'Menu Yii-2',
                        'url' => '#',
                        'items' => [
                                    ['label' => 'Gii', 'icon' => 'fa fa-file-code-o', 'url' => ['/gii']],
                                    ['label' => 'Debug', 'icon' => 'fa fa-dashboard', 'url' => ['/debug']],        
                        ],
                    ],
                ],
            
            ]
        ) ?>

    </section>

</aside>
