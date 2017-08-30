<?php

namespace frontend\modules\pa\controllers;

use Yii;
use frontend\modules\pa\models\BimbinganPa;
use frontend\modules\pa\models\BimbinganDetail;
use frontend\modules\pa\models\BimbinganPaSearch;
use frontend\modules\pa\models\Model;
use yii\web\Controller;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ForbiddenHttpException;

/**
 * BimbinganPaController implements the CRUD actions for BimbinganPa model.
 */
class BpadController extends Controller
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
     * Lists all BimbinganPa models.
     * @return mixed
     */
    public function actionIndex()
    {
        $user = Yii::$app->user->identity;
        $dosen = $user->getCivitas();

        $searchModel = new BimbinganPaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider ([
                'query' => BimbinganPa::find()->
                where(['dosenpa_id'=>$dosen->id]),
                'sort' => [
                    'defaultOrder' => ['id' => SORT_DESC]]
            ]);
 
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single BimbinganPa model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

      /**
     * Updates an existing BimbinganPa model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {

        // if ($model->load(Yii::$app->request->post()) && $model->save()) {
        //     return $this->redirect(['view', 'id' => $model->id]);

        $model = $this->findModel($id);
        $detailpa = BimbinganDetail::findOne(['bimbingan_id'=>$id]);

        if ($model->load(Yii::$app->request->post()) && $detailpa->load(Yii::$app->request->post())){

        if ($model->save(false))

        if ($detailpa->load(Yii::$app->request->post())) {
            $valid = $model->validate();
            $valid = $detailpa->validate() && $valid;
            $detailpa->bimbingan_id = $model->id;
            $detailpa->save(false);
        }

        return $this->redirect(['view', 'id' => $model->id]);
        
        }
         else {
            return $this->render('update', [
                'model' => $model,
                'detailpa' => $detailpa,
            ]);
        }
    }

    /**
     * Finds the BimbinganPa model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BimbinganPa the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BimbinganPa::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
