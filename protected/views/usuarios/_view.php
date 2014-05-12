<?php
/* @var $this UsuariosController */
/* @var $data Usuarios */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre1')); ?>:</b>
	<?php echo CHtml::encode($data->nombre1); ?>
	<br />

        <b><?php echo CHtml::encode($data->getAttributeLabel('nombre2')); ?>:</b>
	<?php echo CHtml::encode($data->nombre2); ?>
        <br/>

        <b><?php echo CHtml::encode($data->getAttributeLabel('apellido1')); ?>:</b>
	<?php echo CHtml::encode($data->apellido1); ?>
        <br/>
       
        <b><?php echo CHtml::encode($data->getAttributeLabel('apellido2')); ?>:</b>
	<?php echo CHtml::encode($data->apellido2); ?>
        <br/>
       
	<b><?php echo CHtml::encode($data->getAttributeLabel('username')); ?>:</b>
	<?php echo CHtml::encode($data->username); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email')); ?>:</b>
	<?php echo CHtml::encode($data->email); ?>
	<br />


</div>