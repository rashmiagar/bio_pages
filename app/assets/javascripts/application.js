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


// function remove_fields(link) {
// 	  $(link).prev("input[type=hidden]").val("1");
// 	  $(link).closest(".fields").hide();
// 	}

// function add_fields(link, association, content) {
//   var new_id = new Date().getTime();
//   var regexp = new RegExp("new_" + association, "g");
 
//   $(link).before(content.replace(regexp, new_id));
//   // $('#user_skills_attributes_'+new_id+'_name').typeahead({
//   //     minLength: 1,
//   //     highlight: true
//   //    }, {
// 	 //   name: 'skills',
// 	 //   source: substringMatcher(autocomplete_items)
//   //   });
  
// }

// var my_Suggestion_class = new Bloodhound({
//       datumTokenizer: function(datum) { return Bloodhound.tokenizers.obj.whitespace(datum.value);},
//       queryTokenizer: Bloodhound.tokenizers.whitespace,
//       // local: $.map(country_list, function(item) {
//       //     console.log(item);
//       //     return {value: item};
//       // })
//       remote: {
//             url: "/typeahead",
//            replace: function(url, uriEncodedQuery) {
//             // How to change this to denominator for denominator queries?
//             // var categoryID = $('#user_skills_attributes_1_category_id').val();
//              var categoryID = $('.new-skill-field-row-0 select').val();

//             return url + "?q="+uriEncodedQuery+ "&category_id=" + encodeURIComponent(categoryID)
//             },
//             filter: function(skills) {
//                 console.log(skills);
//                 return $.map(skills, function(item) {
//                    console.log(item);
//                   return {value: item};
//                 });
//             },
//         }
//   });


$(document).ready(function(){


   var country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];



   // my_Suggestion_class.initialize();

   //      var typeahead_elem = $('#bio_pic_pages_user_skills_0_name');
   //      typeahead_elem.typeahead({
   //          hint: true,
   //          highlight: true,
   //          minLength: 1
   //      },
   //      {
   //        name: 'skills',
   //        displayKey: 'value',
   //        source: my_Suggestion_class.ttAdapter(),
   //        templates: {
   //          suggestion: Handlebars.compile("<p style='padding:6px'><img width=50'> <b>{{value}}</b></p>"),
   //          footer: Handlebars.compile("<b>Searched for '{{query}}'</b>"),
   //           empty: [
   //              '<div class="noitems">',
   //              'No Items Found',
   //              '</div>'
   //          ].join('\n')
   //        },
   //        engine: Handlebars
   //      });
});
