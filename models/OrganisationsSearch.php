<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Organisations;

/**
 * OrganisationsSearch represents the model behind the search form of `app\models\Organisations`.
 */
class OrganisationsSearch extends Organisations
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['organisation_id', 'organisationCode', 'organisationLevel', 'organisationStatus'], 'integer'],
            [['uid', 'organisationName', 'start', 'end', 'longitude', 'latitude', 'created', 'updated', 'deleted'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Organisations::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'organisation_id' => $this->organisation_id,
            'organisationCode' => $this->organisationCode,
            'organisationLevel' => $this->organisationLevel,
            'start' => $this->start,
            'end' => $this->end,
            'organisationStatus' => $this->organisationStatus,
            'created' => $this->created,
            'updated' => $this->updated,
            'deleted' => $this->deleted,
        ]);

        $query->andFilterWhere(['like', 'uid', $this->uid])
            ->andFilterWhere(['like', 'organisationName', $this->organisationName])
            ->andFilterWhere(['like', 'longitude', $this->longitude])
            ->andFilterWhere(['like', 'latitude', $this->latitude]);

        return $dataProvider;
    }
}
