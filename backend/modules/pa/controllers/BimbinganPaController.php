<?php

namespace backend\modules\pa\controllers;

use Yii;
use backend\modules\pa\models\BimbinganPa;
use backend\modules\pa\models\BimbinganDetail;
use backend\modules\pa\models\BimbinganPaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ForbiddenHttpException;

/**
 * BimbinganPaController implements the CRUD actions for BimbinganPa model.
 */
class BimbinganPaController extends Controller
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
        $searchModel = new BimbinganPaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

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
     * Creates a new BimbinganPa model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
            $model = new BimbinganPa();
            $detailpa = new BimbinganDetail(); //menambahkan complex form

            if ($model->load(Yii::$app->request->post()) && $detailpa->load(Yii::$app->request->post())) {

            $user = Yii::$app->user->identity;
            $civitas = $user->getCivitas();

            $model->mhsid=$civitas->mhsid;  
            //die('IDDOSEN PA : ' .$civitas->getRombel2()->dosenpa_id);
            $model->dosenpa_id=$civitas->getRombel2()->dosenpa_id;

            $model->tanggal=date('Y-m-d');


            $detailpa->bimbingan_id = $model->id;
            $detailpa->save();
            
                return $this->redirect(['view', 'id' => $model->id]);

            } else {    
                return $this->render('create', [
                    'model' => $model,
                    'detailpa' => $detailpa,
                ]);
            }
        }

    /**
     * Updates an existing BimbinganPa model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing BimbinganPa model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
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
