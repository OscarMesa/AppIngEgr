<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs=array(
	'Ingresoses'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Ingresos', 'url'=>array('index')),
	array('label'=>'Create Ingresos', 'url'=>array('create')),
	array('label'=>'Update Ingresos', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Ingresos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Ingresos', 'url'=>array('admin')),
);
?>

<h1>View Ingresos #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripcion',
		'fecha_ingreso',
		'valor_ingreso',
		'usuario_id',
		'tipo_egreso',
	),
)); ?>
