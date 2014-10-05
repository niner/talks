window.addEventListener('load', function() {
    queue();
});

function queue() {
    var foods = 8;
    var buffet = init_buffet(foods);
    var queue = init_queue(foods);
    var steps = 0;

    var processor = window.setInterval(function() {
        for (var i = 0; i < queue.length; i++) {
            queue[i].advance(queue);
        }
        if (steps++ > 1600)
            window.clearInterval(processor)
    }, 10);
}

function init_buffet(size) {
    var foods = [];
    for (var i = 0; i < size; i++) {
        foods.push(
            new Food(i)
        );
    }
    return foods;
}

function init_queue(foods) {
    var people = [];
    for (var i = 0; i < 50; i++) {
        people.push(
            new Person(i, foods)
        );
    }
    return people;
}

Person.prototype.constructor = Person;
function Person(i, foods) {
    this.element = document.createElement('img');
    this.element.id = 'person_' + i;
    this.element.src = 'person.png';
    this.element.style.position = 'absolute';
    this.element.style.left = (42 * i) + 'px';
    this.element.style.top = 0;
    document.getElementById('queue').appendChild(this.element);
    this.foods = [];
    for (var i = 0; i < foods; i++)
        this.foods[i] = parseInt(Math.random() * 180);
    this.waitingTime = 0;
    this.processing = 0;
}

Person.prototype.left = function() {
    return parseInt(this.element.style.left);
}

Person.prototype.top = function() {
    return parseInt(this.element.style.top);
}

Person.prototype.c_left = function() {
    return parseInt(this.element.style.left) + 20;
}

Person.prototype.c_top = function() {
    return parseInt(this.element.style.top) + 20;
}

Person.prototype.advance = function(queue) {
    var left = this.left();
    var top = this.top();
    if (left > 0) {
        left--;
        if (this.detect_collission(left + 20, top + 20, queue, 0))
            return;
        this.element.style.left = left + 'px';
        return;
    }
    if (top % 50 == 0) {
        if (this.foods[top / 50] > 0) {
            this.foods[top / 50]--;
            return;
        }
    }
    top++;
    if (this.detect_collission(left + 20, top + 20, queue, 1))
        return;
    this.element.style.top = top + 'px';
}

Person.prototype.detect_collission = function (left, top, queue, al) {
    for (var i = 0; i < queue.length; i++) {
        if (queue[i].element.id != this.element.id) {
            var person = queue[i];
            var p_left = person.c_left();
            var p_top = person.c_top();

            var horiz = p_left > left ? p_left - left : left - p_left;
            var vert = p_top > top ? p_top - top : top - p_top;
            var s_distance = horiz * horiz + vert * vert;
            if (s_distance < 40 * 40) {
                return true;
            }
        }
    }
    return false;
}

Food.prototype.constructor = Food;
function Food(i) {
    this.element = document.createElement('div');
    this.element.id = 'food_' + i;
    this.element.style.position = 'absolute';
    this.element.style.left = 0;
    this.element.style.top = (40 * i) + 'px';
    this.element.style.height = '40px';
    this.element.style.width = '50px';
    this.element.style.backgroundColor = '#' + i % 3 * 4 + '0' + (i + 1) % 3 * 4 + '0' + (i + 2) % 3 * 4 +  '0';
    document.getElementById('buffet').appendChild(this.element);
}
