<?php

use app\models\Organisations;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
/** @var yii\web\View $this */
/** @var app\models\OrganisationsSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Organisations');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="organisations-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Organisations'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'organisation_id',
            'uid',
            'organisationName',
            'organisationCode',
            'organisationLevel',
            //'start',
            //'end',
            //'organisationStatus',
            //'longitude',
            //'latitude',
            //'created',
            //'updated',
            //'deleted',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Organisations $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'organisation_id' => $model->organisation_id]);
                 }
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
