<?php
/**
 * Created by PhpStorm.
 * User: zidan
 * Date: 31.10.2016
 * Time: 20:38
 */

namespace App\Presenters;

use Nette;
use Nette\Forms\Form;

class LoginPresenter extends Nette\Application\UI\Presenter
{
    private $database;

    public function __construct(Nette\Database\Context $database)
    {
        $this->database = $database;
    }

    public function renderDefault()
    {
        $this->template->posts = $this->database->table('articles')->order('id DESC')->limit(5);
    }

    protected function createComponentCommentForm()
    {
        $form = new Form;

        $form->addText('username', 'Uživatelské jméno: ')->setRequired();
        $form->addPassword('password', 'heslo: ');
        $form->addSubmit('send', 'Prihlasit se');
        return $form;

    }
}