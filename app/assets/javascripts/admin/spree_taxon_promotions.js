//= require admin/spree_backend
//= require_self

$.fn.taxonAutocomplete = function () {
    'use strict';

    this.select2({
        placeholder: Spree.translations.taxon_placeholder,
        multiple: true,
        initSelection: function (element, callback) {
            var url = Spree.url(Spree.routes.taxons_search, {
                ids: element.val()
            });
            return $.getJSON(url, null, function (data) {
                return callback(data['taxons']);
            });
        },
        ajax: {
            url: Spree.routes.taxons_search,
            datatype: 'json',
            data: function (term, page) {
                return {
                    per_page: 50,
                    page: page,
                    q: {
                        name_cont: term
                    }
                };
            },
            results: function (data, page) {
                var more = page < data.pages;
                console.log(more)
                return {
                    results: data['taxons'],
                    more: more
                };
            }
        },
        formatResult: function (taxon) {
            return taxon.pretty_name;
        },
        formatSelection: function (taxon) {
            return taxon.pretty_name;
        }
    });
}