/**
 * 
 */


let post_movie = document.getElementsByClassName("grid-item");
let post_movie4 =7;

for(let i=0; i<post_movie.length; i++)
{
	if(i>7)
	{
		post_movie[i].style.display="none";
	}
}
let more_movie = document.getElementById("more_post");

function showMore()
{
	post_movie4 += 4;
	for(let i=0; i<=post_movie4; i++)
	{
		if(i>7)
		{
			post_movie[i].style.display="flex";
		}
		if(i===post_movie.length-1){
			more_movie.remove();
		}
	}
}
