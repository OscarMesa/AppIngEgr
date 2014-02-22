
<?php
/** @var BootActiveForm $form */
$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id' => 'verticalForm',
    'htmlOptions' => array('class' => 'well', "enctype" => "multipart/form-data"),
        ));
?>
<?php echo $form->textFieldRow($programa, 'title', array('class' => 'span3', 'disabled' => 'disabled')); ?>
<?php echo $form->textFieldRow($programa, 'alias', array('class' => 'span3', 'disabled' => 'disabled')); ?>

<?php if ($estado == 1) { ?>
    <div class="alert alert-block">
        <p>Esta accion enviara un correo de notificacion al usuario, explicando que este articulo ya fue revisado y aprobado o desaprobado por un usuario de nettic.</p> 
    </div>
    <label for="">Aprobar contenido</label>
    <div style="width: 12em">
        <div class="switch small">
            <input id="x" name="AprobacionRevision[Radio_aprobar]" value='3' type="radio" checked>
            <label for="x" onclick="">No</label>

            <input id="x1" value='2' name="AprobacionRevision[Radio_aprobar]" type="radio">
            <label for="x1" onclick="">Si</label>

            <span></span>
        </div>
    </div>
    <label for="AprobacionRevision_razones_aprobacion">Razones</label>
    <!--  ver este link si quieren colocar este componente   http://www.yiiframework.com/extension/krichtexteditor/-->
    <?php echo CHtml::textArea('AprobacionRevision[razones_aprobacion]', '', array('rows' => '5', 'cols' => '50', 'id' => 'AprobacionRevision_razones_aprobacion', 'style' => 'width:40em')) ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('size' => 'Normal', 'buttonType' => 'submit', 'block' => false, 'label' => 'Revisar y enviar', 'htmlOptions' => array('style' => 'display:block;margin-top:12px;'))); ?>    

<?php } else if ($estado == 2) { ?>
    <?php ?>
    <div class="alert alert-block">
        <p>Mediante esta acción usted podrá revisar y aprobar el contenido de este programa, notificado por usario de Nettic.</p> 
    </div>
    <label for="">Aprobar contenido</label>
    <div style="width: 12em">
        <div class="switch small">
            <input id="x" name="AprobacionRevision[Radio_aprobar]" value='5' type="radio" checked>
            <label for="x" onclick="">No</label>

            <input id="x1" value='4' name="AprobacionRevision[Radio_aprobar]" type="radio">
            <label for="x1" onclick="">Si</label>
            
            <span></span>
        </div>
    </div>
    <label for="AprobacionRevision_razones_aprobacion">Razones</label>
    <!--  ver este link si quieren colocar este componente   http://www.yiiframework.com/extension/krichtexteditor/-->
    <?php echo CHtml::textArea('AprobacionRevision[razones_aprobacion]', '', array('rows' => '5', 'cols' => '50', 'id' => 'AprobacionRevision_razones_aprobacion', 'style' => 'width:40em')) ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('size' => 'Normal', 'buttonType' => 'submit', 'block' => false, 'label' => 'Revisar y enviar', 'htmlOptions' => array('style' => 'display:block;margin-top:12px;'))); ?>    

<?php } else if ($estado == 5) { ?> 

<?php } ?>    
<?php echo CHtml::hiddenField('V7guiK2Items[id]', $programa->id); ?> 
<?php echo CHtml::hiddenField('V7guiK2Items[estado]', $estado); ?>   

<?php $this->endWidget(); ?>
