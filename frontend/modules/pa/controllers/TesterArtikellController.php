<?php
namespace frontend\modules\pa\controllers;

use Yii;
use backend\modules\pa\models\ArticleItems;
use backend\modules\pa\models\ArticleItemsSearch;
use yii\data\ActiveDataProvider;
/**
 * Site controller
 */
class ArtikelController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all BimbinganDetail models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProviderArtikel = new ActiveDataProvider([
            'query' => ArticleItems::find()
                    ->where('id != :ArticleCategories', [
                        ':ArticleCategories' => isset($_GET['ArticleCategories']) ? $_GET['article_categories'] : 'NULL'
                    ]),
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ] 
        ]);

        return $this->render('index', [
            'dataProviderArtikel' => $dataProviderArtikel
        ]);
    }

    public function actionView($id)
    {
        $model = Artikel::findOne($id);

        // // menambahkan jumlah baca 1
        // $model->updateCounters(['jumlah_baca' => 1]); 
    }

        /**
     * Finds the BimbinganDetail model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BimbinganDetail the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BimbinganDetail::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

