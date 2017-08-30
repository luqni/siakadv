<?php

namespace mdm\widgets;

use Yii;
use yii\helpers\Html;
use yii\base\Model;
use yii\helpers\Inflector;
use yii\widgets\ActiveForm;

/**
 * Description of DataColumn
 *
 * @author Misbahul D Munir <misbahuldmunir@gmail.com>
 * @since 1.0
 */
class DataColumn extends Column
{
    /**
     * @var string attribute
     */
    public $attribute;
    /**
     * @var array option for input
     */
    public $inputOptions = ['class' => 'form-control'];
    /**
     * @var array|\Closure
     */
    public $items;

    /**
     * @inheritdoc
     */
    public function init()
    {
        if ($this->attribute) {
            $field = str_replace(['[]', '][', '[', ']', ' ', '.'], ['', '-', '-', '', '-', '-'], $this->attribute);
        } else {
            $field = false;
        }
        if (empty($this->inputOptions['data-field']) && $field) {
            $this->inputOptions['data-field'] = $field;
        }
        if (empty($this->contentOptions['data-column']) && $field) {
            $this->contentOptions['data-column'] = $field;
        }
        if (empty($this->headerOptions['data-column']) && $field) {
            $this->headerOptions['data-column'] = $field;
        }
        if ($this->header === null) {
            if ($this->grid->model instanceof Model && !empty($this->attribute)) {
                $this->header = $this->grid->model->getAttributeLabel($this->attribute);
            } else {
                $this->header = Inflector::camel2words($this->attribute);
            }
        }
        if ($this->value === null) {
            $this->value = [$this, 'renderInputCell'];
        } elseif (is_string($this->value)) {
            $this->attribute = $this->value;
            $this->value = [$this, 'renderTextCell'];
        }
    }

    /**
     * Render input cell
     * @param Model $model model for cell
     * @param string $key
     * @param integer $index
     * @return string
     */
    public function renderInputCell($model, $key, $index)
    {
        $form = $this->grid->form;
        $items = $this->items;
        if ($items !== null) {
            if ($items instanceof \Closure) {
                $items = call_user_func($items, $model, $key, $index);
            }
            if ($form instanceof ActiveForm) {
                return $form->field($model, "[$key]{$this->attribute}")
                        ->dropDownList($items, $this->inputOptions)->label(false);
            } else {
                return Html::activeDropDownList($model, "[$key]{$this->attribute}", $items, $this->inputOptions);
            }
        } else {
            if ($form instanceof ActiveForm) {
                return $form->field($model, "[$key]{$this->attribute}")
                        ->textInput($this->inputOptions)->label(false);
            }
            return Html::activeTextInput($model, "[$key]{$this->attribute}", $this->inputOptions);
        }
    }

    /**
     * Render input cell
     * @param Model $model model for cell
     * @param string $key
     * @return string
     */
    public function renderTextCell($model, $key)
    {
        return Html::getAttributeValue($model, "[$key]{$this->attribute}");
    }
}
