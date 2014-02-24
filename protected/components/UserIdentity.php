<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
    public $user;
    /**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
            $usuarios = Usuarios::model()->findAll();
		$users=array(
			// username => password
			'demo'=> array('pass'=>sha1('demo'),'user' => null),
			'admin'=> array(sha1('admin'),'user' => null),
		);
                
                foreach ($usuarios as $usuario)
                {
                    $users[$usuario->username] = array('pass'=>$usuario->password,'user'=>$usuario);
                 }
		if(!isset($users[$this->username]))
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		elseif($users[$this->username]['pass']!==sha1 ($this->password))
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else{
                    $this->setUser($users[$this->username]['user']);
                    $this->errorCode=self::ERROR_NONE;
                 }
		return !$this->errorCode;
	}
         public function getUser()
    {
        return $this->user;
    }
 
    public function setUser(CActiveRecord $user)
    {
        $this->user=$user->attributes;
    }


        
}