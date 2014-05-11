<?php

/**
 * This is the model class for table "usuarios".
 *
 * The followings are the available columns in table 'usuarios':
 * @property integer $id
 * @property string $nombre1
 * @property string $nombre2
 * @property string $apellido1
 * @property string $apellido2
 * @property integer $identificacion
 * @property integer $id_tipo_identidad
 * @property string $username
 * @property string $password
 * @property string $email
 *
 * The followings are the available model relations:
 * @property Egresos[] $egresoses
 * @property Ingresos[] $ingresoses
 */
class Usuarios extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'usuarios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre1, apellido1, username, password, email', 'required'),
			array('identificacion, id_tipo_identidad', 'numerical', 'integerOnly'=>true),
			array('nombre1', 'length', 'max'=>100),
			array('nombre2, password', 'length', 'max'=>50),
			array('apellido1', 'length', 'max'=>40),
			array('apellido2', 'length', 'max'=>30),
			array('username', 'length', 'max'=>60),
			array('email', 'length', 'max'=>80),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, nombre1, nombre2, apellido1, apellido2, identificacion, id_tipo_identidad, username, password, email', 'safe', 'on'=>'search'),
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
			'egresoses' => array(self::HAS_MANY, 'Egresos', 'usuario_id'),
			'ingresoses' => array(self::HAS_MANY, 'Ingresos', 'usuario_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre1' => 'Nombre1',
			'nombre2' => 'Nombre2',
			'apellido1' => 'Apellido1',
			'apellido2' => 'Apellido2',
			'identificacion' => 'Identificacion',
			'id_tipo_identidad' => 'Id Tipo Identidad',
			'username' => 'Username',
			'password' => 'Password',
			'email' => 'Email',
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
		$criteria->compare('nombre1',$this->nombre1,true);
		$criteria->compare('nombre2',$this->nombre2,true);
		$criteria->compare('apellido1',$this->apellido1,true);
		$criteria->compare('apellido2',$this->apellido2,true);
		$criteria->compare('identificacion',$this->identificacion);
		$criteria->compare('id_tipo_identidad',$this->id_tipo_identidad);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Usuarios the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
