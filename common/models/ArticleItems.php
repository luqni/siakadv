<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;


/**
 * This is the model class for table "article_items".
 *
 * @property integer $id
 * @property string $title
 * @property string $alias
 * @property integer $catid
 * @property integer $userid
 * @property string $introtext
 * @property string $fulltext
 * @property integer $state
 * @property integer $access
 * @property string $language
 * @property integer $ordering
 * @property integer $hits
 * @property string $image
 * @property string $image_caption
 * @property string $image_credits
 * @property string $video
 * @property string $video_type
 * @property string $video_caption
 * @property string $video_credits
 * @property string $created
 * @property integer $created_by
 * @property string $modified
 * @property integer $modified_by
 * @property string $params
 * @property string $metadesc
 * @property string $metakey
 * @property string $robots
 * @property string $author
 * @property string $copyright
 *
 * @property ArticleAttachments[] $articleAttachments
 * @property ArticleCategories $cat
 * @property User $user
 */
class ArticleItems extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
            'class' => TimestampBehavior::className(),
            'createdAtAttribute' => 'created',
            'updatedAtAttribute' => 'modified',
            'value' => new Expression('NOW()'),
            ],

             [
            'class' => BlameableBehavior::className(),
            'createdByAttribute' => 'created_by',
            'updatedByAttribute' => 'modified_by',
            ],
            ];
    }


    public static function tableName()
    {
        return 'article_items';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'catid', 'userid'], 'required'],
            [[  'created_by', 'modified_by'], 'integer'],
            [['catid','introtext', 'fulltext', 'image', 'video', 'params', 'metadesc', 'metakey'], 'string'],
            [['catid','created', 'modified', 'language', 'created', 'modified', 'userid', 'state', 'access', 'ordering', 'hits',], 'safe'],
            [['title', 'alias', 'image_caption', 'image_credits', 'video_caption', 'video_credits'], 'string', 'max' => 255],
            [['language'], 'string', 'max' => 7],
            [['video_type', 'robots'], 'string', 'max' => 20],
            [['author', 'copyright'], 'string', 'max' => 50],
            [['catid'], 'exist', 'skipOnError' => true, 'targetClass' => ArticleCategories::className(), 'targetAttribute' => ['catid' => 'id']],
            [['userid'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['userid' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Judul Artikel',
            'alias' => 'Alias',
            'catid' => 'Kategori',
            'articleCategories.name' => 'Kategori',
            'userid' => 'User',
            'user.username' => 'Author',
            'introtext' => 'Intro',
            'fulltext' => 'Fulltext',
            'state' => 'State',
            'access' => 'Access',
            'language' => 'Language',
            'ordering' => 'Ordering',
            'hits' => 'Hits',
            'image' => 'Image',
            'image_caption' => 'Image Caption',
            'image_credits' => 'Image Credits',
            'video' => 'Video',
            'video_type' => 'Video Type',
            'video_caption' => 'Video Caption',
            'video_credits' => 'Video Credits',
            'created' => 'Created',
            'created_by' => 'Created By',
            'modified' => 'Modified',
            'modified_by' => 'Modified By',
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
    public function getArticleAttachments()
    {
        return $this->hasMany(ArticleAttachments::className(), ['itemid' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticleCategories()
    {
        return $this->hasOne(ArticleCategories::className(), ['id' => 'catid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'userid']);
    }

}

