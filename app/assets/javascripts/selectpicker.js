//= require bootstrap-select

$.fn.selectpicker.defaults = {
    //noneSelectedText: 'Ничего не выбрано',
    noneSelectedText: '',
    noneResultsText: 'Совпадений не найдено {0}',
    countSelectedText: 'Выбрано {0} из {1}',
    maxOptionsText: ['Достигнут предел ({n} {var} максимум)', 'Достигнут предел в группе ({n} {var} максимум)', ['items', 'item']],
    doneButtonText: 'Закрыть',
    multipleSeparator: ', '
};

$(function () {
    $('select').selectpicker();
});
