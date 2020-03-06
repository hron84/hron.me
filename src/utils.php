<?php

function path_join(...$elements) {
    return implode(DIRECTORY_SEPARATOR, $elements);
}
