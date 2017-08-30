<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-frontend',
    'name'=>'Bimbingan Akademik',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'homeUrl' => '/siakadv',
    'modules' => [
        'pa' => [
            'class' => 'frontend\modules\pa\PaModule',
        ],

    ],

    'components' => [
        'request' => [
            'baseUrl' => '/siakadv',
        ],
        'user' => [
            'identityClass' => 'dektrium\user\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        
        'authManager'=> [
            'class' => 'yii\rbac\DBManager',
        ],

        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],

        // 'view' => [
        //     'theme' => [
        //         'pathMap' => [
        //             '@app/views' => 'vendor/almasaeed2010/adminlte/pages',
        //         ],
        //     ],
        // ],

        // 'assetManager' => [
        //     'bundles' => [
        //         'dmstr\web\AdminLteAsset' => [
        //             'skin' => 'skin-blue',
        //         ],
        //     ],
        // ],

    ],
    'params' => $params,

    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            '*'
        ]
    ],
];
