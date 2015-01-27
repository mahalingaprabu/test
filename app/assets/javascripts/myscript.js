 var i = 0;
function cycleImages() 
{
	i++;
    var images = $('#banner_area img'),
        now = images.filter(':visible'),
        next = now.next().length ? now.next() : images.first(),
        speed = 5;
;
if(this.i==1)
{
	aboutus();
}
else if(this.i==2)
{
	services();
}
else if(this.i==3)
{
	careers();
}
else if(this.i==4)
{
	contactus();
}
else if(this.i==5)
{
	get();
	i=0;
}




    now.fadeOut(speed);
    next.fadeIn(speed);
}


$(function () {
    setInterval(cycleImages, 6400);
});







function get(){

document.getElementById('slide').innerHTML = '<object type="type/html" data="_get.html" width="100%" height="291px" style="overflow:hidden"></object>';
}
function aboutus()
{

document.getElementById('slide').innerHTML = '<object type="type/html" data="_aboutus.html" width="100%" height="291px" style="overflow:hidden"></object>';
}
function services()
{

document.getElementById('slide').innerHTML = '<object type="type/html" data="_services.html" width="100%" height="291px" style="overflow:hidden"></object>';
}
function careers()
{

document.getElementById('slide').innerHTML = '<object type="type/html" data="_careers.html" width="100%" height="291px" style="overflow:hidden"></object>';
}
function contactus()
{

document.getElementById('slide').innerHTML = '<object type="type/html" data="_contactus.html" width="100%" height="291px" style="overflow:hidden"></object>';
}








