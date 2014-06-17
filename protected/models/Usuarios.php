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
 * @property string $estado_usuario
 * @proterty int $id_usuario_modificador
 * @property string $fecha_creacion
 * @property string $fecha_modificacion
 *
 * The followings are the available model relations:
 * @property Egresos[] $egresoses
 * @property Ingresos[] $ingresoses
 * @property TipoIdentificacion $idTipoIdentidad
 * @property Usuarios $idUsuarioModificador
 * @property Usuarios[] $usuarioses
 */
class Usuarios extends CActiveRecord
{
        public $password2;
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
			array('nombre1, apellido1,estado_usuario, username, password, email,fecha_creacion', 'required'),
			array('identificacion, id_tipo_identidad,id_usuario_modificador', 'numerical', 'integerOnly'=>true),
			array('nombre1', 'length', 'max'=>100),
			array('nombre2, password', 'length', 'max'=>50),
			array('apellido1', 'length', 'max'=>40),
			array('apellido2', 'length', 'max'=>30),
			array('username', 'length', 'max'=>60),
                        array('estado_usuario', 'length', 'max'=>8),
			array('email', 'length', 'max'=>80),
                        array('fecha_modificacion', 'safe'),
                        array('password2', 'compare', 'compareAttribute' => 'password', 'message'=>'La contraseñas son diferentes'),
			array('email', 'email', 'message'=>'La dirección de email es incorrecta'),
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
                        'idTipoIdentidad' => array(self::BELONGS_TO, 'TipoIdentificacion', 'id_tipo_identidad'),
                        'idUsuarioModificador' => array(self::BELONGS_TO, 'Usuarios', 'id_usuario_modificador'),
                        'usuarioses' => array(self::HAS_MANY, 'Usuarios', 'id_usuario_modificador'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre1' => 'Nombre 1',
			'nombre2' => 'Nombre 2',
			'apellido1' => 'Apellido 1',
			'apellido2' => 'Apellido 2',
			'identificacion' => 'Identificacion',
			'id_tipo_identidad' => 'Tipo Identidad',
			'username' => 'Nombre de usuario',
			'password' => 'Contraseña',
                        'password2' => 'Repetir contraseña',
			'email' => 'Correo',
                        'fecha_creacion' => 'Fecha Creacion',
                        'fecha_modificacion' => 'Fecha Modificacion',
                        'id_usuario_modificador' => 'Usuario modificador'
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
                $criteria->compare('id_usuario_modificador',$this->id_usuario_modificador,true);
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
