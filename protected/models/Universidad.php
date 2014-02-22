<?php

/**
 * This is the model class for table "universidad".
 *
 * The followings are the available columns in table 'universidad':
 * @property integer $id_universidad
 * @property string $state_universidad
 * @property string $nombre_universidad
 *
 * The followings are the available model relations:
 * @property Usuarios[] $usuarioses
 */
class Universidad extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'universidad';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('state_universidad', 'length', 'max'=>8),
			array('nombre_universidad', 'length', 'max'=>80),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_universidad, state_universidad, nombre_universidad', 'safe', 'on'=>'search'),
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
			'usuarios' => array(self::MANY_MANY, 'Usuarios', 'usuario_universidades(universidades_id, id_usuario)'),
                        'usuariosUniversidades' => array(self::HAS_MANY,'UsuarioUniversidades','universidades_id'),
		);
                
	}
        

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_universidad' => 'Id Universidad',
			'state_universidad' => 'State Universidad',
			'nombre_universidad' => 'Nombre Universidad',
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

		$criteria->compare('id_universidad',$this->id_universidad);
		$criteria->compare('state_universidad',$this->state_universidad,true);
		$criteria->compare('nombre_universidad',$this->nombre_universidad,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Universidad the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
