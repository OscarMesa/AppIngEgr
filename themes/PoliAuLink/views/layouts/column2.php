<?php $this->beginContent('//layouts/main'); ?>
<div class="container">
 	<div class="alpha grid_3">
		<div id="sidebar">
                    &nbsp;
		<?php
                if(!Yii::app()->user->isGuest){
			$this->beginWidget('zii.widgets.CPortlet', array(
				'title'=>'Operaciones',
			));
			$this->widget('zii.widgets.CMenu', array(
				'items'=>$this->menu,
				'htmlOptions'=>array('class'=>'operations'),
			));
			$this->endWidget();
                }
		?>
		
		</div><!-- sidebar -->
	</div>   
	<div class="grid_13 omega">
		<div id="content">
			<?php echo $content; ?>
		</div><!-- content -->
	</div>

</div>
<?php $this->endContent(); ?>