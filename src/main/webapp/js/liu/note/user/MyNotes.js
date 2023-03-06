import { NotesAPI } from "./NotesAPI.js";

document.addEventListener("DOMContentLoaded", () => {
    NotesAPI.init();
    setTimeout(bindSidebarNote, 1000);
    bindAddBtn();
    setNotesUpdateTitleArea();
    setNotesUpdateContentArea();
})

function doNothing() {

}

function bindAddBtn() {
    document.querySelector('.notes_addBtn').addEventListener('click', () => {
        NotesAPI.uploadNewNote();
        setTimeout(bindSidebarNote, 1000);
        // 找 normal info 內的第一筆
        let note = document.querySelector('.notes_normal_info');
        let noteId = note.querySelector('.notes_sidebar_noteId').value;
        let noteTitle = note.querySelector('.notes_sidebar_noteTitle').innerHTML;
        let noteContent = note.querySelector('.notes_sidebar_noteContent').value;

        createNotesEditArea(noteId, noteTitle, noteContent);
    });
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

// function clearNotesEditArea() {
//     document.querySelector('.notes_update').innerHTML = '';
// }

function clearNotesEditArea() {
    document.querySelector('#notes_update_noteTitle').innerHTML = '';
    document.querySelector('#notes_update_noteContent').innerHTML = '';
}

function createNotesEditArea(noteId, noteTitle, noteContent) {
    clearNotesEditArea();

    let idInput = document.querySelector('.notes_update_noteId');
    idInput.value = noteId;

    let titleDiv = document.querySelector('#notes_update_noteTitle');
    titleDiv.innerHTML = noteTitle;

    let contentDiv = document.querySelector('#notes_update_noteContent');
    contentDiv.innerHTML = noteContent;

}

// function createNotesEditArea(noteId, noteTitle, noteContent) {
//     clearNotesEditArea();

//     let editDiv = document.querySelector('.notes_update');
//     editDiv.innerHTML = '';

//     let idInput = document.createElement('input');
//     idInput.type = 'hidden';
//     idInput.value = noteId;
//     idInput.classList.add('notes_update_noteId');
//     editDiv.appendChild(idInput);

//     let titleSection = document.createElement('section');
//     titleSection.classList.add('notes_update_noteTitle');
//     titleSection.setAttribute('id', 'notes_update_noteTitle');
//     titleSection.setAttribute('contenteditable', 'true');
//     titleSection.innerHTML = noteTitle;
//     editDiv.appendChild(titleSection);

//     let contentSection = document.createElement('section');
//     contentSection.classList.add('notes_update_noteContent');
//     contentSection.setAttribute('id', 'notes_update_noteContent');
//     contentSection.setAttribute('contenteditable', 'true');
//     contentSection.innerHTML = noteContent;
//     editDiv.appendChild(contentSection);

//     // setNotesUpdateForm();
// }

function setNotesUpdateForm() {
    tinymce.init({
        selector: '.notes_update_form',
        inline: true,
        toolbar_mode: 'sliding',
        resize: false,
        promotion: false,
        branding: false,
        setup: function(editor) {
            editor.on('init', function(e) {
              console.log('The Editor has initialized.');
            });
            editor.on('change', function(e) {
                tinyMCE.triggerSave();
                console.log(tinymce.activeEditor.getContent());
                NotesAPI.editNote();
                setTimeout(bindSidebarNote, 1000);
            });
        },
    })
}

function setNotesUpdateTitleArea() {
    tinymce.init({
        selector: '#notes_update_noteTitle',
        inline: true,
        toolbar_mode: 'sliding',
        resize: false,
        promotion: false,
        branding: false,
        setup: function(editor) {
            editor.on('init', function(e) {
              console.log('The Title Editor has initialized.');
            });
            editor.on('change', function(e) {
                // tinyMCE.triggerSave();
                NotesAPI.editNote();
                setTimeout(bindSidebarNote, 1000);
            });
        },
    })
}

// default setting 參考用
// tinymce.init({
//     selector: 'textarea',  
//     toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | outdent indent',
// file_picker_callback: function(callback, value, meta) {
//     // Provide file and text for the link dialog
//     if (meta.filetype == 'file') {
//       callback('mypage.html', {text: 'My text'});
//     }

//     // Provide image and alt text for the image dialog
//     if (meta.filetype == 'image') {
//       callback('myimage.jpg', {alt: 'My alt text'});
//     }

//     // Provide alternative source and posted for the media dialog
//     if (meta.filetype == 'media') {
//       callback('movie.mp4', {source2: 'alt.ogg', poster: 'image.jpg'});
//     }
//   }
// });


function setNotesUpdateContentArea() {
    tinymce.init({
        selector: '#notes_update_noteContent',
        inline: true,
        toolbar_mode: 'floating',
        resize: false,
        promotion: false,
        branding: false,
        skin: 'oxide-dark',
        content_css: 'dark',
        images_upload_url: 'http://localhost:8080/onlinelearning/note/user/notephoto/upload',
        automatic_uploads: true,
        plugins: 'image',
        toolbar: 'undo redo | image | link image | bold italic | alignleft aligncenter alignright alignjustify | outdent indent',
        // file_picker_callback: function(callback, value, meta) {
        //     // Provide file and text for the link dialog
        //     if (meta.filetype == 'file') {
        //       callback('mypage.html', {text: 'My text'});
        //     }
        
        //     // Provide image and alt text for the image dialog
        //     if (meta.filetype == 'image') {
        //       callback('myimage.jpg', {alt: 'My alt text'});
        //     }
        
        //     // Provide alternative source and posted for the media dialog
        //     if (meta.filetype == 'media') {
        //       callback('movie.mp4', {source2: 'alt.ogg', poster: 'image.jpg'});
        //     }
        // },
        setup: function(editor) {
            editor.on('init', function(e) {
              console.log('The Content Editor has initialized.');
            });
            editor.on('change', function(e) {
                // tinyMCE.triggerSave();
                NotesAPI.editNote();
                setTimeout(bindSidebarNote, 1000);
            });
        },
    })
}




