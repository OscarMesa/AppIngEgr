<?php
/* @var $this TipoEgresosController */
/* @var $model TipoEgresos */

$this->breadcrumbs=array(
	'Tipo Egresoses'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List TipoEgresos', 'url'=>array('index')),
	array('label'=>'Create TipoEgresos', 'url'=>array('create')),
	array('label'=>'Update TipoEgresos', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete TipoEgresos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoEgresos', 'url'=>array('admin')),
);
?>

<h1>View TipoEgresos #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripcion',
	),
)); ?>
