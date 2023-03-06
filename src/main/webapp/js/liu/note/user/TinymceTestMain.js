import {NotesAPI} from './MyNotes.js';

tinymce.init({
    selector: '#notes_update_noteContent',
    promotion: false,
    branding: false,
    content_css: ['document' ],
    plugins: 'image',
    file_picker_types: 'file image media',
    file_picker_callback: function(callback, value, meta) {
        imageFilePicker(callback, value, meta);
    },
    // plugins: 'advlist lists',
    // toolbar: 'bullist numlist',
    // menubar: false,
    setup: function(editor) {
        editor.on('init', function(e) {
          console.log('The Editor has initialized.');
        });
        editor.on('input', function(e) {
            console.log(tinymce.get('notes_update_noteContent').getContent());
            // NotesAPI.editNote();
        });
    },
    
});

tinymce.init({
    selector: 'textarea#tinymceTestArea',
    promotion: false,
    branding: true,
});





