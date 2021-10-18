/**
 * 
 */
let plusMinus = document.getElementsByClassName("plus_minus");

for(let i=0; i<plusMinus.length; i++){
	
	if(plusMinus[i].innerText.indexOf("-") == -1)
	{
		plusMinus[i].style.color="#1e88e5";
	}
	else
	{
		plusMinus[i].style.color="#ef5350";	
	}
	
}