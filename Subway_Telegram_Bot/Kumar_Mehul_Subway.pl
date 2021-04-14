% meal facts
healthy_meal(healthy).
value_meal(value).
vegan_meal(vegan).
veggie_meal(veggie).
meaty_meal(meaty).


% append methods
append([], Y, Y).
append([H|X], Y, [H|Z]):-
    append(X, Y, Z).


% empty list
empty_list([]).


% category options
meals([healthy, normal, value, vegan, veggie, meaty]).

vegan_breads([italian_wheat, parmesan_oregano, hearty_italian, multigrain, flatbread]).
non_vegan_breads([honey_oat]).

value_mains([chicken, ham, bacon, tuna]).
expensive_mains([beef, salmon, turkey]).

veggies([cucumber, green_peppers, lettuce, red_onions, tomatoes, olives, jalapenos, pickles]).

healthy_sauces([honey_mustard, sweet_onion, chilli, tomato]).
unhealthy_sauces([chipotle_southwest, bbq, ranch, mayonnaise]).

non_vegan_topups([american, monterey_jack, cheddar, egg_mayonnaise]).
vegan_topups([avocado]).

healthy_sides([cookies, energy_bar]).
unhealthy_sides([chips, hashbrowns]).

healthy_drinks([mineral_water, orange_juice, green_tea, coffee]).
unhealthy_drinks([soft_drinks]).


% simple aggregator to find relevant fact based on case or input
all_options(X, Y):-
    X == meals -> meals(Y);
    X == breads -> breads(Y);
    X == mains -> mains(Y);
    X == veggies -> veggies(Y);
    X == sauces -> sauces(Y);
    X == topups -> topups(Y);
    X == sides -> sides(Y);
    X == drinks -> drinks(Y).

% available options for each category based on input
available_options(X, Y):-
    X == meals -> ask_meals(Y);
    X == breads -> ask_breads(Y);
    X == mains -> ask_mains(Y);
    X == veggies -> ask_veggies(Y);
    X == sauces -> ask_sauces(Y);
    X == topups -> ask_topups(Y);
    X == sides -> ask_sides(Y);
    X == drinks -> ask_drinks(Y).

% selected options for each category based on input
selected_options(X, Y):-
    X == meals -> findall(Y, selected_meals(Y), Y);
    X == breads -> findall(Y, selected_breads(Y), Y);
    X == mains -> findall(Y, selected_mains(Y), Y);
    X == veggies -> findall(Y, selected_veggies(Y), Y);
    X == sauces -> findall(Y, selected_sauces(Y), Y);
    X == topups -> findall(Y, selected_topups(Y), Y);
    X == sides -> findall(Y, selected_sides(Y), Y);
    X == drinks -> findall(Y, selected_drinks(Y), Y).


% list of all available breads
breads(X):-
    vegan_breads(B1), non_vegan_breads(B2), append(B1, B2, X).


% list of all available mains
mains(X):-
    value_mains(M1), expensive_mains(M2), append(M1, M2, X).


% list of all available sauces
sauces(X):-
    healthy_sauces(S1), unhealthy_sauces(S2), append(S1, S2, X).


% list of all available topups
topups(X):-
    non_vegan_topups(T1), vegan_topups(T2), append(T1, T2, X).


% list of all available sides
sides(X):-
    healthy_sides(S1), unhealthy_sides(S2), append(S1, S2, X).


% list of all available drinks
drinks(X):-
    healthy_drinks(D1), unhealthy_drinks(D2), append(D1, D2, X).

    
% list of meals based on previous choices
ask_meals(X):-
    meals(X).


% list of breads based on previous choices
ask_breads(X):-
    selected_meals(Y), vegan_meal(Y) -> vegan_breads(X);   
    breads(X).
% honey_oat bread is not there in vegan_meal


% list of mains based on previous choices
ask_mains(X):-
    selected_meals(Y), vegan_meal(Y) -> empty_list(X);
    selected_meals(Y), veggie_meal(Y) -> empty_list(X);
    selected_meals(Y), value_meal(Y) -> value_mains(X); 
    mains(X).
% expensive_mains is not there in value_meal
% no main options in vegan_meal and value_meal, return empty_list


% list of veggies based on previous choices
ask_veggies(X):-
    selected_meals(Y), \+ meaty_meal(Y), veggies(X).
% no meaty_meal in veggie_meal, return empty list [].


% list of sauces based on previous choices
ask_sauces(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_sauces(X);   
    sauces(X).
% unhealthy_sauces not in healthy_meal, return a list containing only healthy_sauces


% list of top-ups based on previous choices
ask_topups(X):-
    selected_meals(Y), value_meal(Y) -> empty_list(X);
    selected_meals(Y), vegan_meal(Y) -> vegan_topups(X); 
    topups(X).
% topups not there in value_meal, returns an empty list
% non_vegan_topups not there in vegan_meal, return a list containing vegan_topups


% list of sides based on previous choices
ask_sides(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_sides(X);   
    sides(X).
% no unhealthy_sides in healthy_meal, return a list containing healthy_sides


% list of drinks based on previous choices
ask_drinks(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_drinks(X);   
    drinks(X).
% no unhealthy_drinks in healthy_meal, return a list containing healthy_drinks
