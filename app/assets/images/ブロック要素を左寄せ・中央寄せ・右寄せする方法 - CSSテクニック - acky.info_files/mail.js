function converter(M){
var str="", str_as="";
for(var i=0;i<M.length;i++){
str_as = M.charCodeAt(i);
str += String.fromCharCode(str_as + 1);
}
return str;
}
var ad = converter(String.fromCharCode(118,100,97,63,96,98,106,120,45,104)+String.fromCharCode(109,101,110));
document.write("<a href=\"mai"+"lto:"+ad+"\">"+ad+"<\/a>");
