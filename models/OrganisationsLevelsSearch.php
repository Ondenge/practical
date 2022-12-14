<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\OrganisationLevels;

/**
 * OrganisationsLevelsSearch represents the model behind the search form of `app\models\OrganisationLevels`.
 */
class OrganisationsLevelsSearch extends OrganisationLevels
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['level_id', 'levelCode', 'tier'], 'integer'],
            [['levelName', 'created', 'updated', 'deleted'], 'safe'],
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
        $query = OrganisationLevels::find();

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
            'level_id' => $this->level_id,
            'levelCode' => $this->levelCode,
            'tier' => $this->tier,
            'created' => $this->created,
            'updated' => $this->updated,
            'deleted' => $this->deleted,
        ]);

        $query->andFilterWhere(['like', 'levelName', $this->levelName]);

        return $dataProvider;
    }
}
