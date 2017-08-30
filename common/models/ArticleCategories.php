<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "article_categories".
 *
 * @property integer $id
 * @property string $name
 * @property string $alias
 * @property string $description
 * @property integer $parentid
 * @property integer $state
 * @property integer $access
 * @property string $language
 * @property integer $ordering
 * @property string $image
 * @property string $image_caption
 * @property string $image_credits
 * @property string $params
 * @property string $metadesc
 * @property string $metakey
 * @property string $robots
 * @property string $author
 * @property string $copyright
 *
 * @property ArticleItems[] $articleItems
 */
class ArticleCategories extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'article_categories';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'alias', 'language'], 'required'],
            [['description', 'image', 'params', 'metadesc', 'metakey'], 'string'],
            [['parentid', 'state', 'access', 'ordering'], 'integer'],
            [['name', 'alias', 'image_caption', 'image_credits'], 'string', 'max' => 255],
            [['language'], 'string', 'max' => 7],
            [['robots'], 'string', 'max' => 20],
            [['author', 'copyright'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'alias' => 'Alias',
            'description' => 'Description',
            'parentid' => 'Parentid',
            'state' => 'State',
            'access' => 'Access',
            'language' => 'Language',
            'ordering' => 'Ordering',
            'image' => 'Image',
            'image_caption' => 'Image Caption',
            'image_credits' => 'Image Credits',
            'params' => 'Params',
            'metadesc' => 'Metadesc',
            'metakey' => 'Metakey',
            'robots' => 'Robots',
            'author' => 'Author',
            'copyright' => 'Copyright',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticleItems()
    {
        return $this->hasMany(ArticleItems::className(), ['catid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticle()
    {
        return $this->hasOne(ArticleItems::className(), ['catid' => 'id']);
    }

    

    public static function topKategori()
    {
        $model  = self::find()
                ->orderBy('name ASC')
                ->all();
        return $model;
    }
}
