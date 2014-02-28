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
		<?php echo $form->label($model,'deescripcion'); ?>
		<?php echo $form->textField($model,'deescripcion',array('size'=>60,'maxlength'=>300)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_ingreso'); ?>
		<?php echo $form->textField($model,'fecha_ingreso'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'valor_egresos'); ?>
		<?php echo $form->textField($model,'valor_egresos'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'usuario_id'); ?>
		<?php echo $form->dropDownList($model,'usuario_id',  CHtml::listData(Usuarios::model()->findAll(),'id','nombre')); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_egreso_id'); ?>
                <?php echo $form->dropDownList($model,'tipo_egreso_id',  CHtml::listData(TipoEgresos::model()->findAll(),'id','descripcion')); ?>		
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->