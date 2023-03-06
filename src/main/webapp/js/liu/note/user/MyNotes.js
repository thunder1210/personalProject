import { NotesAPI } from "./NotesAPI.js";

document.addEventListener("DOMContentLoaded", () => {
    NotesAPI.init();
    setTimeout(bindSidebarNote, 1000);
    bindAddBtn();
    setNotesUpdateTitleArea();
    setNotePhotoTestArea();
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

function setNotePhotoTestArea() {
    tinymce.init({
        selector: '#notes_photo_test',
        plugins: 'image code',
        toolbar: 'undo redo | link image | code',
        // images_upload_url: 'http://localhost:8080/onlinelearning/note/user/notephoto/tinymce/upload',
        /* enable title field in the Image dialog*/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        // automatic_uploads: true,
        /*
          URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
          images_upload_url: 'postAcceptor.php',
          here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
          var input = document.createElement('input');
          input.setAttribute('type', 'file');
          input.setAttribute('accept', 'image/*');

          input.onchange = function () {
            var file = this.files[0];
      
            var reader = new FileReader();
            reader.onload = function () {

              var id = 'blobid' + (new Date()).getTime();
              var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
              var base64 = reader.result.split(',')[1];
              var blobInfo = blobCache.create(id, file, base64);
              blobCache.add(blobInfo);
      
              /* call the callback and populate the Title field with the file name */
              cb(blobInfo.blobUri(), { title: file.name });
            };
            reader.readAsDataURL(file);
          };
      
          input.click();
        },
        images_upload_handler: function (blobInfo, success, failure, file) {
            console.log('images_upload_handler is working.');
            let data = new FormData();
            data.append('notePhotoFile', blobInfo.blob(), blobInfo.filename());
            // data.append('noteId', document.querySelector('#currStarId').value);
            axios.post('http://localhost:8080/onlinelearning/note/user/notephoto/tinymce/upload', data, {
                headers : {"Content-Type": "multipart/form-data"}
            })
            .then(function (res) {
                console.log(res.data);
                    // success(res.data.location);
                })
            .catch(function (err) {
                console.log(err);
                    // failure('HTTP Error: ' + err.message);
                });
        },
      });
}

function setNotesUpdateContentArea() {
    tinymce.init({
        selector: '#notes_update_noteContent',
        inline: true,
        toolbar_mode: 'floating',
        resize: false,
        promotion: false,
        branding: false,
        skin: 'oxide-dark',
        plugins: 'image',
        toolbar: 'undo redo | image | bold italic | alignleft aligncenter alignright alignjustify | outdent indent ',
        images_upload_url: 'http://localhost:8080/onlinelearning/note/user/notephoto/tinymce/upload',
        file_picker_types: 'file image media',
        /* enable title field in the Image dialog*/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
          var input = document.createElement('input');
          input.setAttribute('type', 'file');
          input.setAttribute('accept', 'image/*');

          input.onchange = function () {
            var file = this.files[0];
      
            var reader = new FileReader();
            reader.onload = function () {

                var id = 'blobid' + (new Date()).getTime();
                var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                var base64 = reader.result.split(',')[1];
                var blobInfo = blobCache.create(id, file, base64);
                blobCache.add(blobInfo);
      
                /* call the callback and populate the Title field with the file name */
                cb(blobInfo.blobUri(), { title: file.name });
            };
            reader.readAsDataURL(file);
          };
          input.click();
        },
        images_upload_handler: function (blobInfo, success, failure, file) {
            console.log('images_upload_handler is working.');
            let data = new FormData();
            data.append('notePhotoFile', blobInfo.blob(), blobInfo.filename());
            data.append('noteId', document.querySelector('.notes_update_noteId').value);
            axios.post('http://localhost:8080/onlinelearning/note/user/notephoto/tinymce/upload', data, {
                headers : {"Content-Type": "multipart/form-data"}
            })
            .then(function (res) {
                console.log(res.data);
                let contentArea = document.querySelector('#notes_update_noteContent');
                let images = contentArea.querySelectorAll('img');
                images[images.length - 1].src = res.data;
                success(res.data.location);
                })
            .catch(function (err) {
                console.log(err);
                failure('HTTP Error: ' + err.message);
                });
        },
        setup: function(editor) {
            editor.on('init', function(e) {
              console.log('The Content Editor has initialized.');
            });
            editor.on('change', function(e) {
                tinyMCE.triggerSave();
                NotesAPI.editNote();
                setTimeout(bindSidebarNote, 1000);
            });
        },
    })
}




