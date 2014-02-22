<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'usuarios-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="help-block">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'state_usuario',array('class'=>'span5','maxlength'=>8)); ?>

	<?php echo $form->textFieldRow($model,'nombre',array('class'=>'span5','maxlength'=>30)); ?>

	<?php echo $form->textFieldRow($model,'apellido1',array('class'=>'span5','maxlength'=>30)); ?>

	<?php echo $form->textFieldRow($model,'apellido2',array('class'=>'span5','maxlength'=>30)); ?>

	<?php echo $form->textFieldRow($model,'contrasena',array('class'=>'span5','maxlength'=>40)); ?>

	<?php echo $form->textFieldRow($model,'telefono',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'celular',array('class'=>'span5','maxlength'=>20)); ?>

	<?php echo $form->textFieldRow($model,'correo',array('class'=>'span5','maxlength'=>50)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
