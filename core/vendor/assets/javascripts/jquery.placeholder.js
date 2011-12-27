/*
* jQuery Placeholder
*/
(function($) {
	function Placeholder(input) {
		this.input = input;
		this.placeholderContent = this.input.attr("placeholder") == undefined ? "" : this.input.attr("placeholder");
		this.labelFor = this.input.attr("id") == undefined ? "" : this.input.attr("id");
		input.removeAttr("placeholder");
	}


	Placeholder.prototype = {
		show : function() {
			this.input.before('<label class="input-placeholder" for="' + this.labelFor + '">' + this.placeholderContent + '</label>');
			this.label = this.input.prev();
			this.label.bind('click', function() {
				this.input.focus()
			});
		},
		focus : function() {
			this.label.addClass("input-placeholder-focus");
		},
		blur : function() {
			if(this.input.val() === '') {
				this.label.removeClass("input-placeholder-hidden");
				this.label.removeClass("input-placeholder-focus");
			} else {
				this.label.addClass("input-placeholder-hidden");
			}
		},
		keypress : function() {
			this.label.addClass("input-placeholder-hidden");
		}
	};
	
	$.fn.placeholder = function() {
		this.each(function() {
			var input = $(this);
			var placeholder = new Placeholder(input);
			placeholder.show();
			input.focus(function() {
				placeholder.focus();
			});
			input.blur(function() {
				placeholder.blur();
			});
			input.keypress(function() {
				placeholder.keypress();
			});
		});
	}
})(jQuery);
