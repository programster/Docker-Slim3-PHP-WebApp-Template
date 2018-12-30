<?php

/*
 * A basic controller for a slim application.
 */

class HomeController
{
    private $m_request;
    private $m_response;
    private $m_args;
    
    
    public function __construct(\Slim\Http\Request $request, \Slim\Http\Response $response, $args) 
    {
        $this->m_request = $request;
        $this->m_response = $response;
        $this->m_args = $args;
    }
    
    
    /**
     * Display hello world.
     */
    public function index()
    {
        $view = new HomeView($message="hello world");
        
        // You can treat views as strings e.g.
        $body = $view . " ";
        
        return $this->m_response->getBody()->write($body);
    }
}