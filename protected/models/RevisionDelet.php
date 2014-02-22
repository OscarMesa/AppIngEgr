<?php

/**
 * This is the model class for table "revision".
 *
 * The followings are the available columns in table 'revision':
 * @property integer $id_revision
 * @property integer $id_estado_revision
 * @property integer $id_programa
 * @property string $fecha_creacion
 * @property integer $id_usuario 
 *
 * The followings are the available model relations:
 * @property TipoEstadoRevision $idEstadoRevision
 */
class Revision extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'appaerovision.revision';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_estado_revision, id_programa,id_usuario', 'required'),
			array('id_estado_revision, id_programa,id_usuario', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_revision, id_estado_revision, id_programa, fecha_creacion', 'safe', 'on'=>'search'),
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
			'EstadoRevision' => array(self::BELONGS_TO, 'TipoEstadoRevision', 'id_estado_revision'),
                        'item' => array(self::BELONGS_TO,'V7guiK2Items','id_programa'),
                        'usuario' => array(self::BELONGS_TO,'V7guiUsers','id_usuario')
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_revision' => 'Id Revision',
			'id_estado_revision' => 'Id Estado Revision',
			'id_programa' => 'Id Programa',
			'fecha_creacion' => 'Fecha Creacion',
                        'id_usuario' =>  'Id usuario'
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

		$criteria->compare('id_revision',$this->id_revision);
		$criteria->compare('id_estado_revision',$this->id_estado_revision);
		$criteria->compare('id_programa',$this->id_programa);
		$criteria->compare('fecha_creacion',$this->fecha_creacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Revision the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
