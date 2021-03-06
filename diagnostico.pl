
:- use_module(library(jpl)).
start:-sleep(0.4),
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
        /*write("Hola. ?Como estas? Primero que nada dime tu nombre por favor : "),
        read(Paciente),*/


		interface2.


       /* hipotesis(Paciente,Enfermedad),
        write(Paciente),write(', tu '), write(' probablemente tenga '),write(Enfermedad),write('.'),undo,
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.*/


    simtoma(Paciente,fiebre) :- verificar(Paciente," tiene un fiebre (si/no) ?").

    simtoma(Paciente,fiebre_cuarenta) :- verificar(Paciente,"tiene firebe mayor de 39 (si/no) ?").

    simtoma(Paciente,dolor_de_cabeza) :- verificar(Paciente," tiene un dolor de cabeza (si/no) ?").

    simtoma(Paciente,perdida_olfato) :- verificar(Paciente," tienes falta de olfato (si/no) ?").

    simtoma(Paciente,dolor_muscular) :- verificar(Paciente," tiene dolor muscular (si/no) ?").

    simtoma(Paciente,tos) :- verificar(Paciente," tiene un tos (si/no) ?").

    simtoma(Paciente,perdida_respiratoria) :- verificar(Paciente," Perdida respiratoria (si/no) ?").

    simtoma(Paciente,resfriado) :- verificar(Paciente," tiene un resfriado (si/no) ?").

    simtoma(Paciente,dolor_de_garganta) :- verificar(Paciente," tiene un dolor de garganta (si/no) ?").

    simtoma(Paciente,estornudo) :- verificar(Paciente," tiene un estornudo (si/no) ?").

    simtoma(Paciente,tos_seca) :- verificar(Paciente," tiene un tos seca(si/no) ?").

	/*simtoma(_,"Lo siento, parece que no puedo diagnosticar la Enfermedad.").*/


    hipotesis(Paciente,coronavirus) :-
        simtoma(Paciente,fiebre_cuarenta),
        simtoma(Paciente,perdida_olfato),
        simtoma(Paciente,dolor_de_cabeza),
        simtoma(Paciente,perdida_respiratoria),
        simtoma(Paciente,tos_seca).

    hipotesis(Paciente,gripe) :-
        simtoma(Paciente,fiebre),
        simtoma(Paciente,dolor_de_cabeza),
        simtoma(Paciente,dolor_muscular),
        simtoma(Paciente,estornudo).

    hipotesis(Paciente,dolor_de_garganta) :-
        simtoma(Paciente,fiebre),
        simtoma(Paciente,dolor_de_cabeza),
        simtoma(Paciente,tos),
        simtoma(Paciente,tos_seca),
        simtoma(Paciente,resfriado).



	hipotesis(_,"enfermedad. Pero lo siento, parece que no puedo diagnosticar la dicha enfermedad").

    response(Reply) :-
        read(Reply),
        write(Reply),nl.

preguntar(Paciente,Pregunta) :-
	interface(', usted',Paciente,Pregunta),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.

:- dynamic si/1,no/1.

verificar(P,S) :-
   (si(S)
    ->
    true ;
    (si(S)
     ->
     fail ;
     preguntar(P,S))).

undo :- retract(si(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Paciente):-
                hipotesis(Paciente,Enfermedad),
		interface3(Paciente,', tu probablemente tengas ',Enfermedad,'.'),
        write(Paciente),write(', tu probablemente tengas '),write(Enfermedad),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Covid-19'], F),
	jpl_new('javax.swing.JLabel',['---Sistema test de covid-19 ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == si ; N == s)
      ->
       assert(si(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['Covid-19'], F),
	jpl_new('javax.swing.JLabel',['--- Sistema test de covid-19 ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hola. ?Como estas? Primero que nada dime tu nombre por favor'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('cancelaste'),interface3('cancelaste. ','gracias ','por ','usarme.'),end,fail
		;	write("Hola. ?Como estas? Primero que nada dime tu nombre por favor : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Covid-19'], F),
	jpl_new('javax.swing.JLabel',['--- Sistema test de covid-19 ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("To start the expert system please type 'start.' and press Enter key").
