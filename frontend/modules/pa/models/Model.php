<?php

namespace frontend\modules\pa\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * Model implements the CRUD actions for AuthItem model.
 */
class Model extends \yii\base\Model
{
	/**
	*Creates and populates a set of models
	*
	*@params string $modelClass
	*@params string $multipleModels
	*@return array
	*/

	public static function createMultiple ($modelClass, $multipleModels = [])
	{
		$model = new $modelClass;
		$formName = $model->formName();
		$post = Yii::$app->request->post($formName);
		$model = [];

		if (!empty($multipleModels)) {
			$keys = array_keys(ArrayHelper::map($multipleModels, 'id', 'id'));
			$multipleModels = array_combine($keys, $multipleModels);
		}

		if ($post && is_array($post)) {
			foreach ($post as $i => $item) {
				if (isset($item['id'] && !empty($item['id']) && isset($multipleModels[$item['id']])) 
				{
					$models[] = $multipleModels[$item['id']];
				}

				else {
					$models[] = new $modelClass;
				}
			}
		}

		unset($model, $formName, $post);
		return $models;
	}
}