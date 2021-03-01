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
function x(val) = [val,0,0];
function y(val) = [0,val,0];
function z(val) = [0,0,val];
