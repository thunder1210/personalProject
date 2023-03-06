// ------------ 新增文章 ------------
document.querySelector('.ajax-form-submit').addEventListener('click', (e) => {
    e.preventDefault();
    let postType = document.querySelector('#postType').value;
    let postTitle = document.querySelector('#postTitle').value;
    let postContent = document.querySelector('#postContent').value;
    let postPhotoFile = document.querySelector('#postPhotoFile').files[0];
    let memberId = document.querySelector('#memberId').value;

    const formData = new FormData();
    formData.append('blogPostType', postType);
    formData.append('blogPostTitle', postTitle);
    formData.append('blogPostContent', postContent);
    formData.append('blogPostMultipart', postPhotoFile);
    formData.append('memberId', memberId);
    console.log(formData.get('blogPostType'));
    console.log(formData.get('blogPostTitle'));
    console.log(formData.get('blogPostContent'));
    console.log(formData.get('blogPostMultipart'));
    console.log(formData.get('memberId'));

    axios.post("http://localhost:8080/onlinelearning/blogedit/post/ajax", formData, {
        headers: {
            "Content-Type": "multipart/form-data"
        }
    },
    )
        .then(res => {
            console.log(res.data);
            window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })
        .catch(err => {
            console.error(err);
            window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })
})




// ------------- 編輯彈窗 ------------- 
var exampleModal = document.getElementById('exampleModal')
exampleModal.addEventListener('show.bs.modal', function (event) { // Button that triggered the modal

    var button = event.relatedTarget // Extract info from data-bs-* attributes

    var recipient = button.getAttribute('data-bs-whatever')
    // you could initiate an AJAX request here and then do the updating in a callback

    // Update the modal's content
    var modalTitle = exampleModal.querySelector('.modal-title')

    var modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = '編輯：' + recipient
    modalBodyInput.value = ''
})

// ------------- 刪除彈窗 -------------
var exampleModal2 = document.getElementById('exampleModal2')
exampleModal2.addEventListener('show.bs.modal', function (event) {

    var button = event.relatedTarget

    var recipient2 = button.getAttribute('data-bs-whatever2')

    var modalTitle2 = exampleModal2.querySelector('.modal-title2')

    modalTitle2.textContent = '刪除：' + recipient2
    modalBodyInput2.value = ''
})

// --------------------------------

// ------------- 送出編輯 按鈕 -------------

const editBtn = document.querySelector('.save-update-btn');

editBtn.addEventListener('click', function (e) {
    // let blogPostId = editBtn
    let postType = document.querySelector("#recipient-type").value
    let postTitle = document.querySelector("#recipient-title").value
    let postContent = document.querySelector("#recipient-content").value
    let postId = this.id

    let blogJsonRaw = { "blogPostId": postId, "blogPostType": postType, "blogPostTitle": postTitle, "blogPostContent": postContent };
    let blogJsonString = JSON.stringify(blogJsonRaw);

    axios({
        url: 'http://localhost:8080/onlinelearning/blogedit/put',
        method: 'put',
        headers: {
            "Content-Type": "application/json"
        },
        responseType: 'text',
        data: { "blogPostId": postId, "blogPostType": postType, "blogPostTitle": postTitle, "blogPostContent": postContent }

    })
        .then(res => {
            console.log(res.data);
            let memberId = document.querySelector('#memberId').value;
            // window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })
        .catch(err => {
            console.log(err)
            // window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })


})

const fakeEditBtn = document.getElementsByClassName("fake-edit-btn")
for (i = 0; i < fakeEditBtn.length; i++) {
    fakeEditBtn[i].addEventListener('click', function (e) {
        console.log('fakeEditBtn has been clicked.')
        let editBtnId = this.id;
        console.log(editBtnId);
        let editDiv = document.querySelector(`[data-id="${editBtnId}"]`);
        console.log(editDiv);
        document.querySelector(".save-update-btn").id = editBtnId;
        document.querySelector("#recipient-title").value = editDiv.querySelector(`.blogPostTitle`).innerHTML;
        document.querySelector("#recipient-type").value = editDiv.querySelector(`.blogPostType`).innerHTML;
        document.querySelector("#recipient-photo").src = editDiv.querySelector('.blogPostPhoto').src;
        document.querySelector("#postPhotoFile").value = editDiv.querySelector(`.blogPostPhoto`).innerHTML;
        document.querySelector("#recipient-content").value = editDiv.querySelector(`.blogPostContent`).innerHTML;
    })
}



// ------------- 確定刪除 按鈕 -------------
const deleteBtn = document.querySelector('.delete-btn');

const fakeDeleteBtn = document.getElementsByClassName("fake-delete-btn")
for (i = 0; i < fakeDeleteBtn.length; i++) {
    fakeDeleteBtn[i].addEventListener('click', function (e) {
        deleteBtn.setAttribute('data-blogPostId', this.id);
    })
}

deleteBtn.addEventListener('click', function (e) {
    let bgpID = this.getAttribute('data-blogPostId');
    console.log(bgpID)
    sendDeleteAjax(bgpID)
})

function sendDeleteAjax(bgpID) {
    let blogJsonRaw = { "blogPostId": bgpID };
    let blogJsonString = JSON.stringify(blogJsonRaw);

    axios({
        url: 'http://localhost:8080/onlinelearning/blogedit/delete',
        method: 'delete',
        headers: {
            "Content-Type": "application/json"
        },
        responseType: 'text',
        data: {
            "blogPostId": bgpID
        }
    })
        .then(res => {
            console.log(res.data);
            let memberId = document.querySelector('#memberId').value;
            window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })
        .catch(err => {
            console.log(err)
            window.location.href = `http://localhost:8080/onlinelearning/blogedit?memberId=${memberId}`
        })
}

