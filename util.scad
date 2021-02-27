/******************************************************************************

        Util

/*****************************************************************************/

/**
 * Get the value for a key in an array of key value pairs.
 *
 * Data has the following format
 * example = [
 *     ["key1", 42],
 *     ["key2", 1337],
 * ];
 */
function get(data, key) = data[search([key], data)[0]][1];