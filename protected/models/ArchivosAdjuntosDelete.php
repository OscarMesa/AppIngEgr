<?php

/**
 * This is the model class for table "archivos_adjuntos".
 *
 * The followings are the available columns in table 'archivos_adjuntos':
 * @property integer $id
 * @property integer $itemID
 * @property string $filename
 * @property string $title
 * @property string $titleAttribute
 * @property integer $id_usuario
 */
class ArchivosAdjuntos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'appaerovision.archivos_adjuntos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('itemID, filename, title', 'required'),
			array('itemID', 'numerical', 'integerOnly'=>true),
			array('filename, title', 'length', 'max'=>100),
			array('titleAttribute', 'length', 'max'=>120),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, itemID, filename, title, titleAttribute', 'safe', 'on'=>'search'),
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
                    'item' => array(self::BELONGS_TO,'V7guiK2Items','itemID')
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'itemID' => 'Item',
			'filename' => 'Filename',
			'title' => 'Title',
			'titleAttribute' => 'Title',
                        'id_usuario' => 'Id usuario'
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
		$criteria->compare('itemID',$this->itemID);
		$criteria->compare('filename',$this->filename,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('titleAttribute',$this->titleAttribute,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ArchivosAdjuntos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
