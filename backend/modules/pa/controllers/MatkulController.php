<?php

namespace backend\modules\pa\controllers;

use Yii;
use backend\modules\pa\models\Nilai;
use backend\modules\pa\models\NilaiSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use backend\modules\pa\models\Matkul;

class MatkulController extends Controller
{
    public function actionIndex()
    {
    	$sql = (new \yii\db\query())->SELECT('nama')->From('matakuliah')->all();
    	// var_dump($sql);
        $result = array();
       // array_push ($result, $sql);
        var_export($sql);
        

    	// $matakuliah = Matkul::findBySql('SELECT nama From matakuliah')->all();
    	// 	return $this->render('index', [
    	// 		'matakulias' => $matakulias,
    	// 		]);
    			
        // $query = Matkul::find();

        // $pagination = new Pagination([
        //     'defaultPageSize' => 5,
        //     'totalCount' => $query->count(),
        // ]);

        // $matakuliahs = $query->orderBy('name')
        //     ->offset($pagination->offset)
        //     ->limit($pagination->limit)
        //     ->all();

        // return $this->render('index', [
        //     'matakuliahs' => $matakuliahs,
        //     'pagination' => $pagination,
        // ]);

    }
}


?>