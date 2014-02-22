<?php

$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'verticalForm',
    'action'=>$this->createUrl('usuario/registro'),
    'enableClientValidation'=>true,
    'clientOptions'=>array(
		'validateOnSubmit'=>true,
        ),
    'htmlOptions'=>array(
        'class'=>'well',
        ),
)); ?>

<?php

$model = new Perfiles();
echo $form->dropDownListRow($model, 'nombre',
 CHtml::listData($modelPerfil, 'id_perfil', 'nombre'));?>


<?php $this->endWidget(); ?>