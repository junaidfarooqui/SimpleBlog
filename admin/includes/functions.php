<?php

function getCategoriesHtml($categories, $articleId = null)
{
    $categoryTree = array();

    foreach ($categories as $category) {
        // If the category has no parent, add it to the top level of the hierarchy
        if ($category['parent_id'] === null) {
            $categoryTree[$category['id']] = $category;
        } else {
            // Otherwise, add it as a child of its parent category
            $categoryTree[$category['parent_id']]['children'][$category['id']] = $category;
        }
    }
    return createCheckboxTree($categoryTree);
}

function createCheckboxTree($categories, $parent_id = null, $activeCategories = null ) {
    $html = '';
    foreach ($categories as $category) {
        if ($category['parent_id'] == $parent_id) {
            $html .= '<li class="list-item"><label>';
            $html .= '<input class="form-check-input me-1" type="checkbox" name="categories[]" value="' . $category['id'] . '"> ' . $category['name'];
            if (isset($category['children'])) {
                $html .= '<ul>' . createCheckboxTree($category['children'], $category['id']) . '</ul>';
            }
            $html .= '</label></li>';
        }
    }
    return $html;
}
