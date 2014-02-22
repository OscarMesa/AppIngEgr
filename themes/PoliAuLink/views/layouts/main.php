<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="es" />

	<!-- blueprint CSS framework -->
	 <?php Yii::app()->bootstrap->register();?>
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/template.css"/>
        <script src="<?php echo Yii::app()->baseUrl; ?>/js/jquery.tools.min.js"></script>
</head>

<body>

<div class="container_16" id="page">

	<div id="header" class="grid_16">
		<div id="banner" class="grid_16 alpha omega">
                    <div align="center">
                        <h1>aerovision</h1>
                        
                    </div>
                    </div>
            <div class="clear"></div>
                <div id="menu_superior" class="grid_16 alpha omega"> <?php $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>'Ingresar', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>'Salir ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
			),
		)); ?>
                </div>
	</div><!-- header -->
        <div class="clear"></div>
        <div class="clear"></div>
<div class="grid_3">  
	<div >
            &nbsp;

		
	</div><!-- mainmenu -->
</div>
<div  class="grid_16">
	<?php  echo $content; ?>
</div>
                        <div class="clear"></div>
	<div id="footer">
		<p style="text-align: center;">
                    
                  Aerovision
    </p>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>