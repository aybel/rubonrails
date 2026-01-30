import $ from "jquery";
document.addEventListener("turbo:load", function() {
    change_city_options();
    clean_form();
    console.log("proveedor create");
});
const change_city_options = function () {
    $("#country-select").on('change', function () {
        const selectedCountryId = $(this).val();
        handle_cities(selectedCountryId).then(function (cities) {
            const citySelect = $('#city-select');
            citySelect.empty();
            citySelect.append($('<option>', {
                value: '',
                text: 'Seleccione una ciudad'
            }));
            cities.forEach(function (city) {
                citySelect.append($('<option>', {
                    value: city.id,
                    text: city.name
                }));
            });
        });
    });
};
const handle_cities = function (countryId) {
    return new Promise(function (resolve, reject) {
        const $loading = $('#loading-gif-overlay');
        if (countryId) {
            $loading.css('display', 'flex');
            $.ajax({
                url: '/cities?country_id=' + countryId,
                dataType: 'json',
                success: function (data) {
                    $loading.hide();
                    resolve(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $loading.hide();
                    $('#city-select').empty();
                    reject(errorThrown);
                }
            });
        } else {
            $('#city-select').empty();
            $loading.hide();
            resolve([]);
        }
    });
};

const clean_form = function () {
    const form = $('#supplier-form')[0];
    if (form) {
        form.reset();
    }
    $('#city-select').empty();
};