import{c as se,u as ne,a as H,_ as z,z as oe,f as W,t as Q,j as le,A as ie,B as re,C as ce,D as ue}from"./index-2b957120.js";import"./crypto-js@4.1.1-7d239ab2.js";import{f as E,h as K,k as D,i as pe,H as de,K as me,L as _e,y as fe,M as ve,q as ge,r as F,m as he}from"./naive-ui@2.34.3_vue@3.3.2-cf3752ae.js";import{d as R,b as G,q as P,o as h,c as k,a as e,N as o,M as V,m as a,J as s,F as Y,U as X,p as ye,I as M,v as xe,W as L,_ as Z,K as ee}from"./@vue_runtime-core@3.3.2-da3364bd.js";import{r as v,u as n}from"./@vue_reactivity@3.3.2-ae2838a1.js";import{L as l,n as te}from"./@vue_shared@3.3.2-50d8a10d.js";import"./@vue_runtime-dom@3.3.2-7747b59a.js";import"./@iconify_vue@4.1.1_vue@3.3.2-f279cb68.js";import"./pinia@2.1.1_typescript@4.9.5_vue@3.3.2-4b43aa74.js";import"./vue-demi@0.14.4_vue@3.3.2-71ba0ef2.js";import"./vue-router@4.2.0_vue@3.3.2-1a885509.js";import"./axios@1.4.0-4a70c6fc.js";import"./@vueuse_core@9.13.0_vue@3.3.2-596ab462.js";import"./@vueuse_shared@9.13.0_vue@3.3.2-e741950b.js";import"./vue-i18n@9.2.2_vue@3.3.2-f6864f94.js";import"./@intlify_shared@9.2.2-6f62a0ce.js";import"./@intlify_core-base@9.2.2-e46b7bcb.js";import"./@intlify_message-compiler@9.2.2-e451351e.js";import"./@intlify_devtools-if@9.2.2-c61c979f.js";import"./element-plus@2.3.4_vue@3.3.2-a565e156.js";import"./lodash-es@4.17.21-811ce8f5.js";import"./@element-plus_icons-vue@2.1.0_vue@3.3.2-9f61c6d4.js";import"./@sxzz_popperjs-es@2.11.7-c75af06c.js";import"./@ctrl_tinycolor@3.6.0-f8748455.js";import"./dayjs@1.11.7-7063ff69.js";import"./@babel_runtime@7.21.5-042e6b4d.js";import"./async-validator@4.2.5-dee29e8b.js";import"./memoize-one@6.0.0-297ddbcb.js";import"./escape-html@1.0.3-78e42352.js";import"./normalize-wheel-es@1.2.0-ed76fb12.js";import"./@floating-ui_dom@1.2.8-946b0ed0.js";import"./@floating-ui_core@1.2.6-614032f8.js";import"./vue3-qrcode@0.0.2_vue@3.3.2-547b044e.js";import"./qrcode@1.5.3-b7eb702b.js";import"./encode-utf8@1.0.3-f813de00.js";import"./dijkstrajs@1.0.3-f906a09e.js";import"./vooks@0.2.12_vue@3.3.2-a672608a.js";import"./evtd@0.2.4-b614532e.js";import"./katex@0.16.7-aa744d12.js";import"./seemly@0.3.6-5600174a.js";import"./treemate@0.3.11-25c27bff.js";import"./vdirs@0.1.8_vue@3.3.2-4519c5fd.js";import"./vueuc@0.4.51_vue@3.3.2-6941250f.js";import"./@css-render_vue3-ssr@0.15.12_vue@3.3.2-811edb7f.js";import"./@juggle_resize-observer@3.4.0-41516555.js";import"./css-render@0.15.12-57b1a53f.js";import"./@emotion_hash@0.8.0-8a8e73f6.js";import"./date-fns@2.30.0-975a2d8f.js";import"./@css-render_plugin-bem@0.15.12_css-render@0.15.12-9dde7ffe.js";function be(){const C=new Date,t=C.getDate(),m=C.getMonth()+1;return`${C.getFullYear()}-${m}-${t}`}const we={class:"p-4 space-y-5 min-h-[200px]"},ke={class:"space-y-6"},Ce={class:"flex items-center"},$e={class:"text-red-600"},Ne={class:"text-green-600"},Se={class:"text-green-600"},ze={key:0,class:"flex items-center"},Le={class:"text-red-600"},Ie={class:"flex items-center"},Ue={class:"text-green-600"},De={class:"text-green-600"},Pe={class:"text-green-600"},je={class:"flex items-center space-x-4 hidden"},Be=e("span",{class:"flex-shrink-0 w-[100px]"},"用户昵称",-1),Te={class:"w-[200px]"},Me={class:"flex-shrink-0 w-[100px]"},Re={class:"flex flex-wrap items-center gap-4"},Ae={class:"flex items-center space-x-4"},Oe=e("span",{class:"flex-shrink-0 w-[100px]"},"设置主题",-1),Fe={class:"flex flex-wrap items-center gap-4"},Ge={class:"flex items-center space-x-4"},Je=e("span",{class:"flex-shrink-0 w-[100px]"},"设置语言",-1),Qe={class:"flex flex-wrap items-center gap-4"},Ve=R({__name:"General",setup(C){const t=se(),m=ne(),{isMobile:_}=H(),b=E(),i=v({}),u=v(!1);async function r(){try{u.value=!0;const{data:c}=await oe();i.value=c}finally{u.value=!1}}const $=v({website:"",register:"",point:""}),N=v(!1);async function S(){try{N.value=!0;const{data:c}=await W();$.value=c}finally{N.value=!1}}G(()=>{r(),S()});const y=P(()=>t.theme),d=P(()=>m.userInfo),j=v(d.value.name??""),J=P({get(){return t.language},set(c){t.setLanguage(c)}}),I=[{label:"Auto",key:"auto",icon:"ri:contrast-line"},{label:"Light",key:"light",icon:"ri:sun-foggy-line"},{label:"Dark",key:"dark",icon:"ri:moon-foggy-line"}],A=[{label:"简体中文",key:"zh-CN",value:"zh-CN"},{label:"繁體中文",key:"zh-TW",value:"zh-TW"},{label:"English",key:"en-US",value:"en-US"}];function f(c){m.updateUserInfo(c),b.success(Q("common.success"))}function w(){const c=be(),x=localStorage.getItem("chatStorage")||"{}",U=JSON.stringify(JSON.parse(x),null,2),g=new Blob([U],{type:"application/json"}),B=URL.createObjectURL(g),T=document.createElement("a");T.href=B,T.download=`chat-store_${c}.json`,document.body.appendChild(T),T.click(),document.body.removeChild(T)}function p(c){const x=c.target;if(!x||!x.files)return;const U=x.files[0];if(!U)return;const g=new FileReader;g.onload=()=>{try{const B=JSON.parse(g.result);localStorage.setItem("chatStorage",JSON.stringify(B)),b.success(Q("common.success")),location.reload()}catch{b.error(Q("common.invalidFileFormat"))}},g.readAsText(U)}function O(){localStorage.removeItem("chatStorage"),location.reload()}function q(){const c=document.getElementById("fileInput");c&&c.click()}const ae=P(()=>`${window.location.origin}#/chat?inviteCode=${i.value.sn}`);return(c,x)=>{var U;return h(),k("div",we,[e("div",ke,[e("div",Ce,[e("span",null,[o("🌟 尊敬的 "),e("span",$e,l(d.value.name),1),o(" 用户您好，您共获得 "),e("span",Ne,l(i.value.totalPoints),1),o(" 积分，当前剩余 "),e("span",Se,l(i.value.remainingPoints),1),o(" 可用积分（若在过程中出现无结果或异常，将不会扣除您的流量）")])]),((U=i.value.pointsTip)==null?void 0:U.length)>0?(h(),k("div",ze,[e("span",null,[o("💡 温馨提示： "),e("span",Le,l(i.value.pointsTip),1)])])):V("",!0),e("div",Ie,[e("span",null,[o("🧑‍🤝‍🧑 邀请您的朋友注册您可以获得 "),e("span",Ue,l($.value.point.inviter),1),o(" 积分，您的朋友可以获得 "),e("span",De,l($.value.point.invitee),1),o(" 积分。您的邀请链接为（可长按选中复制）："),e("span",Pe,l(ae.value),1),o(" （⚠ 若系统检测到您自己邀请自己，则不会发送奖励 ）")])]),e("div",je,[Be,e("div",Te,[a(n(K),{value:j.value,"onUpdate:value":x[0]||(x[0]=g=>j.value=g),placeholder:""},null,8,["value"])]),a(n(D),{size:"tiny",text:"",type:"primary",onClick:x[1]||(x[1]=g=>f({name:j.value}))},{default:s(()=>[o(l(c.$t("common.save")),1)]),_:1})]),e("div",{class:te(["flex items-center space-x-4",n(_)&&"items-start"])},[e("span",Me,l(c.$t("setting.chatHistory")),1),e("div",Re,[a(n(D),{size:"small",onClick:w},{icon:s(()=>[a(n(z),{icon:"ri:download-2-fill"})]),default:s(()=>[o(" "+l(c.$t("common.export")),1)]),_:1}),e("input",{id:"fileInput",type:"file",style:{display:"none"},onChange:p},null,32),a(n(D),{size:"small",onClick:q},{icon:s(()=>[a(n(z),{icon:"ri:upload-2-fill"})]),default:s(()=>[o(" "+l(c.$t("common.import")),1)]),_:1}),a(n(pe),{placement:"bottom",onPositiveClick:O},{trigger:s(()=>[a(n(D),{size:"small"},{icon:s(()=>[a(n(z),{icon:"ri:close-circle-line"})]),default:s(()=>[o(" "+l(c.$t("common.clear")),1)]),_:1})]),default:s(()=>[o(" "+l(c.$t("chat.clearHistoryConfirm")),1)]),_:1})])],2),e("div",Ae,[Oe,e("div",Fe,[(h(),k(Y,null,X(I,g=>a(n(D),{key:g.key,size:"small",type:g.key===y.value?"primary":void 0,onClick:B=>n(t).setTheme(g.key)},{icon:s(()=>[a(n(z),{icon:g.icon},null,8,["icon"])]),_:2},1032,["type","onClick"])),64))])]),e("div",Ge,[Je,e("div",Qe,[a(n(de),{style:{width:"140px"},value:J.value,options:A,onUpdateValue:x[2]||(x[2]=g=>n(t).setLanguage(g))},null,8,["value"])])])])])}}}),qe={class:"p-4 space-y-4"},He={class:"flex items-center space-x-4"},We={class:"flex-1"},Ee={class:"items-center clear"},Ke={class:"text-red-600"},Ye={key:0},Xe=e("span",null,[o("有效期："),e("span",{class:"text-red-600"},"永久有效")],-1),Ze=[Xe],et={key:1},tt={class:"text-red-600"},at={class:"text-red-600"},st={key:2},nt={key:0,class:"flex justify-center"},ot=R({__name:"About",setup(C){const{isMobile:t}=H(),m=E(),_=v("");le("MjQ1NjI5NTYw");const i=P(()=>r.value||!_.value||_.value.trim()===""),u=v({website:"",register:""}),r=v(!1);async function $(){try{r.value=!0;const{data:f}=await W();u.value=f}finally{r.value=!1}}function N(){if(y.value&&y.value.length>0&&I.value<y.value.length){const f=y.value[I.value];f&&f.jumpUrl.length>0?window.open(f.jumpUrl):console.error("Card or jumpUrl is undefined")}else console.error("Invalid selectedCardIndex or cards is not populated")}const S=v(null),y=v();async function d(){try{r.value=!0;const{data:f}=await ie();y.value=f,await xe(),A()}finally{r.value=!1}}const j=async()=>{await re(_.value).then(f=>{var w;f.status==="success"?(m.success(f.message),location.reload()):((w=S.value)==null||w.focus(),m.error(f.message))})};G(()=>{d(),$()});function J(f){I.value=f}const I=v(0);function A(){y.value.forEach((f,w)=>{const p=document.querySelector(`.card-${w}`);I.value===w?p==null||p.classList.add("selected"):p==null||p.classList.remove("selected")})}return ye(I,()=>{A()}),(f,w)=>(h(),M(n(ve),{show:r.value},{default:s(()=>[e("div",qe,[e("div",He,[e("div",We,[a(n(K),{ref_key:"cardNoRef",ref:S,value:_.value,"onUpdate:value":w[0]||(w[0]=p=>_.value=p),placeholder:"卡密"},null,8,["value"])]),a(n(D),{type:"success",disabled:i.value,onClick:j},{default:s(()=>[o(" 卡密激活 ")]),_:1},8,["disabled"])]),e("div",Ee,[e("span",null,l(u.value.website.cardBindTip),1)]),a(n(me),{"x-gap":"12",cols:n(t)?1:2},{default:s(()=>[(h(!0),k(Y,null,X(y.value,(p,O)=>(h(),M(n(_e),null,{default:s(()=>[a(n(fe),{style:{"margin-bottom":"10px"},headStyle:{textAlign:"center"},class:te(`card-${O}`),title:p.name,hoverable:"",size:"medium",onClick:q=>J(O)},{default:s(()=>[e("div",null,[e("span",null,[o("可使用："),e("span",Ke,l(p.totalPoints),1),o(" 积分")])]),p.duration==="0"?(h(),k("div",Ye,Ze)):(h(),k("div",et,[e("span",null,[o("有效期："),e("span",tt,l(p.duration),1),o(" 天")])])),e("div",null,[e("span",null,[o("价格："),e("span",at,l(p.price)+" 元",1),o(),e("del",null,l(p.marketPrice)+" 元",1)])]),p.desc.length>0?(h(),k("div",st,l(p.desc),1)):V("",!0)]),_:2},1032,["class","title","onClick"])]),_:2},1024))),256))]),_:1},8,["cols"]),u.value.website.enablePurchaseLink?(h(),k("div",nt,[a(n(D),{type:"success",onClick:N,style:{"border-radius":"16px"}},{default:s(()=>[o(" 立即购买 ")]),_:1})])):V("",!0)])]),_:1},8,["show"]))}}),lt={class:"flex justify-end mt-4"},it=R({__name:"PointsList",setup(C){const t=v({loading:!1,lists:[],total:0,pageNo:1,pageSize:10}),m=v([]);G(async()=>{await _(t.value.pageNo,t.value.pageSize)});async function _(i,u){t.value.loading=!0;const r=await ce({pageNo:i,pageSize:u});m.value=r.data,t.value.lists=m.value.list,t.value.total=m.value.count,t.value.pageNo=i,t.value.pageSize=u,t.value.loading=!1}function b(i){t.value.pageNo=i,_(t.value.pageNo,t.value.pageSize)}return(i,u)=>{const r=L("el-table-column"),$=L("el-table"),N=L("el-pagination"),S=L("el-card"),y=Z("loading");return h(),k("div",null,[a(S,{shadow:"never"},{default:s(()=>[ee((h(),M($,{size:"large",data:t.value.lists,height:"400",style:{width:"100%"}},{default:s(()=>[a(r,{label:"获取途径",prop:"card","min-width":"100"},{default:s(({row:d})=>[o(l(d.from),1)]),_:1}),a(r,{label:"积分数量",prop:"price","min-width":"120"},{default:s(({row:d})=>[o(l(d.points),1)]),_:1}),a(r,{label:"获取时间",prop:"time","min-width":"180"},{default:s(({row:d})=>[o(l(d.createdAt),1)]),_:1}),a(r,{label:"过期时间",prop:"price","min-width":"120"},{default:s(({row:d})=>[o(l(d.expiredAt),1)]),_:1})]),_:1},8,["data"])),[[y,t.value.loading]]),e("div",lt,[a(N,{background:"",onCurrentChange:b,"current-page":t.value.pageNo,"page-size":t.value.pageSize,layout:"prev, pager, next",total:t.value.total},null,8,["current-page","page-size","total"])])]),_:1})])}}}),rt={class:"flex justify-end mt-4"},ct=R({__name:"ReferralList",setup(C){const t=v({loading:!1,lists:[],total:0,pageNo:1,pageSize:10}),m=v([]);G(async()=>{await _(t.value.pageNo,t.value.pageSize)});async function _(i,u){t.value.loading=!0;const r=await ue({pageNo:i,pageSize:u});m.value=r.data,t.value.lists=m.value.list,t.value.total=m.value.count,t.value.pageNo=i,t.value.pageSize=u,t.value.loading=!1}function b(i){t.value.pageNo=i,_(t.value.pageNo,t.value.pageSize)}return(i,u)=>{const r=L("el-table-column"),$=L("el-table"),N=L("el-pagination"),S=L("el-card"),y=Z("loading");return h(),k("div",null,[a(S,{shadow:"never"},{default:s(()=>[ee((h(),M($,{size:"large",data:t.value.lists,height:"400",style:{width:"100%"}},{default:s(()=>[a(r,{label:"被邀请人",prop:"inviteeName","min-width":"150"},{default:s(({row:d})=>[o(l(d.inviteeName),1)]),_:1}),a(r,{label:"获取积分",prop:"score","min-width":"120"},{default:s(({row:d})=>[o(l(d.userPoints),1)]),_:1}),a(r,{label:"邀请时间",prop:"time","min-width":"180"},{default:s(({row:d})=>[o(l(d.createdAt),1)]),_:1})]),_:1},8,["data"])),[[y,t.value.loading]]),e("div",rt,[a(N,{background:"",onCurrentChange:b,"current-page":t.value.pageNo,"page-size":t.value.pageSize,layout:"prev, pager, next",total:t.value.total},null,8,["current-page","page-size","total"])])]),_:1})])}}}),ut={class:"ml-2"},pt={class:"min-h-[100px]"},dt={class:"ml-2"},mt={class:"ml-2"},_t={class:"ml-2"},ua=R({__name:"index",props:{visible:{type:Boolean}},emits:["update:visible"],setup(C,{emit:t}){const m=C,_=v("General"),b=P({get(){return m.visible},set(i){t("update:visible",i)}});return(i,u)=>(h(),M(n(he),{show:b.value,"onUpdate:show":u[1]||(u[1]=r=>b.value=r),title:"个人中心","auto-focus":!1,preset:"card",style:{width:"95%","max-width":"640px"}},{default:s(()=>[e("div",null,[a(n(ge),{value:_.value,"onUpdate:value":u[0]||(u[0]=r=>_.value=r),type:"line",animated:""},{default:s(()=>[a(n(F),{name:"General",tab:"General"},{tab:s(()=>[a(n(z),{class:"text-lg",icon:"ri:file-user-line"}),e("span",ut,l(i.$t("profile.about")),1)]),default:s(()=>[e("div",pt,[a(Ve)])]),_:1}),a(n(F),{name:"Config",tab:"Config"},{tab:s(()=>[a(n(z),{class:"text-lg",icon:"ri:list-settings-line"}),e("span",dt,l(i.$t("profile.package")),1)]),default:s(()=>[a(ot)]),_:1}),a(n(F),{name:"PointsList",tab:"PointsList"},{tab:s(()=>[a(n(z),{class:"text-lg",icon:"ri:file-user-line"}),e("span",mt,l(i.$t("profile.point")),1)]),default:s(()=>[a(it)]),_:1}),a(n(F),{name:"ReferralList",tab:"ReferralList"},{tab:s(()=>[a(n(z),{class:"text-lg",icon:"ri:file-user-line"}),e("span",_t,l(i.$t("profile.invite")),1)]),default:s(()=>[a(ct)]),_:1})]),_:1},8,["value"])])]),_:1},8,["show"]))}});export{ua as default};
