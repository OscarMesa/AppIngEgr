<?php

/**
 * This is the model class for table "egresos".
 *
 * The followings are the available columns in table 'egresos':
 * @property integer $id
 * @property string $descripcion
 * @property string $fecha_egreso
 * @property double $valor_egresos
 * @property integer $usuario_id
 * @property integer $tipo_egreso_id
 *
 * The followings are the available model relations:
 * @property TipoEgresos $tipoEgreso
 * @property Usuarios[] $Usuario
 */
class Egresos extends CActiveRecord {

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'egresos';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('descripcion, fecha_egreso, valor_egresos, usuario_id, tipo_egreso_id', 'required'),
            array('usuario_id, tipo_egreso_id', 'numerical', 'integerOnly' => true),
            array('valor_egresos', 'numerical'),
            array('valor_egresos', 'numerical', 'integerOnly' => true, 'min' => 1),
            array('descripcion', 'length', 'max' => 300),
            array('fecha_egreso', 'date', 'format' => 'yyyy-M-d'),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('id, descripcion, fecha_egreso, valor_egresos, usuario_id, tipo_egreso_id', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'tipoEgreso' => array(self::BELONGS_TO, 'TipoEgresos', 'tipo_egreso_id'),
            'usuario' => array(self::BELONGS_TO, 'Usuarios', 'usuario_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'descripcion' => 'Descripción',
            'fecha_egreso' => 'Fecha',
            'valor_egresos' => 'Valor',
            'usuario_id' => 'Usuario',
            'tipo_egreso_id' => 'Tipo',
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
    public function search() {
        // @todo Please modify the following code to remove attributes that should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('descripcion', $this->descripcion, true);
        $criteria->compare('fecha_egreso', $this->fecha_egreso, true);
        $criteria->compare('valor_egresos', $this->valor_egresos);
        $criteria->compare('usuario_id', $this->usuario_id);
        $criteria->compare('tipo_egreso_id', $this->tipo_egreso_id);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }

    public function formatDate() {
        return date("Y-m-d", strtotime($this->fecha_egreso));
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Egresos the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    protected function afterFind() {
        $this->fecha_egreso = Yii::app()->dateFormatter->format('yyyy-MM-dd', CDateTimeParser::parse($this->fecha_egreso, 'yyyy-MM-dd'));
        return parent::afterFind();
    }

}
