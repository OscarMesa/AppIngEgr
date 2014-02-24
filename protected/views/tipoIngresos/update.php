<?php
/* @var $this TipoIngresosController */
/* @var $model TipoIngresos */

$this->breadcrumbs=array(
	'Tipo Ingresoses'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List TipoIngresos', 'url'=>array('index')),
	array('label'=>'Create TipoIngresos', 'url'=>array('create')),
	array('label'=>'View TipoIngresos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage TipoIngresos', 'url'=>array('admin')),
);
?>

<h1>Update TipoIngresos <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>