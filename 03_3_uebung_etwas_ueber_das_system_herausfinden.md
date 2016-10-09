# 3.3 Übung: Etwas über das System herausfinden

{% exercise %}
Define a variable `x` equal to 10.
{% initial %}
var x =
{% solution %}
var x = 10;
{% validation %}
assert(x == 10);
{% context %}
// This is context code available everywhere
// The user will be able to call magicFunc in his code
function magicFunc() {
    return 3;
}
{% endexercise %}

---

Aufgabe: Wieviel Arbeitsspeicher ist auf dem System frei?

Lösung: {%s%}free -h{%ends%}

---