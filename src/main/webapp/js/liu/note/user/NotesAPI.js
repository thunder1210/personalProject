export class NotesAPI {

    constructor() {

    }

    static init() {
        // bindAddBtn();
        refreshNotesSidebar();

    }

    static uploadNewNote() {
        uploadNewNote();
    }

    static editNote() {
        editNote();
    }

    static stickNote() {
        stickNote();
    }

    static bindAllNormalStars() {
        bindAllNormalStars();
    }

    static bindOneStar() {
        bindOneStar();
    }
}

// function bindAddBtn() {
//     document.querySelector('.notes_addBtn').addEventListener('click', () => {
//         uploadNewNote();
//     });
// }

function clearNotesSidebar() {
    document.querySelector('.notes_top_userArea').innerHTML = '';
    document.querySelector('.notes_normal_userArea').innerHTML = '';
}

function refreshNotesSidebar() {
    clearNotesSidebar();

    let memberId = document.querySelector('#memberId').value;
    let memberJsonRaw = {"memberId" : memberId};
    let memberJsonString = JSON.stringify(memberJsonRaw);
    let getAllNotesUrl = 'http://localhost:8080/onlinelearning/note/user/getAll';
    axios.post(getAllNotesUrl, memberJsonString, {
        headers : {'Content-Type': 'application/json'}
    })
    .then(res => {
        let notes = res.data;
        createNotesSidebar(notes);
    })
    .catch(err => {
        console.log(err);
    })
}

function createNotesSidebar(notes) {
    for (let i = 0; i < notes.length; i++) {
        let notesInfoMaker;
        let notesInfoDiv = document.createElement('div');
        if (notes[i].noteTopSetting == 'on') {
            notesInfoMaker = document.querySelector('.notes_top_userArea');
            notesInfoDiv.classList.add('notes_top_info');
        } else if (notes[i].noteTopSetting == 'off') {
            notesInfoMaker = document.querySelector('.notes_normal_userArea');
            notesInfoDiv.classList.add('notes_normal_info');
        }
        notesInfoDiv.innerHTML = '';

        let starDiv = document.createElement('div');
        starDiv.innerHTML = ('☆');
        if (notes[i].noteTopSetting == 'on') {
            starDiv.classList.add('star_top');
        } else if (notes[i].noteTopSetting == 'off') {
            starDiv.classList.add('star_normal');
        }
        starDiv.setAttribute('data-starId', notes[i].noteId);
        notesInfoDiv.appendChild(starDiv);

        let idInput = document.createElement('input');
        idInput.classList.add('notes_sidebar_noteId');
        idInput.type = 'hidden';
        idInput.value = notes[i].noteId;
        notesInfoDiv.appendChild(idInput);

        let titleSection = document.createElement('section');
        titleSection.classList.add('notes_sidebar_noteTitle');
        titleSection.innerHTML = notes[i].noteTitle;
        notesInfoDiv.appendChild(titleSection);

        let contentInput = document.createElement('input');
        contentInput.classList.add('notes_sidebar_noteContent');
        contentInput.type = 'hidden';
        contentInput.value = notes[i].noteContent;
        notesInfoDiv.appendChild(contentInput);

        notesInfoMaker.appendChild(notesInfoDiv);
    }
    bindAllNormalStars();
}

function insertNewNoteAtSidebar(note) {
    let notesInfoMaker = document.querySelector('.notes_normal_userArea');

    let notesInfoDiv = document.createElement('div');
    notesInfoDiv.classList.add('notes_normal_info');

    let starDiv = document.createElement('div');
    starDiv.innerHTML = ('☆');
    starDiv.classList.add('star_normal');
    starDiv.setAttribute('data-starId', note.noteId);
    notesInfoDiv.appendChild(starDiv);
    bindOneStar(notesInfoDiv.firstChild);

    let idInput = document.createElement('input');
    idInput.classList.add('notes_sidebar_noteId');
    idInput.type = 'hidden';
    idInput.value = note.noteId;
    notesInfoDiv.appendChild(idInput);

    let titleSection = document.createElement('section');
    titleSection.classList.add('notes_sidebar_noteTitle');
    titleSection.innerHTML = note.noteTitle;
    notesInfoDiv.appendChild(titleSection);

    let contentInput = document.createElement('input');
    contentInput.classList.add('notes_sidebar_noteContent');
    contentInput.type = 'hidden';
    contentInput.value = note.noteContent;
    notesInfoDiv.appendChild(contentInput);

    notesInfoMaker.insertBefore(notesInfoDiv, notesInfoMaker.firstChild);

    // notesInfoMaker.appendChild(notesInfoDiv);

}

function uploadNewNote() {
    let noteTitle = 'Note Title...';
    let noteContent = 'Take Note Here...';
    let noteTopSetting = 'off';
    let noteAccess = 'private';
    let memberId = document.querySelector('#memberId').value;
        
    let noteJsonRaw = {"noteTitle" : noteTitle, "noteContent" : noteContent, "noteTopSetting": noteTopSetting,"noteAccess" : noteAccess, "memberId" : memberId};
    let noteJsonString = JSON.stringify(noteJsonRaw);
        
    let addNoteUrl = 'http://localhost:8080/onlinelearning/note/user/addNew';
        
    axios.post(addNoteUrl, noteJsonString, {
        headers : {'Content-Type': 'application/json'}
    })
    .then(res => {
        insertNewNoteAtSidebar(res.data);
        // clearNotesSidebar();
        // refreshNotesSidebar();
    })
    .catch(err => {
        console.error(err); 
    })
}

function editNote() {
    let noteId = document.querySelector('.notes_update_noteId').value;
    let noteTitle = document.querySelector('.notes_update_noteTitle').innerHTML;
    let noteContent = document.querySelector('.notes_update_noteContent').innerHTML;
    let noteAccess = 'private';
    let memberId = document.querySelector('#memberId').value;

    let noteJsonRaw = {"noteId" : noteId,"noteTitle" : noteTitle, "noteContent" : noteContent, "noteAccess" : noteAccess, "memberId" : memberId};
    let noteJsonString = JSON.stringify(noteJsonRaw);
    console.log('editNote() is working');
    console.log(noteJsonString);

    let editNoteUrl = 'http://localhost:8080/onlinelearning/note/user/edit';
    axios.put(editNoteUrl, noteJsonString, {
        headers : {'Content-Type': 'application/json'}
    })
    .then(res => {
        refreshNotesSidebar();
    })
    .catch(err => {
        console.log(err);
    })
}

function bindAllNormalStars() {
    document.querySelectorAll('.star_normal').forEach((star) => star.addEventListener('click', () => {
        // console.log(star);
        // console.log(star.getAttribute('data-starId'));
        document.querySelector('#currStarId').value = star.getAttribute('data-starId');
        stickNote();
        setTimeout(bindSidebarNote, 1000);
    })
)}

function bindOneStar(starDiv) {
    starDiv.addEventListener('click', () => {
        if (starDiv.classList.contains('star_normal')) {
            document.querySelector('#currStarId').value = starDiv.getAttribute('data-starId');
            stickNote();
            setTimeout(bindSidebarNote, 1000);
        }
    })
}

function stickNote() {
    console.log('NotesAPI.stickNote() is working.');
    let noteId = document.querySelector('#currStarId').value;
    let noteTopSetting = 'on';
    let noteJsonRaw = {"noteId" : noteId, "noteTopSetting" : noteTopSetting};
    let noteJsonString = JSON.stringify(noteJsonRaw);
    console.log(noteJsonString);
    let stickNoteUrl = 'http://localhost:8080/onlinelearning/note/user/stick';
    axios.put(stickNoteUrl, noteJsonString, {
        headers : {'Content-Type': 'application/json'}
    })
    .then(res => {
        console.log(res.data);
        clearNotesSidebar();
        refreshNotesSidebar();
    })
    .catch(err => {
        console.log(err);
    })
}

function bindSidebarNote() {
    let selectNoteBind = document.querySelectorAll
    ('.notes_normal_info, .notes_top_info');
    console.log(selectNoteBind);
    for (let i = 0; i < selectNoteBind.length; i++) {
        let noteId = selectNoteBind[i].querySelector('.notes_sidebar_noteId').value;
        let noteTitle = selectNoteBind[i].querySelector('.notes_sidebar_noteTitle').innerHTML;
        let noteContent = selectNoteBind[i].querySelector('.notes_sidebar_noteContent').value;
        selectNoteBind[i].addEventListener('click', () => {
            for (let j = 0; j < selectNoteBind.length; j++) { 
                selectNoteBind[j].querySelector('.notes_sidebar_noteTitle').classList.remove('notes_selected');
            }
            selectNoteBind[i].querySelector('.notes_sidebar_noteTitle').classList.add('notes_selected');
            createNotesEditArea(noteId, noteTitle, noteContent);
            
        })
    }
}

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

// function bindSidebarNoteTitle(notes) {
//     let selectNoteBind = document.querySelectorAll('.notes_sidebar_noteTitle');
//     for (let i = 0; i < selectNoteBind.length; i++) {
//         selectNoteBind[i].addEventListener('click', () => {
//             createNotesEditArea(notes[i]);
//         })
//     }
// }