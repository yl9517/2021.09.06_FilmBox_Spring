let movieCd = $('#mvCd').val();
$.ajax({
	url : "/content"
	, data : {'movieCd': movieCd}
	, method : 'get'
	, dataType:'json'
	,success:function(data) {
			let movEn = data.movieNmEn;
			$('#mvEn').append(movEn);
			
	         let resultt =  "<tr>";
              resultt += "<th>장르</th>"
              resultt += "<td>"+data.genres+"</td>"
              resultt += "<th>상영시간</th>"
              resultt += "<td>"+data.showTm+"</td>"
              resultt += "</tr>";
               
              resultt += "<tr>";
              resultt += "<th>등급</th>"
              resultt += "<td>"+data.audits+"</td>"
              resultt += "<th>개봉일</th>"
              resultt += "<td>"+data.openDt+"</td>"
              resultt += "</tr>";
               
              resultt += "<tr>";
              resultt += "<th>감독</th>"
              resultt += "<td colspan='3'>"+data.directors+"</td>"
              resultt += "</tr>";
              
              resultt += "<tr>";
              resultt += "<th>출연진</th>"
              resultt += "<td colspan='3'>"+data.actors+"</td>"
              resultt += "</tr>";
               
              
			$("#content").append(resultt);
	}
	,error:function(data){
		console.log(data);
	}
});