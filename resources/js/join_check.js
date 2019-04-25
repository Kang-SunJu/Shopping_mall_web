var join = {
email:{
	empty: { code:'empty', desc:'이메일을 입력하세요' },
	valid: { code:'valid', desc:'유효한 이메일입니다' },
	invalid: { code:'invalid', desc:'유효하지 않은 이메일입니다' }
},	
email_status: function(email){
	//teT01.0ad1@hanul-edu.co.kr
	var reg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if( email == '' ) 			return this.email.empty;
	else if( !reg.test(email) ) return this.email.invalid;
	else						return this.email.valid;
},		
pwd_ck: {
	empty: { code: 'empty', 
			 desc:'비밀번호를 다시 입력하세요' },
	invalid:{code: 'invalid', 
			desc: '비밀번호가 일치하지 않습니다'},
	valid:{	code: 'valid', desc: '비밀번호가 일치합니다'}
},

pwd_ck_status: function(pwd_ck, pwd){
	if( pwd_ck == '' ) 			return this.pwd_ck.empty;
	else if( pwd_ck == pwd ) 	return this.pwd_ck.valid;
	else 						return this.pwd_ck.invalid;
},

pwd:{
	empty:{
		code: 'empty', desc: '비밀번호를 입력하세요'
	},
	space:{
		code: 'space', desc: '공백없이 입력하세요'
	},
	invalid:{
		code: 'invalid', desc:'영문대문자, 소문자, 숫자만 입력하세요'
	},
	min: {
		code: 'min', desc:'최소 5자 이상 입력하세요'
	},
	max: {
		code: 'max', desc:'최소 10자 이하 입력하세요'
	},
	valid:{
		code: 'valid', desc:'사용가능한 비밀번호입니다'
	},
	lack:{
		code: 'lack', 
		desc: '영문 대문자,소문자,숫자를 모두 포함해야 합니다'
	}
},

pwd_status: function(pwd){
	var space = /\s/g;
	var reg = /[^a-zA-Z0-9]/g;
	var upper = /[A-Z]/g;
	var lower = /[a-z]/g;
	var digit = /[0-9]/g;
	if( pwd == '' ) 		return this.pwd.empty;
	else if( pwd.match(space) )	return this.pwd.space;
	else if( reg.test(pwd) )	return this.pwd.invalid;
	else if( pwd.length < 5 )	return this.pwd.min;
	else if( pwd.length > 10 )	return this.pwd.max;
	else if( !upper.test(pwd) | !lower.test(pwd) | !digit.test(pwd) ) return this.pwd.lack;
	else	return this.pwd.valid;
},

id:{
	empty:{
		code: 'empty', 
		desc: '아이디를 입력하세요(영문소문자, 숫자만 입력)'
	},
	space: {
		code:'space', desc:'공백없이 입력하세요' 
	},
	invalid: {
		code: 'invalid', desc: '영문소문자, 숫자만 입력하세요'
	},
	min: {
		code: 'min', desc:'최소 5자 이상 입력하세요'
	},
	max: {
		code:'max', desc:'최대 10자 이하로 입력하세요'
	},
	valid:{
		code:'valid', desc: '아이디 중복여부를 확인하세요'
	},
	usable: {
		code:'usable', desc: '사용 가능한 아이디입니다'
	},
	unusable: {
		code: 'unusable', desc: '이미 사용중인 아이디입니다'
	}
},

id_usable: function(usable){
	if( usable == 'true' ){
		return this.id.usable;
	}else{
		return this.id.unusable;
	}
},

id_status: function(id){
	var space = /\s/g;
	var reg = /[^a-z0-9]/g;
	
	if( id == '' ){  //입력하지 않은 경우
		return this.id.empty;
	}else if( id.match(space) ){//공백문자를 입력한 경우
		return this.id.space;
	}else if( reg.test(id) ){ //영문소문자, 숫자 외의 문자를 입력한 경우
		return this.id.invalid;
	}else if( id.length<5 ){	//최소문자갯수
		return this.id.min;
	}else if( id.length>10 ){//최대문자갯수
		return this.id.max;
	}else{
		return this.id.valid;
	}
}

}