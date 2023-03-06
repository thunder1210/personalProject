export class NotesAPI {
    constructor() {

    }

    static uploadNewNote() {
        uploadNewNote();
    }
}

// document.addEventListener("DOMContentLoaded", () => {
//     refreshNotesCard();
//     let addNoteBtn = document.querySelector('.notes_addBtn');
//     addNoteBtn.addEventListener('click', () => {
//         uploadNewNote();
//     })
// })

// function refreshNotesCard() {
//     // let notes = getAllNotes();
//     // console.log(notes);
//     // CreateNotesCard(notes);
//     // let selectNoteBind = document.querySelectorAll('.notes_card');
//     // for (let i = 0; i < selectNoteBind.length; i++) {
//     //     selectNoteBind[i].addEventListener('click', () => {
//     //         createNotesEditArea(notes[i]);
//     //     })
//     // }
//     let memberId = document.querySelector('#memberId').value;
//     let memberJsonRaw = {"memberId" : memberId};
//     let memberJsonString = JSON.stringify(memberJsonRaw);
//     let getAllNotesUrl = 'http://localhost:8080/onlinelearning/note/user/getAll';
//     axios.post(getAllNotesUrl, memberJsonString, {
//         headers : {'Content-Type': 'application/json'}
//     })
//     .then(res => {
//         console.log(res.data);
//         createNotesCard(res.data);
//         let notes = res.data;
//         let selectNoteBind = document.querySelectorAll('.notes_card');
//         for (let i = 0; i < selectNoteBind.length; i++) {
//             selectNoteBind[i].addEventListener('click', () => {
//                 createNotesEditArea(notes[i]);
//             })
//         }
//     })
//     .catch(err => {
//         console.log(err);
//     })
// }

// function createNotesCard(notes) {
//     console.log(notes);
//     let notesCardMaker = document.querySelector('.notes_list');
//     notesCardMaker.innerHTML = '';
//     for (let i = 0; i < notes.length; i++) {
//         let notesCardDiv = document.createElement('div');
//         notesCardDiv.classList.add('notes_card');

//         let idInput = document.createComment('input');
//         idInput.type = 'hidden';
//         idInput.value = notes[i].noteId;
//         notesCardDiv.appendChild(idInput);

//         let titleSection = document.createElement('section');
//         titleSection.classList.add('notes_card_noteTitle');
//         let titleText = document.createTextNode(notes[i].noteTitle);
//         titleSection.appendChild(titleText);
//         notesCardDiv.appendChild(titleSection);

//         let contentSection = document.createElement('section');
//         contentSection.classList.add('notes_card_noteContent');
//         let contentText = document.createTextNode(notes[i].noteContent);
//         contentSection.appendChild(contentText);
//         notesCardDiv.appendChild(contentSection);

//         let updateTimeSection = document.createElement('section');
//         updateTimeSection.classList.add('notes_card_noteLastUpdateTime');
//         let updateTimeText = document.createTextNode(notes[i].noteLastUpdateTime);
//         updateTimeSection.appendChild(updateTimeText);
//         notesCardDiv.appendChild(updateTimeSection);

//         notesCardMaker.appendChild(notesCardDiv);

//         // notesCardMaker.innerHTML +=
//         // ` 
//         // <div class="notes_card">
//         //     <input type="hidden" class="notes_card_noteId" value="${notes[i].noteId}">
//         //     <section class="notes_card_noteTitle">${notes[i].noteTitle}</section>
//         //     <section class="notes_card_noteContent">${notes[i].noteContent}</section>
//         //     <section class="notes_card_noteLastUpdateTime">${notes[i].noteLastUpdateTime}</section>
//         // </div>
//         // ` 
//     }
//     let deleteBind = document.querySelectorAll('.notes_card');
//     console.log(deleteBind);
//     deleteBind.forEach((noteCard) => {
//         noteCard.addEventListener('dblclick', () => {
//             if (window.confirm(`你確定要刪除嗎?`)) {
//                 deleteNote();
//             }
//         })
//     })
// }

function uploadNewNote() {
    let noteTitle = 'New Note...';
    let noteContent = 'Take Note...';
    let noteAccess = 'private';
    let memberId = document.querySelector('#memberId').value;

    let noteJsonRaw = {"noteTitle" : noteTitle, "noteContent" : noteContent, "noteAccess" : noteAccess, "memberId" : memberId};
    let noteJsonString = JSON.stringify(noteJsonRaw);

    let addNoteUrl = 'http://localhost:8080/onlinelearning/note/user/addNew';

    axios.post(addNoteUrl, noteJsonString, {
        headers : {'Content-Type': 'application/json'}
    })
    .then(res => {
        console.log('upload new note');
        // refreshNotesCard();
        // createNotesEditArea(res.data);
    })
    .catch(err => {
        console.error(err); 
    })
}

// function clearNotesEditArea() {
//     let notesclearer = document.querySelector('.notes_mainArea');
//     notesclearer.innerHTML = '';
// }

// function createNotesEditArea(currNote) {
//     let notesEditMaker = document.querySelector('.notes_mainArea');
//     notesEditMaker.innerHTML = '';

//     let editForm = document.createElement('form');
//     editForm.classList.add('notes_update_form');

//     let editDiv = document.createElement('div');
//     editDiv.classList.add('notes_update');

//     let idInput = document.createElement('input');
//     idInput.type = 'hidden';
//     idInput.value = currNote.noteId;
//     idInput.classList.add('notes_update_noteId');
//     editDiv.appendChild(idInput);

//     let titleSection = document.createElement('section');
//     titleSection.classList.add('notes_update_noteTitle');
//     titleSection.setAttribute('contenteditable', 'true');
//     let titleText = document.createTextNode(currNote.noteTitle);
//     titleSection.appendChild(titleText);
//     editDiv.appendChild(titleSection);

//     let contentSection = document.createElement('section');
//     contentSection.classList.add('notes_update_noteContent');
//     contentSection.setAttribute('contenteditable', 'true');
//     contentSection.innerHTML = currNote.noteContent;
//     editDiv.appendChild(contentSection);

//     editForm.appendChild(editDiv);
//     notesEditMaker.appendChild(editForm);

//     tinymce.init({
//         selector: '.notes_update_noteContent',
//     });
    
    
    
    
//     // let photoForm = document.createElement('form');
//     // photoForm.classList.add('notesPhoto_preview_form');
    
//     // let photoInput = document.createElement('input');
//     // photoInput.classList.add('notesPhoto_preview_input');
//     // photoInput.type = 'file'; 

//     // photoForm.appendChild(photoInput);
//     // notesEditMaker.appendChild(photoForm);

//     // <form class="notesPhoto_preview_form">
//     //     <input class="notesPhoto_preview_input" type="file">
//     // </form>


//     // notesEditMaker.innerHTML += 
//     // `
//     // <form class="notes_update_form">
//     //     <div class="notes_update">
//     //         <input type="hidden" class="notes_update_noteId" value="${currNote.noteId}">
//     //         <section class="notes_update_noteTitle" contenteditable="true">${currNote.noteTitle}</section>
//     //         <section class="notes_update_noteContent" contenteditable="true">${currNote.noteContent}</section>
//     //     </div>;
//     // </form>
//     // `
//     contentSection.focus();
    
//     editForm.addEventListener('input', (e) => {
//         e.preventDefault();
//         editNote();
//     })

// }

// function editNote() {
//     let noteId = document.querySelector('.notes_update_noteId').value;
//     let noteTitle = document.querySelector('.notes_update_noteTitle').innerHTML;
//     let noteContent = document.querySelector('.notes_update_noteContent').innerHTML;
//     let noteAccess = 'private';
//     let memberId = document.querySelector('#memberId').value;

//     let noteJsonRaw = {"noteId" : noteId,"noteTitle" : noteTitle, "noteContent" : noteContent, "noteAccess" : noteAccess, "memberId" : memberId};
//     let noteJsonString = JSON.stringify(noteJsonRaw);
//     console.log('editNote() is working');
//     console.log(noteJsonString);

//     let editNoteUrl = 'http://localhost:8080/onlinelearning/note/user/edit';
//     axios.put(editNoteUrl, noteJsonString, {
//         headers : {'Content-Type': 'application/json'}
//     })
//     .then(res => {
//         refreshNotesCard();
//     })
//     .catch(err => {
//         console.log(err);
//     })
// }

// function deleteNote() {
//     let noteId = document.querySelector('.notes_update_noteId').value;
//     axios.delete('http://localhost:8080/onlinelearning/note/user/delete?noteId='+ noteId)
//     .then(res => {
//         console.log(res.data);
//         refreshNotesCard();
//         clearNotesEditArea();
//     })
//     .catch(err => {
//         console.error(err); 
//     })
// }

// function previewImg(newImg) {
//     let img = document.createElement('img');
//     img.src = imgUrl;
// }

// function uploadImg() {
    
//     // let ContentSection = document.querySelector('.notes_update_noteContent');
// }






