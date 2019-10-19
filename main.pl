:- use_module(library(apply)).

novel("att vara ganska tragisk").

% Random word with the same score for now 
word_analysis(Element, NewWord) :-
    string_lower(Element, LowerCase),
    word_strength(LowerCase, Strength),
    findall(NewWord, word_strength(NewWord, Strength), NewWords),
    random_member(NewWord, NewWords).

% Word which does not exist in the database
word_analysis(Element, Element).

p() :-
    novel(X),
    split_string(X, " ", "", L),
    maplist(word_analysis, L, Out),
    write(Out).
