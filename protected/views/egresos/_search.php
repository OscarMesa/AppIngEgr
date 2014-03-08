<?php
/* @var $this EgresosController */
/* @var $model Egresos */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'descripcion'); ?>
		<?php echo $form->textField($model,'descripcion',array('size'=>60,'maxlength'=>300)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'valor_egresos'); ?>
		<?php echo $form->textField($model,'valor_egresos'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'usuario_id'); ?>
		<?php echo $form->dropDownList($model,'usuario_id',  CHtml::listData(Usuarios::model()->findAll(),'id','nombre'), array('empty'=>'- Seleccione -')); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_egreso_id'); ?>
        <?php echo $form->dropDownList($model,'tipo_egreso_id',  CHtml::listData(TipoEgresos::model()->findAll(),'id','descripcion'),array('empty'=>'- Seleccione -')); ?>		
	</div>

    <div class="row">
		<?php echo $form->labelEx($model,'fecha_egreso'); ?>
        <?php 
            $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model' => $model,
                'attribute' => 'fecha_egreso',
                'options' => array(
					'changeMonth' => true,
        			'changeYear' => true,
                    'showOn' => 'button',
                    'dateFormat' => 'yy-mm-dd',
                ),
                'htmlOptions' => array(
                    //'style' => '',
                ),
            ));
        ?>        
	</div>
    
	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->