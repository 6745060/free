import{i as W,d as Et,h as V,a as M,b as rt,c as p,t as bt,N as St,e as A,f as F,g as j,m as It,j as Mt}from"./@vue_shared@3.3.2-50d8a10d.js";let f;class Tt{constructor(e=!1){this.detached=e,this._active=!0,this.effects=[],this.cleanups=[],this.parent=f,!e&&f&&(this.index=(f.scopes||(f.scopes=[])).push(this)-1)}get active(){return this._active}run(e){if(this._active){const s=f;try{return f=this,e()}finally{f=s}}}on(){f=this}off(){f=this.parent}stop(e){if(this._active){let s,r;for(s=0,r=this.effects.length;s<r;s++)this.effects[s].stop();for(s=0,r=this.cleanups.length;s<r;s++)this.cleanups[s]();if(this.scopes)for(s=0,r=this.scopes.length;s<r;s++)this.scopes[s].stop(!0);if(!this.detached&&this.parent&&!e){const n=this.parent.scopes.pop();n&&n!==this&&(this.parent.scopes[this.index]=n,n.index=this.index)}this.parent=void 0,this._active=!1}}}function he(t){return new Tt(t)}function xt(t,e=f){e&&e.active&&e.effects.push(t)}function _e(){return f}function pe(t){f&&f.cleanups.push(t)}const Y=t=>{const e=new Set(t);return e.w=0,e.n=0,e},it=t=>(t.w&R)>0,ct=t=>(t.n&R)>0,Kt=({deps:t})=>{if(t.length)for(let e=0;e<t.length;e++)t[e].w|=R},Pt=t=>{const{deps:e}=t;if(e.length){let s=0;for(let r=0;r<e.length;r++){const n=e[r];it(n)&&!ct(n)?n.delete(t):e[s++]=n,n.w&=~R,n.n&=~R}e.length=s}},z=new WeakMap;let S=0,R=1;const C=30;let h;const E=Symbol(""),G=Symbol("");class Ot{constructor(e,s=null,r){this.fn=e,this.scheduler=s,this.active=!0,this.deps=[],this.parent=void 0,xt(this,r)}run(){if(!this.active)return this.fn();let e=h,s=v;for(;e;){if(e===this)return;e=e.parent}try{return this.parent=h,h=this,v=!0,R=1<<++S,S<=C?Kt(this):X(this),this.fn()}finally{S<=C&&Pt(this),R=1<<--S,h=this.parent,v=s,this.parent=void 0,this.deferStop&&this.stop()}}stop(){h===this?this.deferStop=!0:this.active&&(X(this),this.onStop&&this.onStop(),this.active=!1)}}function X(t){const{deps:e}=t;if(e.length){for(let s=0;s<e.length;s++)e[s].delete(t);e.length=0}}let v=!0;const ot=[];function yt(){ot.push(v),v=!1}function jt(){const t=ot.pop();v=t===void 0?!0:t}function u(t,e,s){if(v&&h){let r=z.get(t);r||z.set(t,r=new Map);let n=r.get(s);n||r.set(s,n=Y()),at(n)}}function at(t,e){let s=!1;S<=C?ct(t)||(t.n|=R,s=!it(t)):s=!t.has(h),s&&(t.add(h),h.deps.push(t))}function m(t,e,s,r,n,i){const c=z.get(t);if(!c)return;let o=[];if(e==="clear")o=[...c.values()];else if(s==="length"&&p(t)){const l=Number(r);c.forEach((d,g)=>{(g==="length"||g>=l)&&o.push(d)})}else switch(s!==void 0&&o.push(c.get(s)),e){case"add":p(t)?F(s)&&o.push(c.get("length")):(o.push(c.get(E)),j(t)&&o.push(c.get(G)));break;case"delete":p(t)||(o.push(c.get(E)),j(t)&&o.push(c.get(G)));break;case"set":j(t)&&o.push(c.get(E));break}if(o.length===1)o[0]&&N(o[0]);else{const l=[];for(const d of o)d&&l.push(...d);N(Y(l))}}function N(t,e){const s=p(t)?t:[...t];for(const r of s)r.computed&&Z(r);for(const r of s)r.computed||Z(r)}function Z(t,e){(t!==h||t.allowRecurse)&&(t.scheduler?t.scheduler():t.run())}function zt(t,e){var s;return(s=z.get(t))==null?void 0:s.get(e)}const At=It("__proto__,__v_isRef,__isVue"),ft=new Set(Object.getOwnPropertyNames(Symbol).filter(t=>t!=="arguments"&&t!=="caller").map(t=>Symbol[t]).filter(W)),Dt=$(),Ht=$(!1,!0),Ct=$(!0),k=Gt();function Gt(){const t={};return["includes","indexOf","lastIndexOf"].forEach(e=>{t[e]=function(...s){const r=a(this);for(let i=0,c=this.length;i<c;i++)u(r,"get",i+"");const n=r[e](...s);return n===-1||n===!1?r[e](...s.map(a)):n}}),["push","pop","shift","unshift","splice"].forEach(e=>{t[e]=function(...s){yt();const r=a(this)[e].apply(this,s);return jt(),r}}),t}function Nt(t){const e=a(this);return u(e,"has",t),e.hasOwnProperty(t)}function $(t=!1,e=!1){return function(r,n,i){if(n==="__v_isReactive")return!t;if(n==="__v_isReadonly")return t;if(n==="__v_isShallow")return e;if(n==="__v_raw"&&i===(t?e?ee:pt:e?_t:ht).get(r))return r;const c=p(r);if(!t){if(c&&A(k,n))return Reflect.get(k,n,i);if(n==="hasOwnProperty")return Nt}const o=Reflect.get(r,n,i);return(W(n)?ft.has(n):At(n))||(t||u(r,"get",n),e)?o:_(o)?c&&F(n)?o:o.value:M(o)?t?gt(o):dt(o):o}}const Wt=ut(),Vt=ut(!0);function ut(t=!1){return function(s,r,n,i){let c=s[r];if(b(c)&&_(c)&&!_(n))return!1;if(!t&&(!wt(n)&&!b(n)&&(c=a(c),n=a(n)),!p(s)&&_(c)&&!_(n)))return c.value=n,!0;const o=p(s)&&F(r)?Number(r)<s.length:A(s,r),l=Reflect.set(s,r,n,i);return s===a(i)&&(o?V(n,c)&&m(s,"set",r,n):m(s,"add",r,n)),l}}function Ft(t,e){const s=A(t,e);t[e];const r=Reflect.deleteProperty(t,e);return r&&s&&m(t,"delete",e,void 0),r}function Yt(t,e){const s=Reflect.has(t,e);return(!W(e)||!ft.has(e))&&u(t,"has",e),s}function $t(t){return u(t,"iterate",p(t)?"length":E),Reflect.ownKeys(t)}const lt={get:Dt,set:Wt,deleteProperty:Ft,has:Yt,ownKeys:$t},Bt={get:Ct,set(t,e){return!0},deleteProperty(t,e){return!0}},qt=Mt({},lt,{get:Ht,set:Vt}),B=t=>t,D=t=>Reflect.getPrototypeOf(t);function x(t,e,s=!1,r=!1){t=t.__v_raw;const n=a(t),i=a(e);s||(e!==i&&u(n,"get",e),u(n,"get",i));const{has:c}=D(n),o=r?B:s?J:I;if(c.call(n,e))return o(t.get(e));if(c.call(n,i))return o(t.get(i));t!==n&&t.get(e)}function K(t,e=!1){const s=this.__v_raw,r=a(s),n=a(t);return e||(t!==n&&u(r,"has",t),u(r,"has",n)),t===n?s.has(t):s.has(t)||s.has(n)}function P(t,e=!1){return t=t.__v_raw,!e&&u(a(t),"iterate",E),Reflect.get(t,"size",t)}function tt(t){t=a(t);const e=a(this);return D(e).has.call(e,t)||(e.add(t),m(e,"add",t,t)),this}function et(t,e){e=a(e);const s=a(this),{has:r,get:n}=D(s);let i=r.call(s,t);i||(t=a(t),i=r.call(s,t));const c=n.call(s,t);return s.set(t,e),i?V(e,c)&&m(s,"set",t,e):m(s,"add",t,e),this}function st(t){const e=a(this),{has:s,get:r}=D(e);let n=s.call(e,t);n||(t=a(t),n=s.call(e,t)),r&&r.call(e,t);const i=e.delete(t);return n&&m(e,"delete",t,void 0),i}function nt(){const t=a(this),e=t.size!==0,s=t.clear();return e&&m(t,"clear",void 0,void 0),s}function O(t,e){return function(r,n){const i=this,c=i.__v_raw,o=a(c),l=e?B:t?J:I;return!t&&u(o,"iterate",E),c.forEach((d,g)=>r.call(n,l(d),l(g),i))}}function y(t,e,s){return function(...r){const n=this.__v_raw,i=a(n),c=j(i),o=t==="entries"||t===Symbol.iterator&&c,l=t==="keys"&&c,d=n[t](...r),g=s?B:e?J:I;return!e&&u(i,"iterate",l?G:E),{next(){const{value:T,done:H}=d.next();return H?{value:T,done:H}:{value:o?[g(T[0]),g(T[1])]:g(T),done:H}},[Symbol.iterator](){return this}}}}function w(t){return function(...e){return t==="delete"?!1:this}}function Lt(){const t={get(i){return x(this,i)},get size(){return P(this)},has:K,add:tt,set:et,delete:st,clear:nt,forEach:O(!1,!1)},e={get(i){return x(this,i,!1,!0)},get size(){return P(this)},has:K,add:tt,set:et,delete:st,clear:nt,forEach:O(!1,!0)},s={get(i){return x(this,i,!0)},get size(){return P(this,!0)},has(i){return K.call(this,i,!0)},add:w("add"),set:w("set"),delete:w("delete"),clear:w("clear"),forEach:O(!0,!1)},r={get(i){return x(this,i,!0,!0)},get size(){return P(this,!0)},has(i){return K.call(this,i,!0)},add:w("add"),set:w("set"),delete:w("delete"),clear:w("clear"),forEach:O(!0,!0)};return["keys","values","entries",Symbol.iterator].forEach(i=>{t[i]=y(i,!1,!1),s[i]=y(i,!0,!1),e[i]=y(i,!1,!0),r[i]=y(i,!0,!0)}),[t,s,e,r]}const[Ut,Jt,Qt,Xt]=Lt();function q(t,e){const s=e?t?Xt:Qt:t?Jt:Ut;return(r,n,i)=>n==="__v_isReactive"?!t:n==="__v_isReadonly"?t:n==="__v_raw"?r:Reflect.get(A(s,n)&&n in r?s:r,n,i)}const Zt={get:q(!1,!1)},kt={get:q(!1,!0)},te={get:q(!0,!1)},ht=new WeakMap,_t=new WeakMap,pt=new WeakMap,ee=new WeakMap;function se(t){switch(t){case"Object":case"Array":return 1;case"Map":case"Set":case"WeakMap":case"WeakSet":return 2;default:return 0}}function ne(t){return t.__v_skip||!Object.isExtensible(t)?0:se(bt(t))}function dt(t){return b(t)?t:L(t,!1,lt,Zt,ht)}function de(t){return L(t,!1,qt,kt,_t)}function gt(t){return L(t,!0,Bt,te,pt)}function L(t,e,s,r,n){if(!M(t)||t.__v_raw&&!(e&&t.__v_isReactive))return t;const i=n.get(t);if(i)return i;const c=ne(t);if(c===0)return t;const o=new Proxy(t,c===2?r:s);return n.set(t,o),o}function U(t){return b(t)?U(t.__v_raw):!!(t&&t.__v_isReactive)}function b(t){return!!(t&&t.__v_isReadonly)}function wt(t){return!!(t&&t.__v_isShallow)}function ge(t){return U(t)||b(t)}function a(t){const e=t&&t.__v_raw;return e?a(e):t}function we(t){return Et(t,"__v_skip",!0),t}const I=t=>M(t)?dt(t):t,J=t=>M(t)?gt(t):t;function vt(t){v&&h&&(t=a(t),at(t.dep||(t.dep=Y())))}function Q(t,e){t=a(t);const s=t.dep;s&&N(s)}function _(t){return!!(t&&t.__v_isRef===!0)}function re(t){return Rt(t,!1)}function ve(t){return Rt(t,!0)}function Rt(t,e){return _(t)?t:new ie(t,e)}class ie{constructor(e,s){this.__v_isShallow=s,this.dep=void 0,this.__v_isRef=!0,this._rawValue=s?e:a(e),this._value=s?e:I(e)}get value(){return vt(this),this._value}set value(e){const s=this.__v_isShallow||wt(e)||b(e);e=s?e:a(e),V(e,this._rawValue)&&(this._rawValue=e,this._value=s?e:I(e),Q(this))}}function Re(t){Q(t)}function ce(t){return _(t)?t.value:t}const oe={get:(t,e,s)=>ce(Reflect.get(t,e,s)),set:(t,e,s,r)=>{const n=t[e];return _(n)&&!_(s)?(n.value=s,!0):Reflect.set(t,e,s,r)}};function me(t){return U(t)?t:new Proxy(t,oe)}function Ee(t){const e=p(t)?new Array(t.length):{};for(const s in t)e[s]=mt(t,s);return e}class ae{constructor(e,s,r){this._object=e,this._key=s,this._defaultValue=r,this.__v_isRef=!0}get value(){const e=this._object[this._key];return e===void 0?this._defaultValue:e}set value(e){this._object[this._key]=e}get dep(){return zt(a(this._object),this._key)}}class fe{constructor(e){this._getter=e,this.__v_isRef=!0,this.__v_isReadonly=!0}get value(){return this._getter()}}function be(t,e,s){return _(t)?t:rt(t)?new fe(t):M(t)&&arguments.length>1?mt(t,e,s):re(t)}function mt(t,e,s){const r=t[e];return _(r)?r:new ae(t,e,s)}class ue{constructor(e,s,r,n){this._setter=s,this.dep=void 0,this.__v_isRef=!0,this.__v_isReadonly=!1,this._dirty=!0,this.effect=new Ot(e,()=>{this._dirty||(this._dirty=!0,Q(this))}),this.effect.computed=this,this.effect.active=this._cacheable=!n,this.__v_isReadonly=r}get value(){const e=a(this);return vt(e),(e._dirty||!e._cacheable)&&(e._dirty=!1,e._value=e.effect.run()),e._value}set value(e){this._setter(e)}}function Se(t,e,s=!1){let r,n;const i=rt(t);return i?(r=t,n=St):(r=t.get,n=t.set),new ue(r,n,i||!n,s)}export{Tt as E,Ot as R,wt as a,U as b,ge as c,Se as d,jt as e,me as f,_e as g,a as h,_ as i,dt as j,m as k,ve as l,we as m,gt as n,pe as o,yt as p,be as q,re as r,de as s,u as t,ce as u,Ee as v,he as w,Re as x};
