var addRow = function () {
    addTableRow($("#team-table"));
    return false;
};

var deleteRow = function (event) {
    $(event.target).closest("tr").remove();
    return false;
};

function addTableRow(table) {
 
    var $ttc = $(table).find("tbody tr:last");
    var $tr = $ttc.clone();

    $tr.find("input,select,input[type=hidden]").attr("name", function () { // find name in the cloned row
        var parts = this.id.match(/(\D+)_(\d+)__(\D+)$/); // extract parts from id, including index
        return parts[1] + "[" + ++parts[2] + "]." + parts[3]; // build new name
    }).attr("id", function () { // change id also
        var parts = this.id.match(/(\D+)_(\d+)__(\D+)$/); // extract parts
        return parts[1] + "_" + ++parts[2] + "__" + parts[3]; // build new id
    });
    $tr.find("span[data-valmsg-for]").attr("data-valmsg-for", function () { // find validation message
        var parts = $(this).attr("data-valmsg-for").match(/(\D+)\[(\d+)]\.(\D+)$/); // extract parts from the referring attribute
        return parts[1] + "[" + ++parts[2] + "]." + parts[3]; // build new value
    })
    $ttc.find(".new-row").attr("class", "remove-row").attr("title", "Delete row").unbind("click").click(deleteRow); // change buttin function
    $tr.find(".new-row").click(addRow); // add function to the cloned button

    // reset fields in the new row
    $tr.find("select").val("");
    $tr.find("input[type=text]").val("");

    // add cloned row as last row
    $(table).find("tbody tr:last").after($tr);

    // Find the affected form
    var $form = $tr.closest("FORM");

    // Unbind existing validation
    $form.unbind();
    $form.data("validator", null);

    // Check document for changes
    $.validator.unobtrusive.parse(document);

    // We could re-validate with changes
    // $form.validate($form.data("unobtrusiveValidation").options);
};

(function ($) {
 

    $.fn.resetValidation = function () {
        var $form = this.closest('form');

        //reset jQuery Validate's internals
        $form.validate().resetForm();

        //reset unobtrusive validation summary, if it exists
        $form.find("[data-valmsg-summary=true]")
            .removeClass("validation-summary-errors")
            .addClass("validation-summary-valid")
            .find("ul").empty();

        //reset unobtrusive field level, if it exists
        $form.find("[data-valmsg-replace]")
            .removeClass("field-validation-error")
            .addClass("field-validation-valid")
            .empty();

        return $form;
    };
})(jQuery);

$(function () {
    $(".new-row").click(addRow);
    $(".remove-row").click(deleteRow);
})