<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\OrganisationLevels $model */

$this->title = Yii::t('app', 'Create Organisation Levels');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Organisation Levels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="organisation-levels-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
