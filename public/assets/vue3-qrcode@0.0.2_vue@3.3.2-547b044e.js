import{b as n}from"./qrcode@1.5.3-b7eb702b.js";import{r as i}from"./@vue_reactivity@3.3.2-ae2838a1.js";import{t as c,o as s,c as l,M as u}from"./@vue_runtime-core@3.3.2-da3364bd.js";const d=(t,r)=>{const a=t.__vccOpts||t;for(const[e,o]of r)a[e]=o;return a},m=[0,1,2,3,4,5,6,7],p=40,g=["image/png","image/jpeg","image/webp"],f=["low","medium","quartile","high","L","M","Q","H"],_={props:{toSJISFunc:Function,margin:Number,scale:Number,width:Number,height:Number,version:{type:Number,validator:t=>t===parseInt(String(t),10)&&t>1&&t<=p},errorCorrectionLevel:{type:String,validator:t=>f.includes(t)},maskPattern:{type:Number,validator:t=>m.includes(t)},quality:{type:Number,validator:t=>t===parseFloat(String(t))&&t>=0&&t<=1},type:{type:String,validator:t=>g.includes(t)},color:{type:Object,default:()=>({dark:"#000000",light:"#FFFFFF"}),validator(t){return["dark","light"].every(r=>["string","undefined"].includes(typeof t[r]))}},value:{type:String,required:!0,validator(t){if(typeof t=="string")return!0}}},setup(t){const r=i("");return c(()=>{const a=Object.assign(t,t.quality==null||{renderOptions:{quality:t.quality}});n.toDataURL(t.value,a).then(e=>{r.value=e}).catch(e=>{console.log("error",e)})}),{dataUrl:r}}},y=["src"];function b(t,r,a,e,o,h){return e.dataUrl?(s(),l("img",{key:0,src:e.dataUrl},null,8,y)):u("",!0)}const F=d(_,[["render",b]]);export{d as _,F as q};
