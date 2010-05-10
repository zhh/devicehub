CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'Base';	
	config.toolbar_Full =
	[
	    ['Source','-','Save','NewPage','Preview','-','Templates'],
	    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
	    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
	    '/',
	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['Link','Unlink','Anchor'],
	    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	    '/',
	    ['Styles','Format','Font','FontSize'],
	    ['TextColor','BGColor'],
	    ['Maximize', 'ShowBlocks','-','About']
	];	
	config.toolbar_Base =
	[	    
	    ['Cut','Copy','Paste','PasteText','PasteFromWord'],
	    ['Undo','Redo'],
	    ['Format','Font','FontSize'],
	    ['SelectAll','RemoveFormat'],	    	    
	    ['Find','Replace'],
	    ['Preview'],
	    '/',
	    ['Bold','Italic','Underline','Strike'],
	    ['TextColor','BGColor'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['NumberedList','BulletedList'],
	    ['Outdent','Indent'],	    
	    ['Link','Unlink'],    
	    ['Table','HorizontalRule','Smiley','SpecialChar'],
	];	
};