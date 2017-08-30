<?php

namespace backend\modules\pa\controllers;

use Yii;
use backend\modules\pa\models\AuthItem;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * RbacController implements the CRUD actions for AuthItem model.
 */
class RbacController extends Controller
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

    //User Assignment
    public function actionAssignment()
    {
        $auth = Yii::$app->authManager;

        $mahasiswa = $auth->createRole ('mahasiswa');
        $admin = $auth->createRole ('admin');

        $auth->assign($mahasiswa, mahasiswa);
        $auth->assign($admin, admin);
    }

    //Create Role
    public function actionCreate_role()
    {
        $auth = Yii::$app->authManager;
        //Mahasiswa -> index/create/view
        //Admin -> (mahasiswa) and update/delete -> index/create/view/update/delete

        $index = $auth->createPermission('pa/mahasiswa/index');
        $create = $auth->createPermission('pa/mahasiswa/create');
        $view = $auth->createPermission('pa/mahasiswa/view');

        $update = $auth->createPermission('pa/mahasiswa/update');
        $delete = $auth->createPermission('pa/mahasiswa/delete');
        
        //add "mahasiswa" role and give this role the "createMahasiswa" permission
        $mahasiswa = $auth->createRole ('mahasiswa');
        $auth->add($mahasiswa);
        $auth->addChild($mahasiswa, $index);
        $auth->addChild($mahasiswa, $create);
        $auth->addChild($mahasiswa, $view);

        //add "admin" role and give this role the "updateMahasiswa" permission
        //as well as the permissions of the "mahasiswa" role
        $admin = $auth->createRole ('admin');
        $auth->add($admin);
        $auth->addChild($admin, $mahasiswa);
        $auth->addChild($admin, $update);
        $auth->addChild($admin, $delete);


    }

    //Create Permission
    public function actionCreate_permission()
    {
        $auth = Yii::$app->authManager;

        //Index
        $index = $auth->createPermission('pa/mahasiswa/index');
        $index->description = 'Create a index';
        $auth->add($index);

        //create
        $create = $auth->createPermission('pa/mahasiswa/create');
        $create->description = 'Create a Post';
        $auth->add($create);

        //view
        $view = $auth->createPermission('pa/mahasiswa/view');
        $view->description = 'View a Post';
        $auth->add($view);

        //update
        $update = $auth->createPermission('pa/mahasiswa/update');
        $update->description = 'Update a Post';
        $auth->add($update);

        //delete
        $delete = $auth->createPermission('pa/mahasiswa/delete');
        $delete->description = 'Delete a Post';
        $auth->add($delete);
    }

    /**
     * Lists all AuthItem models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => AuthItem::find(),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single AuthItem model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new AuthItem model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new AuthItem();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->name]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing AuthItem model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->name]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing AuthItem model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the AuthItem model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return AuthItem the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = AuthItem::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
