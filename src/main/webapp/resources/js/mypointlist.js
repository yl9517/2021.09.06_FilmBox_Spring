/**
 * 
 */
let plusMinus = document.getElementsByClassName("plus_minus");
console.log(plusMinus);
for(let i=0; i<plusMinus.length; i++){
	
	if(plusMinus[i].innerText.indexOf("-") == -1)
	{
		plusMinus[i].style.color="#1e88e5";
		console.log('파'+plusMinus[i].innerText);
		
	}
	else
	{
		plusMinus[i].style.color="#ef5350";
		console.log('빨'+plusMinus[i].innerText);
		
	}
	
}