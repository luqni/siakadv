<?php
namespace backend\modules\pa\models;
use Yii;
use yii\db\ActiveRecord;
use backend\modules\pa\models\Matkul;
use yii\db\Connection;


class Matkul extends ActiveRecord
{
	 function __construct($matakuliah)
	 {
	// 	// get all rows from the country table and order them by "name"
	 	// $matakuliah = Matkul::find()->orderBy('nama')->all();

	// 	// get the row whose primary key is "US"
	// 	// $country = Country::findOne('US');

	// 	// displays "United States"
	// 	echo $matakuliah->nama;

	// 	// modifies the country name to be "U.S.A." and save it to database
	// 	// $country->name = 'U.S.A.';
	// 	// $country->save();
	 }
	
}



?>