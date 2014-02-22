<?php
/* @var $this TipoIngresosController */
/* @var $model TipoIngresos */

$this->breadcrumbs=array(
	'Tipo Ingresoses'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List TipoIngresos', 'url'=>array('index')),
	array('label'=>'Create TipoIngresos', 'url'=>array('create')),
	array('label'=>'Update TipoIngresos', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete TipoIngresos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoIngresos', 'url'=>array('admin')),
);
?>

<h1>View TipoIngresos #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripcion',
	),
)); ?>
