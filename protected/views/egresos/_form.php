<?php
/* @var $this EgresosController */
/* @var $model Egresos */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'egresos-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Los campos con <span class="required">*</span> son requeridos.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'descripcion'); ?>
		<?php echo $form->textField($model,'descripcion',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'descripcion'); ?>
	</div>

<!--	<div class="row">
		<?php //echo $form->labelEx($model,'fecha_egreso'); ?>
		<?php //echo $form->textField($model,'fecha_egreso'); ?>
		<?php //echo $form->error($model,'fecha_egreso'); ?>
	</div>-->

	<div class="row">
		<?php echo $form->labelEx($model,'valor_egresos'); ?>
		<?php echo $form->textField($model,'valor_egresos'); ?>
		<?php echo $form->error($model,'valor_egresos'); ?>
	</div>

<!--	<div class="row">
		<?php //echo $form->labelEx($model,'usuario_id'); ?>
		<?php //echo $form->textField($model,'usuario_id'); ?>
		<?php //echo $form->error($model,'usuario_id'); ?>
	</div>-->

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_egreso_id'); ?>		
                <?php echo $form->dropDownList($model,'tipo_egreso_id', CHtml::listData(TipoEgresos::model()->findAll(), 'id', 'descripcion'),array('empty'=>'- Seleccione -'));?>
		<?php echo $form->error($model,'tipo_egreso_id'); ?>
	</div>
    
    <div class="row">
		<?php echo $form->labelEx($model,'fecha_egreso'); ?>
        <?php 
            $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model' => $model,
                'value'=>date('Y-m-d'),
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
		<?php echo $form->error($model,'fecha_egreso'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->