<?php

/*
 * A view for the home page. This is just here to demonstrate the way views
 * work here..
 */

class HomeView extends AbstractView
{
    private $m_message;
    
    /**
     * Constructor for the view, put your required variables here.
     */
    public function __construct($message)
    {
        $this->m_message = $message;
    }
    
    
    /**
     * Put your html or echo out content within this function.
     */
    protected function renderContent()
    {
        ?>
        
        <h2>Hello there!</h2>
        <p>The passed in message was: <?= $this->m_message; ?></p>
        
        <?php
    }
}