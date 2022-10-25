<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\OrganisationLevels $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="organisation-levels-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'levelName')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'levelCode')->textInput() ?>

    <?= $form->field($model, 'tier')->textInput() ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'updated')->textInput() ?>

    <?= $form->field($model, 'deleted')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
