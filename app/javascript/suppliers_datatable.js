$(function () {
    console.log("Inicializacion de página");
    $('#suppliers-table').DataTable({
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
        },
        responsive: true,
        pageLength: 10
    });
    // const table = document.getElementById('suppliers-table');
    // if (table && !window.jQuery.fn.dataTable.isDataTable(table)) {
    //     window.jQuery(table).DataTable({
    //         language: {
    //             url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
    //         },
    //         responsive: true,
    //         pageLength: 10
    //     });
    // }
});

