<?php

/**
 * This is the model class for table "usuario_universidades".
 *
 * The followings are the available columns in table 'usuario_universidades':
 * @property integer $id_usuario
 * @property string $state_uu
 * @property integer $universidades_id
 */
class UsuarioUniversidades extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'usuario_universidades';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_usuario, universidades_id', 'required'),
			array('id_usuario, universidades_id', 'numerical', 'integerOnly'=>true),
			array('state_uu', 'length', 'max'=>8),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_usuario, state_uu, universidades_id', 'safe', 'on'=>'search'),
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
                    'usuarios' => array(self::BELONGS_TO, 'Usuarios', 'id_usuario'),
                    'universidades' => array(self::BELONGS_TO, 'Universidad', 'universidades_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_usuario' => 'Id Usuario',
			'state_uu' => 'State Uu',
			'universidades_id' => 'Universidades',
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

		$criteria->compare('id_usuario',$this->id_usuario);
		$criteria->compare('state_uu',$this->state_uu,true);
		$criteria->compare('universidades_id',$this->universidades_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UsuarioUniversidades the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
