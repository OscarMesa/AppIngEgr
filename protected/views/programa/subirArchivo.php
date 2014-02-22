
<?php /** @var BootActiveForm $form */
$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'verticalForm',
    'htmlOptions'=>array('class'=>'well',"enctype"=>"multipart/form-data"),
)); ?>
 
<?php echo $form->textFieldRow($model, 'title', array('class'=>'span3','disabled'=>'disabled')); ?>
<?php echo $form->textFieldRow($model, 'alias', array('class'=>'span3','disabled'=>'disabled')); ?>

<div class="bs-docs-archivos" id="conetendor-archivos"> 
    <?php $this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Nuevo',
    'size'=>'small',
    'type'=>'primary',
    'buttonType'=> 'button',
    'htmlOptions'=>array('style'=>'display:block;margin-top:12px;margin-bottom:6px;','id'=>'agregar-archivo'),
)); ?>
    <input id="V7guiK2Items_fileUpload_1" class="span3" type="file" numero="1" name="archivo[]">
</div> 
<?php $this->widget('bootstrap.widgets.TbButton', array('size'=>'Normal','buttonType'=>'submit', 'block'=>false,'label'=>'Enviar','htmlOptions'=>array('style'=>'display:block;margin-top:12px;'))); ?>
<?php echo CHtml::hiddenField('id',$model->id);?>
<?php $this->endWidget(); ?>

<script>
    $(document).on('click','#agregar-archivo',function(r){
       ele = $('.bs-docs-archivos').find('input[type="file"]');
       var input = document.createElement("input");
        input.type = "file";
        input.id = 'V7guiK2Items_fileUpload_'+(ele.length + 1);
        input.class = "span3";
        input.name = 'archivo[]';
       conteiner = document.getElementById('conetendor-archivos');
       conteiner.appendChild(input);   
    });
</script>