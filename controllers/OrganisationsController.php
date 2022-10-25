<?php

namespace app\controllers;

use app\models\Organisations;
use app\models\OrganisationsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * OrganisationsController implements the CRUD actions for Organisations model.
 */
class OrganisationsController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Organisations models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new OrganisationsSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Organisations model.
     * @param int $organisation_id Organisation ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($organisation_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($organisation_id),
        ]);
    }

    /**
     * Creates a new Organisations model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Organisations();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'organisation_id' => $model->organisation_id]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Organisations model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $organisation_id Organisation ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($organisation_id)
    {
        $model = $this->findModel($organisation_id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'organisation_id' => $model->organisation_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Organisations model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $organisation_id Organisation ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($organisation_id)
    {
        $this->findModel($organisation_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Organisations model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $organisation_id Organisation ID
     * @return Organisations the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($organisation_id)
    {
        if (($model = Organisations::findOne(['organisation_id' => $organisation_id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
