<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;


class PostPresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	private $database;


	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	public function renderShow($postId)
	{
		$post = $this->database->table('posts')->get($postId);
		if (!$post) {
			$this->error('Post not found');
		}

		$this->template->post = $post;
		$this->template->comments = $post->related('comment')->order('created_at');
	}


	protected function createComponentCommentForm()
	{
		$form = new Form;
		$form->addText('name', 'Your name:')
			->setRequired();

		$form->addEmail('email', 'Email:');

		$form->addTextArea('content', 'Comment:')
			->setRequired();

		$form->addSubmit('send', 'Publish comment');
		$form->onSuccess[] = [$this, 'commentFormSucceeded'];

		return $form;
	}


	public function commentFormSucceeded($form, $values)
	{
		$this->database->table('comments')->insert([
			'post_id' => $this->getParameter('postId'),
			'name' => $values->name,
			'email' => $values->email,
			'content' => $values->content,
		]);

		$this->flashMessage('Thank you for your comment', 'success');
		$this->redirect('this');
	}


	public function actionCreate()
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}
	}


	public function actionEdit($postId)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}

		$post = $this->database->table('posts')->get($postId);
		if (!$post) {
			$this->error('Post not found');
		}
		$this['postForm']->setDefaults($post->toArray());
	}


	protected function createComponentPostForm()
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->error('Příhlašte se prosím pro editaci článku');
		}

		$form = new Form;
		$form->addText('title', 'Title:')
			->setRequired();
		$form->addTextArea('content', 'Content:')
			->setRequired();

		$form->addSubmit('send', 'Ulo6it a publikovat');
		$form->onSuccess[] = [$this, 'postFormSucceeded'];

		return $form;
	}


	public function postFormSucceeded($form, $values)
	{
		$postId = $this->getParameter('postId');

		if ($postId) {
			$post = $this->database->table('posts')->get($postId);
			$post->update($values);
		} else {
			$post = $this->database->table('posts')->insert($values);
		}

		$this->flashMessage('Článek byl publikován', 'success');
		$this->redirect('show', $post->id);
	}

}
