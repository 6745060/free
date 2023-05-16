var i={};Object.defineProperty(i,"__esModule",{value:!0});/*!
 * is-plain-object <https://github.com/jonschlinkert/is-plain-object>
 *
 * Copyright (c) 2014-2017, Jon Schlinkert.
 * Released under the MIT License.
 */function n(e){return Object.prototype.toString.call(e)==="[object Object]"}function o(e){var t,r;return n(e)===!1?!1:(t=e.constructor,t===void 0?!0:(r=t.prototype,!(n(r)===!1||r.hasOwnProperty("isPrototypeOf")===!1)))}i.isPlainObject=o;export{i};
