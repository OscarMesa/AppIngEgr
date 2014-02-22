<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egresoses'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Egresos', 'url'=>array('index')),
	array('label'=>'Create Egresos', 'url'=>array('create')),
	array('label'=>'Update Egresos', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Egresos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Egresos', 'url'=>array('admin')),
);
?>

<h1>View Egresos #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'deescripcion',
		'fecha_ingreso',
		'valor_egresos',
		'usuario_id',
		'tipo_egreso_id',
	),
)); ?>
