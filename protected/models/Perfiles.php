<?php

/**
 * This is the model class for table "perfiles".
 *
 * The followings are the available columns in table 'perfiles':
 * @property integer $id_perfil
 * @property string $state_perfiles
 * @property string $nombre
 *
 * The followings are the available model relations:
 * @property Permisos[] $permisoses
 * @property Usuarios[] $usuarioses
 */
class Perfiles extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'perfiles';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('state_perfiles', 'length', 'max'=>8),
			array('nombre', 'length', 'max'=>30),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_perfil, state_perfiles, nombre', 'safe', 'on'=>'search'),
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
			'permisos' => array(self::MANY_MANY, 'Permisos', 'permisos_perfil(perfiles_id, permisos_id)'),
			'usuarioses' => array(self::MANY_MANY, 'Usuarios', 'usuarios_perfiles(perfiles_id_perfil, usuarios_id_usuario)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_perfil' => 'Id Perfil',
			'state_perfiles' => 'State Perfiles',
			'nombre' => 'Nombre',
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

		$criteria->compare('id_perfil',$this->id_perfil);
		$criteria->compare('state_perfiles',$this->state_perfiles,true);
		$criteria->compare('nombre',$this->nombre,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Perfiles the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
