<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'usuarios-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Los campos con <span class="required">*</span> son requeridos.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre1'); ?>
		<?php echo $form->textField($model,'nombre1',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'nombre1'); ?>
	</div>
        
	<div class="row">
		<?php echo $form->labelEx($model,'nombre2'); ?>
		<?php echo $form->textField($model,'nombre2',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'nombre2'); ?>
	</div>        

        <div class="row">
		<?php echo $form->labelEx($model,'apellido1'); ?>
		<?php echo $form->textField($model,'apellido1',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'apellido1'); ?>
	</div>        

        <div class="row">
		<?php echo $form->labelEx($model,'apellido2'); ?>
		<?php echo $form->textField($model,'apellido2',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'apellido2'); ?>
	</div>        

	<div class="row">
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->textField($model,'username',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'email'); ?>
		<?php echo $form->textField($model,'email',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'password'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'password2'); ?>
		<?php echo $form->passwordField($model,'password2',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'password2'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->