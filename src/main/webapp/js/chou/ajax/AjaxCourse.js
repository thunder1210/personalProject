const deleteBtn = document.getElementsByClassName('delete-btn');

for (i = 0; i < deleteBtn.length; i++) {
    deleteBtn[i].addEventListener('click', function (e) {
        let crsID = this.getAttribute('data-crsid');
        sendDeleteAjax(crsID)
    })
}

function sendDeleteAjax(crsID) {
    axios({
        url: 'http://localhost:8080/onlinelearning/course/delete',
        method: 'delete',
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        responseType: 'text',
        params: {
            crsId: crsID
        }
    })
        .then(res => {
            console.log(res.data)
        })
        .catch(err => {
            console.log(err)
            window.location.href = 'http://localhost:8080/onlinelearning/course/admin';
        })
}