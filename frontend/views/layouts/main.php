<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => '<img src="/siakadv/frontend/web/uploads/logo.png" style="display:inline; vertical-align:top; height:32px;"> SIBA - NF',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
            'style' => 'background-color:#006699'
        ],
    ]);

    $user = Yii::$app->user->identity;
    // $civitas = $user->getCivitas();
    //ini dibuat comment untuk offin rbac-manual
    
    if ($user->roleid=='dosen') 
    {
            $menuItems = [
                ['label' => 'Home', 'url' => ['/site/index']],
                ['label' => 'Dashboard', 'url' => ['/site/dashboard']],
                ['label' => 'Bimbingan Dosen', 'url' => ['/pa/bpad']],
                ['label' => 'Profile', 'url' => '#',
                    'items' => [
                  ['label' => 'Profile Dosen', 'url' => ['/pa/dosen'],],
                  ['label' => 'Profile Mahasiswa', 'url' => ['/pa/pmud'],],
                ],
                ],
                ['label' => 'Evaluasi Mahasiswa', 'url' => '#',
                    'items' => [
                ['label' => 'Presensi', 'url' => ['/site/presensi'],],
                ['label' => 'Akademik', 'url' => ['/site/akademik'],],
                ['label' => 'Keuangan', 'url' => ['/site/keuangan'],],
            ],
        ],
            ];
    } 

    if ($user->roleid=='mahasiswa') 
    {
            $menuItems = [
                ['label' => 'Home', 'url' => ['/site/index']],
                ['label' => 'Profile', 'url' => '#',
                    'items' => [
                  ['label' => 'Profile Dosen', 'url' => ['/pa/pdum'],],
                  ['label' => 'Profile Mahasiswa', 'url' => ['/pa/mahasiswa'],],
                ],
                ],

                ['label' => 'Bimbingan Mahasiswa', 'url' => ['/pa/bimbingan-pa']],
                ['label' => 'Evaluasi Mahasiswa', 'url' => '#',
                    'items' => [
                    ['label' => 'Akademik', 'url' => ['/site/akademik'],],
                ],
                ],
                ];
    } 
    
    if ($user->roleid=='admin') 
    {
            $menuItems = [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'Dashboard', 'url' => ['/site/dashboard']],
            ['label' => 'Artikel', 'url' => ['/pa/article-items']],
            ['label' => 'Profile', 'url' => '#',
                    'items' => [
                  ['label' => 'Profile Dosen', 'url' => ['/pa/pdua'],],
                  ['label' => 'Profile Mahasiswa', 'url' => ['/pa/pmua'],],
                ],
            ],

            ['label' => 'Bimbingan Akademik', 'url' => ['/pa/bpadmin']],
            ['label' => 'Evaluasi Mahasiswa', 'url' => '#',
                    'items' => [
                ['label' => 'Presensi', 'url' => ['/site/presensi'],],
                ['label' => 'Akademik', 'url' => ['/site/akademik'],],
                ['label' => 'Keuangan', 'url' => ['/site/keuangan'],],
                ],
            ],
            ['label' => 'User', 'url' => ['/admin']],
            ];
    } 

    if ($user->roleid=='ketua' OR $user->roleid=='kaprodi') 
    {
            $menuItems = [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'Dashboard', 'url' => ['/site/dashboard']],
            ['label' => 'Bimbingan Akademik', 'url' => ['/mimin/pa/bimbingan-pa']],
            ];
    }


    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } else {
        $menuItems[] = [
            'label' => 'Logout (' . Yii::$app->user->identity->username . ')',
            'url' => ['/site/logout'],
            'linkOptions' => ['data-method' => 'post']
        ];
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">
            &copy; Henny Anggraeni <?= date('Y') ?>
        </p>

        <p class="pull-right">
            STT Terpadu Nurul Fikri
        </p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
