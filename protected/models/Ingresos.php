<?php

/**
 * This is the model class for table "ingresos".
 *
 * The followings are the available columns in table 'ingresos':
 * @property integer $id
 * @property string $descripcion
 * @property string $fecha_ingreso
 * @property double $valor_ingreso
 * @property integer $usuario_id
 * @property integer $tipo_egreso
 *
 * The followings are the available model relations:
 * @property TipoIngresos $tipoEgreso
 * @property Usuarios $usuario
 */
class Ingresos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ingresos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('descripcion, fecha_ingreso, valor_ingreso, usuario_id, tipo_egreso', 'required'),
			array('usuario_id, tipo_egreso', 'numerical', 'integerOnly'=>true),
			array('valor_ingreso', 'numerical'),
			array('descripcion', 'length', 'max'=>300),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, descripcion, fecha_ingreso, valor_ingreso, usuario_id, tipo_egreso', 'safe', 'on'=>'search'),
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
			'tipoEgreso' => array(self::BELONGS_TO, 'TipoIngresos', 'tipo_egreso'),
			'usuario' => array(self::BELONGS_TO, 'Usuarios', 'usuario_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'descripcion' => 'Descripcion',
			'fecha_ingreso' => 'Fecha Ingreso',
			'valor_ingreso' => 'Valor Ingreso',
			'usuario_id' => 'Usuario',
			'tipo_egreso' => 'Tipo Egreso',
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
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('fecha_ingreso',$this->fecha_ingreso,true);
		$criteria->compare('valor_ingreso',$this->valor_ingreso);
		$criteria->compare('usuario_id',$this->usuario_id);
		$criteria->compare('tipo_egreso',$this->tipo_egreso);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Ingresos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
