<?php

namespace frontend\models;

use yii\base\Model;
use yii\web\UploadedFile;


class UploadForm extends Model
{
	/**
	* @var UploadedFile
	*/

	public $imageFile;
	public $kode;

	public function rules()
	{
		return [
			['kode', 'string', 'max' => 10],
			[['imageFile'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg'],
		];
	}

	public function upload()
	{
		if ($this->validate()) {
			$this->imageFile->saveAs('uploads/' . $this->kode . '.' . strtolower($this->imageFile->extension));
			//$this->imageFile->saveAs('uploads/' . $this->imageFile->baseName . '.' . $this->imageFile->extension);

		return true;
		
	} else {
		return false;
	}
}
}
?>
