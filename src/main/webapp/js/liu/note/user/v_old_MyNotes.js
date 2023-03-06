console.log("MyNotes.js is working.");

const noteBtn = document.getElementsByClassName('note-btn');

for (let i = 0; i < noteBtn.length; i++) {
    noteBtn[i].addEventListener('click', function(e) {
        let noteId = this.getAttribute('data-id');
        getNote(noteId);
        getNotePhoto(noteId);
    })
}

function getNote(noteId) {
    axios.get('http://localhost:8080/onlinelearning/note/user/getOneNote?noteId='+ noteId)
    .then(res => {
        console.log(res.data)
        htmlMaker1(res.data)
    })
    .catch(err => {
        console.error(err); 
    })
} 

function getNotePhoto(noteId) {
    axios.get('http://localhost:8080/onlinelearning/note/user/note-get-photoIds?noteId='+ noteId)
    .then(res => {
        console.log(res.data)
        htmlMaker2(res.data)
    })
    .catch(err => {
        console.error(err); 
    })
}


function htmlMaker1(data) {
    let output = document.getElementById('output-result');
    output.innerHTML = 
    `<table>
        <tr><td>筆記標題：${data.noteTitle}</td></tr>
        <tr><td>筆記內容：${data.noteContent}</td></tr>
    </table>`;
}

function htmlMaker2(data) {
    let output = document.getElementById('output-result');

    for (let i = 0; i < data.length; i++) {

        axios.get('http://localhost:8080/onlinelearning/note/user/notePhoto?notePhotoId='+ data[i])
        .then(res => {
            // console.log(res.data);
            var notePhotoContent = res.data;
            var newImgTag = `<img src="${notePhotoContent}" />`;
            output.innerHTML += newImgTag;
        })
        .catch(err => {
            console.error(err); 
        })
        
    }

}

const deleteBtn = document.getElementsByClassName('delete-btn');

for (let i = 0; i < deleteBtn.length; i++) {
    deleteBtn[i].addEventListener('click', function(e) {
        let noteId = this.getAttribute('data-id');
        deleteNote(noteId);
    })
}

function deleteNote(noteId) {
    axios.delete('http://localhost:8080/onlinelearning/note/user/delete?noteId='+ noteId)
    .then(res => {
        document.getElementById(noteId).remove();
        console.log(res.data)
    })
    .catch(err => {
        console.error(err); 
    })
}