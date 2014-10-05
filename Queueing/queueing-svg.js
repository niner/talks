window.addEventListener('load', function() {
    queue();
});

function queue() {
    init_queue();
}

function init_queue() {
    for (var i = 0; i < 10; i++) {
        create_person(i);
    }
}

function create_person(i) {
    var person = document.createElementNS('svg', 'svg:ellipse');
    person.setAttribute('id', 'person_' + i);
    person.setAttribute('rx', 20);
    person.setAttribute('ry', 20);
    person.setAttribute('style', 'fill: blue; fill-opacity: 100;');
    person.setAttribute('cx', 20 + 40 * i);
    person.setAttribute('cy', 20 + 40 * i);
    document.getElementById('buffet').appendChild(person);
}
