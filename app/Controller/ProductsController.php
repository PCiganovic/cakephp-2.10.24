<?php
App::uses('AppController', 'Controller');
/**
 * Products Controller
 */
class ProductsController extends AppController {

/**
 * Scaffold
 *
 * @var mixed
 */
	public $scaffold;

	public function add(){
		$this->layout = false;
		$response = array('status'=>'failed', 'message'=>'HTTP method not allowed');
		if($this->request->is('post')){

			//get data from request object
			$data = $this->request->input('json_decode', true);
			if(empty($data)){
				$data = $this->request->data;
			}

			//response if post data or form data was not passed
			$response = array('status'=>'failed', 'message'=>'Please provide form data');

			if(!empty($data)){
				//call the model's save function
				if($this->Product->save($data)){
					//return success
					$pid = $this->Product->id;
					$response = array('status'=>'success','message'=>'Product ID: '. $pid .' successfully created', 'id'=>$pid);
				} else{
					$response = array('status'=>'failed', 'message'=>'Failed to save data');
				}
			}
		}

		$this->response->type('application/json');
		$this->response->body(json_encode($response));
		return $this->response->send();
	}

	public function view($id = null)
	{
		$this->layout = false;
		//set default response
		$response = array('status' => 'failed', 'message' => 'Failed to process request');

		//check if ID was passed
		if (!empty($id)) {

			//find data by ID
			$result = $this->Product->findById($id);
			if (!empty($result)) {
				$response = array('status' => 'success', 'data' => $result);
			} else {
				$response['message'] = 'Found no matching data';
			}
		} else {
			$response['message'] = 'Please provide ID';
		}

		$this->response->type('application/json');
		$this->response->body(json_encode($response));
		return $this->response->send();
	}

	public function update()
	{
		//set layout as false to unset default CakePHP layout. This is to prevent our JSON response from mixing with HTML
		$this->layout = false;

		//set default response
		$response = array('status' => 'failed', 'message' => 'HTTP method not allowed');

		//check if HTTP method is PUT
		if ($this->request->is('put')) {
			//get data from request object
			$data = $this->request->input('json_decode', true);
			if (empty($data)) {
				$data = $this->request->data;
			}

			//check if product ID was provided
			if (!empty($data['id'])) {

				//set the product ID to update
				$this->Product->id = $data['id'];
				if ($this->Product->save($data)) {
					$response = array('status' => 'success', 'message' => 'Product successfully updated');
				} else {
					$response['message'] = 'Failed to update product';
				}
			} else {
				$response['message'] = 'Please provide product ID';
			}
		}

		$this->response->type('application/json');
		$this->response->body(json_encode($response));
		return $this->response->send();
	}

	public function ajax_delete(){
		$this->layout = false;

		//set default response
		$response = array('status'=>'failed', 'message'=>'HTTP method not allowed');

		//check if HTTP method is DELETE
		if($this->request->is('delete')){
			//get data from request object
			$data = $this->request->input('json_decode', true);
			if(empty($data)){
				$data = $this->request->data;
			}

			//check if product ID was provided
			if(!empty($data['id'])){
				//set the product ID to update
				$this->Product->id = intval($data['id']);
				if($this->Product->delete($this->Product->id, true)){
					$response = array('status'=>'success','message'=>'Product successfully deleted');
				}
			}
		}

		$this->response->type('application/json');
		$this->response->body(json_encode($response));
		return $this->response->send();
	}
}
