<?php

use app\models\OrganisationLevels;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
/** @var yii\web\View $this */
/** @var app\models\OrganisationsLevelsSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Organisation Levels');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="organisation-levels-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Organisation Levels'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'level_id',
            'levelName',
            'levelCode',
            'tier',
            'created',
            //'updated',
            //'deleted',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, OrganisationLevels $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'level_id' => $model->level_id]);
                 }
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
