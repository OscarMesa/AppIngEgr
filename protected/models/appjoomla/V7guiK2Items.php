<?php

/**
 * This is the model class for table "v7gui_k2_items".
 *
 * The followings are the available columns in table 'v7gui_k2_items':
 * @property integer $id
 * @property string $title
 * @property string $alias
 * @property integer $catid
 * @property integer $published
 * @property string $introtext
 * @property string $fulltext
 * @property string $video
 * @property string $gallery
 * @property string $extra_fields
 * @property string $extra_fields_search
 * @property string $created
 * @property integer $created_by
 * @property string $created_by_alias
 * @property string $checked_out
 * @property string $checked_out_time
 * @property string $modified
 * @property integer $modified_by
 * @property string $publish_up
 * @property string $publish_down
 * @property integer $trash
 * @property integer $access
 * @property integer $ordering
 * @property integer $featured
 * @property integer $featured_ordering
 * @property string $image_caption
 * @property string $image_credits
 * @property string $video_caption
 * @property string $video_credits
 * @property string $hits
 * @property string $params
 * @property string $metadesc
 * @property string $metadata
 * @property string $metakey
 * @property string $plugins
 * @property string $language
 * @property file $fileUpload archivo adjunto
 */
class V7guiK2Items extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'wwwaerov_joomla.v7gui_k2_items';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, catid, introtext, fulltext, extra_fields_search, created, created_by_alias, checked_out, checked_out_time, modified, publish_up, publish_down, image_caption, image_credits, video_caption, video_credits, hits, params, metadesc, metadata, metakey, plugins, language', 'required'),
			array('catid, published, created_by, modified_by, trash, access, ordering, featured, featured_ordering', 'numerical', 'integerOnly'=>true),
			array('title, alias, gallery, created_by_alias, image_credits, video_credits', 'length', 'max'=>255),
			array('checked_out, hits', 'length', 'max'=>10),
			array('language', 'length', 'max'=>7),
			array('video, extra_fields', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, title, alias, catid, published, introtext, fulltext, video, gallery, extra_fields, extra_fields_search, created, created_by, created_by_alias, checked_out, checked_out_time, modified, modified_by, publish_up, publish_down, trash, access, ordering, featured, featured_ordering, image_caption, image_credits, video_caption, video_credits, hits, params, metadesc, metadata, metakey, plugins, language', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
                    'category' => array(self::BELONGS_TO,'V7guiK2Categories','catid'),
                    'arch_adjuntos' => array(self::HAS_MANY,'V7guiK2Attachments','itemID'),
                    'revisiones' => array(self::HAS_MANY,'Revision','id_programa'),
                    'revisionMax' => array(self::STAT,'Revision','id_programa','select'=>'MAX(id_estado_revision)'),
                    'adjuntos' => array(self::HAS_MANY,'ArchivosAdjuntos','itemID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'title' => 'Titulo del programa',
			'alias' => 'Alias',
			'catid' => 'Catid',
			'published' => 'Published',
			'introtext' => 'Introtext',
			'fulltext' => 'Fulltext',
			'video' => 'Video',
			'gallery' => 'Gallery',
			'extra_fields' => 'Extra Fields',
			'extra_fields_search' => 'Extra Fields Search',
			'created' => 'Fecha de creación',
			'created_by' => 'Created By',
			'created_by_alias' => 'Created By Alias',
			'checked_out' => 'Checked Out',
			'checked_out_time' => 'Checked Out Time',
			'modified' => 'Fecha de modificación',
			'modified_by' => 'Modified By',
			'publish_up' => 'Publish Up',
			'publish_down' => 'Fecha de finalización',
			'trash' => 'Trash',
			'access' => 'Access',
			'ordering' => 'Ordering',
			'featured' => 'Featured',
			'featured_ordering' => 'Featured Ordering',
			'image_caption' => 'Image Caption',
			'image_credits' => 'Image Credits',
			'video_caption' => 'Video Caption',
			'video_credits' => 'Video Credits',
			'hits' => 'Hits',
			'params' => 'Params',
			'metadesc' => 'Metadesc',
			'metadata' => 'Metadata',
			'metakey' => 'Metakey',
			'plugins' => 'Plugins',
			'language' => 'Language',
                        'fileUpload' => 'Archivo'
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('alias',$this->alias,true);
		$criteria->compare('catid',$this->catid);
		$criteria->compare('published',$this->published);
		$criteria->compare('introtext',$this->introtext,true);
		$criteria->compare('fulltext',$this->fulltext,true);
		$criteria->compare('video',$this->video,true);
		$criteria->compare('gallery',$this->gallery,true);
		$criteria->compare('extra_fields',$this->extra_fields,true);
		$criteria->compare('extra_fields_search',$this->extra_fields_search,true);
		$criteria->compare('created',$this->created,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('created_by_alias',$this->created_by_alias,true);
		$criteria->compare('checked_out',$this->checked_out,true);
		$criteria->compare('checked_out_time',$this->checked_out_time,true);
		$criteria->compare('modified',$this->modified,true);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('publish_up',$this->publish_up,true);
		$criteria->compare('publish_down',$this->publish_down,true);
		$criteria->compare('trash',$this->trash);
		$criteria->compare('access',$this->access);
		$criteria->compare('ordering',$this->ordering);
		$criteria->compare('featured',$this->featured);
		$criteria->compare('featured_ordering',$this->featured_ordering);
		$criteria->compare('image_caption',$this->image_caption,true);
		$criteria->compare('image_credits',$this->image_credits,true);
		$criteria->compare('video_caption',$this->video_caption,true);
		$criteria->compare('video_credits',$this->video_credits,true);
		$criteria->compare('hits',$this->hits,true);
		$criteria->compare('params',$this->params,true);
		$criteria->compare('metadesc',$this->metadesc,true);
		$criteria->compare('metadata',$this->metadata,true);
		$criteria->compare('metakey',$this->metakey,true);
		$criteria->compare('plugins',$this->plugins,true);
		$criteria->compare('language',$this->language,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * @return CDbConnection the database connection used for this class
	 */
	public function getDbConnection()
	{
		return Yii::app()->db2;
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return V7guiK2Items the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
