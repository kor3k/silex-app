<?php

namespace App\Entity;

class User
{
    private $id;

    private $username;

    private $isAdmin;

    public function __construct()
    {
        $this->isAdmin  =   false;
    }

    /**
     * @param string $username
     * @return $this
     */
    public function setUsername( $username )
    {
        $this->username =   strtolower( (string)$username );
        return $this;
    }

    /**
     * @param bool $isAdmin
     * @return $this
     */
    public function setAdmin( $isAdmin = true )
    {
        $this->isAdmin  =   (boolean)$isAdmin;
        return $this;
    }

    /**
     * @return string
     */
    public function getUsername()
    {
        return strtoupper( $this->username );
    }

    /**
     * @return boolean
     */
    public function isAdmin()
    {
        return (boolean)$this->isAdmin;
    }

    /**
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
}