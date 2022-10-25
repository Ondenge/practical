<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "organisationlevel".
 *
 * @property int $level_id
 * @property string $levelName
 * @property int $levelCode
 * @property int $tier
 * @property string $created
 * @property string $updated
 * @property string|null $deleted
 *
 * @property Organisation[] $organisations
 */
class Organisationlevels extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'organisationlevel';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['levelName', 'levelCode', 'tier', 'created', 'updated'], 'required'],
            [['levelCode', 'tier'], 'integer'],
            [['created', 'updated', 'deleted'], 'safe'],
            [['levelName'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'level_id' => Yii::t('app', 'Level ID'),
            'levelName' => Yii::t('app', 'Level Name'),
            'levelCode' => Yii::t('app', 'Level Code'),
            'tier' => Yii::t('app', 'Tier'),
            'created' => Yii::t('app', 'Created'),
            'updated' => Yii::t('app', 'Updated'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * Gets query for [[Organisations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrganisations()
    {
        return $this->hasMany(Organisation::class, ['organisationLevel' => 'level_id']);
    }
}
