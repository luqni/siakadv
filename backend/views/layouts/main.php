<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use hscstudio\mimin\components\Mimin;

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

    $menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
        ['label' => 'Dashboard', 'url' => ['/site/highchart']],
        ['label' => 'Artikel', 'url' => ['/pa/artikel']],
        ['label' => 'Profile', 'url' => '#',
        'items' => [
            ['label' => 'Profile Dosen', 'url' => ['/pa/dosen'],],
            ['label' => 'Profile Mahasiswa', 'url' => ['/pa/mahasiswa'],],
            ],
        ],
        ['label' => 'Bimbingan Akademik', 'url' => ['/pa/bimbingan-pa'],],
        ['label' => 'Evaluasi Mahasiswa', 'url' => '#',
        'items' => [
            ['label' => 'Nilai', 'url' => ['/pa/nilai'],],
            ['label' => 'Presensi', 'url' => ['/pa/presensi'],],
            ['label' => 'Akademik', 'url' => ['/pa/akademik'],],
            ['label' => 'Keuangan', 'url' => ['/pa/penilaian'],],
            ['label' => 'Rencana Studi', 'url' => ['/pa/mahasiswa'],],
            ['label' => 'Penanganan Khusus', 'url' => ['/pa/mahasiswa'],],
            ],
        ],
    ];

    $user = Yii::$app->user->identity;
    // $civitas = $user->getCivitas();
    //ini dibuat comment untuk offin rbac-manual
    /*
    if ($user->roleid=='dosen') 
    {
            $menuItems[] = ['label' => 'Bimbingan Dosen', 'url' => ['/pa/bpad']];
            $menuItems[] = ['label' => 'Profile Mahasiswa', 'url' => ['/pa/pmud']];
    }
    if ($user->roleid=='mahasiswa') 
    {
            $menuItems[] = ['label' => 'Bimbingan Mahasiswa', 'url' => ['/pa/bimbingan-pa']];
            $menuItems[] = ['label' => 'Profile Dosen', 'url' => ['/pa/pdum']];
    }
    if ($user->roleid=='admin') 
    {
            $menuItems[] = ['label' => 'User', 'url' => ['/mimin/user']];
    }
    */

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

    $menuItems = Mimin::filterMenu($menuItems);
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
