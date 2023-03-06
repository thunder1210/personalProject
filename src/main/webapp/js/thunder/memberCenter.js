/*=====================================================================*/

let realHobby1 = document.getElementById('memberHobby1').value;
let realHobby2 = document.getElementById('memberHobby2').value;
let realHobby3 = document.getElementById('memberHobby3').value;
let url1 = 'http://localhost:8080/onlinelearning/Membership/theHobbyTagEdit';

document.getElementById('theUpdateHobbyBtn').addEventListener('click', function(e){
	e.preventDefault();
	let hobbyArr = [];
	for(i=0; i<allTheHobbyBoxes.length;i++){
		if(allTheHobbyBoxes[i].checked==true){
			hobbyArr.push(allTheHobbyBoxes[i].value);
		}
	}
	const HobbyIdd = document.getElementById('theId').value;
	let dtoObjectHobby = { "memberId":HobbyIdd ,"memberFavorite1" :hobbyArr[0], "memberFavorite2" :hobbyArr[1], "memberFavorite3": hobbyArr[2]}


	axios.post(url1, dtoObjectHobby)
	.then(response =>{
		Swal.fire({
			position: 'top-end',
			icon: '個人興趣更新',
			title: '更新已完成！',
			showConfirmButton: false,
			timer: 1500
		})
	}).catch(err => {
		console.log(err);
	})
})

let allTheHobbyBoxes = document.getElementsByClassName('hobbyClass');
let theHobbyLable = document.getElementsByClassName('theHobbyLable');
let hobbyTester = 0;

for(i=0; i<allTheHobbyBoxes.length;i++){
	if(allTheHobbyBoxes[i].value==realHobby1 || allTheHobbyBoxes[i].value==realHobby2 || allTheHobbyBoxes[i].value==realHobby3){
		theHobbyLable[i].style.backgroundColor = "#FFAF60";
		theHobbyLable[i].style.color = "white";
		theHobbyLable[i].setAttribute('value', '1')
		allTheHobbyBoxes[i].checked=true;
		hobbyTester++;
	}
}

for(i=0; i<allTheHobbyBoxes.length;i++){
	theHobbyLable[i].addEventListener('click', function(e){
		if(this.getAttribute('value')==0){
			if(hobbyTester>=3){
				return;
			}
		this.setAttribute('value', '1')
		this.style.backgroundColor = "#FFAF60";
		this.style.color = "white";
		hobbyTester++;
	} else if(this.getAttribute('value')==1){
		this.setAttribute('value', '0')
		this.style.backgroundColor = "white";
		this.style.color = "black";
		hobbyTester--;
	}
})
}

/*=====================================================================*/

let realSkill1 = document.getElementById('memberSkill1').value;
let realSkill2 = document.getElementById('memberSkill2').value;
let realSkill3 = document.getElementById('memberSkill3').value;
let url = 'http://localhost:8080/onlinelearning/Membership/theSkillTagEdit';

document.getElementById('theUpdateSkillBtn').addEventListener('click', function(e){
	e.preventDefault();
	let arr = [];
	for(i=0; i<allTheSkillBoxes.length;i++){
		if(allTheSkillBoxes[i].checked==true){
			arr.push(allTheSkillBoxes[i].value);
		}
	}
	const Idd = document.getElementById('theId').value;
	let dtoObject = { "memberId":Idd ,"memberSkill1" :arr[0], "memberSkill2" :arr[1], "memberSkill3": arr[2]}

	axios.post(url, dtoObject)
	.then(response =>{
		Swal.fire({
			position: 'top-end',
			icon: '個人興趣更新',
			title: '更新已完成！',
			showConfirmButton: false,
			timer: 1500
		})
	}).catch(err => {
		console.log(err);
	})
})

/*=====================================================================*/

let allTheSkillBoxes = document.getElementsByClassName('skillClass');
let allLabels = document.getElementsByClassName('theLable');
let tester = 0;

for(i=0; i<allTheSkillBoxes.length;i++){
	if(allTheSkillBoxes[i].value==realSkill1 || allTheSkillBoxes[i].value==realSkill2 || allTheSkillBoxes[i].value==realSkill3){
		allLabels[i].style.backgroundColor = "rgb(78, 134, 255)";
		allLabels[i].style.color = "white";
		allLabels[i].setAttribute('value', '1')
		allTheSkillBoxes[i].checked=true;
		tester++;
	}
}

for(i=0; i<allTheSkillBoxes.length;i++){
	allLabels[i].addEventListener('click', function(e){
		if(this.getAttribute('value')==0){
			if(tester>=3){
				return;
			}
		this.setAttribute('value', '1')
		this.style.backgroundColor = "rgb(78, 134, 255)";
		this.style.color = "white";
		tester++;
	} else if(this.getAttribute('value')==1){
		this.setAttribute('value', '0')
		this.style.backgroundColor = "white";
		this.style.color = "black";
		tester--;
	}
})
}

/*=====================================================================*/

const pageNumbers = document.getElementsByClassName('pageNumberLink');	
const mebmerId = document.getElementById('memberId').textContent;
const theTable = document.getElementById('boo bootgrid-basic').getElementsByTagName('tbody')[0];

const allthePages = document.getElementsByName('papage');
for(i=0; i<allthePages.length; i++){
	var pageNum = allthePages[i].textContent;
	const reqUrl = 'http://localhost:8080/onlinelearning/Membership/orderPages' + '?loginMember=' +  mebmerId + '&theWantedPage=' + pageNum;

	allthePages[i].addEventListener('click', function(e){
		remove();
		this.setAttribute('class', "pageNumberLink2");
		axios.get(reqUrl)
  			  .then( (response) => {
			  showResult(response.data.content)
		})
			  .catch( (error) => {
			console.log(error)
		})
	})
}

/*=====================================================================*/

function remove(){
	for(i=0; i<allthePages.length; i++){
		allthePages[i].setAttribute('class', "pageNumberLink")
	}
}

/*=====================================================================*/

function showResult(data){
	var theContents = '<tbody>'
	data.forEach((element, index) => {
		theContents += `<tr>`
		theContents += `<td>${element.recordId}</td>` 
		theContents += `<td>${element.loginIP}</td>`
		theContents += `<td>${element.loginLocation}</td>`
		theContents += `<td>${new Date(element.loginTime).toLocaleString('zh', { hour12: false }).replaceAll('/', '-')}</td>`
		theContents += `<td>${element.loginType}</td>`
		theContents += `<td>${element.loginStatus}</td>`
		theContents += `<td>${element.systemEvent}</td>`
		theContents += '</tr>'
	});
	theContents += '</tbody>'
	theTable.innerHTML = theContents
}

/*=====================================================================*/

let theCheckBoxes = document.getElementsByClassName('form-control');

for (i = 0; i < theCheckBoxes.length; i++) {
	theCheckBoxes[i].addEventListener('click', function (e) {
		this.removeAttribute("readonly");
	})
}

const sendBtn = document.getElementById('sendOutBtn');
const editBtn = document.getElementById('editBtn');

const theMemberId = document.getElementById('MemberId');
const theNickName = document.getElementById('NickName');
const theMemberAge = document.getElementById('MemberAge');
const theMemberName = document.getElementById('MemberName');
const theMemberEmail = document.getElementById('MemberEmail');
const theMemberAddress = document.getElementById('MemberAddress');
const theIdentityNumber = document.getElementById('IdentityNumber');
const theMemberEducated = document.getElementById('MemberEducated');
const theMemberTelephone = document.getElementById('MemberTelephone');

/*=====================================================================*/

editBtn.addEventListener('click', e => {
	e.preventDefault();

	for (i = 0; i < theCheckBoxes.length; i++) {
		theCheckBoxes[i].removeAttribute("readonly");
	}
})

/*=====================================================================*/

sendBtn.addEventListener('click', e => {
	e.preventDefault();
	let dtoObject = {
		nickName: theNickName.value, memberId: theMemberId.value, memberAge: theMemberAge.value,
		memberName: theMemberName.value, memberEmail: theMemberEmail.value, memberAddress: theMemberAddress.value,
		identityNumber: theIdentityNumber.value, memberEducated: theMemberEducated.value,
		memberTelephone: theMemberTelephone.value
	}

	let url = 'http://localhost:8080/onlinelearning/Membership/updateMemberInfo';
	axios.post(url, dtoObject)
		.then(res => {
			theNickName.setAttribute("value", res.data.nickName);
			theMemberId.setAttribute("value", res.data.memberId);
			theMemberAge.setAttribute("value", res.data.memberAge);
			theMemberName.setAttribute("value", res.data.memberName);
			theMemberEmail.setAttribute("value", res.data.memberEmail);
			theMemberAddress.setAttribute("value", res.data.memberAddress);
			theMemberEducated.setAttribute("value", res.data.memberEducated);
			theIdentityNumber.setAttribute("value", res.data.identityNumber);
			theMemberTelephone.setAttribute("value", res.data.memberTelephone);
			for (i = 0; i < theCheckBoxes.length; i++) {
				theCheckBoxes[i].setAttribute("readonly", true);
			}
			Swal.fire({
				position: 'top-end',
				icon: '會員資料修改',
				title: '修改已成功送出！',
				showConfirmButton: false,
				timer: 1500
			})
		})
		.catch(err => {
			console.error(err);
		})
})

/*=====================================================================*/

	function logout(){
		let getID = "http://localhost:8080/onlinelearning/Membership/logout";
		fetch(getID, {
		method: 'POST',
		})
		.then(response => {
			return response.text();
			})
			.then(text =>{
				window.location.href = "http://localhost:8080/onlinelearning/";
				})
		}
		
	