<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\OrganisationLevels $model */

$this->title = Yii::t('app', 'Update Organisation Levels: {name}', [
    'name' => $model->level_id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Organisation Levels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->level_id, 'url' => ['view', 'level_id' => $model->level_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="organisation-levels-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
