<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Organisations $model */

$this->title = Yii::t('app', 'Create Organisations');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Organisations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="organisations-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
