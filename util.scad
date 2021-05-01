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


function rotZM(angle) = 
      [[cos(angle), -sin(angle), 0, 0],
       [sin(angle),  cos(angle), 0, 0],
       [         0,           0, 1, 0],
       [         0,           0, 0, 1]];

function moveM(pos)
    = [[1, 0, 0, pos[0]],
       [0, 1, 0, pos[1]],
       [0, 0, 1, pos[2]],
       [0, 0, 0, 1]];

function vec3(vec) = [vec[0], vec[1], vec[2]];
function vec2(vec) = [vec[0], vec[1]];
