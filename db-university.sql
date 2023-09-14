-- Filtrare gli studenti tra due date 
SELECT * FROM `students` WHERE date_of_birth BETWEEN '1990-01-01' AND '1990-12-31';

--Filtrare i corsi che valgono 10 Crediti  o  più
SELECT * FROM `courses` WHERE cfu > '10';

--Selezionare tutti gli appelli d'esame che sono il 2020-06-20 ma che iniziano dopo le 14:00
SELECT * FROM `exams` WHERE date = '2020-06-20' AND hour> '14:00';

--Selezioanre tutti i corsi del primo anno del primo semestre
SELECT * FROM `courses` WHERE period = 'I semestre' AND year = '1';

--Selezionare tutti i corsi magistrali
SELECT * FROM `degrees`WHERE level = 'magistrale';

--Sapere quanti dipartimenti ci sono 
SELECT COUNT(id) FROM departments;

-- Selezionare gli insegnanti senza numero di telefono
SELECT * FROM `teachers` WHERE phone is null;