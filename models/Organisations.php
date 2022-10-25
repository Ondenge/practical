<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "organisation".
 *
 * @property int $organisation_id
 * @property string $uid
 * @property string|null $organisationName
 * @property int $organisationCode
 * @property int $organisationLevel
 * @property string|null $start
 * @property string|null $end
 * @property int $organisationStatus
 * @property string|null $longitude
 * @property string|null $latitude
 * @property string|null $created
 * @property string|null $updated
 * @property string|null $deleted
 *
 * @property Organisationlevel $organisationLevel0
 */
class Organisations extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'organisation';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['uid', 'organisationCode', 'organisationLevel', 'organisationStatus'], 'required'],
            [['organisationCode', 'organisationLevel', 'organisationStatus'], 'integer'],
            [['start', 'end', 'created', 'updated', 'deleted'], 'safe'],
            [['uid'], 'string', 'max' => 12],
            [['organisationName'], 'string', 'max' => 200],
            [['longitude', 'latitude'], 'string', 'max' => 1000],
            [['organisationLevel'], 'exist', 'skipOnError' => true, 'targetClass' => Organisationlevel::class, 'targetAttribute' => ['organisationLevel' => 'level_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'organisation_id' => Yii::t('app', 'Organisation ID'),
            'uid' => Yii::t('app', 'Uid'),
            'organisationName' => Yii::t('app', 'Organisation Name'),
            'organisationCode' => Yii::t('app', 'Organisation Code'),
            'organisationLevel' => Yii::t('app', 'Organisation Level'),
            'start' => Yii::t('app', 'Start'),
            'end' => Yii::t('app', 'End'),
            'organisationStatus' => Yii::t('app', 'Organisation Status'),
            'longitude' => Yii::t('app', 'Longitude'),
            'latitude' => Yii::t('app', 'Latitude'),
            'created' => Yii::t('app', 'Created'),
            'updated' => Yii::t('app', 'Updated'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * Gets query for [[OrganisationLevel0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrganisationLevel0()
    {
        return $this->hasOne(Organisationlevel::class, ['level_id' => 'organisationLevel']);
    }
}
