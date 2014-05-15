<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs = array(
    'Ingresos' => array('index'),
    $model->id,
);

$this->menu = array(
    array('label' => 'Listar ingresos', 'url' => array('index')),
    array('label' => 'Crear ingreso', 'url' => array('create')),
    array('label' => 'Actualizar ingreso', 'url' => array('update', 'id' => $model->id)),
    array('label' => 'Eliminar ingreso', 'url' => '#', 'linkOptions' => array('submit' => array('delete', 'id' => $model->id), 'confirm' => 'Are you sure you want to delete this item?')),
    array('label' => 'Administrar ingresos', 'url' => array('admin')),
);
?>
<?php
Yii::app()->clientScript->registerScript(
   'myHideEffect',
   '$(".successFlash").animate({opacity: 1.0}, 3000).fadeOut("slow");',
   CClientScript::POS_READY
);
?>
<?php if (Yii::app()->user->hasFlash('success')): ?>
    <div class="successFlash">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>

<h1>Ver Ingreso #<?php echo $model->id; ?></h1>

<?php
$this->widget('zii.widgets.CDetailView', array(
    'data' => $model,
    'attributes' => array(
        'id',
        'descripcion',
         array(
             'label' => $model->getAttributeLabel('fecha_ingreso'),
             'value' => date('Y-m-d',  strtotime($model->fecha_ingreso))
         ),
        'valor_ingreso',
        array(
            'label' => $model->getAttributeLabel('usuario_id'),
            'value' => $model->usuario->nombre1. ' '. $model->usuario->apellido1 ,
        ),
        array(
            'label' => $model->getAttributeLabel('tipo_ingreso_id'),
            'value' => $model->tipoIngreso->descripcion,
        ),
    ),
));
?>
