<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'name'=>'Bimbingan-ADMIN',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'pa' => [
            'class' => 'backend\modules\pa\PaModule',
        ],

        'admin' => [
            'class' => 'mdm\admin\Module',
        ],
        
        'user' => [
            'class' => 'dektrium\user\Module',
            'admins' => ['admin'],
        ],
    ],
    'homeUrl' => '/siakadv/mimin',
    'components' => [
        'request' => [
            'baseUrl' => '/siakadv/mimin',
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

        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            //'defaultRole' => ['guest'],
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

         'view' => [
             'theme' => [
                 'pathMap' => [
                     '@app/views' => 'vendor/almasaeed2010/adminlte/pages'
                 ],
             ],
         ],

        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-blue',
                ],
            ],
        ],

    ],
    'params' => $params,

    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            '*'
        ]
    ],
];
