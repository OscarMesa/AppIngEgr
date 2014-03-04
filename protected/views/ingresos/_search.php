<?php
/* @var $this IngresosController */
/* @var $model Ingresos */
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
		<?php echo $form->label($model,'fecha_ingreso'); ?>
		<?php echo $form->textField($model,'fecha_ingreso'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'valor_ingreso'); ?>
		<?php echo $form->textField($model,'valor_ingreso'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'usuario_id'); ?>
		<?php echo $form->dropDownList($model,'usuario_id', CHtml::listData(Usuarios::model()->findAll(), 'id', 'nombre'),array('empty'=>'- Seleccione -')); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_ingreso_id'); ?>
		<?php echo $form->dropDownList($model,'tipo_ingreso_id', CHtml::listData(TipoIngresos::model()->findAll(), 'id', 'descripcion'),array('empty'=>'- Seleccione -')); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->