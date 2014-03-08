<?php
/* @var $this EgresosController */
/* @var $data Egresos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('descripcion')); ?>:</b>
	<?php echo CHtml::encode($data->descripcion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_egreso')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_egreso); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('valor_egresos')); ?>:</b>
	<?php echo CHtml::encode($data->valor_egresos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_id')); ?>:</b>
	<?php echo CHtml::encode($data->usuario->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_egreso_id')); ?>:</b>
	<?php echo CHtml::encode($data->tipoEgreso->descripcion); ?>
	<br />


</div>