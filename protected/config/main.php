<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
Yii::setPathOfAlias('bootstrap', dirname(__FILE__) . '/../extensions/bootstrap');
return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'PoliAuLink',
    'language' => "es",
    'defaultController' => 'usuarios/inicio',
    'theme' => 'PoliAuLink',
    // preloading 'log' component
    'preload' => array('log'),
    // autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.extensions.*',
        'application.models.appjoomla.*',
        'application.components.*',
        'ext.yii-mail.YiiMailMessage',
    ),
    'modules' => array(
        // uncomment the following to enable the Gii tool

        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => 'admin',
            // If removed, Gii defaults to localhost only. Edit carefully to taste.
            'ipFilters' => array('127.0.0.1', '::1'),
            'generatorPaths' => array(
                'bootstrap.gii',
            ),
        ),
    ),
    // application components
    'components' => array(
        'log' => array(
            'session' => array(
                'timeout' => 60,
            ),
            'class' => 'CLogRouter',
            'routes' => array(
                /* array(
                  'class' => 'CWebLogRoute',
                  'categories' => 'system.db.CDbCommand',
                  'showInFireBug' => true,
                  ), */
                array(
                    'class' => 'CEmailLogRoute',
                    'levels' => 'error, warning',
                    'emails' => 'oscarmesa.elpoli@gmail.com',
                ),
            ),
        ),
        'bootstrap' => array(
            'class' => 'bootstrap.components.Bootstrap',
        ),
        'user' => array(
            // enable cookie-based authentication
            'allowAutoLogin' => true,
        ),
        // uncomment the following to enable URLs in path-format
        'urlManager' => array(
            'urlFormat' => 'path',
            'rules' => array(
          '<controller:\w+>/<id:\d+>'=>'<controller>/view',
          '<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
          '<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
                'programa/subirArchivo/<id>' => 'programa/subirArchivo',
                'programa/ActualizaEstado/<programa>/<estado>' => 'programa/ActualizaEstado'
            ),
        ),
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=math;unix_socket:/path/to/socket/mysql.sock',
            'emulatePrepare' => true,
            'username' => 'oscar',
            'password' => 'oscarmesa',
            'charset' => 'utf8',
            'tablePrefix' => '',
            'enableProfiling' => true,
        ),
        // uncomment the following to use a MySQL database
        /*
          'db'=>array(
          'connectionString' => 'mysql:host=localhost;dbname=testdrive',
          'emulatePrepare' => true,
          'username' => 'root',
          'password' => '',
          'charset' => 'utf8',
          ),
         */
        'errorHandler' => array(
            // use 'site/error' action to display errors
            'errorAction' => 'site/error',
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    //'levels' => 'error, warning',
                    'categories' => 'system.db.*',
                    'logFile' => 'sql.log',
                ),
            // uncomment the following to show log messages on web pages
            /*
              array(
              'class'=>'CWebLogRoute',
              ),
             */
            ),
        ),
        'mail' => array(
            'class' => 'ext.yii-mail.YiiMail',
            'transportType' => 'smtp',
            'transportOptions' => array(
                'host' => 'aerovision.com.co',
                'username' => 'info@aerovision.com.co',
                'password' => 'aerovision',
                'port' => '25',
            ),
            'viewPath' => 'application.views.mail',
        ),
    ),
    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params' => array(
        // this is used in contact page
        'adminEmail' => 'info@aerovision.com.co',
    ),
);