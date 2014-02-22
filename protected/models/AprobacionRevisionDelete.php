<?php

/**
 * This is the model class for table "aprobacion_revision".
 *
 * The followings are the available columns in table 'aprobacion_revision':
 * @property integer $id_aprobacion
 * @property integer $id_revision
 * @property integer $aprobado
 * @property string $motivos
 */
class AprobacionRevision extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'appaerovision.aprobacion_revision';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_revision', 'required'),
			array('id_revision', 'numerical', 'integerOnly'=>true),
                        array('aprobado','type','type'=>'boolean'),

			array('motivos', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_aprobacion, id_revision, aprobado, motivos', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_aprobacion' => 'Id Aprobacion',
			'id_revision' => 'Id Revision',
			'aprobado' => 'Aprobado',
			'motivos' => 'Motivos',
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

		$criteria->compare('id_aprobacion',$this->id_aprobacion);
		$criteria->compare('id_revision',$this->id_revision);
		$criteria->compare('aprobado',$this->aprobado);
		$criteria->compare('motivos',$this->motivos,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return AprobacionRevision the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
