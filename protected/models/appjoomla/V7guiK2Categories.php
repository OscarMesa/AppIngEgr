<?php

/**
 * This is the model class for table "v7gui_k2_categories".
 *
 * The followings are the available columns in table 'v7gui_k2_categories':
 * @property string $id
 * @property string $name
 * @property string $alias
 * @property string $description
 * @property integer $parent
 * @property integer $extraFieldsGroup
 * @property integer $published
 * @property integer $access
 * @property integer $ordering
 * @property string $image
 * @property string $params
 * @property integer $trash
 * @property string $plugins
 * @property string $language
 */
class V7guiK2Categories extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'wwwaerov_joomla.v7gui_k2_categories';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, alias, description, extraFieldsGroup, image, params, plugins, language', 'required'),
			array('parent, extraFieldsGroup, published, access, ordering, trash', 'numerical', 'integerOnly'=>true),
			array('name, alias, image', 'length', 'max'=>255),
			array('language', 'length', 'max'=>7),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, alias, description, parent, extraFieldsGroup, published, access, ordering, image, params, trash, plugins, language', 'safe', 'on'=>'search'),
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
                    'items' => array(self::HAS_MANY,'V7guiK2Items','catid'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'alias' => 'Alias',
			'description' => 'Description',
			'parent' => 'Parent',
			'extraFieldsGroup' => 'Extra Fields Group',
			'published' => 'Published',
			'access' => 'Access',
			'ordering' => 'Ordering',
			'image' => 'Image',
			'params' => 'Params',
			'trash' => 'Trash',
			'plugins' => 'Plugins',
			'language' => 'Language',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('alias',$this->alias,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('parent',$this->parent);
		$criteria->compare('extraFieldsGroup',$this->extraFieldsGroup);
		$criteria->compare('published',$this->published);
		$criteria->compare('access',$this->access);
		$criteria->compare('ordering',$this->ordering);
		$criteria->compare('image',$this->image,true);
		$criteria->compare('params',$this->params,true);
		$criteria->compare('trash',$this->trash);
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
	 * @return V7guiK2Categories the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
        
        
        public static function buscarTodasCategorias($categoria_padre)
        {
            $sql = "SELECT c1.id id1,c2.id id2,c3.id id3,c4.id id4
                        FROM v7gui_k2_categories AS c1
                        LEFT JOIN v7gui_k2_categories AS c2 ON (c2.parent= c1.id)
                        LEFT JOIN v7gui_k2_categories AS c3 ON (c3.parent= c2.id)
                        LEFT JOIN v7gui_k2_categories AS c4 ON (c4.parent= c3.id)
                    WHERE c1.parent = ?";
            $cmd = Yii::app()->db2->createCommand($sql);
            $resulset = $cmd->queryAll(true, array($categoria_padre));
            $categorias = array($categoria_padre=>$categoria_padre);
            foreach ($resulset as $r) {
                foreach ($r as $categoria) {
                    if($categoria != NULL)
                    $categorias[$categoria] = $categoria;
                }             
            }
            return $categorias;
        }
}