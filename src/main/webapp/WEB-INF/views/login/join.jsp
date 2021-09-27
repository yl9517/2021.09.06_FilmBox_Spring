<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="resources/css/joinform.css" />
<!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- bootstrap Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<style>
	/* 아이디 사용 가능 */
	#id_check1{
		color : blue;
		display : none;
		font-size : 12px;
	}
	/* 중복아이디 존재 */
	#id_check2{
		color : red;
		display : none;
		font-size : 12px;
	}
</style>
<body>
	<div class="row">
		<div class="col-sm-offset-2 col-sm-8">
            <form name='nJoin' role="form" id="joinForm" method="post" autocomplete="off">
				<div class="panel panel-default">
					<div class="panel-heading">
						FilmBox 회원가입
					</div>
					
					<!-- panel heading -->
					<div class="panel-body">
						<div class="form-group pull-center"> <!--  pull-left -->
							<label class="control-label"> 회원가입 약관 </label>
							<div class="col-xs-12">
								<textarea class="form-control" readonly rows="10" cols="100">

제 1조. 목적

본 약관은 필름박스(이하 “회사”라 합니다)가 제공하는 온라인, 오프라인 서비스(이하 "서비스"라 합니다) 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.

제 2조. 약관의 효력 및 변경

1. 본 약관은 서비스를 이용하고자 본 약관에 동의한 모든 회원에 대하여 그 효력을 발생합니다.
2. 본 약관의 내용은 회원(서비스)가입 시 게재되거나 공지된 내용에 회원이 동의함으로써 그 효력이 발생합니다.
3. 회사는 합리적인 사유가 발생될 경우 본 약관을 변경(수정 또는 개정)할 수 있으며, 약관을 개정할 경우 회사는 시행일 및 개정 사유를 명시하여 현행 약관과 함께 시행일로부터 최소 7일 전, 고객에게 불리하게 변경되거나 중요한 내용인 경우에는 최소 30일 전에 회사의 웹사이트 또는 전자메일 등을 통해 공지합니다.
4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 탈퇴 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.

제 3조. 약관 외 준칙

1. 본 약관에 명시되지 아니한 사항에 대해서는 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.
2. 본 약관에 명시되지 않은 서비스에 대한 사항은 당사 홈페이지, 모바일 또는 영화관 현장을 통한 해당 서비스 공지사항에 따릅니다.

제 4조. 용어의 정의

본 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.
1. “사이트”: 회사가 재화•용역•정보를 회사에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화•용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트(홈페이지, 모바일 웹/어플리케이션, SNS 등)를 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.
2. "회원" : 본 약관을 인지하고, 본인인증절차를 거쳐 회사에 개인정보를 제공하여 회원으로서 등록하여 회사 아이디(ID)와 멤버십 카드를 부여 받은 자로서, 정상적으로 필름박스 서비스를 이용할 수 있는 권한을 부여 받은 고객을 말합니다.
3. "아이디" : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나 숫자 혹은 그 조합을 말합니다(이하"ID"라 합니다).
4. "비밀번호" : 회원이 부여 받은 ID와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
5. "서비스" : 회사가 회원을 위하여 유료 또는 무료로 제공하는 행위 또는 그 행위 대상인 유, 무형의 물건 자체를 의미하며 온/오프라인에서 이루어지는 영화 관람, 포인트 적립, 사용, 할인, 이벤트 참여 등의 전반적인 고객 서비스 프로그램을 말합니다.
6. "멤버십 포인트" : 회사에서 재화/서비스 구매 시 적립/사용이 가능하도록 제공하는 포인트를 말합니다.
7. "이용중지" : 회사가 약관에 의거하여 회원의 서비스 이용을 제한하는 것을 말합니다.
8. "해지" : 회사 또는 회원이 서비스 사용 후 이용계약을 해약하는 것을 말합니다.
9. "휴면 회원" : 필름박스 서비스를 이용한 마지막 날로부터 연속하여 12개월간 이용 내역이 없는 회원을 말합니다.

제 5조. 서비스의 중단

① "홈페이지"는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

② 제1항에 의한 서비스 중단의 경우에는 "홈페이지"는 제8조에 정한 방법으로 이용자에게 통지합니다.

③ "홈페이지"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "홈페이지"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.


제 6조. 회원의 게시물

1. 게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 서비스 내 게재 이외에 영리 목적으로 사용할 수 없습니다. 단, 비영리적인 경우에는 그러지 아니하며 또한 회사는 서비스 내의 게재권을 갖습니다. 
2. 회사는 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.
3. 회사는 회사가 게시하거나 등록하는 서비스 내의 내용물이 다음 각 항에 해당한다고 판단되는 경우에 사전 통지 없이 삭제할 수 있습니다.
  1) 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
  2) 공공질서 및 미풍양속에 위반되는 내용인 경우
  3) 범죄적 행위에 결부된다고 인정되는 내용일 경우
  4) 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
  5) 회사에서 규정한 게시기간이나 용량을 초과한 경우
  6) 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우
  7) 고객 문의 게시판에 욕설과 성희롱 등 미풍양속에 위배되는 내용을 게재하는 경우
  8) 게시판의 성격에 부합하지 않는 게시물의 경우
  9) 기타 관계법령에 위반된다고 판단되는 경우


제 7조. 회원 가입 및 카드 발급

1. 회원 가입은 회사가 운영하는 사이트를 통해 가능하며, 서비스 가입 신청 시 본 약관과 개인정보 처리방침(‘개인정보수집 및 이용안내’ 및 ‘마케팅 활용 동의’ 등)′에 동의함으로써 회원 가입을 신청합니다. 
2. 고객으로부터 회원 가입 신청이 있는 경우 회사는 자체 기준에 따른 심사를 거친 후 고객에게 회원 자격을 부여 할 수 있으며 회원 자격이 부여된 고객은 회사로부터 가입 완료 공지를 받은 시점부터 회원으로서의 지위를 취득하고 멤버십 카드를 즉시 발급받을 수 있습니다.
3. “정보통신망 이용촉진 및 정보보호 등에 관한 법률” 상 만14세 미만의 아동은 온라인으로 타인에게 개인정보를 보내기 전에 반드시 개인정보의 수집 및 이용목적에 대하여 충분히 숙지하고 법정대리인(부모)의 동의를 받아야 합니다. 

제 8조. 멤버십 카드의 이용 및 관리

1. 회원이 서비스를 이용하고자 할 경우에는 멤버십 카드를 제시하여야 합니다. 카드를 제시할 경우 회사는 회원에게 본인 확인을 위한 식별 절차를 요청할 수 있습니다. 이 경우 회원은 회사의 요청을 준수하여야 정상적인 서비스를 제공받을 수 있습니다.
2. 멤버십 카드는 회원 본인이 직접 사용하여야 하며, 카드를 제3자에게 임의적으로 대여 사용하게 하거나 양도 또는 담보의 목적으로 사용 할 수 없습니다.
3. 전항의 규정에도 불구하고, 회원이 당사의 사전 동의 없이 멤버십 카드를 타인에게 대여하거나, 그 사용을 위임하거나, 양도 또는 담보의 목적으로 제공함으로써 발생한 손해와 타인이 멤버십 카드를 사용할 수 있음을 알았거나 쉽게 알 수 있었음에도 불구하고 멤버십 카드를 방치함으로써 발생한 손해에 대하여는 회사는 어떠한 책임도 지지 않습니다.

제 9조. 회원 탈퇴 및 자격 상실

1. 회원이 이용 계약을 해지(탈퇴) 하고자 하는 경우에는 회원 본인이 사이트나 필름박스 고객센터 또는 E-MAIL등 기타 회사가 정하는 방법으로 회원탈퇴 또는 이용약관 철회를 요청할 수 있으며, 회사는 회원의 요청에 따라 조속히 회원 탈퇴에 필요한 제반 절차를 수행합니다. 단, 회원 탈퇴 시 이벤트 부정 이용 방지 등을 위하여 탈퇴일로부터 30일 이내에 재가입이 불가하며 회원 탈퇴 시 적립된 필름박스 멤버십 포인트 및 쿠폰 등은 모두 삭제됩니다.
2. 회원이 다음 각 호에 해당하는 경우, 회사는 당해 회원에 대한 통보로써 회원 자격을 상실시킬 수 있습니다. 단, 4)호의 경우에는 회원에 대한 통보 없이 자격이 상실됩니다.
  1) 회원 가입 신청 시, 허위 내용을 등록하거나 타인의 명의를 도용한 경우
  2) 가입한 이름이 실명이 아닌 경우
  3) 회원이 부정 적립, 부정 사용 등 멤버십 포인트 및 카드를 부정한 방법 또는 목적으로 이용한 경우
    - 부정 적립 : 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 당해 회원에게 포인트가 적립된 경우를 말합니다. 그러나 시스템의 오류 등 회원의 귀책사유에 의하지 않고 포인트가 적립된 경우나 상품이나 서비스를 실제로 구매한 당사자의 동의가 있어 구매 당사자 대신 다른 회원에게 포인트를 적립하는 경우는 이에 제외됩니다. 부정 적립된 포인트는 회원 자격 상실 통보와 함께 동시 소멸하고 이에 대하여 회원은 어떠한 권리도 주장할 수 없습니다. 또한 부정 적립 포인트로 상품이나 서비스를 구매하는 등의 부당이득이 발생한 경우 회원 당사자 또는 부정 적립 동조자가 당사에 대한 민·형사상 책임을 집니다. 
    - 부정 사용 : 당사나 회원의 동의 없이 타 회원의 포인트를 수단과 방법에 관계 없이 임의로 사용한 경우를 말합니다.
  4) 회원이 사망한 경우
  5) 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
  6) 회사, 다른 회원 또는 제 3자의 지적재산권을 침해하는 경우
  7) 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우
  8) 서비스 운영을 고의로 방해한 경우
  9) 회사의 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
  10) 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란 사이트 링크하는 경우
  11) 본 약관을 포함하여 기타 회사가 정한 이용 조건에 위반한 경우
  12) 당사 및 제휴사의 합리적인 판단에 기하여 필름박스 서비스 제공을 거부할 필요가 있다고 인정할 경우
3. 본 조 제 2 항에 의해 회원 자격이 상실된 회원은 회사로부터 해당 사유 발생에 대한 통지를 받은 날로부터 최대 30일 이내에 본인의 의견을 소명할 수 있으며, 당사는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 계속하여 정상적인 서비스를 이용할 수 있도록 합니다.
4. 본 조 제 1항에 의한 회원 탈퇴 또는 제 2항에 의한 회원 자격상실이 확정되는 시점은 아래와 같습니다.
  1) 회원 탈퇴 요청일 또는 회원 자격상실 통보일에 회원 탈퇴 또는 자격상실이 확정됩니다.
  2) 사망으로 인한 자격상실의 경우에는 회원 사망일에 자격상실이 확정됩니다. 당해 회원에게 제공된 기 필름박스 멤버십 서비스와 관련된 권리나 의무 및 포인트는 당해 회원의 상속인에게 상속되지 않습니다.

제 10조. 회원에 대한 통지

1. 당사가 회원에 대한 통지를 하는 경우, 회원이 당사와 미리 약정하여 지정한 E-MAIL 주소, SMS, PUSH메세지 등으로 할 수 있습니다.
2. 회사는 보다 나은 서비스 혜택 제공을 위해 다양한 전달 방법(안내문, E-MAIL, SMS 등)을 통해 서비스 관련 정보를 제공할 수 있습니다. 단, 회사는 회원이 서비스 혜택 정보 제공을 원치 않는다는 의사를 밝히는 경우 정보 제공 대상에서 해당 회원을 제외하여야 하며, 대상에서 제외되어 서비스 정보를 제공 받지 못해 불이익이 발생하더라도 이에 대해서는 회사가 책임지지 않습니다
3. 당사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 사이트 공지사항에 게시함으로써 개별 통지에 갈음할 수 있습니다. 

제 11조. 회원 정보의 변경

1. 회원은 개인정보 처리방침를 통해 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
2. 회원은 이용 신청 시 기재한 사항이 변경되었을 경우 온라인으로 직접 수정을 하거나, 필름박스측으로 연락하시어 수정 요청을 해야 하며, 회원정보를 변경하지 아니하여 발생되는 문제의 책임은 회원에게 있습니다.
</textarea>
</div>

<!--							<div class="col-xs-12">
 								<div class="checkbox pull-right">
									<label for="join_user_agree">
										<input type="checkbox" name="join_user_agree" id="join_user_agree" value="1"/>
										회원가입 약관에 동의합니다.									</label>
								</div> 
							</div>-->
						</div>
						
						<!-- <div class="form-group pull-center"> -->
							<label class="control-label"> 개인정보 처리방침 안내 </label>
							<div class="col-xs-12">
								<textarea class="form-control" readonly rows="10" cols="100">
								
제 1조. 개인정보 수집 및 이용과 제공

1. 회사는 회원의 개인정보를 보호하고 존중합니다.
2. 회사는 회원이 가입 신청을 할 때 제공하거나 회사 서비스 이용 시 발생하는 각종 개인정보 외 사전에 회원으로부터 동의를 얻어 회원이 다양한 서비스 이용 시 발생하는 정보를 수집하며, 회원의 개인정보는 본 이용 계약의 이행과 본 이용 계약상의 서비스 제공을 위한 목적으로 사용됩니다. 또한 해당 정보를 분석하여 회원에게 보다 나은 서비스를 제공하고 고객 지향적인 마케팅 활동을 하기 위해 사용합니다. 
3. 회사는 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해 두지 않습니다. 또한, 개인정보의 수집·이용·제공에 관한 회원의 동의 거절 시 제한되는 서비스를 구체적으로 명시하고, 필수 수집 항목이 아닌 개인 정보의 수집·이용·제공에 관한 회원의 동의 거절을 이유로 회원 가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
4. 회원은 원하는 경우 언제든 회사에 제공한 개인정보의 수집과 이용에 대한 동의를 철회할 수 있으며, 동의의 철회는 해지 신청을 하는 것으로 이루어집니다.
5. 회사는 서비스 제공과 관련하여 취득한 회원의 개인 정보를 ‘개인정보 처리방침’에 기재된 자에게만 제공하고 기재된 목적 범위 내에서만 활용하며 수집한 개인정보를 당해 회원의 동의 없이 목적 범위를 넘어선 용도로 이용하거나 제3자에게 제공할 수 없습니다. 다만, 다음의 각 호에 해당하는 경우는 예외로 합니다.
  1) 배송 업무상 배송업체에게 배송에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 알려주는 경우
  2) 정보통신서비스의 제공에 따른 요금 정산을 위하여 필요한 경우
  3) 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우
  4) 재화 등의 거래에 따른 대금 정산을 위하여 필요한 경우
  5) 관계 법령에 의하여 수사상 목적으로 정해진 절차와 방법에 따라 관계기관의 요구가 있는 경우
  6) 다른 법률에 특별한 규정이 있는 경우
  7) 정보통신윤리위원회가 관계법령에 의하여 요청한 경우

제 2조. 개인정보 보유 및 이용기간

1. 회원이 가입 시 제공한 정보는 무분별한 회원 가입 방지 및 고객 요구사항 처리 등을 위하여 회원 가입 시점부터 해지 완료 후 30일까지 보관할 수 있습니다. 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 예외로 합니다.
2. 개인정보보호법에 따라 1년 이상 멤버십 서비스를 이용하지 않아 휴면계정으로 전환 된 경우 회원 정보를 별도 분리 보관하여 관리하며, 휴면 계정으로 전환된 후에도 1년동안 필름박스 미이용시 회원 계정 및 개인정보는 파기됩니다. 개인정보 파기 시에는 보유중인 멤버십 포인트, 쿠폰, 관람권 등이 삭제 처리 됩니다.
3. 휴면계정으로 전환된 회원의 경우 휴면 기간 동안 로그인 및 포인트 적립 및 사용 등 필름박스에서 제공하는 모든 서비스를 받을 수 없으며, 별도의 본인 인증 절차를 통해 휴면 계정에서 활동 계정으로 변경 시 지속적인 서비스를 받으실 수 있습니다.
4. 위 1항에도 불구하고 상법 및 ‘전자상거래 등에서 소비자보호에 관한 법률′ 등 관련 법령의 규정에 의하여 다음과 같이 일정기간 보유해야 할 필요가 있을 경우에는 관련 법령이 정한 기간 또는 다음 각 호의 기간 동안 회원정보를 보유할 수 있습니다.
  1) 계약 또는 청약철회 등에 관한 기록 : 5년
  2) 대금결제 및 재화등의 공급에 관한 기록 : 5년
  3) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
※ 개인정보와 관련된 보다 자세한 사항은 개인정보처리방침을 참조하시기 바랍니다.
</textarea>
							</div>
							<!-- <div class="col-xs-12">
								<div class="checkbox pull-right">
									<label for="join_priv_agree">
										<input type="checkbox" name="join_priv_agree" id="join_priv_agree" value="1"/>
										개인정보 처리방침에 동의합니다.									</label>
								</div> 
							</div> -->
						</div>
					</div>
					

				</div>
			</form>	
		</div>




 <div class="container"> 
 <div class="input-form-backgroud row"> 
 <div class="input-form col-md-12 mx-auto"> 
 <h4 class="mb-3">회원가입</h4> 
 <br>
 <form method="post" class="validation-form" action="joinresult" novalidate> 

 		<div class="mb-3"> 
 			<label for="member_id">아이디</label> 
 			<input type="text" class="form-control" id="member_id" name="member_id" value="" required> 
				<span id="id_check1">사용가능한 아이디입니다.</span>
				<span id="id_check2">아이디가 이미 존재합니다.</span>
			<div class="invalid-feedback">아이디를 입력해주세요.</div>
 		</div>
 		
 		<div class="mb-3"> 
 		<label for="member_pwd">비밀번호</label> 
 		<input type="password" class="form-control" id="member_pwd" name="member_pwd" minlength='8' maxlength='10' placeholder="8-10자 입력" required> 
 		<div class="invalid-feedback">8-10자의 비밀번호를 입력해주세요. </div> 
 		</div> 
 		
 		<div class="mb-3"> 
 		<label for="member_name">이름</label> 
 		<input type="text" class="form-control" id="member_name" name="member_name" placeholder="" required> 
 		<div class="invalid-feedback">이름을 입력해주세요. </div> 
 		</div> 
 		
 		<div class="mb-3"> 
 		<label for="member_phone">연락처</label> 
 		<input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="010-1234-5678" required> 
 		<div class="invalid-feedback">연락처를 입력해주세요. </div> 
 		</div> 
 
		<div class="mb-3"> 
 		<label for="email">이메일</label> 
 		<input type="email" class="form-control" id="email" name="email" placeholder="filmbox@filmbox.com" required> 
 		<div class="invalid-feedback"> 이메일을 입력해주세요. </div>
  		</div>

          
           <hr class="mb-4"> 
           <div class="custom-control custom-checkbox"> 
           <input type="checkbox" class="custom-control-input" id="aggrement" required> 
           <label class="custom-control-label" for="aggrement">회원가입 약관, 개인정보 수집 및 이용에 동의합니다.</label>
            </div> 
            
            <br>
            <div class="mb-4" id="joinsubmitdiv">
			<button class="btn btn-danger btn-lg btn-block" id="joinsubmit" type="submit">가입 완료</button>
			</div>

   </form> 
 </div> 
</div>
</div>



<!-- <form method="post" action="joinresult">
<ul>
	<li>
	<label for="member_id">아이디</label>
	<input type="text" id="member_id" name="member_id" required>
	<span id="id_check1">사용가능한 아이디입니다.</span>
	<span id="id_check2">아이디가 이미 존재합니다.</span>
	</li>
	<li>
	<label for="member_pwd">비밀번호</label>
	<input type="password" id="member_pwd" name="member_pwd" minlength='8' maxlength='10' placeholder="8-10자 입력" required>
	</li>
	<li>
	<label for="member_name">이름</label>
	<input type="text" id="member_name" name="member_name" required>
	</li>
	<li>
	<label for="member_phone">연락처</label>
	<input type="text" id="member_phone" name="member_phone" required>
	</li>
	<li>
	<label for="email">이메일</label>
	<input type="text" id="email" name="email" required>
	</li>
</ul> 

	<input type="submit" id="joinsubmit" value="가입">
</form>-->

<!-- id 중복 검사 -->
<script>

$('#member_id').on("propertychange change keyup paste input", function(){
	var member_id = $('#member_id').val();	
	var data = {member_id : member_id}
	
		$.ajax({
			type : "post",
			url : "/useridcheck",
			data : data,
			success : function (result) {
				if(result!='fail'){
					$('#id_check1').css("display", "inline-block");
					$('#id_check2').css("display", "none");
					$("#joinsubmit").attr("disabled", false);
					
				}
				else{
					$('#id_check1').css("display", "none");
					$('#id_check2').css("display", "inline-block");
					$("#joinsubmit").attr("disabled", true);
					
				}
			}
		});
});

//부트스트랩 유효성 검사 

 (function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.getElementsByClassName('validation-form'); 

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()

	
</script> 

</body>
</html>