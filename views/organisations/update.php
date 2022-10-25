<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Organisations $model */

$this->title = Yii::t('app', 'Update Organisations: {name}', [
    'name' => $model->organisation_id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Organisations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->organisation_id, 'url' => ['view', 'organisation_id' => $model->organisation_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="organisations-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
