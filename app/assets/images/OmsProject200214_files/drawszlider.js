function drawszlider(ossz, meik){
    var szazalek=Math.round((meik*1)/ossz);
    document.getElementById("szliderbar").style.width=szazalek+'%';
    document.getElementById("szazalek").innerHTML=szazalek+'%';
}

;
