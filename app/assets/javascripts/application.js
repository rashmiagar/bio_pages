// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/typeahead
//= require twitter/typeahead/bloodhound
//= require_tree .

$(document).on("click", "#new_project_pane", function(){
  
	$.ajax({
		url: $(this).attr("href"),
		complete: function(data){

			//$(data).appendTo("body");
			$('#myModal').modal('show');
		}
	});
});


function remove_fields(link) {
	  $(link).prev("input[type=hidden]").val("1");
	  $(link).closest(".fields").hide();
	}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
 
  $(link).before(content.replace(regexp, new_id));
  $('#user_skills_attributes_'+new_id+'_name').typeahead({
      minLength: 1,
      highlight: true
     }, {
	   name: 'skills',
	   source: substringMatcher(autocomplete_items)
    });
  
}

// 	var substringMatcher = function(strs) {
//      return function findMatches(q, cb) {
//        var matches, substringRegex;

// 		    // an array that will be populated with substring matches
// 		    matches = [];

// 		    // regex used to determine if a string contains the substring `q`
// 		    substrRegex = new RegExp(q, 'i');

// 		    // iterate through the pool of strings and for any string that
// 		    // contains the substring `q`, add it to the `matches` array
// 		    $.each(strs, function(i, str) {
// 		      if (substrRegex.test(str)) {
// 		        matches.push(str);
// 		      }
// 		    });

// 	    cb(matches);
// 	  };
// }

var bestPictures = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  //queryTokenizer: function (d) { return Bloodhound.tokenizers.whitespace(d.name)},
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  //prefetch: '../data/films/post_1960.json',
  remote: {
    url: '/typeahead/%QUERY',
    replace: function(url, uriEncodedQuery) {
        // How to change this to denominator for denominator queries?
        val = $('#user_skills_attributes_3_category_id').val(); 
        if (!val) return url;
        return url + "?q="+uriEncodedQuery+ "&category_id=" + encodeURIComponent(val)
      },

    wildcard: '%QUERY'
  }
});



$(document).ready(function() {
  console.log(autocomplete_items);
  
  // $('.typeahead').typeahead({	
  //    minLength: 1,
  //    highlight: true
  // }, {
  // 	name: 'skills',
  // 	source: substringMatcher(autocomplete_items)
  // });
bestPictures.initialize();
console.log(bestPictures);
$('.typeahead').typeahead({highlight: true}, {
  name: 'best-pictures',
  //displayKey: 'name',
  display: 'name',
  source: bestPictures.ttAdapter()
});
});
